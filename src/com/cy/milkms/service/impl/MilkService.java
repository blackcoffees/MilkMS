package com.cy.milkms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.MilkMapper;
import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.service.IMilkService;
import com.cy.milkms.util.Pager;

@Service("milkService")
public class MilkService implements IMilkService{

	@Autowired
	private MilkMapper mapper;
	
	@Override
	public List<Milk> get_milk_condition(Pager pager, String milkInfo) {
		// TODO Auto-generated method stub
		return mapper.get_milk_condition(pager, milkInfo);
	}

	@Override
	public int get_milk_condition_count(String milkInfo) {
		// TODO Auto-generated method stub
		return mapper.get_milk_condition_count(milkInfo);
	}

	@Override
	public int add_milk(Milk milk) {
		// TODO Auto-generated method stub
		Milk milk2 = this.get_milk_by_name_or_number(milk.getMilk_name(),  milk.getNumber());
		if(milk2 != null){
			return -1;
		}
		return mapper.add_milk(milk);
	}

	@Override
	public Milk get_milk_by_name_or_number(String milk_name, String number) {
		// TODO Auto-generated method stub
		return mapper.get_milk_by_name_or_number(milk_name, number);
	}

	@Override
	public int edit_milk(double purchase_price, double selling_price, String number) {
		// TODO Auto-generated method stub
		return mapper.edit_milk(purchase_price, selling_price, number);
	}

	@Override
	public int delete_milk(String number) {
		// TODO Auto-generated method stub
		return mapper.delete_milk(number);
	}
	
	
	
}
