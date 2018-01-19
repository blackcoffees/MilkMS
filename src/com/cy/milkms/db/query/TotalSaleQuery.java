package com.cy.milkms.db.query;

import com.cy.milkms.db.entity.Sale;

public class TotalSaleQuery extends Sale{
	private int number;/*商品数量*/
	private double price;/*商品单价*/
	private double total_amount;/*商品总价*/
	private String milk_name;/*商品名称*/
	private String name;/*商家名称*/
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
