package com.cy.milkms.db.entity;

import java.sql.Timestamp;

public class Purchase {
	private int id;
	private Timestamp time;/*采购时间*/
	private double total_price;/*采购总价*/
	private Timestamp created;
	private Timestamp updated;
	private int status;/*1 启用，2废弃*/
	
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Purchase(){
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
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
	
}
