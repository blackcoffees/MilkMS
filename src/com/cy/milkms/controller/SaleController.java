package com.cy.milkms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.milkms.db.query.SaleQuery;
import com.cy.milkms.service.ISaleService;
import com.cy.milkms.util.BusinessException;
import com.cy.milkms.util.CommonTool;
import com.cy.milkms.util.Enum;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.ReturnJsonData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("sale")
public class SaleController {
	
	@Autowired
	private ISaleService service;
	
	@ResponseBody
	@RequestMapping("addSale")
	public String addSale(String data){
		Map<String, Object> result = new HashMap<String, Object>();
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
	
	
	@ResponseBody
	@RequestMapping("getSaleByCondition")
	public String getSaleByCondition(String saleID, String startTime, String endTime, Pager pager, String distributorName, String status){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("succ", false);
		result.put("message", "系統繁忙，请稍后再试");
		try {
			if(saleID == "" || saleID == null){
				saleID = "0";
			}
			else if(!CommonTool.isNumber(saleID)){
				result.put("message", "参数错误");
				return JSONObject.fromObject(result).toString();
			}
			if(!CommonTool.isNumber(status)){
				result.put("message", "参数错误");
				return JSONObject.fromObject(result).toString();
			}
			else if(Integer.parseInt(status) == 0 || Integer.parseInt(status) == Enum.SALE_STATUS_OFF || Integer.parseInt(status) == Enum.SALE_STATUS_PAID || Integer.parseInt(status) == Enum.SALE_STATUS_UNPAID)
				;
			else{
				result.put("message", "参数错误");
				return JSONObject.fromObject(result).toString();
			}
			List<List<SaleQuery>> rows = service.getSaleByCondition(startTime, endTime, Integer.parseInt(saleID), pager, distributorName, Integer.parseInt(status));
			int total = service.getSaleByConditionCount(startTime, endTime, Integer.parseInt(saleID), distributorName, Integer.parseInt(status));
			pager.setTotal(total);
			return ReturnJsonData.returnJsonDataMultipleList(pager, rows);
		} catch (Exception e) {
			if(e instanceof BusinessException)
				result.put("message", e.getMessage());
			else
				e.printStackTrace();
			return JSONObject.fromObject(result).toString();
		}
	}
	
	
	@ResponseBody
	@RequestMapping("abandonSale")
	public String abandonSale(String saleID){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("succ", false);
		result.put("message", "系統繁忙，请稍后再试");
		if(!CommonTool.isNumber(saleID)){
			result.put("message", "参数错误");
			return JSONObject.fromObject(result).toString();
		}
		result = service.abandonSale(Integer.parseInt(saleID));
		return JSONObject.fromObject(result).toString();
	}
	
	
	@ResponseBody
	@RequestMapping("balanceSale")
	public String balanceSale(String saleID, String amount){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("succ", false);
		result.put("message", "系統繁忙，请稍后再试");
		if(!CommonTool.isNumber(saleID)){
			result.put("message", "参数错误");
			return JSONObject.fromObject(result).toString();
		}
		if(!CommonTool.isNumber(amount)){
			result.put("message", "参数错误");
			return JSONObject.fromObject(result).toString();
		}
		result = service.balanceSale(Integer.parseInt(saleID), Double.parseDouble(amount));
		return JSONObject.fromObject(result).toString();
	}
}
