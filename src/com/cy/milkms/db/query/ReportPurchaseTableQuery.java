package com.cy.milkms.db.query;

public class ReportPurchaseTableQuery extends PurchaseQuery{
	private int totalNumber;/*商品分组总数量*/
	private double totalPrice;/*商品分组总金额*/
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
	
}
