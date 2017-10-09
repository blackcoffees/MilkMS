package com.cy.milkms.db.entity;

import java.util.UUID;

public class Sale_detailed {
	private String ID;
	private String milk_ID;
	private int number;
	private double price;
	private double total_amount;
	
	public Sale_detailed(){
		this.ID = UUID.randomUUID().toString().replaceAll("-", "");
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getMilk_ID() {
		return milk_ID;
	}

	public void setMilk_ID(String milk_ID) {
		this.milk_ID = milk_ID;
	}

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
	
}
