package com.cy.milkms.db.query;

public class SaleTodayQuery {
	private int saleCount;
	private int saleQuantity;
	private double saleTotalPrice;
	private String firstGoodsName;
	public int getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}
	public int getSaleQuantity() {
		return saleQuantity;
	}
	public void setSaleQuantity(int saleQuantity) {
		this.saleQuantity = saleQuantity;
	}
	public double getSaleTotalPrice() {
		return saleTotalPrice;
	}
	public void setSaleTotalPrice(double saleTotalPrice) {
		this.saleTotalPrice = saleTotalPrice;
	}
	public String getFirstGoodsName() {
		return firstGoodsName;
	}
	public void setFirstGoodsName(String firstGoodsName) {
		this.firstGoodsName = firstGoodsName;
	}
	
}
