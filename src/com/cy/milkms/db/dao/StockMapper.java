package com.cy.milkms.db.dao;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Stock;

public interface StockMapper {
	public int updateStock(@Param("number") int number, @Param("milkID")int milkID);
	
	public Stock getStockByMilkID(@Param("milkID")int milkID);
	
	public int addStock(@Param("number") int number, @Param("milkID")int milkID);
}
