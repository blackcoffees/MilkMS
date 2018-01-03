package com.cy.milkms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.SaleMapper;
import com.cy.milkms.db.entity.Distributor;
import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.db.entity.Sale;
import com.cy.milkms.db.entity.Sale_detailed;
import com.cy.milkms.service.IDistributorService;
import com.cy.milkms.service.IMilkService;
import com.cy.milkms.service.ISaleDetailedService;
import com.cy.milkms.service.ISaleService;
import com.cy.milkms.util.CommonTool;
import com.cy.milkms.util.DateTool;
import com.cy.milkms.util.Enum;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service("saleService")
public class SaleService implements ISaleService{
	
	@Autowired
	private SaleMapper mapper;
	
	@Autowired
	private IDistributorService distributorService;
	
	@Autowired
	private IMilkService milkService;
	
	@Autowired
	private ISaleDetailedService detailedService;

	@Override
	public Map addSale(String saleTime, int distributorID, double totalPrice, String list, int status) throws Exception {
		// TODO Auto-generated method stub
		Map result = new HashMap();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		JSONArray jsonArray = JSONArray.fromObject(list);
		Distributor distributor = distributorService.getDistributorByID(distributorID);
		if(distributor == null){
			result.put("message", "商家不存在，请重新选择");
			return result;
		}
		double totalAmount = 0;
		List<Sale_detailed> detailedList = new ArrayList<Sale_detailed>();
		for(int i=0;i<jsonArray.size();i++){
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			String milkName = jsonObject.getString("milkName");
			Milk milk = milkService.get_milk_by_name_or_number(milkName, "");
			if(milk == null){
				throw new Exception("商品不存在，请重新选择");
			}
			String numberStr = jsonObject.getString("number");
			if(!CommonTool.isNumber(numberStr)){
				throw new Exception("商品数量错误");
			}
			int number = Integer.parseInt(numberStr);
			String priceStr = jsonObject.getString("price");
			if(!CommonTool.isNumber(priceStr)){
				throw new Exception("商品单价错误");
			}
			double price = Double.parseDouble(priceStr);
			double signTotalAmount = number * price;
			totalAmount += signTotalAmount;
			Sale_detailed detailed = new Sale_detailed();
			detailed.setCreated(DateTool.getNowTime());
			detailed.setMilk_ID(milk.getId());
			detailed.setNumber(number);
			detailed.setPrice(price);
			detailed.setTotal_amount(signTotalAmount);
			detailed.setUpdated(DateTool.getNowTime());
			detailedList.add(detailed);
		}
		/*销售单*/
		Sale sale = new Sale();
		sale.setCreated(DateTool.getNowTime());
		sale.setDistributor_id(distributorID);
		sale.setReceivables_amount(totalAmount);
		if(status == Enum.SALE_STATUS_PAID){
			sale.setPaid_amount(totalAmount);
			sale.setUnpaid_amoutn(0);
		}
		else if(status == Enum.SALE_STATUS_UNPAID){
			sale.setPaid_amount(0);
			sale.setUnpaid_amoutn(totalAmount);
		}
		sale.setSale_time(DateTool.getNowTime());
		sale.setCreated(DateTool.getNowTime());
		sale.setUpdated(DateTool.getNowTime());
		sale.setStatus(status);
		int saleID = mapper.addSale(sale);
		if(saleID <= 0){
			throw new Exception("新增失败");
		}
		/*销售分单*/
		for(int i=0;i<detailedList.size();i++){
			Sale_detailed detailed = detailedList.get(i);
			detailed.setSale_ID(saleID);
			int detailedResult = detailedService.addSaleDetailed(detailed);
			if(detailedResult <= 0){
				throw new Exception("新增失败");
			}
		}
		/*商家金额变动*/
		distributor.setTotal_amount(distributor.getTotal_amount() + totalAmount);
		if(status == Enum.SALE_STATUS_PAID){
			distributor.setPaid_amount(distributor.getPaid_amount() + totalAmount);
		}
		else if(status == Enum.SALE_STATUS_UNPAID){
			distributor.setUnpaid_amount(distributor.getUnpaid_amount() + totalAmount);
		}
		distributor.setUpdated(DateTool.getNowTime());
		int disResult = distributorService.updateDistributorAmount(distributor);
		if(disResult <= 0){
			throw new Exception("新增失败");
		}
		result.put("succ", true);
		result.put("message", "");
		return result;
	}

}
