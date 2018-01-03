package com.cy.milkms.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.query.TotalPurchaseIDsQuery;
import com.cy.milkms.db.query.TotalPurchaseQuery;
import com.cy.milkms.util.Pager;

public interface IPurchaseService {
	public List<List<TotalPurchaseQuery>> getPurchaseByConditon(String pucharseID, String startTime, String endTime, Pager pager);
	
	public List<TotalPurchaseIDsQuery> getPurchaseByConditionByID(String pucharseID, String startTime, String endTime, Pager pager);
	
	public int getPurchaseByConditionCount(String pucharseID, String startTime, String endTime);
	
	public Map addPurchase(String data) throws Exception;
	
	public int updatePurchaseOff(int purchaseID) throws Exception;
}
