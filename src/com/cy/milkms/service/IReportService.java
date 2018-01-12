package com.cy.milkms.service;

import com.cy.milkms.util.Pager;

public interface IReportService {
	public String getPurchaseReport(Pager pager, String startTime, String endTime);
}
