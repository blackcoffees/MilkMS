package com.cy.milkms.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Purchase_detailed;

public interface PurchaseDetailedMapper {
	public int addPurchaseDetailed(@Param("detailed")Purchase_detailed detailed);
	
	public List<Purchase_detailed> getPurchaseDetailedByPurchaseID(@Param("purchaseID")int purchaseID);
}
