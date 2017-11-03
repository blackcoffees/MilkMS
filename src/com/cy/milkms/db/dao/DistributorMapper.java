package com.cy.milkms.db.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Distributor;
import com.cy.milkms.util.Pager;

public interface DistributorMapper {
	public List<Distributor> getDistributorByCondition(@Param("distributorInfo")String distributorInfo, @Param("pager")Pager pager);
	
	public int getDistributorByConditionCount(@Param("distributorInfo")String distributorInfo);
	
	public int addDistributor(@Param("distributor")Distributor distributor);
	
	public int getDistributorByNameCount(@Param("name")String name);
	
	public int deleteDistributor(@Param("distributorID")String distributorID, @Param("updated")Timestamp updated);
	
	public int updateDistributor(@Param("address")String address, @Param("people")String people, @Param("phone")String phone, @Param("updated")Timestamp updated, @Param("name")String name);
}
