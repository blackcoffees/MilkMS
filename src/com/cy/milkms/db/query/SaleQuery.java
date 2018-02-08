package com.cy.milkms.db.query;

import com.cy.milkms.db.entity.Sale;

public class SaleQuery extends Sale{
	private String milk_name;/*商品名称*/
	private int quantity;/*商品数量*/
	private double price;/*商品单价*/
	private double total_amount;/*商品总价*/
	private String distributor_name;/*商家名称*/
	private double cost_price;/*采购成本*/
	private double total_cost_price; /*采购总成本*/
	private double total_profit; /*利润*/
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	public String getMilk_name() {
		return milk_name;
	}
	public void setMilk_name(String milk_name) {
		this.milk_name = milk_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDistributor_name() {
		return distributor_name;
	}
	public void setDistributor_name(String distributor_name) {
		this.distributor_name = distributor_name;
	}
	public double getCost_price() {
		return cost_price;
	}
	public void setCost_price(double cost_price) {
		this.cost_price = cost_price;
	}
	public double getTotal_cost_price() {
		return total_cost_price;
	}
	public void setTotal_cost_price(double total_cost_price) {
		this.total_cost_price = total_cost_price;
	}
	public double getTotal_profit() {
		return total_profit;
	}
	public void setTotal_profit(double total_profit) {
		this.total_profit = total_profit;
	}
}
