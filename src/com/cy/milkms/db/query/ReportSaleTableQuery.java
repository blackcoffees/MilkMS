package com.cy.milkms.db.query;

public class ReportSaleTableQuery extends SaleQuery{
	public int totalSaleQuantity; /*分组销售总数量*/
	public double totalSalePrice; /*分组销售总金额*/
	public double totalSaleProfit; /*分组销售总利润*/
	public int getTotalSaleQuantity() {
		return totalSaleQuantity;
	}
	public void setTotalSaleQuantity(int totalSaleQuantity) {
		this.totalSaleQuantity = totalSaleQuantity;
	}
	public double getTotalSalePrice() {
		return totalSalePrice;
	}
	public void setTotalSalePrice(double totalSalePrice) {
		this.totalSalePrice = totalSalePrice;
	}
	public double getTotalSaleProfit() {
		return totalSaleProfit;
	}
	public void setTotalSaleProfit(double totalSaleProfit) {
		this.totalSaleProfit = totalSaleProfit;
	}
	
}
