package com.cy.milkms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.milkms.db.query.TotalPurchaseQuery;
import com.cy.milkms.service.IPurchaseService;
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
	public String getPurchaseByConditon(String pucharseID, String startTime, String endTime, Pager pager){
		Map result = new HashMap();
		if(pucharseID != null && !CommonTool.isNumber(pucharseID)){
			result.put("succ", false);
			result.put("message", "请输入合法的采购单号");
			return JSONObject.fromObject(result).toString();
		}
		List<List<TotalPurchaseQuery>> rows = service.getPurchaseByConditon(pucharseID, startTime, endTime, pager);
		int total = service.getPurchaseByConditionCount(pucharseID, startTime, endTime);
		return ReturnJsonData.createReturnJsonData(total, rows);
	}
	
	
	@ResponseBody
	@RequestMapping("addPurchase")
	public String addPurchase(String data){
		Map result = new HashMap();
		try {
			result = service.addPurchase(data);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.put("succ", false);
			result.put("message", e.getMessage());
		}
		return JSONObject.fromObject(result).toString();
	}
}
