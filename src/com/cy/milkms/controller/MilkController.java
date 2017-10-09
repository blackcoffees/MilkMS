package com.cy.milkms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.milkms.service.IMilkService;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.ReturnJsonData;

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
}
