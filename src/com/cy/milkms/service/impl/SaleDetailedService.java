package com.cy.milkms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.SaleDetailedMapper;
import com.cy.milkms.db.entity.Sale_detailed;
import com.cy.milkms.service.ILogService;
import com.cy.milkms.service.ISaleDetailedService;

@Service("saleDetailedService")
public class SaleDetailedService implements ISaleDetailedService{

	@Autowired
	private SaleDetailedMapper mapper;
	
	@Autowired
	private ILogService logService;
	
	@Override
	public int addSaleDetailed(Sale_detailed detailed) {
		/*操作日志*/
		logService.addLog(mapper, "addSaleDetailed", detailed);
		return mapper.addSaleDetailed(detailed);
	}

	@Override
	public List<Sale_detailed> getSaleDetailedBySaleID(int saleID) {
		return mapper.getSaleDetailedBySaleID(saleID);
	}

}
