package com.cy.milkms.service;

import java.util.List;
import java.util.Map;

import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.util.Pager;

public interface IMilkService {
	public List<Milk> getMilkByCondition(Pager pager, String milkInfo);
	
	public int getMilkByConditionCount(String milkInfo);
	
	public Map<String, Object> addMilk(Milk milk) throws Exception;
	
 	public Milk getMilkByNameOrCode(String milk_name, String code);
 	
 	public int editMilk(double purchase_price, double selling_price, String code);
 	
 	public int deleteMilk(String code);
 	
 	public List<Milk> getMilkByName(String name);
}
