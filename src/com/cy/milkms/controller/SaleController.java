package com.cy.milkms.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.milkms.service.ISaleService;
import com.cy.milkms.util.CommonTool;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@ResponseBody
@RequestMapping("sale")
public class SaleController {
	
	@Autowired
	private ISaleService service;
	
	@RequestMapping("addSale")
	public String addSale(String data){
		Map result = new HashMap();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		try {
			JSONArray jsonArray = JSONArray.fromObject(data);
			String saleTime = jsonArray.getJSONObject(0).getString("time");
			if(saleTime == null || saleTime == ""){
				result.put("message", "采购时间不能为空");
				return JSONObject.fromObject(result).toString();
			}
			String totalPriceStr = jsonArray.getJSONObject(0).getString("totalPrice");
			if(!CommonTool.isNumber(totalPriceStr)){
				result.put("message", "总价必须是数字");
				return JSONObject.fromObject(result).toString();
			}
			double totalPrice = Double.parseDouble(totalPriceStr);
			if(totalPrice <= 0){
				result.put("message", "总价必须大于0");
				return JSONObject.fromObject(result).toString();
			}
			String distributorIDStr = jsonArray.getJSONObject(0).getString("distributorID");
			if(!CommonTool.isNumber(distributorIDStr)){
				result.put("message", "店铺选择错误");
				return JSONObject.fromObject(result).toString();
			}
			String statusStr = jsonArray.getJSONObject(0).getString("status");
			if(!CommonTool.isNumber(statusStr)){
				result.put("message", "参数错误");
				return JSONObject.fromObject(result).toString();
			}
			int status = Integer.parseInt(statusStr);
			if(!(status == 1 || status == 2)){
				result.put("message", "参数错误");
				return JSONObject.fromObject(result).toString();
			}
			String list = jsonArray.getJSONObject(0).getString("list");
			result = service.addSale(saleTime, Integer.parseInt(distributorIDStr), totalPrice, list, status);
		} catch (Exception e) {
			// TODO: handle exception
			result.put("message", e.getMessage());
			e.printStackTrace();
		}
		return JSONObject.fromObject(result).toString();
	}
}
