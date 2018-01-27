package com.cy.milkms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cy.milkms.db.query.PurchaseQuery;
import com.cy.milkms.service.IPurchaseService;
import com.cy.milkms.util.BusinessException;
import com.cy.milkms.util.CommonTool;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.ReturnJsonData;

import net.sf.json.JSONObject;

@RequestMapping("purchase")
@Controller
public class PurchaseController {
	
	@Autowired
	IPurchaseService service;
	
	@ResponseBody
	@RequestMapping("getPurchaseByConditon")
	public String getPurchaseByConditon(String purchaseID, String startTime, String endTime, Pager pager){
		Map<String, Object> result = new HashMap<String, Object>();
		if(purchaseID != null && !CommonTool.isNumber(purchaseID)){
			result.put("succ", false);
			result.put("message", "请输入合法的采购单号");
			return JSONObject.fromObject(result).toString();
		}
		List<List<PurchaseQuery>> rows = service.getPurchaseByConditon(purchaseID, startTime, endTime, pager);
		int total = service.getPurchaseByConditionCount(purchaseID, startTime, endTime);
		pager.setTotal(total);
		return ReturnJsonData.returnJsonDataMultipleList(pager, rows);
	}
	
	
	@ResponseBody
	@RequestMapping("addPurchase")
	public String addPurchase(String data){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = service.addPurchase(data);
		} catch (Exception e) {
			if(e instanceof BusinessException){
				result.put("succ", false);
				result.put("message", e.getMessage());
			}
			else {
				e.printStackTrace();
				result.put("succ", false);
				result.put("message", "系统繁忙，请稍后再试!");
			}
		}
		return JSONObject.fromObject(result).toString();
	}
	
	
	@ResponseBody
	@RequestMapping("updatePurchaseOff")
	public String updatePurchaseOff(String purchaseID){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("succ", false);
		result.put("message", "废弃失败");
		if(!CommonTool.isNumber(purchaseID))
			return JSONObject.fromObject(result).toString();
		int updateResult = 0;
		try {
			updateResult = service.updatePurchaseOff(Integer.parseInt(purchaseID));
		} catch (Exception e) {
			if(e instanceof BusinessException){
				result.put("succ", false);
				result.put("message", e.getMessage());
			}
			else {
				e.printStackTrace();
				result.put("succ", false);
				result.put("message", "系统繁忙，请稍后再试!");
			}
		}
		if(updateResult > 0){
			result.put("succ", true);
			result.put("message", "废弃成功");
		}
		return JSONObject.fromObject(result).toString();
	}
}
