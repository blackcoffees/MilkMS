package com.cy.milkms.db.entity;

import java.sql.Timestamp;

public class Sale {
	private int id;
	private int distributor_id;
	private double receivables_price;
	private double unpaid_price;
	private double paid_price;
	private Timestamp sale_time;
	private Timestamp paid_time;
	private Timestamp created;
	private Timestamp updated;
	private int status;
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDistributor_id() {
		return distributor_id;
	}
	public void setDistributor_id(int distributor_id) {
		this.distributor_id = distributor_id;
	}
	public Timestamp getSale_time() {
		return sale_time;
	}
	public void setSale_time(Timestamp sale_time) {
		this.sale_time = sale_time;
	}
	public Timestamp getPaid_time() {
		return paid_time;
	}
	public void setPaid_time(Timestamp paid_time) {
		this.paid_time = paid_time;
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
	public double getReceivables_price() {
		return receivables_price;
	}
	public void setReceivables_price(double receivables_price) {
		this.receivables_price = receivables_price;
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
