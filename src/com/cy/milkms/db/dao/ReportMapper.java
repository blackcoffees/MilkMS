package com.cy.milkms.db.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.cy.milkms.db.query.LineChartQuery;
import com.cy.milkms.db.query.LineDateQuery;
import com.cy.milkms.db.query.PieChartQuery;
import com.cy.milkms.db.query.PurchaseQuery;
import com.cy.milkms.db.query.ReportPurchaseSummaryDataQuery;
import com.cy.milkms.db.query.ReportPurchaseTableQuery;
import com.cy.milkms.db.query.ReportSaleSummaryDataQuery;
import com.cy.milkms.db.query.ReportSaleTableQuery;
import com.cy.milkms.db.query.SaleQuery;
import com.cy.milkms.db.query.SaleTodayQuery;
import com.cy.milkms.util.Pager;

public interface ReportMapper {
	
	/*采购*/
	/*汇总数据*/
	public ReportPurchaseSummaryDataQuery getPurchaseReportSummaryData(@Param("summaryDataQuery")ReportPurchaseSummaryDataQuery summaryDataQuery);
	/*表格数据*/
	public List<ReportPurchaseTableQuery> getPurchaseReportTableData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("pager")Pager pager, @Param("milkInfo")String milkInfo);
	/*折线图x轴数据*/
	public List<LineDateQuery> getPurchaseReportDateData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("milkInfo")String milkInfo);
	/*折线图y轴数据*/
	public List<LineChartQuery> getPurchaseReportLineData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("milkInfo")String milkInfo);
	/*饼状图数据*/
	public List<PieChartQuery> getPurchaseReportPieData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("milkInfo")String milkInfo);
	
	
	/*销售*/
	/*汇总数据*/
	public ReportSaleSummaryDataQuery getSaleReportSummaryData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("info")String info, @Param("type")String type);
	/*表格数据*/
	public List<ReportSaleTableQuery> getSaleReportTableData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("type")String type,
			@Param("pager")Pager pager, @Param("info")String info);
	/*折线图x轴数据*/
	public List<LineDateQuery> getSaleReportDateData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("info")String info, @Param("type")String type);
	/*折线图y轴数据*/
	public List<LineChartQuery> getSaleReportLineData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("type")String type, @Param("info")String info);
	/*饼状图数据*/
	public List<PieChartQuery> getSaleReportPieData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("type")String type, @Param("info")String info);
	
	
	/*分析*/
	/*汇总数据*/
	public ReportSaleSummaryDataQuery getAnalysisSummaryData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("info")String info, @Param("type")String type);
	/*涨幅数据*/
	public List<LineChartQuery> getAnalysisRoseData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("info")String info, @Param("type")String type);
	/*折线图x轴数据*/
	public List<LineDateQuery> getAnalysisReportDateData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("info")String info, @Param("type")String type);
	/*折线图y轴数据*/
	public List<LineChartQuery> getAnalysisReportLineData(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("type")String type, @Param("info")String info);
	
	
	/*导出*/
	public List<PurchaseQuery> getExportDatasByPurchase(@Param("startTime")String startTime, @Param("endTime")String endTime);
	public List<SaleQuery> getExportDatasBySale(@Param("startTime")String startTime, @Param("endTime")String endTime);
	
	
	public SaleTodayQuery getSaleToday(@Param("time")String time);
}
