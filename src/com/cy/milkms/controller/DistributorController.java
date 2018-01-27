package com.cy.milkms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.milkms.db.entity.Distributor;
import com.cy.milkms.service.IDistributorService;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.ReturnJsonData;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("distributor")
public class DistributorController {
	@Autowired
	private IDistributorService service;
	
	@RequestMapping("getDistributorByCondition")
	@ResponseBody
	public String getDistributorByCondition(String distributorInfo, Pager pager){
		List<Distributor> rows = service.getDistributorByCondition(distributorInfo, pager);
		int total = service.getDistributorByConditionCount(distributorInfo);
		pager.setTotal(total);
		return ReturnJsonData.returnJsonDataSigleList(pager, rows);
	}
	
	@RequestMapping("addDistributor")
	@ResponseBody
	public String addDistributor(Distributor distributor){
		Map<String, Object> result = new HashMap<>();
		boolean succ = false;
		String message = "系统繁忙，请稍后再试";
		
		int add_result = service.addDistributor(distributor);
		if(add_result == -1){
			message = "商家名字已经存在，请重新输入";
		}
		else if(add_result > 0){
			succ = true;
			message = "新增成功";
		}
		else {
			message = "新增失败";
		}
		result.put("succ", succ);
		result.put("message", message);
		return JSONObject.fromObject(result).toString();
	}
	
	@RequestMapping("deleteDistributor")
	@ResponseBody
	public String deleteDistributor(String distributorID){
		Map<String, Object> result = new HashMap<>();
		boolean succ = false;
		String message = "系统繁忙，请稍后再试";
		
		int delete_res = service.deleteDistributor(distributorID);
		if(delete_res > 0){
			succ = true;
			message = "删除成功";
		}
		else{
			message = "删除失败";
		}
		result.put("succ", succ);
		result.put("message", message);
		return JSONObject.fromObject(result).toString();
	}
	
	@RequestMapping("updateDistributor")
	@ResponseBody
	public String updateDistributor(String address, String people, String phone, String name){
		Map<String, Object> result = new HashMap<>();
		boolean succ = false;
		String message = "系统繁忙，请稍后再试";
		
		int update_res = service.updateDistributor(address, people, phone, name);
		if(update_res > 0){
			succ = true;
			message = "编辑成功";
		}
		else{
			message = "编辑失败";
		}
		result.put("succ", succ);
		result.put("message", message);
		return JSONObject.fromObject(result).toString();
	}
}
