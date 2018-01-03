package com.cy.milkms.util;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cy.milkms.db.entity.Milk;

import net.sf.json.JSONArray;

public class ReturnJsonData {
	public static String currentJsonData(int total, List<?> list){
		/*
		 * 一重list，返回json
		 * */
		if(total == 0 || list.size() == 0){
			Map map2 = new HashMap();
			map2.put("total", total);
			map2.put("data", list);
			return JSONArray.fromObject(map2).toString();
		}
		List result = new ArrayList();
		for(int j=0;j<list.size();j++){
			Map<String, String> map = new HashMap<String, String>();
			Field[] fields = list.get(j).getClass().getDeclaredFields();
			PropertyDescriptor pd = null;
			for(int i=0;i<fields.length;i++){
				String name = fields[i].getName();
				try {
					pd = new PropertyDescriptor(name, list.get(j).getClass());
					Method method = pd.getReadMethod();
					String value = String.valueOf(method.invoke(list.get(j)));
					map.put(name, value);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			result.add(map);
		}
		
		Map map2 = new HashMap();
		map2.put("total", total);
		map2.put("data", result);
		return JSONArray.fromObject(map2).toString();
	}
	
	public static String createReturnJsonData(int total, List<?> list){
		/*
		 * 多重list，返回json
		 * */
		if(total == 0 || list.size() == 0){
			Map map2 = new HashMap();
			map2.put("total", total);
			map2.put("data", list);
			return JSONArray.fromObject(map2).toString();
		}
		List reslut = genJsonData(list);
		Map map = new HashMap();
		map.put("total", total);
		map.put("data", reslut);
		return JSONArray.fromObject(map).toString();
	}
	
	
	public static List genJsonData(List<?> list){
		try {
			if(list.get(0) instanceof List){
				List jsonDatas = new ArrayList();
				for(int i=0;i<list.size();i++){
					List jsonData = genJsonData((List)list.get(i));
					jsonDatas.add(jsonData);
				}
				return jsonDatas;
			}
			else{
				Field[] fields = list.get(0).getClass().getDeclaredFields();
				PropertyDescriptor pd = null;
				List result = new ArrayList();
				for(int i=0;i<list.size();i++){
					Map<String, String> valueMap = new HashMap<String, String>();
					for(int j=0;j<fields.length;j++){
						String fieldName = fields[j].getName();
						pd = new PropertyDescriptor(fieldName, list.get(0).getClass());
						Method method = pd.getReadMethod();
						String value = String.valueOf(method.invoke(list.get(i)));
						valueMap.put(fieldName, value);
					}
					result.add(valueMap);
				}
				return result;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public static void main(String[] args){
		try{
			List<Milk> list = new ArrayList<Milk>();
			list.add(new Milk());
			list.add(new Milk());
			List<Milk> list2 = new ArrayList<Milk>();
			list2.add(new Milk());
			list2.add(new Milk());
			List list3 = new ArrayList();
			list3.add(list);
			list3.add(list2);
			String string = createReturnJsonData(4, list3);
			System.out.println(string);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
