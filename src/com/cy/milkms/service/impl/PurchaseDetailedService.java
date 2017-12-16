package com.cy.milkms.service.impl;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cy.milkms.db.dao.PurchaseDetailedMapper;
import com.cy.milkms.db.entity.Purchase_detailed;
import com.cy.milkms.service.IPurchaseDetailedService;

@Service("purchaseDetailedService")
public class PurchaseDetailedService implements IPurchaseDetailedService{

	@Autowired
	private PurchaseDetailedMapper mapper;
	
	@Override
	@Transactional
	public int addPurchaseDetailed(Purchase_detailed detailed) throws Exception {
		// TODO Auto-generated method stub
		int result = mapper.addPurchaseDetailed(detailed);
		if(result <= 0){
			throw new Exception("新增采购单分单失败，分单ID: " + detailed.getID());
		}
		return result;
	}
	
}
