package com.cy.milkms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.ReportMapper;
import com.cy.milkms.db.query.TotalPurchaseIDsQuery;
import com.cy.milkms.db.query.TotalPurchaseQuery;
import com.cy.milkms.service.IPurchaseService;
import com.cy.milkms.service.IReportService;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.ReturnJsonData;

@Service("reportService")
public class ReportService implements IReportService{
	
	@Autowired
	private ReportMapper mapper;


	@Override
	public String getPurchaseReportByCondition(String milkName, Pager pager, String startTime, String endTime) {
		// TODO Auto-generated method stub
		int total = mapper.getPurchaseReportByConditionCount(startTime, endTime, milkName);
		List<TotalPurchaseIDsQuery> purchaseIDList = mapper.getPurchaseReportByConditionIDs(milkName, pager, startTime, endTime);
		int[] purchaseIDs = new int[purchaseIDList.size()];
		for(int i=0;i<purchaseIDList.size();i++){
			purchaseIDs[i] = purchaseIDList.get(i).getId();
		}
		List<TotalPurchaseQuery> rows = mapper.getPurchaseReportByCondition(milkName, startTime, endTime, purchaseIDs);
		List tableDatas = ReturnJsonData.genJsonData(rows);
		
		
		return null;
	}

}
