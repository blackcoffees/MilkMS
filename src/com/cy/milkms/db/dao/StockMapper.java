package com.cy.milkms.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Stock;
import com.cy.milkms.db.query.StockQuery;
import com.cy.milkms.util.Pager;

public interface StockMapper {
	public int updateStock(@Param("stock")Stock stock);
	
	public Stock getStockByMilkID(@Param("milkID")int milkID);
	
	public int addStock(@Param("stock")Stock stock);
	
	public List<StockQuery> getStockByMilkName(@Param("milkName")String milkName);
	
	public List<StockQuery> getStockByCondition(@Param("milkName")String milkName, @Param("pager")Pager pager);
	
	public int getStockByConditionCount(@Param("milkName")String milkName);
	
	
}
