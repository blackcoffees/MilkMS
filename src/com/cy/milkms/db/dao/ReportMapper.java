package com.cy.milkms.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.query.ReportPurchaseSummaryDataQuery;
import com.cy.milkms.db.query.ReportPurchaseTableQuery;
import com.cy.milkms.db.query.ReportSaleTableQuery;
import com.cy.milkms.util.Pager;

public interface ReportMapper {
	public List<ReportPurchaseSummaryDataQuery> getPurchaseReportSummaryData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("milkInfo")String milkInfo);
	
	public List<ReportPurchaseTableQuery> getPurchaseReportLimit(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("pager")Pager pager, @Param("milkInfo")String milkInfo);
	
	public List<ReportPurchaseSummaryDataQuery> getSaleReportTotalNumber(@Param("startTime")String startTime, @Param("endTime")String endTime,
			@Param("info")String info, @Param("type")String type);
	
	public List<ReportSaleTableQuery> getSaleReportLimit(@Param("startTime")String startTime, @Param("endTime")String endTime,
			@Param("pager")Pager pager, @Param("info")String info, @Param("type")String type);
	
}
