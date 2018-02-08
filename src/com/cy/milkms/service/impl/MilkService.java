package com.cy.milkms.service.impl;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cy.milkms.db.dao.MilkMapper;
import com.cy.milkms.db.entity.Milk;
import com.cy.milkms.db.entity.Stock;
import com.cy.milkms.service.ILogService;
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
	
	@Autowired
	private ILogService logService;
	
	@Override
	public List<Milk> getMilkByCondition(Pager pager, String milkInfo) {
		return mapper.getMilkByCondition(pager, milkInfo);
	}

	@Override
	public int getMilkByConditionCount(String milkInfo) {
		return mapper.getMilkByConditionCount(milkInfo);
	}

	@Override
	@Transactional
	public Map<String, Object> addMilk(Milk milk) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		Milk milk2 = this.getMilkByNameOrCode(milk.getMilk_name(),  milk.getCode());
		if(milk2 != null){
			if(milk.getMilk_name().equals(milk2.getMilk_name()))
				result.put("message", "商品名称已经存在");
			else if(milk.getCode().equals(milk2.getCode()))
				result.put("message", "商品编号已经存在");
			return result;
		}
		milk.setCreated(DateTool.getNowTime());
		milk.setUpdated(DateTool.getNowTime());
		int addMilkResult = mapper.addMilk(milk);
		if(addMilkResult <= 0){
			throw new Exception("新增失败");
		}
		/*操作日志*/
		logService.addLog(mapper, "addMilk", milk);
		/*增加库存记录*/
		Stock stock = new Stock();
		stock.setMilk_ID(milk.getId());
		stock.setQuantity(0);
		stock.setCreated(DateTool.getNowTime());
		stock.setCost_price(0);
		int addStockResult = stockService.addStock(stock);
		if(addStockResult <= 0){
			throw new Exception("新增失败");
		}
		result.put("succ", true);
		result.put("message", "新增成功");
		return result;
	}

	@Override
	public Milk getMilkByNameOrCode(String milk_name, String code) {
		return mapper.getMilkByNameOrCode(milk_name, code);
	}

	@Override
	@Transactional
	public int editMilk(double purchase_price, double selling_price, String code) {
		/*操作日志*/
		Timestamp timestamp =  DateTool.getNowTime();
		logService.addLog(mapper, "editMilk", new Object[]{purchase_price, selling_price, code, timestamp});
		return mapper.editMilk(purchase_price, selling_price, code, timestamp);
	}

	@Override
	@Transactional
	public int deleteMilk(String code) {
		/*操作日志*/
		Timestamp timestamp =  DateTool.getNowTime();
		logService.addLog(mapper, "deleteMilk",new Object[]{code, timestamp});
		return mapper.deleteMilk(code, timestamp);
	}

	@Override
	public List<Milk> getMilkByName(String name) {
		return mapper.getMilkByName(name);
	}
	
	
	
}
