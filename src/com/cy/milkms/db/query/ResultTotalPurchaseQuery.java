package com.cy.milkms.db.query;

import java.sql.Timestamp;
import java.util.List;

import com.cy.milkms.db.entity.Purchase;

public class ResultTotalPurchaseQuery{
	private String name;
	private Timestamp time;
	private List<TotalPurchaseQuery> list;

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public List<TotalPurchaseQuery> getList() {
		return list;
	}

	public void setList(List<TotalPurchaseQuery> list) {
		this.list = list;
	}
	
	
}
