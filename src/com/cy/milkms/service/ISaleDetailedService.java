package com.cy.milkms.service;

import java.util.List;

import com.cy.milkms.db.entity.Sale_detailed;

public interface ISaleDetailedService {
	public int addSaleDetailed(Sale_detailed detailed);
	
	public List<Sale_detailed> getSaleDetailedBySaleID(int saleID);
}
