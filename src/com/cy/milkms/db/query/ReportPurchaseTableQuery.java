package com.cy.milkms.db.query;

public class ReportPurchaseTableQuery extends PurchaseQuery{
	private int totalPurchaseQuantity;/*商品分组总数量*/
	private double totalPurchasePrice;/*商品分组总金额*/
	private int code;/*商品编号*/
	public int getTotalPurchaseQuantity() {
		return totalPurchaseQuantity;
	}
	public void setTotalPurchaseQuantity(int totalPurchaseQuantity) {
		this.totalPurchaseQuantity = totalPurchaseQuantity;
	}
	public double getTotalPurchasePrice() {
		return totalPurchasePrice;
	}
	public void setTotalPurchasePrice(double totalPurchasePrice) {
		this.totalPurchasePrice = totalPurchasePrice;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
}
