package com.cy.milkms.db.entity;

import java.util.UUID;

public class Purchase_detailed {
	private String ID;
	private String purchase_ID;
	private String milk_ID;
	private int number;
	private double purchase_price;
	private double total_amount;
	
	public Purchase_detailed(){
		this.ID = UUID.randomUUID().toString().replaceAll("-", "");
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getPurchase_ID() {
		return purchase_ID;
	}

	public void setPurchase_ID(String purchase_ID) {
		this.purchase_ID = purchase_ID;
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

	public double getPurchase_price() {
		return purchase_price;
	}

	public void setPurchase_price(double purchase_price) {
		this.purchase_price = purchase_price;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	
}
