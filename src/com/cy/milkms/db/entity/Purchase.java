package com.cy.milkms.db.entity;

import java.util.UUID;

public class Purchase {
	private String ID;
	private String time;
	private double total_amount;
	
	public Purchase(){
		this.ID = UUID.randomUUID().toString().replaceAll("-", "");
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	
}
