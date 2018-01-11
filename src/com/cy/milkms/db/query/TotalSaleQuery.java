package com.cy.milkms.db.query;

import com.cy.milkms.db.entity.Sale;

public class TotalSaleQuery extends Sale{
	private int number;
	private double price;
	private double total_amount;
	private String milk_name;
	private String name;
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
