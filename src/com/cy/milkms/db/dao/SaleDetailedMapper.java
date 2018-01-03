package com.cy.milkms.db.dao;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Sale_detailed;

public interface SaleDetailedMapper {
	public int addSaleDetailed(@Param("detailed")Sale_detailed detailed);
}
