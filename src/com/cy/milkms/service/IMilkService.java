package com.cy.milkms.service;

import java.util.List;

import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.util.Pager;

public interface IMilkService {
	public List<Milk> get_milk_condition(Pager pager, String milkInfo);
	
	public int get_milk_condition_count(String milkInfo);
	
	public int add_milk(Milk milk);
	
 	public Milk get_milk_by_name_or_number(String milk_name, String number);
 	
 	public int edit_milk(double purchase_price, double selling_price, String number);
 	
 	public int delete_milk(String number);
}
