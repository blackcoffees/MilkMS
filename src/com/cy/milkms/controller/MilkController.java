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

import net.sf.json.JSON;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("milk")
public class MilkController {
	
	@Autowired
	private IMilkService service;
	
	@RequestMapping("get_milk_condition")
	@ResponseBody
	public String get_milk_condition(Pager pager, String milkName){
		int total = service.get_milk_condition_count(milkName);
		List list = service.get_milk_condition(pager, milkName);
		return ReturnJsonData.currentJsonData(total, list);
	}
	
	
	@RequestMapping("add_milk")
	@ResponseBody
	public String add_milk(Milk milk, String purchase_price, String selling_price){
		Map res = new HashMap();
		boolean succ = false;
		String message = "表单输入错误";
		String pattern = "[0-9]{4}";
		boolean isValidat = Pattern.matches(pattern, milk.getNumber());
		if(!isValidat){
			res.put("succ", succ);
			res.put("message", message);
			return JSONArray.fromObject(res).toString();
		}
		pattern = "^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$";
		isValidat = Pattern.matches(pattern, purchase_price);
		if(!isValidat || Double.parseDouble(purchase_price) > 2000){
			res.put("succ", succ);
			res.put("message", message);
			return JSONArray.fromObject(res).toString();
		}
		isValidat = Pattern.matches(pattern, selling_price);
		if(!isValidat || Double.parseDouble(selling_price) > 2000){
			res.put("succ", succ);
			res.put("message", message);
			return JSONArray.fromObject(res).toString();
		}
		
		milk.setPurchase_price(Double.parseDouble(purchase_price));
		milk.setSelling_price(Double.parseDouble(selling_price));
		milk.setStatus(Enum.MILK_STATUS_ON);
		
		int add_result = service.add_milk(milk);
		if(add_result>0){
			succ = true;
			res.put("succ", succ);
			return JSONArray.fromObject(res).toString();
		}
		else if(add_result == -1){
			message = "牛奶名称或编号已经存在，请重新输入";
			res.put("succ", succ);
			res.put("message", message);
			return JSONArray.fromObject(res).toString();
		}
		else{
			message = "新增失败";
			res.put("succ", succ);
			res.put("message", message);
			return JSONArray.fromObject(res).toString();
		}
		
	}
	
	@RequestMapping("edit_milk")
	@ResponseBody
	public String edit_milk(String purchase_price, String selling_price, String number){
		boolean succ = false;
		String message = "系统繁忙";
		Map result = new HashMap();
		
		String pattern = "^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$";
		boolean isValidat = Pattern.matches(pattern, purchase_price);
		if(!isValidat || Double.parseDouble(purchase_price) > 2000){
			message = "进货价格式错误";
			result.put("succ", succ);
			result.put("message", message);
			return JSONArray.fromObject(result).toString();
		}
		isValidat = Pattern.matches(pattern, selling_price);
		if(!isValidat || Double.parseDouble(selling_price) > 2000){
			message = "销售价格式错误";
			result.put("succ", succ);
			result.put("message", message);
			return JSONArray.fromObject(result).toString();
		}
		
		int edit_result = service.edit_milk(Double.parseDouble(purchase_price), Double.parseDouble(selling_price), number);
		if(edit_result > 0){
			succ = true;
			message = "编辑成功";
			result.put("succ", succ);
			result.put("message", message);
		}
		return JSONArray.fromObject(result).toString();
	}
	
	
	@RequestMapping("delete_milk")
	@ResponseBody
	public String delete_milk(String number){

		String message = "系统繁忙";
		boolean succ = false;
		Map map = new HashMap();
		
		int result = service.delete_milk(number);
		if(result <= 0){
			message = "删除失败";
		}
		else{
			message = "删除成功";
			succ = true;
		}
		return JSONArray.fromObject(map).toString();
	}
}
