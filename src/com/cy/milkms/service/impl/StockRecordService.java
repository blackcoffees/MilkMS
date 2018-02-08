package com.cy.milkms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.StockRecordMapper;
import com.cy.milkms.db.entity.StockRecord;
import com.cy.milkms.service.IStockRecordService;

@Service("stockRecordService")
public class StockRecordService implements IStockRecordService{

	@Autowired
	private StockRecordMapper mapper;
	
	@Override
	public int addStockRecord(StockRecord stockRecord) {
		return mapper.addStockRecord(stockRecord);
	}

}
