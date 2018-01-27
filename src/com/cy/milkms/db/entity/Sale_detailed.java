package com.cy.milkms.db.entity;

import java.sql.Timestamp;
import java.util.UUID;

public class Sale_detailed {
	private int ID;
	private int milk_ID;
	private int number;
	private int sale_ID;
	private double price;
	private double total_price;
	private double cost_price;/*'加权平均成本'*/
	private Timestamp created;
	private Timestamp updated;
	
	
	public int getSale_ID() {
		return sale_ID;
	}

	public void setSale_ID(int sale_ID) {
		this.sale_ID = sale_ID;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

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

	public double getCost_price() {
		return cost_price;
	}

	public void setCost_price(double cost_price) {
		this.cost_price = cost_price;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	
}
