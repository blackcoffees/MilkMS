package com.cy.milkms.db.dao;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.StockRecord;

public interface StockRecordMapper {
	public int addStockRecord(@Param("stockRecord")StockRecord stockRecord);
}
