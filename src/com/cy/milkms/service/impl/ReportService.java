package com.cy.milkms.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.ReportMapper;
import com.cy.milkms.db.query.ReportPurchaseTableQuery;
import com.cy.milkms.db.query.ReportTotalNumberQuery;
import com.cy.milkms.service.IReportService;
import com.cy.milkms.util.LineChart;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.PieChart;
import com.cy.milkms.util.ReturnJsonData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service("reportService")
public class ReportService implements IReportService{

	@Autowired
	private ReportMapper mapper;

	@Override
	public String getPurchaseReport(Pager pager, String startTime, String endTime) {
		try {

			Map<String, Object> result = new HashMap<>();
			
			List<ReportTotalNumberQuery> numberList = mapper.getPurchaseReportTotalNumber(startTime, endTime);
			/*采购总数量*/
			int purchaseTotalNumber = 0;
			/*采购总金额*/
			double purchaseTotalAmout = 0;
			/*采购前三商品*/
			String firstThreeMilkName = "";
			for(int i=0;i<numberList.size();i++){
				purchaseTotalNumber += numberList.get(i).getMilkTotalNumber();
				purchaseTotalAmout += numberList.get(i).getMilkTotalPrice();
				if(i<2){
					firstThreeMilkName += numberList.get(i).getMilkName()+",";
				}
			}
			firstThreeMilkName = firstThreeMilkName.substring(0, firstThreeMilkName.length()-1);
			result.put("purchaseTotalNumber", purchaseTotalNumber);
			result.put("purchaseTotalAmout", purchaseTotalAmout);
			result.put("firstThreeMilkName", firstThreeMilkName);
			
			/*表格数据*/
			List<ReportPurchaseTableQuery> tableList = mapper.getPurchaseReportLimit(startTime, endTime, pager);
			Set<Integer> orderSet = new HashSet<>();
			Map<String, List<ReportPurchaseTableQuery>> tableMap = new HashMap<>();
			for(int i=0;i<tableList.size();i++){
				orderSet.add(tableList.get(i).getId());
				if(tableMap.containsKey(tableList.get(i).getName())){
					tableMap.get(tableList.get(i).getName()).add(tableList.get(i));
					tableMap.get(tableList.get(i).getName()).get(0).setTotalNumber(tableMap.get(tableList.get(i).getName()).get(0).getTotalNumber() + tableList.get(i).getNumber());
					tableMap.get(tableList.get(i).getName()).get(0).setTotalPrice(tableMap.get(tableList.get(i).getName()).get(0).getTotalPrice() + tableList.get(i).getTotal_amount());
				}
				else{
					List<ReportPurchaseTableQuery> temp = new ArrayList<>();
					tableList.get(i).setTotalNumber(tableList.get(i).getNumber());
					tableList.get(i).setTotalPrice(tableList.get(i).getTotal_amount());
					temp.add(tableList.get(i));
					tableMap.put(tableList.get(i).getName(), temp);
				}
			}
			result.put("purchaseOrderTotalNumber", orderSet.size());
			/*根据商品分组采购总价排序*/
			List<List<ReportPurchaseTableQuery>> resultTableList = new ArrayList<>();
			Set<String> keys = tableMap.keySet();
			Iterator<String> iterator = keys.iterator();
			while(iterator.hasNext()){
				String key = iterator.next();
				if(resultTableList.size() == 0){
					resultTableList.add(tableMap.get(key));
				}
				else{
					for(int i=0;i<resultTableList.size();i++){
						if(tableMap.get(key).get(0).getTotalPrice() > resultTableList.get(i).get(0).getTotalPrice()){
							resultTableList.add(i, tableMap.get(key));
							break;
						}
					}
				}
			}
			List json = ReturnJsonData.genJsonData(resultTableList);
			result.put("tableDatas", json);
			result.put("tableTotal", resultTableList.size());
			
			/*折线图数据*/
			/*折线图日期x轴*/
			Set<Date> timeSet = new HashSet<>();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");   
			for(int i=0;i<resultTableList.size();i++){
				List<ReportPurchaseTableQuery> oneList = resultTableList.get(i);
				for(int j=0;j<oneList.size();j++){
					ReportPurchaseTableQuery one = oneList.get(j);
					timeSet.add(df.parse(df.format(one.getTime())));
				}
			}
			/*时间大小排序*/
			Iterator<Date> timeIte = timeSet.iterator();
			List<Date> timeX = new ArrayList<>();
			while(timeIte.hasNext()){
				Date timeKey = timeIte.next();
				if(timeX.size() == 0){
					timeX.add(timeKey);
				}
				else{
					for(int i=0;i<timeX.size();i++){
						if(timeKey.getTime() > timeX.get(i).getTime()){
							timeX.add(i, timeKey);
							break;
						}
					}
				}
			}
			List<String> timeXStrList = new ArrayList<>();
			for(int i=0;i<timeX.size();i++){
				timeXStrList.add(df.format(timeX.get(i)));
			}
			String lineXData = JSONArray.fromObject(timeXStrList).toString();
			result.put("lineXData", lineXData);
			/*折线图价格y轴*/
			List<LineChart> lineChartList = new ArrayList<>();
			for(int i=0;i<resultTableList.size();i++){
				List<ReportPurchaseTableQuery> oneList = resultTableList.get(i);
				LineChart lineChart = new LineChart();
				String[] lineDatas = new String[timeX.size()];
				for(int k=0;k<timeX.size();k++){
					boolean isExit = false;
					int j=0;
					for(;j<oneList.size();j++){
						if(oneList.get(j).getTime().getTime() == timeX.get(k).getTime()){
							isExit = true;
							break;
						}
					}
					if(isExit){
						lineDatas[k] = String.valueOf(oneList.get(j).getTotal_amount());
					}
					else{
						lineDatas[k] = null;
					}
				}
				lineChart.setTitle(oneList.get(0).getName());
				lineChart.setDatas(lineDatas);
				lineChartList.add(lineChart);
			}
			List lineYData = ReturnJsonData.genJsonData(lineChartList);
			result.put("lineYData", lineYData);
			
			/*饼状图数据*/
			List<PieChart> pieChartList = new ArrayList<>();
			for(int i=0;i<resultTableList.size();i++){
				PieChart pieChart = new PieChart();
				pieChart.setTitle(resultTableList.get(i).get(0).getName());
				pieChart.setNumber(resultTableList.get(i).get(0).getTotalPrice());
				pieChartList.add(pieChart);
			}
			List pieData = ReturnJsonData.genJsonData(pieChartList);
			result.put("pieData", pieData);
			return JSONObject.fromObject(result).toString();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return null;
	}
	
	
}
