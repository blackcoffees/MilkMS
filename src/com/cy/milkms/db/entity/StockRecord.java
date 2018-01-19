package com.cy.milkms.db.entity;

import java.sql.Timestamp;

public class StockRecord {
	private int id;
	private int milk_id;
	private int old_number;
	private int new_number;
	private double old_cost_price;
	private double new_cost_price;
	private Timestamp created;
	private Timestamp updated;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMilk_id() {
		return milk_id;
	}
	public void setMilk_id(int milk_id) {
		this.milk_id = milk_id;
	}
	public int getOld_number() {
		return old_number;
	}
	public void setOld_number(int old_number) {
		this.old_number = old_number;
	}
	public int getNew_number() {
		return new_number;
	}
	public void setNew_number(int new_number) {
		this.new_number = new_number;
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
	public double getOld_cost_price() {
		return old_cost_price;
	}
	public void setOld_cost_price(double old_cost_price) {
		this.old_cost_price = old_cost_price;
	}
	public double getNew_cost_price() {
		return new_cost_price;
	}
	public void setNew_cost_price(double new_cost_price) {
		this.new_cost_price = new_cost_price;
	}
	
}
