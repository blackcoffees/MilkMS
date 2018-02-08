package com.cy.milkms.db.query;

public class ReportSaleSummaryDataQuery {
	/*销售汇总数据对象*/
	private int summarySaleOrderCount;
	private int summarySaleGoodsQuantity;
	private double summarySaleGoodsPrice;
	private double summarySaleGoodsProfit;
	public int getSummarySaleOrderCount() {
		return summarySaleOrderCount;
	}
	public void setSummarySaleOrderCount(int summarySaleOrderCount) {
		this.summarySaleOrderCount = summarySaleOrderCount;
	}
	public int getSummarySaleGoodsQuantity() {
		return summarySaleGoodsQuantity;
	}
	public void setSummarySaleGoodsQuantity(int summarySaleGoodsQuantity) {
		this.summarySaleGoodsQuantity = summarySaleGoodsQuantity;
	}
	public double getSummarySaleGoodsPrice() {
		return summarySaleGoodsPrice;
	}
	public void setSummarySaleGoodsPrice(double summarySaleGoodsPrice) {
		this.summarySaleGoodsPrice = summarySaleGoodsPrice;
	}
	public double getSummarySaleGoodsProfit() {
		return summarySaleGoodsProfit;
	}
	public void setSummarySaleGoodsProfit(double summarySaleGoodsProfit) {
		this.summarySaleGoodsProfit = summarySaleGoodsProfit;
	}
	
}
