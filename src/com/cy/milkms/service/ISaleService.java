package com.cy.milkms.service;

import java.util.Map;

import com.cy.milkms.db.entity.Sale;

public interface ISaleService {
	public Map addSale(String saleTime, int distributorID, double totalPrice, String list, int status) throws Exception;
}
