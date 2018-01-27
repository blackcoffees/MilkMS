package com.cy.milkms.service.impl;

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
import com.cy.milkms.db.query.PurchaseQuery;
import com.cy.milkms.service.IMilkService;
import com.cy.milkms.service.IPurchaseDetailedService;
import com.cy.milkms.service.IPurchaseService;
import com.cy.milkms.service.IStockRecordService;
import com.cy.milkms.service.IStockService;
import com.cy.milkms.util.BusinessException;
import com.cy.milkms.util.DateTool;
import com.cy.milkms.util.Enum;
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
	public List<List<PurchaseQuery>> getPurchaseByConditon(String purchaseID, String startTime, String endTime, Pager pager) {
		List<List<PurchaseQuery>> rows = new ArrayList<List<PurchaseQuery>>();
		List<PurchaseQuery> purchaseList = mapper.getPurchaseByConditon(purchaseID, startTime, endTime, pager);
		Map<Integer, List<PurchaseQuery>> map =new HashMap<Integer, List<PurchaseQuery>>();
		List<Integer> sortPurchaseIDs = new ArrayList<Integer>();
		for(int i=0;i<purchaseList.size();i++){
			if(map.containsKey(purchaseList.get(i).getId())){
				map.get(purchaseList.get(i).getId()).add(purchaseList.get(i));
			}
			else{
				List<PurchaseQuery> list = new ArrayList<PurchaseQuery>();
				list.add(purchaseList.get(i));
				map.put(purchaseList.get(i).getId(), list);
				sortPurchaseIDs.add(purchaseList.get(i).getId());
			}
		}
		for(int j=0;j<sortPurchaseIDs.size();j++){
			rows.add(map.get(sortPurchaseIDs.get(j)));
		}
		return rows;
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
			
		String total_price = jsonArray.getJSONObject(0).getString("total_price");
		double totalPriceDouble = Double.parseDouble(total_price);
		if(total_price.equals("") || total_price == null){
			result.put("message", "采购总价不能小于等于0");
			return result;
		}
		/*采购单*/	
		Purchase purchase = new Purchase();
		purchase.setCreated(DateTool.getNowTime());
		purchase.setUpdated(DateTool.getNowTime());
		purchase.setTime(Timestamp.valueOf(time));
		purchase.setTotal_price(totalPriceDouble);
		purchase.setStatus(Enum.PURCHASE_SATTUS_ON);
		int add_pur = mapper.addPurchase(purchase);
		if(add_pur <= 0)
			throw new BusinessException("新增采购单失败");
		
		/*采购分单*/
		String listStr = jsonArray.getJSONObject(0).getString("list");
		JSONArray listJsonArray = JSONArray.fromObject(listStr);
		for(int i=0;i<listJsonArray.size();i++){
			JSONObject jsonObject = listJsonArray.getJSONObject(i);
			String milk_name = jsonObject.getString("milk_name");
			Milk milk = milkService.getMilkByNameOrCode(milk_name, "");
			if(milk == null)
				throw new BusinessException("商品不存在");
			
			String quantity = jsonObject.getString("quantity");
			String price = jsonObject.getString("price");
			String total_amount = jsonObject.getString("total_amount");
			if(quantity.equals("") || quantity == "" || Integer.parseInt(quantity) <= 0){
				throw new BusinessException("商品数量错误");
			}
			
			if(price.equals("") || price == "" || Double.parseDouble(price) <= 0){
				throw new BusinessException("商品单价错误");
			}
			
			if(total_amount.equals("") || total_amount == "" || Double.parseDouble(total_amount) <= 0 ||
				(Integer.parseInt(quantity)*Double.parseDouble(price) != Double.parseDouble(total_amount))){
				throw new BusinessException("商品总价错误");
			}
			Purchase_detailed detailed = new Purchase_detailed();
			detailed.setMilk_ID(milk.getId());
			detailed.setCreated(DateTool.getNowTime());
			detailed.setQuantity(Integer.parseInt(quantity));
			detailed.setPurchase_ID(purchase.getId());
			detailed.setPrice(Double.parseDouble(price));
			detailed.setTotal_price(Double.parseDouble(total_amount));
			detailed.setUpdated(DateTool.getNowTime());
			detailedService.addPurchaseDetailed(detailed);
			/*新增库存*/
			Stock stock = stockService.getStockByMilkID(milk.getId());
			if(stock == null){
				Stock stock2 = new Stock();
				stock2.setMilk_ID(milk.getId());
				stock2.setQuantity(Integer.parseInt(quantity));
				stock2.setCreated(DateTool.getNowTime());
				stock2.setCost_price(Double.parseDouble(price));
				int stockID = stockService.addStock(stock2);
				if(stockID <= 0){
					throw new BusinessException("库存添加失败");
				}
			}
			else{ 
				/*库存记录*/
				double new_cost_price = (totalPriceDouble + (stock.getCost_price() * stock.getQuantity())) / (stock.getQuantity() + Integer.parseInt(quantity));
				StockRecord stockRecord = new StockRecord();
				stockRecord.setCreated(DateTool.getNowTime());
				stockRecord.setMilk_id(milk.getId());
				stockRecord.setNew_qty(stock.getQuantity() + Integer.parseInt(quantity));
				stockRecord.setOld_qty(stock.getQuantity());
				stockRecord.setOld_cost_price(stock.getCost_price());
				stockRecord.setNew_cost_price(new_cost_price);
				stockRecord.setUpdated(DateTool.getNowTime());
				int addStockRecordResult = stockRecordService.addStockRecord(stockRecord);
				if(addStockRecordResult <= 0){
					throw new BusinessException("库存添加失败");
				}
				/*库存*/
				stock.setQuantity(Integer.parseInt(quantity) + stock.getQuantity());
				stock.setCost_price(new_cost_price);
				stock.setUpdated(DateTool.getNowTime());
				int effect = stockService.updateStock(stock);
				if(effect <= 0){
					throw new BusinessException("库存添加失败");
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
				map.put(map.get(list.get(i).getMilk_ID()), (number+list.get(i).getQuantity()));
			}
			else {
				map.put(list.get(i).getMilk_ID(), list.get(i).getQuantity());
			}
		}
		Set<Integer> keySet = map.keySet();
		Iterator<Integer> iterator = keySet.iterator();
		while(iterator.hasNext()){
			int milkID = iterator.next();
			Stock stock = stockService.getStockByMilkID(milkID);
			if(stock.getQuantity() < (stock.getQuantity() - map.get(milkID))){
				throw new BusinessException("库存不足，无法废弃采购单");
			}
			StockRecord stockRecord = new StockRecord();
			stockRecord.setCreated(DateTool.getNowTime());
			stockRecord.setMilk_id(milkID);
			stockRecord.setNew_qty(stock.getQuantity() - map.get(milkID));
			stockRecord.setOld_qty(stock.getQuantity());
			stockRecord.setUpdated(DateTool.getNowTime());
			int addStockRecordResult = stockRecordService.addStockRecord(stockRecord);
			if(addStockRecordResult <= 0){
				throw new BusinessException("修改库存失败，请联系管理员");
			}
			stock.setQuantity(stock.getQuantity() - map.get(milkID));
			stock.setUpdated(DateTool.getNowTime());
			int stockResult = stockService.updateStock(stock);
			if(stockResult <= 0){
				throw new BusinessException("修改库存失败，请联系管理员");
			}
		}
		return mapper.updatePurchaseOff(purchaseID);
	}
	
}
