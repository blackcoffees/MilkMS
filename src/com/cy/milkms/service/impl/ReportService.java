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
import com.cy.milkms.db.query.ReportPurchaseSummaryDataQuery;
import com.cy.milkms.db.query.ReportPurchaseTableQuery;
import com.cy.milkms.service.IReportService;
import com.cy.milkms.util.LineChart;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.PieChart;
import com.cy.milkms.util.ReturnJsonData;

import net.sf.json.JSONObject;

@Service("reportService")
public class ReportService implements IReportService{

	@Autowired
	private ReportMapper mapper;

	@Override
	public String getPurchaseReport(Pager pager, String startTime, String endTime, String milkInfo) {
		try {

			Map<String, Object> result = new HashMap<>();
			/*汇总数据*/
			List<ReportPurchaseSummaryDataQuery> summaryList = mapper.getPurchaseReportSummaryData(startTime, endTime, milkInfo);
			result.put("summaryPurchaseOrderCount", summaryList.get(0).getSummaryPurchaseOrderCount());
			result.put("summaryPurchaseMilkNumber", summaryList.get(0).getSummaryPurchaseMilkNumber());
			result.put("summaryPurchaseMilkPrice", summaryList.get(0).getSummaryPurchaseMilkPrice());
			result.put("summaryFirstThreeMilkName", summaryList.get(0).getSummaryFirstThreeMilkName());
			
			/*表格数据*/
			List<ReportPurchaseTableQuery> tableList = mapper.getPurchaseReportLimit(startTime, endTime, pager, milkInfo);
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
			result.put("lineXData", timeXStrList);
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
				lineChart.setName(oneList.get(0).getName());
				lineChart.setDatas(lineDatas);
				lineChartList.add(lineChart);
			}
			String lineYData = ReturnJsonData.currentLineChartData(lineChartList);
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

	@Override
	public String getSaleReport(Pager pager, String startTime, String endTime, String info, String type) {
//		try {
//			Map<String, Object> result = new HashMap<>();
//			
//			List<ReportTotalNumberQuery> numberList = mapper.getSaleReportTotalNumber(startTime, endTime, info, type);
//			/*采购总数量*/
//			int saleTotalNumber = 0;
//			/*采购总金额*/
//			double saleTotalAmout = 0;
//			for(int i=0;i<numberList.size();i++){
//				saleTotalNumber += numberList.get(i).getMilkTotalNumber();
//				saleTotalAmout += numberList.get(i).getMilkTotalPrice();
//			}
//			result.put("saleTotalNumber", saleTotalNumber);
//			result.put("saleTotalAmout", saleTotalAmout);
//			
//			/*总利润*/
//			double saleTotalProfit = 0;
//			/*销售单数*/
//			Set<Integer> orderSet = new HashSet<>();
//			/*表格数据*/
//			List<ReportSaleTableQuery> saleList = mapper.getSaleReportLimit(startTime, endTime, pager, info, type);
//			Map<String, List<ReportSaleTableQuery>> saleMap = new HashMap<>();
//			for(ReportSaleTableQuery reportSale: saleList){
//				orderSet.add(reportSale.getId());
//				if(saleMap.containsKey(reportSale.getMilk_name())){
//					saleMap.get(reportSale.getMilk_name()).add(reportSale);
//				}
//				else{
//					List<ReportSaleTableQuery> temp = new ArrayList<>();
//					temp.add(reportSale);
//					saleMap.put(reportSale.getMilk_name(), temp);
//				}
//			}
//			Set<String> keys = saleMap.keySet();
//			Iterator<String> iterator = keys.iterator();
//			List<List<ReportSaleTableQuery>> tableDatas = new ArrayList<>();
//			/*x轴数据*/
//			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-mm-DD");
//			Set<Date> saleTimeSet = new HashSet<>();
//			while(iterator.hasNext()){
//				String key = iterator.next();
//				List<ReportSaleTableQuery> temp = saleMap.get(key);
//				for(ReportSaleTableQuery reportSale: temp){
//					temp.get(0).setTotalNumber(temp.get(0).getTotalNumber() + reportSale.getNumber());
//					temp.get(0).setTotalPrice(temp.get(0).getTotalPrice() + reportSale.getTotal_amount());
//					temp.get(0).setTotalProfit(temp.get(0).getTotalProfit() + (reportSale.getTotal_amount() - reportSale.getNumber() * reportSale.getCostPrice()));
//					reportSale.setTotalCostPrice(reportSale.getTotal_amount() - reportSale.getNumber() * reportSale.getCostPrice());
//					saleTimeSet.add(sdf.parse(sdf.format(reportSale.getSale_time())));
//				}
//				tableDatas.add(temp);
//				saleTotalProfit += temp.get(0).getTotalProfit();
//			}
//			result.put("saleTotalProfit", saleTotalProfit);
//			result.put("saleTotalOrder", orderSet.size());
//			
//			result.put("tableDatas", ReturnJsonData.genJsonData(tableDatas));
//			
//			/*折线图数据*/
//			List<Date> saleTimeList = new ArrayList<>();
//			Iterator<Date> saleTimeIte = saleTimeSet.iterator();
//			while(saleTimeIte.hasNext()){
//				Date key = saleTimeIte.next();
//				if(saleTimeList.size() == 0){
//					saleTimeList.add(key);
//				}
//				else{
//					for(int i=0;i<saleTimeList.size();i++){
//						if(saleTimeList.get(i).getTime() < key.getTime()){
//							saleTimeList.add(i, key);
//							break;
//						}
//					}
//				}
//			}
//			result.put("lineXData", saleTimeList);
//			/*销售数据*/
//			List<LineChart> lineSaleYData = new ArrayList<>();
//			/*利润数据*/
//			List<LineChart> lineProfitYData = new ArrayList<>();
//			for(List<ReportSaleTableQuery> temp: tableDatas){
//				String[] lineSaleData = new String[saleTimeList.size()];
//				String[] lineProfitData = new String[saleTimeList.size()];
//				for(int i=0;i<saleTimeList.size();i++){
//					int j=0;
//					boolean is_exit = false;
//					for(;j<temp.size();j++){
//						if(saleTimeList.get(i).getTime() == temp.get(j).getSale_time().getTime()){
//							is_exit = true;
//							break;
//						}
//					}
//					if(is_exit){
//						lineSaleData[i] = String.valueOf(temp.get(j).getTotalPrice());
//						lineProfitData[i] = String.valueOf(temp.get(j).getTotalProfit());
//					}
//					else{
//						lineSaleData[i] = null;
//						lineProfitData[i] = null;
//					}
//				}
//				LineChart lineChart = new LineChart();
//				lineChart.setDatas(lineSaleData);
//				lineChart.setName(temp.get(0).getMilk_name());
//				lineSaleYData.add(lineChart);
//				
//				LineChart lineChart2 = new LineChart();
//				lineChart2.setDatas(lineProfitData);
//				lineChart2.setName(temp.get(0).getMilk_name());
//				lineProfitYData.add(lineChart2);
//			}
//			result.put("lineSaleYData", ReturnJsonData.currentLineChartData(lineSaleYData));
//			result.put("lineProfitYData", ReturnJsonData.currentLineChartData(lineProfitYData));
//			
//			/*饼状图数据*/
//			List<PieChart> pieSaleList = new ArrayList<>();
//			List<PieChart> pieProfitList = new ArrayList<>();
//			for(List<ReportSaleTableQuery> temp: tableDatas){
//				PieChart pieChart = new PieChart();
//				pieChart.setTitle(temp.get(0).getName());
//				pieChart.setNumber(temp.get(0).getTotalPrice());
//				pieSaleList.add(pieChart);
//				
//				PieChart pieChart2 = new PieChart();
//				pieChart2.setTitle(temp.get(0).getName());
//				pieChart2.setNumber(temp.get(0).getTotalProfit());
//				pieProfitList.add(pieChart2);
//			}
//			List pieSaleData = ReturnJsonData.genJsonData(pieSaleList);
//			List pieProfitData = ReturnJsonData.genJsonData(pieProfitList);
//			result.put("pieSaleData", pieSaleData);
//			result.put("pieProfitData", pieProfitData);
//			return JSONObject.fromObject(result).toString();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return null;
	}
	
	
}
