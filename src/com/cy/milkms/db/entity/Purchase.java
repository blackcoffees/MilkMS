package com.cy.milkms.db.entity;

import java.sql.Timestamp;
import java.util.UUID;

public class Purchase {
	private int id;
	private Timestamp time;
	private double total_amount;
	private Timestamp created;
	private Timestamp updated;
	private int status;
	
	public static int PURCHASE_STATUS_ON = 1;
	public static int PURCHASE_STATUS_OFF = 2;
	
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
