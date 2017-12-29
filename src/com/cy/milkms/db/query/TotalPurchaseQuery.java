package com.cy.milkms.db.query;

import java.sql.Timestamp;
import java.util.List;

import com.cy.milkms.db.entity.Purchase_detailed;

public class TotalPurchaseQuery extends Purchase_detailed{
	private String name;
	private Timestamp time;
	private double totalPurchaseAmount;
	private int id;
	private int purchase_ID;
	private int milk_ID;
	private int number;
	private double purchase_price;
	private double total_amount;
	private int status;
	
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public double getPurchase_price() {
		return purchase_price;
	}

	public void setPurchase_price(double purchase_price) {
		this.purchase_price = purchase_price;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
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
