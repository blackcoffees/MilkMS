package com.cy.milkms.service;

import java.util.Map;

import com.cy.milkms.util.Pager;

public interface IReportService {
	public String getPurchaseReport(Pager pager, String startTime, String endTime, String milkInfo);
	
	public String getSaleReport(Pager pager, String startTime, String endTime, String info, String type);
	
	public String getGoodsAnalysisReport(String startStartTime, String startEndTime, String endStartTime, String endEndTime,
			String info, Pager pager, String type);
	
	public Map<String, Object> exportExcel(String path, String startTime, String endTime, String type);
	
	public Map<String, Object> getSaleToday();
}
