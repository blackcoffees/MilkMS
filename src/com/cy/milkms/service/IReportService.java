package com.cy.milkms.service;

import com.cy.milkms.util.Pager;

public interface IReportService {
	public String getPurchaseReport(Pager pager, String startTime, String endTime, String milkInfo);
	
	public String getSaleReport(Pager pager, String startTime, String endTime, String info, String type);
}
