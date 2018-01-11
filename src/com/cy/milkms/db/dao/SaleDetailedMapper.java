package com.cy.milkms.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Sale_detailed;

public interface SaleDetailedMapper {
	public int addSaleDetailed(@Param("detailed")Sale_detailed detailed);
	
	public List<Sale_detailed> getSaleDetailedBySaleID(@Param("saleID")int saleID);
}
