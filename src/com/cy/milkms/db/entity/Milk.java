package com.cy.milkms.db.entity;
import java.sql.Timestamp;
import java.util.UUID;
public class Milk {
	private int id;
	private String code; /*商品编号*/
	private String milk_name; /*商品名称*/
	private String specifications;/*规格*/
	private double purchase_price;/*采购价格*/
	private double selling_price;/*建议出售价格*/
	private int status;/*状态*/
	private Timestamp created;
	private Timestamp updated;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMilk_name() {
		return milk_name;
	}
	public void setMilk_name(String milk_name) {
		this.milk_name = milk_name;
	}
	public String getSpecifications() {
		return specifications;
	}
	public void setSpecifications(String specifications) {
		this.specifications = specifications;
	}
	public double getPurchase_price() {
		return purchase_price;
	}
	public void setPurchase_price(double purchase_price) {
		this.purchase_price = purchase_price;
	}
	public double getSelling_price() {
		return selling_price;
	}
	public void setSelling_price(double selling_price) {
		this.selling_price = selling_price;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}	
	
}
