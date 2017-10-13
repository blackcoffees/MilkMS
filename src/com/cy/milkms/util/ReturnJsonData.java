package com.cy.milkms.util;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cy.milkms.db.entity.Milk;

import net.sf.json.JSONArray;

public class ReturnJsonData {
	public static String currentJsonData(int total, List<?> list){
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
	
	public static void main(String[] args) throws NoSuchMethodException, SecurityException, Exception {
		List<Milk> list = new ArrayList<Milk>();
		list.add(new Milk());
		currentJsonData(1, list);
	}
}
