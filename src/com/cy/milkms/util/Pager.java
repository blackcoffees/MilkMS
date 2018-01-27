package com.cy.milkms.util;

public class Pager {
	private int page;/*现在的页码数*/
	private int rows;/*每一页展示多少行*/
	private int start;/*查询开始的行数*/
	private int total;/*总行数*/
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
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
