package com.cy.milkms.db.query;

import com.cy.milkms.db.entity.Purchase;

public class PurchaseQuery extends Purchase{
	private String milk_name;/*商品名称*/
	private int quantity;/*商品数量*/
	private double price;/*商品采购单价*/
	private double total_amount;/*商品分单采购总价*/
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	public String getMilk_name() {
		return milk_name;
	}
	public void setMilk_name(String milk_name) {
		this.milk_name = milk_name;
	}
	
}
