package com.cy.milkms.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Purchase;
import com.cy.milkms.db.query.TotalPurchaseQuery;
import com.cy.milkms.util.Pager;

public interface PurchaseMapper {
	public List<TotalPurchaseQuery> getPurchaseByConditon(int pucharseID, String startTime, String endTime, @Param("pager")Pager pager);
	
	public int getPurchaseByConditonCount();
	
	public int addPurchase(@Param("purchase")Purchase purchase);
}
