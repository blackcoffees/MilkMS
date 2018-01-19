package com.cy.milkms.service.impl;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import com.cy.milkms.db.entity.Stock;
import com.cy.milkms.db.entity.StockRecord;
import com.cy.milkms.db.query.TotalPurchaseIDsQuery;
import com.cy.milkms.db.query.TotalPurchaseQuery;
import com.cy.milkms.service.IMilkService;
import com.cy.milkms.service.IPurchaseDetailedService;
import com.cy.milkms.service.IPurchaseService;
import com.cy.milkms.service.IStockRecordService;
import com.cy.milkms.service.IStockService;
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
	
	@Autowired
	private IStockService stockService;
	
	@Autowired
	private IStockRecordService stockRecordService;

	@Override
	public List<List<TotalPurchaseQuery>> getPurchaseByConditon(String pucharseID, String startTime, String endTime, Pager pager) {
		List<List<TotalPurchaseQuery>> rows = new ArrayList<List<TotalPurchaseQuery>>();
		try {
			List<TotalPurchaseIDsQuery> purchaseIDList = this.getPurchaseByConditionByID(pucharseID, startTime, endTime, pager);
			Integer[] purchaseIDs = new Integer[purchaseIDList.size()];
			for(int i=0;i<purchaseIDList.size();i++){
				purchaseIDs[i] = purchaseIDList.get(i).getId();
			}
			List<TotalPurchaseQuery> purchaseList = mapper.getPurchaseByConditon(startTime, endTime, purchaseIDs);
			Map<Integer, List<TotalPurchaseQuery>> map =new HashMap<Integer, List<TotalPurchaseQuery>>();
			List<Integer> sortPurchaseIDs = new ArrayList<Integer>();
			for(int i=0;i<purchaseList.size();i++){
				if(map.containsKey(purchaseList.get(i).getId())){
					map.get(purchaseList.get(i).getId()).add(purchaseList.get(i));
				}
				else{
					List<TotalPurchaseQuery> list = new ArrayList<TotalPurchaseQuery>();
					list.add(purchaseList.get(i));
					map.put(purchaseList.get(i).getId(), list);
					sortPurchaseIDs.add(purchaseList.get(i).getId());
				}
			}
			for(int j=0;j<sortPurchaseIDs.size();j++){
				rows.add(map.get(sortPurchaseIDs.get(j)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rows;
	}

	@Override
	public List<TotalPurchaseIDsQuery> getPurchaseByConditionByID(String pucharseID, String startTime, String endTime, Pager pager) {
		return mapper.getPurchaseByConditionByID(pucharseID, startTime, endTime, pager);
	}

	@Override
	@Transactional
	public Map<String, Object> addPurchase(String data) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
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
		/*采购单*/	
		Purchase purchase = new Purchase();
		purchase.setCreated(DateTool.getNowTime());
		purchase.setUpdated(DateTool.getNowTime());
		purchase.setTime(Timestamp.valueOf(time));
		purchase.setTotal_amount(totalPriceDouble);
		int add_pur = mapper.addPurchase(purchase);
		if(add_pur <= 0)
			throw new Exception("新增采购单失败");
		
		String listStr = jsonArray.getJSONObject(0).getString("list");
		JSONArray listJsonArray = JSONArray.fromObject(listStr);
		Map<Integer, Integer> stockMap = new HashMap<Integer, Integer>();
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
			/*采购分单*/
			Purchase_detailed detailed = new Purchase_detailed();
			detailed.setMilk_ID(milk.getId());
			detailed.setCreated(DateTool.getNowTime());
			detailed.setNumber(Integer.parseInt(number));
			detailed.setPurchase_ID(purchase.getId());
			detailed.setPurchase_price(Double.parseDouble(price));
			detailed.setTotal_amount(Double.parseDouble(totalPrice));
			detailed.setUpdated(DateTool.getNowTime());
			detailedService.addPurchaseDetailed(detailed);
			/*新增库存*/
			Stock stock = stockService.getStockByMilkID(milk.getId());
			if(stock == null){
				Stock stock2 = new Stock();
				stock2.setMilk_ID(milk.getId());
				stock2.setNumber(Integer.parseInt(number));
				stock2.setCreated(DateTool.getNowTime());
				stock2.setCost_price(Double.parseDouble(price));
				int stockID = stockService.addStock(stock2);
				if(stockID <= 0){
					throw new Exception("库存添加失败");
				}
			}
			else{ 
				/*库存记录*/
				double new_cost_price = (totalPriceDouble + (stock.getCost_price() * stock.getNumber())) / (stock.getNumber() + Integer.parseInt(number));
				StockRecord stockRecord = new StockRecord();
				stockRecord.setCreated(DateTool.getNowTime());
				stockRecord.setMilk_id(milk.getId());
				stockRecord.setNew_number(stock.getNumber() + Integer.parseInt(number));
				stockRecord.setOld_number(stock.getNumber());
				stockRecord.setOld_cost_price(stock.getCost_price());
				stockRecord.setNew_cost_price(new_cost_price);
				stockRecord.setUpdated(DateTool.getNowTime());
				int addStockRecordResult = stockRecordService.addStockRecord(stockRecord);
				if(addStockRecordResult <= 0){
					throw new Exception("库存添加失败");
				}
				/*库存*/
				stock.setNumber(Integer.parseInt(number) + stock.getNumber());
				stock.setCost_price(new_cost_price);
				stock.setUpdated(DateTool.getNowTime());
				int effect = stockService.updateStock(stock);
				if(effect <= 0){
					throw new Exception("库存添加失败");
				}
			}
		}
		result.put("succ", true);
		result.put("message", "新增采购单成功");
		return result;
	}

	@Override
	public int getPurchaseByConditionCount(String pucharseID, String startTime, String endTime) {
		return mapper.getPurchaseByConditionCount(pucharseID, startTime, endTime);
	}

	@Override
	public int updatePurchaseOff(int purchaseID) throws Exception {
		List<Purchase_detailed> list = detailedService.getPurchaseDetailedByPurchaseID(purchaseID);
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i=0;i<list.size();i++){
			if(map.get(list.get(i).getMilk_ID()) != null){
				int number = map.get(list.get(i).getMilk_ID());
				map.put(map.get(list.get(i).getMilk_ID()), (number+list.get(i).getNumber()));
			}
			else {
				map.put(list.get(i).getMilk_ID(), list.get(i).getNumber());
			}
		}
		Set<Integer> keySet = map.keySet();
		Iterator<Integer> iterator = keySet.iterator();
		while(iterator.hasNext()){
			int milkID = iterator.next();
			Stock stock = stockService.getStockByMilkID(milkID);
			if(stock.getNumber() < (stock.getNumber() - map.get(milkID))){
				throw new Exception("库存不足，无法废弃采购单");
			}
			StockRecord stockRecord = new StockRecord();
			stockRecord.setCreated(DateTool.getNowTime());
			stockRecord.setMilk_id(milkID);
			stockRecord.setNew_number(stock.getNumber() - map.get(milkID));
			stockRecord.setOld_number(stock.getNumber());
			stockRecord.setUpdated(DateTool.getNowTime());
			int addStockRecordResult = stockRecordService.addStockRecord(stockRecord);
			if(addStockRecordResult <= 0){
				throw new Exception("修改库存失败，请联系管理员");
			}
			stock.setNumber(stock.getNumber() - map.get(milkID));
			stock.setUpdated(DateTool.getNowTime());
			int stockResult = stockService.updateStock(stock);
			if(stockResult <= 0){
				throw new Exception("修改库存失败，请联系管理员");
			}
		}
		return mapper.updatePurchaseOff(purchaseID);
	}
	
}
