package com.cy.milkms.db.query;

import java.sql.Timestamp;

public class LineChartQuery {
	/*数据库：折线图y轴数据对象*/
	private String milk_name;
	private Timestamp time;
	private double total_price;
	private String distributor_name;
	public String getMilk_name() {
		return milk_name;
	}
	public void setMilk_name(String milk_name) {
		this.milk_name = milk_name;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public String getDistributor_name() {
		return distributor_name;
	}
	public void setDistributor_name(String distributor_name) {
		this.distributor_name = distributor_name;
	}
}
