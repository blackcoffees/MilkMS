package com.cy.milkms.db.entity;

import java.sql.Timestamp;

public class Stock {
	private int milk_ID;
	private int number;
	private Timestamp created;
	private Timestamp updated;
	
	public int getMilk_ID() {
		return milk_ID;
	}
	public void setMilk_ID(int milk_ID) {
		this.milk_ID = milk_ID;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
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
