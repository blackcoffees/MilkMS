package com.cy.milkms.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.query.TotalPurchaseIDsQuery;
import com.cy.milkms.db.query.TotalPurchaseQuery;
import com.cy.milkms.util.Pager;

public interface ReportMapper {
	public List<TotalPurchaseIDsQuery> getPurchaseReportByConditionIDs(@Param("milkName")String milkName, @Param("Pager") Pager pager, @Param("startTime")String startTime, @Param("endTime")String endTime);
	
	public int getPurchaseReportByConditionCount(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("milkName")String milkName);
	
	public List<TotalPurchaseQuery> getPurchaseReportByCondition(@Param("milkName")String milkName, @Param("startTime")String startTime, @Param("endTime")String endTime, @Param("purchaseIDs")int[] purchaseIDs);
}
