package com.cy.milkms.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.milkms.service.IReportService;
import com.cy.milkms.util.CommonTool;
import com.cy.milkms.util.DateTool;
import com.cy.milkms.util.Pager;

import net.sf.json.JSONObject;

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
		if(!DateTool.compareToDate(startTime, endTime)){
			Map<String, Object> result = new HashMap<>();
			result.put("succ", false);
			result.put("message", "开始时间不能小于结束时间");
			return JSONObject.fromObject(result).toString();
		}
		if(DateTool.isExceedOneYear(startTime, endTime)){
			Map<String, Object> result = new HashMap<>();
			result.put("succ", false);
			result.put("message", "时间相差大于一年，请使用导出功能");
			return JSONObject.fromObject(result).toString();
		}
		return service.getPurchaseReport(pager, startTime, endTime, milkInfo);
	}
	
	
	@RequestMapping("getSaleReport")
	@ResponseBody
	public String getSaleReport(Pager pager, String startTime, String endTime, String info, String type){
		if(startTime == null || startTime.equals("")){
			startTime = DateTool.getNowMonthFirst();
		}
		if(endTime == null || endTime.equals("")){
			endTime = DateTool.getNowMonthLast();
		}
		if(!DateTool.compareToDate(startTime, endTime)){
			Map<String, Object> result = new HashMap<>();
			result.put("succ", false);
			result.put("message", "开始时间不能小于结束时间");
			return JSONObject.fromObject(result).toString();
		}
		if(DateTool.isExceedOneYear(startTime, endTime)){
			Map<String, Object> result = new HashMap<>();
			result.put("succ", false);
			result.put("message", "时间相差大于一年，请使用导出功能");
			return JSONObject.fromObject(result).toString();
		}
		return service.getSaleReport(pager, startTime, endTime, info, type);
	}
	
	@RequestMapping("getGoodsAnalysisReport")
	@ResponseBody
	public String getGoodsAnalysisReport(String startStartTime, String startEndTime, String endStartTime, String endEndTime,
			String info, Pager pager, String type){
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		if(!CommonTool.isNull(startStartTime) && !CommonTool.isNull(startEndTime) && CommonTool.isNull(endStartTime) &&
				CommonTool.isNull(endEndTime));
		else if(!CommonTool.isNull(startStartTime) && !CommonTool.isNull(startEndTime) && !CommonTool.isNull(endStartTime) &&
				!CommonTool.isNull(endEndTime)){
			if(!DateTool.compareToDate(endStartTime, endEndTime)){
				result.put("message", "销售时间错误，请重新选择");
				return JSONObject.fromObject(result).toString();
			}
		}
		else{
			result.put("message", "请选择销售时间");
			return JSONObject.fromObject(result).toString();
		}
		if(!DateTool.compareToDate(startStartTime, startEndTime)){
			result.put("message", "销售时间错误，请重新选择");
			return JSONObject.fromObject(result).toString();
		}
		
		return service.getGoodsAnalysisReport(startStartTime, startEndTime, endStartTime, endEndTime, info, pager, type);
	}
	
	@RequestMapping("exportExcel")
	@ResponseBody
	public String exportExcel(String path, String startTime, String endTime, String type){
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		result = service.exportExcel(path, startTime, endTime, type);
		return JSONObject.fromObject(result).toString();
	}
	
	
	@RequestMapping("getSaleToday")
	public String getSaleToday(){
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		result = service.getSaleToday();
		return JSONObject.fromObject(result).toString();
	}
}
