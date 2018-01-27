package com.cy.milkms.service;

import java.util.List;
import java.util.Map;
import com.cy.milkms.db.query.PurchaseQuery;
import com.cy.milkms.util.Pager;

public interface IPurchaseService {
	public List<List<PurchaseQuery>> getPurchaseByConditon(String purchaseID, String startTime, String endTime, Pager pager);
	
	public int getPurchaseByConditionCount(String pucharseID, String startTime, String endTime);
	
	public Map<String, Object> addPurchase(String data) throws Exception;
	
	public int updatePurchaseOff(int purchaseID) throws Exception;
}
