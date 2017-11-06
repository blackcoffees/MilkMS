package com.cy.milkms.db.dao;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Purchase_detailed;

public interface PurchaseDetailedMapper {
	public int addPurchaseDetailed(@Param("detailed")Purchase_detailed detailed);
}
