package com.cy.milkms.service;

import java.util.List;
import com.cy.milkms.db.entity.Stock;
import com.cy.milkms.db.query.StockQuery;
import com.cy.milkms.util.Pager;

public interface IStockService {
	public int updateStock(Stock stock);
	
	public Stock getStockByMilkID(int milkID);
	
	public int addStock(Stock stock);
	
	public List<StockQuery> getStockByMilkName(String milkName);
	
	public List<StockQuery> getStockByCondition(String milkName, Pager pager);
	
	public int getStockByConditionCount(String milkName);
}
