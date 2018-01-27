package com.cy.milkms.db.entity;

import java.sql.Timestamp;
import java.util.UUID;

public class Distributor {
	private int id;
	private String name;
	private String address;
	private String people;
	private String phone;
	private double total_price;
	private double unpaid_price;
	private double paid_price;
	private int status;
	private Timestamp created;
	private Timestamp updated;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public double getUnpaid_price() {
		return unpaid_price;
	}
	public void setUnpaid_price(double unpaid_price) {
		this.unpaid_price = unpaid_price;
	}
	public double getPaid_price() {
		return paid_price;
	}
	public void setPaid_price(double paid_price) {
		this.paid_price = paid_price;
	}
	
}
