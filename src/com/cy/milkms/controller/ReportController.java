package com.cy.milkms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.milkms.service.IReportService;
import com.cy.milkms.util.DateTool;
import com.cy.milkms.util.Pager;

@Controller
@RequestMapping("report")
public class ReportController {

	@Autowired
	private IReportService service;
	
	
	@RequestMapping("getPurchaseReport")
	@ResponseBody
	public String getPurchaseReport(Pager pager, String startTime, String endTime, String milkInfo){
		if(startTime == null || startTime.equals("")){
			startTime = DateTool.getNowMonthFirst();
		}
		if(endTime == null || endTime.equals("")){
			endTime = DateTool.getNowMonthLast();
		}
		return service.getPurchaseReport(pager, startTime, endTime, milkInfo);
	}
	
	
	@RequestMapping("getSaleReport")
	@ResponseBody
	public String getSaleReport(Pager pager, String startTime, String endTime, String info, String type){
		return service.getSaleReport(pager, startTime, endTime, info, type);
	}
}
