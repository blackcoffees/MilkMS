package com.cy.milkms.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cy.milkms.db.dao.PurchaseMapper;
import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.db.entity.Purchase;
import com.cy.milkms.db.entity.Purchase_detailed;
import com.cy.milkms.db.query.ResultTotalPurchaseQuery;
import com.cy.milkms.db.query.TotalPurchaseQuery;
import com.cy.milkms.service.IMilkService;
import com.cy.milkms.service.IPurchaseDetailedService;
import com.cy.milkms.service.IPurchaseService;
import com.cy.milkms.util.DateTool;
import com.cy.milkms.util.Pager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service("purchaseService")
public class PurchaseService implements IPurchaseService{

	@Autowired
	private PurchaseMapper mapper;
	
	@Autowired
	private IMilkService milkService;
	
	@Autowired
	private IPurchaseDetailedService detailedService;

	@Override
	public List<ResultTotalPurchaseQuery> getPurchaseByConditon(int pucharseID, String startTime, String endTime, Pager pager) {
		// TODO Auto-generated method stub
		List<TotalPurchaseQuery> rows = mapper.getPurchaseByConditon(pucharseID, startTime, endTime, pager);
		Map<String, List<TotalPurchaseQuery>> map =new HashMap<String, List<TotalPurchaseQuery>>();
		for(int i=0;i<rows.size();i++){
			if(map.containsKey(rows.get(i).getID())){
				map.get(rows.get(i).getID()).add(rows.get(i));
			}
			else{
				List<TotalPurchaseQuery> list = new ArrayList<TotalPurchaseQuery>();
				list.add(rows.get(i));
				map.put(rows.get(i).getID(), list);
			}
		}
		
		Iterator<String> keyIte = map.keySet().iterator();
		List<ResultTotalPurchaseQuery> result = new ArrayList<ResultTotalPurchaseQuery>();
		while(keyIte.hasNext()){
			String key = keyIte.next();
			List<TotalPurchaseQuery> list = map.get(key);
			ResultTotalPurchaseQuery query = new ResultTotalPurchaseQuery();
			query.setName(list.get(0).getName());
			query.setTime(list.get(0).getTime());
			query.setList(list);
			result.add(query);
		}
		
		return result;
	}

	@Override
	public int getPurchaseByConditonCount() {
		// TODO Auto-generated method stub
		return mapper.getPurchaseByConditonCount();
	}

	@Override
	@Transactional
	public Map addPurchase(String data) throws Exception {
		// TODO Auto-generated method stub
		Map result = new HashMap();
		result.put("message", "系统繁忙，请稍后再试");
		result.put("succ", false);
			
		JSONArray jsonArray = JSONArray.fromObject(data);
		String time = jsonArray.getJSONObject(0).getString("time");
		if(time.equals("") || time == null){
			result.put("message", "请输入采购时间");
			return result;
		}
			
		String totalPrice = jsonArray.getJSONObject(0).getString("totalPrice");
		double totalPriceDouble = Double.parseDouble(totalPrice);
		if(totalPrice.equals("") || totalPrice == null){
			result.put("message", "采购总价不能小于等于0");
			return result;
		}
			
		Purchase purchase = new Purchase();
		purchase.setCreated(DateTool.getNowTime());
		purchase.setUpdated(DateTool.getNowTime());
		purchase.setTime(Timestamp.valueOf(time+" 00:00:00"));
		purchase.setTotal_amount(totalPriceDouble);
		int add_pur = mapper.addPurchase(purchase);
		if(add_pur <= 0)
			throw new Exception("新增采购单失败");
		
		String listStr = jsonArray.getJSONObject(0).getString("list");
		JSONArray listJsonArray = JSONArray.fromObject(listStr);
		for(int i=0;i<listJsonArray.size();i++){
			JSONObject jsonObject = listJsonArray.getJSONObject(i);
			String milk_name = jsonObject.getString("milk_name");
			Milk milk = milkService.get_milk_by_name_or_number(milk_name, "");
			if(milk == null)
				throw new Exception("商品不存在");
			
			String number = jsonObject.getString("number");
			String price = jsonObject.getString("price");
			totalPrice = jsonObject.getString("totalPrice");
			if(number.equals("") || number == "" || Integer.parseInt(number) <= 0){
				throw new Exception("商品数量错误");
			}
			
			if(price.equals("") || price == "" || Double.parseDouble(price) <= 0){
				throw new Exception("商品单价错误");
			}
			
			if(totalPrice.equals("") || totalPrice == "" || Double.parseDouble(totalPrice) <= 0 ||
				(Integer.parseInt(number)*Double.parseDouble(price) != Double.parseDouble(totalPrice))){
				throw new Exception("商品总价错误");
			}
			
			Purchase_detailed detailed = new Purchase_detailed();
			detailed.setMilk_ID(milk.getID());
			detailed.setCreated(DateTool.getNowTime());
			detailed.setNumber(Integer.getInteger(number));
			detailed.setPurchase_ID(purchase.getID());
			detailed.setPurchase_price(Double.parseDouble(price));
			detailed.setTotal_amount(Double.parseDouble(totalPrice));
			detailed.setUpdated(DateTool.getNowTime());
			
			detailedService.addPurchaseDetailed(detailed);
		}
		
		result.put("succ", true);
		result.put("message", "新增采购单成功");
		return result;
	}
	
}
