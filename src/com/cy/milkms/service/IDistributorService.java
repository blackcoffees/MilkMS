package com.cy.milkms.service;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Distributor;
import com.cy.milkms.util.Pager;

public interface IDistributorService {
	public List<Distributor> getDistributorByCondition(String distributorInfo, Pager pager);
	
	public int getDistributorByConditionCount(String distributorInfo);
	
	public int addDistributor(Distributor distributor);
	
	public int getDistributorNameCount(String name);
	
	public int deleteDistributor(String distributorID);
	
	public int updateDistributor(String address, String people, String phone, String name);
	
	public Distributor getDistributorByID(int distributorID);
	
	public int updateDistributorAmount(Distributor distributor);
}
