package com.cy.milkms.db.entity;

import java.sql.Timestamp;
import java.util.UUID;

public class Purchase {
	private String ID;
	private Timestamp time;
	private double total_amount;
	private Timestamp created;
	private Timestamp updated;
	
	public Purchase(){
		this.ID = UUID.randomUUID().toString();
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
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
