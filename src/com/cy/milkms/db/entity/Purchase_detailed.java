package com.cy.milkms.db.entity;

import java.sql.Timestamp;

public class Purchase_detailed {
	private int id;
	private int purchase_ID;
	private int milk_ID;
	private int quantity;/*数量*/
	private double price;/*采购单价*/
	private double total_price;/*采购总价*/
	private Timestamp created;
	private Timestamp updated;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPurchase_ID() {
		return purchase_ID;
	}

	public void setPurchase_ID(int purchase_ID) {
		this.purchase_ID = purchase_ID;
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

	public Purchase_detailed(){

	}

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

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	

}
