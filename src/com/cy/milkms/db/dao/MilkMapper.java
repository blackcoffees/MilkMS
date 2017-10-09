package com.cy.milkms.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.util.Pager;

public interface MilkMapper {
	public List<Milk> get_milk_condition(@Param("pager")Pager pager, @Param("milkName")String milkName);
	public int get_milk_condition_count(@Param("milkName")String milkName);
	
}
