package com.cy.milkms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.SaleDetailedMapper;
import com.cy.milkms.db.entity.Sale_detailed;
import com.cy.milkms.service.ISaleDetailedService;

@Service("saleDetailedService")
public class SaleDetailedService implements ISaleDetailedService{

	@Autowired
	private SaleDetailedMapper mapper;
	
	@Override
	public int addSaleDetailed(Sale_detailed detailed) {
		// TODO Auto-generated method stub
		return mapper.addSaleDetailed(detailed);
	}

}
