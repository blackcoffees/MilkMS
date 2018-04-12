package com.cy.milkms.db.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.util.Pager;

public interface MilkMapper {
	
	public List<Milk> getMilkByCondition(@Param("pager")Pager pager, @Param("milkInfo")String milkInfo);
	
	public int getMilkByConditionCount(@Param("milkInfo")String milkInfo);
	
	public int addMilk(@Param("milk")Milk milk);
	
	public Milk getMilkByNameOrCode(@Param("milk_name")String milk_name, @Param("code")String code);
	
	public int editMilk(@Param("purchase_price")double purchase_price, @Param("selling_price")double selling_price, @Param("code")String code, @Param("updated")Timestamp updated);
	
	public int deleteMilk(@Param("code")String code, @Param("updated")Timestamp updated);
	
	public List<Milk> getMilkByName(@Param("name")String name);
	
	public List<Milk> getMilkFrontByCondition(@Param("milkInfo")String milkInfo);
	
	public List<Milk> getMilkFrontBarCode(@Param("milkInfo")String milkInfo);
}
