package com.cy.milkms.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Purchase_detailed;

public interface IPurchaseDetailedService {
	public int addPurchaseDetailed(Purchase_detailed detailed) throws Exception;
	
	public List<Purchase_detailed> getPurchaseDetailedByPurchaseID(int purchaseID);
}
