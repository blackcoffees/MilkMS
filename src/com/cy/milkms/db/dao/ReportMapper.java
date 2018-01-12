package com.cy.milkms.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.query.ReportPurchaseTableQuery;
import com.cy.milkms.db.query.ReportTotalNumberQuery;
import com.cy.milkms.db.query.TotalPurchaseQuery;
import com.cy.milkms.util.Pager;

public interface ReportMapper {
	public List<ReportTotalNumberQuery> getPurchaseReportTotalNumber(@Param("startTime")String startTime, @Param("endTime")String endTime);
	
	public List<ReportPurchaseTableQuery> getPurchaseReportLimit(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("pager")Pager pager);
	
}
