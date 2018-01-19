package com.cy.milkms.db.query;

public class ReportPurchaseSummaryDataQuery {
	/*报表汇总数据*/
	private int summaryPurchaseOrderCount;/*商品汇总 订单数量*/
	private String summaryPurchaseMilkNumber;/*商品汇总 商品数量*/
	private int summaryPurchaseMilkPrice;/*商品汇总 商品总价格（采购总价格）*/
	private double summaryFirstThreeMilkName;/*商品汇总 排名前三的商品*/
	
	
	public int getSummaryPurchaseOrderCount() {
		return summaryPurchaseOrderCount;
	}
	public void setSummaryPurchaseOrderCount(int summaryPurchaseOrderCount) {
		this.summaryPurchaseOrderCount = summaryPurchaseOrderCount;
	}
	public String getSummaryPurchaseMilkNumber() {
		return summaryPurchaseMilkNumber;
	}
	public void setSummaryPurchaseMilkNumber(String summaryPurchaseMilkNumber) {
		this.summaryPurchaseMilkNumber = summaryPurchaseMilkNumber;
	}
	public int getSummaryPurchaseMilkPrice() {
		return summaryPurchaseMilkPrice;
	}
	public void setSummaryPurchaseMilkPrice(int summaryPurchaseMilkPrice) {
		this.summaryPurchaseMilkPrice = summaryPurchaseMilkPrice;
	}
	public double getSummaryFirstThreeMilkName() {
		return summaryFirstThreeMilkName;
	}
	public void setSummaryFirstThreeMilkName(double summaryFirstThreeMilkName) {
		this.summaryFirstThreeMilkName = summaryFirstThreeMilkName;
	}
}
