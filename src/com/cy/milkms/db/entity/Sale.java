package com.cy.milkms.db.entity;

import java.util.UUID;

public class Sale {
	private String ID;
	private String sale_time;
	private String write_time;
	private String distributor_ID;
	private boolean is_receivables;
	private double receivables_amount;
	private double paid_amount;
	private String paid_time;
	
	public Sale(){
		this.ID = UUID.randomUUID().toString().replaceAll("-", "");
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getSale_time() {
		return sale_time;
	}

	public void setSale_time(String sale_time) {
		this.sale_time = sale_time;
	}

	public String getWrite_time() {
		return write_time;
	}

	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}

	public String getDistributor_ID() {
		return distributor_ID;
	}

	public void setDistributor_ID(String distributor_ID) {
		this.distributor_ID = distributor_ID;
	}

	public boolean isIs_receivables() {
		return is_receivables;
	}

	public void setIs_receivables(boolean is_receivables) {
		this.is_receivables = is_receivables;
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

	public String getPaid_time() {
		return paid_time;
	}

	public void setPaid_time(String paid_time) {
		this.paid_time = paid_time;
	}
	
}
