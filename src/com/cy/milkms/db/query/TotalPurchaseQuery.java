package com.cy.milkms.db.query;

import java.sql.Timestamp;
import java.util.List;

import com.cy.milkms.db.entity.Purchase_detailed;

public class TotalPurchaseQuery extends Purchase_detailed{
	private String name;
	private Timestamp time;
	private double totalPurchaseAmount;

	

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
	public double getTotalPurchaseAmount() {
		return totalPurchaseAmount;
	}

	public void setTotalPurchaseAmount(double totalPurchaseAmount) {
		this.totalPurchaseAmount = totalPurchaseAmount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
