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
	public List<Milk> get_milk_condition(Pager pager, String milkName) {
		// TODO Auto-generated method stub
		return mapper.get_milk_condition(pager, milkName);
	}

	@Override
	public int get_milk_condition_count(String milkName) {
		// TODO Auto-generated method stub
		return mapper.get_milk_condition_count(milkName);
	}
	
	
	
}
