package com.cy.milkms.db.entity;

import java.sql.Timestamp;

public class StockRecord {
	private int id;
	private int milk_id;
	private int old_qty;
	private int new_qty;
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
	public int getOld_qty() {
		return old_qty;
	}
	public void setOld_qty(int old_qty) {
		this.old_qty = old_qty;
	}
	public int getNew_qty() {
		return new_qty;
	}
	public void setNew_qty(int new_qty) {
		this.new_qty = new_qty;
	}
	
}
