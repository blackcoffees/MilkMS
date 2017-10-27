package com.cy.milkms.db.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.messaging.handler.annotation.Payload;

import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.util.Pager;

public interface MilkMapper {
	
	public List<Milk> get_milk_condition(@Param("pager")Pager pager, @Param("milkInfo")String milkInfo);
	
	public int get_milk_condition_count(@Param("milkInfo")String milkInfo);
	
	public int add_milk(@Param("milk")Milk milk);
	
	public Milk get_milk_by_name_or_number(@Param("milk_name")String milk_name, @Param("number")String number);
	
	public int edit_milk(@Param("purchase_price")double purchase_price, @Param("selling_price")double selling_price, @Param("number")String number, @Param("updated")Timestamp updated);
	
	public int delete_milk(@Param("number")String number, @Param("updated")Timestamp updated);
}
