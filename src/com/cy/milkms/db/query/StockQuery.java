package com.cy.milkms.db.query;

import com.cy.milkms.db.entity.Stock;

public class StockQuery extends Stock{
	private String milkName;
	private String milkNumber;
	private String specifications;
	public String getMilkName() {
		return milkName;
	}
	public void setMilkName(String milkName) {
		this.milkName = milkName;
	}
	public String getMilkNumber() {
		return milkNumber;
	}
	public void setMilkNumber(String milkNumber) {
		this.milkNumber = milkNumber;
	}
	public String getSpecifications() {
		return specifications;
	}
	public void setSpecifications(String specifications) {
		this.specifications = specifications;
	}
	
	
}
