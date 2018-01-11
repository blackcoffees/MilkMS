package com.cy.milkms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cy.milkms.db.dao.MilkMapper;
import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.db.entity.Stock;
import com.cy.milkms.service.IMilkService;
import com.cy.milkms.service.IStockService;
import com.cy.milkms.util.DateTool;
import com.cy.milkms.util.Pager;

@Service("milkService")
public class MilkService implements IMilkService{

	@Autowired
	private MilkMapper mapper;
	
	@Autowired
	private IStockService stockService;
	
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
	@Transactional
	public Map<String, Object> add_milk(Milk milk) {
		// TODO Auto-generated method stub
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		Milk milk2 = this.get_milk_by_name_or_number(milk.getMilk_name(),  milk.getNumber());
		if(milk2 != null){
			result.put("message", "商品已经存在");
			return result;
		}
		milk.setCreated(DateTool.getNowTime());
		milk.setUpdated(DateTool.getNowTime());
		try {
			int addMilkResult = mapper.add_milk(milk);
			if(addMilkResult <= 0){
				throw new Exception("新增失败");
			}
			/*增加库存记录*/
			Stock stock = new Stock();
			stock.setMilk_ID(milk.getId());
			stock.setNumber(0);
			stock.setCreated(DateTool.getNowTime());
			int addStockResult = stockService.addStock(stock);
			if(addStockResult <= 0){
				throw new Exception("新增失败");
			}
			result.put("succ", true);
			result.put("message", "新增成功");
			return result;
		} catch (Exception e) {
			result.put("message", e.getMessage());
			return result;
		}
	}

	@Override
	public Milk get_milk_by_name_or_number(String milk_name, String number) {
		// TODO Auto-generated method stub
		return mapper.get_milk_by_name_or_number(milk_name, number);
	}

	@Override
	@Transactional
	public int edit_milk(double purchase_price, double selling_price, String number) {
		// TODO Auto-generated method stub
		return mapper.edit_milk(purchase_price, selling_price, number, DateTool.getNowTime());
	}

	@Override
	@Transactional
	public int delete_milk(String number) {
		// TODO Auto-generated method stub
		return mapper.delete_milk(number, DateTool.getNowTime());
	}

	@Override
	public List<Milk> getMilkByName(String name) {
		// TODO Auto-generated method stub
		return mapper.getMilkByName(name);
	}
	
	
	
}
