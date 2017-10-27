package com.cy.milkms.db.entity;
import java.sql.Timestamp;
import java.util.UUID;
public class Milk {
	private String ID;
	private String number;
	private String milk_name;
	private String specifications;
	private double purchase_price;
	private double selling_price;
	private int status;
	private Timestamp created;
	private Timestamp updated;
	
	
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Milk(){
		ID = UUID.randomUUID().toString();
	}
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getID() {
		return ID;
	}
	public void setID(String ID) {
		this.ID = ID;
	}
	public String getMilk_name() {
		return milk_name;
	}
	public void setMilk_name(String milk_name) {
		this.milk_name = milk_name;
	}
	public String getSpecifications() {
		return specifications;
	}
	public void setSpecifications(String specifications) {
		this.specifications = specifications;
	}
	public double getPurchase_price() {
		return purchase_price;
	}
	public void setPurchase_price(double purchase_price) {
		this.purchase_price = purchase_price;
	}
	public double getSelling_price() {
		return selling_price;
	}
	public void setSelling_price(double selling_price) {
		this.selling_price = selling_price;
	}
	
	
}
