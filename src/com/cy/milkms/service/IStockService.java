package com.cy.milkms.service;

import com.cy.milkms.db.entity.Stock;

public interface IStockService {
	public int updateStock(int milkID, int number);
	
	public Stock getStockByMilkID(int milkID);
	
	public int addStock(int milkID, int number);
}
