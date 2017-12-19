package com.cy.milkms.service;

import java.util.List;
import java.util.Map;

import com.cy.milkms.db.query.ResultTotalPurchaseQuery;
import com.cy.milkms.util.Pager;

public interface IPurchaseService {
	public List<ResultTotalPurchaseQuery> getPurchaseByConditon(int pucharseID, String startTime, String endTime, Pager pager);
	
	public int getPurchaseByConditonCount();
	
	public Map addPurchase(String data) throws Exception;
}
