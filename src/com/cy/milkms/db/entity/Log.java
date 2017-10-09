package com.cy.milkms.db.entity;

import java.util.UUID;

public class Log {
	private String ID;
	private String time;
	private String data;
	private String sql;
	public Log(){
		ID = UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getID() {
		return ID;
	}
	public void setID(String ID) {
		this.ID = ID;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	
}
