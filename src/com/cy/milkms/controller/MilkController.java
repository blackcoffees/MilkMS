package com.cy.milkms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.service.IMilkService;
import com.cy.milkms.util.Enum;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.ReturnJsonData;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("milk")
public class MilkController {
	
	@Autowired
	private IMilkService service;
	
	@RequestMapping("getMilkByCondition")
	@ResponseBody
	public String getMilkByCondition(Pager pager, String milkInfo){
		int total = service.getMilkByConditionCount(milkInfo);
		List<Milk> list = service.getMilkByCondition(pager, milkInfo);
		pager.setTotal(total);
		return ReturnJsonData.returnJsonDataSigleList(pager, list);
	}
	
	
	@RequestMapping("addMilk")
	@ResponseBody
	public String addMilk(Milk milk, String purchase_price, String selling_price){
		Map<String, Object> res = new HashMap<>();
		boolean succ = false;
		res.put("succ", succ);
		
		String message = "表单输入错误";
		String pattern = "[0-9]{4}";
		boolean isValidat = Pattern.matches(pattern, milk.getCode());
		if(!isValidat){
			res.put("message", message);
			return JSONObject.fromObject(res).toString();
		}
		pattern = "^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$";
		isValidat = Pattern.matches(pattern, purchase_price);
		if(!isValidat || Double.parseDouble(purchase_price) > 2000){
			res.put("message", message);
			return JSONObject.fromObject(res).toString();
		}
		isValidat = Pattern.matches(pattern, selling_price);
		if(!isValidat || Double.parseDouble(selling_price) > 2000){
			res.put("message", message);
			return JSONObject.fromObject(res).toString();
		}
		
		milk.setPurchase_price(Double.parseDouble(purchase_price));
		milk.setSelling_price(Double.parseDouble(selling_price));
		milk.setStatus(Enum.MILK_STATUS_ON);
		
		try {
			res = service.addMilk(milk);
		} catch (Exception e) {
			e.printStackTrace();
			res.put("message", "系统繁忙，请稍后再试");
		}
		return JSONObject.fromObject(res).toString();
		
	}
	
	@RequestMapping("editMilk")
	@ResponseBody
	public String editMilk(String purchase_price, String selling_price, String code){
		boolean succ = false;
		Map<String, Object> result = new HashMap<>();
		result.put("succ", succ);
		
		String pattern = "^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$";
		boolean isValidat = Pattern.matches(pattern, purchase_price);
		if(!isValidat){
			result.put("message", "进货价,格式错误");
			return JSONObject.fromObject(result).toString();
		}
		isValidat = Pattern.matches(pattern, selling_price);
		if(!isValidat){
			result.put("message", "销售价,格式错误");
			return JSONObject.fromObject(result).toString();
		}
		
		int edit_result = service.editMilk(Double.parseDouble(purchase_price), Double.parseDouble(selling_price), code);
		if(edit_result > 0){
			succ = true;
			result.put("succ", succ);
			result.put("message", "编辑成功");
		}
		else{
			result.put("message", "编辑失败");
		}
		return JSONObject.fromObject(result).toString();
	}
	
	
	@RequestMapping("deleteMilk")
	@ResponseBody
	public String deleteMilk(String code){

		String message = "系统繁忙";
		boolean succ = false;
		Map<String, Object> map = new HashMap<>();
		
		int result = service.deleteMilk(code);
		if(result <= 0){
			message = "删除失败";
		}
		else{
			message = "删除成功";
			succ = true;
		}
		map.put("succ", succ);
		map.put("message", message);
		return JSONObject.fromObject(map).toString();
	}
	
	@ResponseBody
	@RequestMapping("getMilkByName")
	public String getMilkByName(String name){
		List<Milk> list = service.getMilkByName(name);
		Pager pager = new Pager();
		pager.setTotal(list.size());
		return ReturnJsonData.returnJsonDataSigleList(pager, list);
	}
	
	
	@ResponseBody
	@RequestMapping("getMilkFront")
	public String getMilkFron(String milkInfo){
		Pager pager = new Pager();
		List<Milk> list = service.getMilkFron(milkInfo);
		return ReturnJsonData.returnJsonDataSigleList(pager, list);
	}
}
