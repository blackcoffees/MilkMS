package com.cy.milkms.db.entity;

import java.sql.Timestamp;
import java.util.UUID;

public class Distributor {
	private String id;
	private String name;
	private String address;
	private String people;
	private String phone;
	private double total_amount;
	private double unpaid_amount;
	private double paid_amount;
	private int status;
	private Timestamp created;
	private Timestamp updated;
	
	
	public Distributor(){
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(double paid_amount) {
		this.paid_amount = paid_amount;
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
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	public double getUnpaid_amount() {
		return unpaid_amount;
	}
	public void setUnpaid_amount(double unpaid_amount) {
		this.unpaid_amount = unpaid_amount;
	}
	
}
