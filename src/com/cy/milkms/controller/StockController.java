package com.cy.milkms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.milkms.db.query.StockQuery;
import com.cy.milkms.service.IStockService;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.ReturnJsonData;

@Controller
@RequestMapping("stock")
public class StockController {

	@Autowired
	private IStockService service;
	
	@RequestMapping("getStockByMilkName")
	@ResponseBody
	public String getStockByMilkName(String milkName){
		List<StockQuery> rows = service.getStockByMilkName(milkName);
		return ReturnJsonData.createReturnJsonData(rows.size(), rows);
	}
	
	@RequestMapping("getStockByCondition")
	@ResponseBody
	public String getStockByCondition(String milkName, Pager pager){
		List<StockQuery> list = service.getStockByCondition(milkName, pager);
		int total = service.getStockByConditionCount(milkName);
		return ReturnJsonData.createReturnJsonData(total, list);
	}
	
}
