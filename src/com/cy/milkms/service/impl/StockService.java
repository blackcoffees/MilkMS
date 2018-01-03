package com.cy.milkms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.StockMapper;
import com.cy.milkms.db.entity.Stock;
import com.cy.milkms.service.IStockService;

@Service("stockService")
public class StockService implements IStockService{

	@Autowired
	private StockMapper mapper;
	
	@Override
	public int updateStock(int milkID, int number) {
		// TODO Auto-generated method stub
		return mapper.updateStock(milkID, number);
	}

	@Override
	public Stock getStockByMilkID(int milkID) {
		// TODO Auto-generated method stub
		return mapper.getStockByMilkID(milkID);
	}

	@Override
	public int addStock(int milkID, int number) {
		// TODO Auto-generated method stub
		return mapper.addStock(number, milkID);
	}

}
