package com.cy.milkms.db.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Sale;
import com.cy.milkms.db.query.TotalSaleQuery;
import com.cy.milkms.util.Pager;

public interface SaleMapper {
	public int addSale(@Param("sale")Sale sale);
	
	public List<TotalSaleQuery> getSaleByCondition(@Param("startTime")String startTime,
			@Param("endTime")String endTime, @Param("saleID")int saleID, @Param("pager")Pager pager, @Param("distributorName")String distributorName, @Param("status")int status);
	
	public int getSaleByConditionCount(@Param("startTime")String startTime,
			@Param("endTime")String endTime, @Param("saleID")int saleID, @Param("distributorName")String distributorName, @Param("status")int status);
	
	public int updateSaleStatus(@Param("status")int status, @Param("saleID")int saleID, @Param("updated")Timestamp updated);
	
	public Sale getSaleByID(@Param("saleID")int saleID);
	
	public int updateBalanceSale(@Param("sale")Sale sale);
}
