package com.cy.milkms.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;


import com.cy.milkms.db.entity.Sale;
import com.cy.milkms.db.query.SaleQuery;
import com.cy.milkms.util.Pager;

public interface ISaleService {
	public Map<String, Object> addSale(String saleTime, int distributorID, double totalPrice, String list, int status) throws Exception;
	
	public List<List<SaleQuery>> getSaleByCondition(String startTime, String endTime, int saleID, Pager pager, String distributorName, int status);
	
	public int getSaleByConditionCount(String startTime, String endTime, int saleID, String distributorName, int status);
	
	public int updateSaleStatus(int status, int saleID, Timestamp updated);
	
	public Map<String, Object> abandonSale(int saleID);
	
	public Sale getSaleByID(int saleID);
	
	public Map<String, Object> balanceSale(int saleID, double amount);
	
	public int updateBalanceSale(Sale sale);
}
