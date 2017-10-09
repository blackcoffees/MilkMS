package com.cy.milkms.service;

import java.util.List;

import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.util.Pager;

public interface IMilkService {
	public List<Milk> get_milk_condition(Pager pager, String milkName);
	
	public int get_milk_condition_count(String milkName);
}
