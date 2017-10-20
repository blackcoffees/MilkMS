package com.cy.milkms.util;

public class Pager {
	private int page;
	private int rows;
	private int start;
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		this.setStart();
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
		this.setStart();
	}

	public int getStart() {
		return start;
	}
	
	public void setStart(){
		if(this.page == 0){
			page = 1;
		}
		if(this.rows == 0){
			rows = 10;
		}
		start = (page-1)*rows;	
	}
}
