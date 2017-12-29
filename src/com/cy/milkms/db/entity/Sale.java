package com.cy.milkms.db.entity;

import java.sql.Timestamp;

public class Sale {
	private int id;
	private int distributor_id;
	private double receivables_amount;
	private double paid_amount;
	private Timestamp sale_time;
	private Timestamp paid_time;
	private Timestamp created;
	private Timestamp updated;
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
	public double getReceivables_amount() {
		return receivables_amount;
	}
	public void setReceivables_amount(double receivables_amount) {
		this.receivables_amount = receivables_amount;
	}
	public double getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(double paid_amount) {
		this.paid_amount = paid_amount;
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
	
	
}
