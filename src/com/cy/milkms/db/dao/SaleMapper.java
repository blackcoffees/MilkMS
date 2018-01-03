package com.cy.milkms.db.dao;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Sale;

public interface SaleMapper {
	public int addSale(@Param("sale")Sale sale);
}
