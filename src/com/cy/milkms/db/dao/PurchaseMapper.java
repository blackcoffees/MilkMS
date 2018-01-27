package com.cy.milkms.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Purchase;
import com.cy.milkms.db.query.PurchaseQuery;
import com.cy.milkms.util.Pager;

public interface PurchaseMapper {
	public List<PurchaseQuery> getPurchaseByConditon(@Param("purchaseID")String purchaseID, @Param("startTime")String startTime, @Param("endTime")String endTime, @Param("pager")Pager pager);
	
	public int getPurchaseByConditionCount(@Param("purchaseID")String pucharseID, @Param("startTime")String startTime, @Param("endTime")String endTime);
	
	public int addPurchase(@Param("purchase")Purchase purchase);
	
	public int updatePurchaseOff(@Param("purchaseID")int purchaseID);
}
