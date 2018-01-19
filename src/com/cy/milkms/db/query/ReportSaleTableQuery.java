package com.cy.milkms.db.query;

public class ReportSaleTableQuery extends TotalSaleQuery{
	private int totalNumber;/*商品分组总数量*/
	private double totalPrice;/*商品分组总金额*/
	private double totalProfit;/*商品分组总利润*/
	
	private double totalCostPrice;/*加权平均总成本*/
	private double costPrice;/*加权平均成本*/
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public double getTotalProfit() {
		return totalProfit;
	}
	public void setTotalProfit(double totalProfit) {
		this.totalProfit = totalProfit;
	}
	public double getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}
	public double getTotalCostPrice() {
		return totalCostPrice;
	}
	public void setTotalCostPrice(double totalCostPrice) {
		this.totalCostPrice = totalCostPrice;
	}
	
}
