package com.cy.milkms.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.DistributorMapper;
import com.cy.milkms.db.entity.Distributor;
import com.cy.milkms.service.IDistributorService;
import com.cy.milkms.util.DateTool;
import com.cy.milkms.util.Enum;
import com.cy.milkms.util.Pager;

@Service("distributorService")
public class DistributorService implements IDistributorService{

	@Autowired
	private DistributorMapper mapper;
	
	@Override
	public List<Distributor> getDistributorByCondition(String distributorInfo, Pager pager) {
		// TODO Auto-generated method stub
		return mapper.getDistributorByCondition(distributorInfo, pager);
	}

	@Override
	public int getDistributorByConditionCount(String distributorInfo) {
		// TODO Auto-generated method stub
		return mapper.getDistributorByConditionCount(distributorInfo);
	}

	@Override
	public int addDistributor(Distributor distributor) {
		// TODO Auto-generated method stub
		int exit = this.getDistributorNameCount(distributor.getName());
		if(exit > 0) return -1;
		distributor.setPaid_amount(0);
		distributor.setUnpaid_amount(0);
		distributor.setTotal_amount(0);
		distributor.setCreated(DateTool.getNowTime());
		distributor.setUpdated(DateTool.getNowTime());
		distributor.setStatus(Enum.DISTRIBUTOR_STATUS_ON);
		return mapper.addDistributor(distributor);
	}

	@Override
	public int getDistributorNameCount(String name) {
		// TODO Auto-generated method stub
		return mapper.getDistributorByNameCount(name);
	}

	@Override
	public int deleteDistributor(String distributorID) {
		// TODO Auto-generated method stub
		Timestamp updated = DateTool.getNowTime();
		return mapper.deleteDistributor(distributorID, updated);
	}

	@Override
	public int updateDistributor(String address, String people, String phone, String ID) {
		// TODO Auto-generated method stub
		Timestamp updated = DateTool.getNowTime(); 
		return mapper.updateDistributor(address, people, phone, updated, ID);
	}


}
