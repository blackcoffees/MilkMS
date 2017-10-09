package com.cy.milkms.db.entity;

public class Distributor {
	private String ID;
	private String name;
	private String address;
	private String people;
	private String phone;
	private double total_amount;
	private double unpaid_amount;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
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
