package com.cy.milkms.db.entity;

import java.sql.Timestamp;

public class Stock {
	private int milk_ID;
	private int quantity;
	private double cost_price;
	private Timestamp created;
	private Timestamp updated;
	
	public int getMilk_ID() {
		return milk_ID;
	}
	public void setMilk_ID(int milk_ID) {
		this.milk_ID = milk_ID;
	}
	public Timestamp getCreated() {
		return created;
	}
	public void setCreated(Timestamp created) {
		this.created = created;
	}
	public Timestamp getUpdated() {
		return updated;
	}
	public void setUpdated(Timestamp updated) {
		this.updated = updated;
	}
	public double getCost_price() {
		return cost_price;
	}
	public void setCost_price(double cost_price) {
		this.cost_price = cost_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
