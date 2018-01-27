package com.cy.milkms.db.query;

public class ReportPurchaseSummaryDataQuery {
	/*传入参数*/
	private String startTime;
	private String endTime;
	private String milkInfo;
	/*报表汇总数据*/
	private int summaryPurchaseOrderCount;/*商品汇总 订单数量*/
	private int summaryPurchaseMilkNumber;/*商品汇总 商品数量*/
	private double summaryPurchaseMilkPrice;/*商品汇总 商品总价格（采购总价格）*/
	private String summaryFirstThreeMilkName;/*商品汇总 排名前三的商品*/
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getMilkInfo() {
		return milkInfo;
	}
	public void setMilkInfo(String milkInfo) {
		this.milkInfo = milkInfo;
	}
	public int getSummaryPurchaseOrderCount() {
		return summaryPurchaseOrderCount;
	}
	public void setSummaryPurchaseOrderCount(int summaryPurchaseOrderCount) {
		this.summaryPurchaseOrderCount = summaryPurchaseOrderCount;
	}
	public void setSummaryPurchaseMilkPrice(int summaryPurchaseMilkPrice) {
		this.summaryPurchaseMilkPrice = summaryPurchaseMilkPrice;
	}
	public int getSummaryPurchaseMilkNumber() {
		return summaryPurchaseMilkNumber;
	}
	public void setSummaryPurchaseMilkNumber(int summaryPurchaseMilkNumber) {
		this.summaryPurchaseMilkNumber = summaryPurchaseMilkNumber;
	}
	public double getSummaryPurchaseMilkPrice() {
		return summaryPurchaseMilkPrice;
	}
	public void setSummaryPurchaseMilkPrice(double summaryPurchaseMilkPrice) {
		this.summaryPurchaseMilkPrice = summaryPurchaseMilkPrice;
	}
	public String getSummaryFirstThreeMilkName() {
		return summaryFirstThreeMilkName;
	}
	public void setSummaryFirstThreeMilkName(String summaryFirstThreeMilkName) {
		this.summaryFirstThreeMilkName = summaryFirstThreeMilkName;
	}
	
}
