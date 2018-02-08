package com.cy.milkms.service.impl;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cy.milkms.db.dao.ReportMapper;
import com.cy.milkms.db.query.LineChartQuery;
import com.cy.milkms.db.query.LineDateQuery;
import com.cy.milkms.db.query.PieChartQuery;
import com.cy.milkms.db.query.ReportPurchaseSummaryDataQuery;
import com.cy.milkms.db.query.ReportPurchaseTableQuery;
import com.cy.milkms.db.query.ReportSaleSummaryDataQuery;
import com.cy.milkms.db.query.ReportSaleTableQuery;
import com.cy.milkms.db.query.SaleTodayQuery;
import com.cy.milkms.service.IReportService;
import com.cy.milkms.util.CommonTool;
import com.cy.milkms.util.DateTool;
import com.cy.milkms.util.LineChart;
import com.cy.milkms.util.Pager;
import com.cy.milkms.util.ReturnJsonData;
import com.cy.milkms.util.Rose;

import net.sf.json.JSONObject;

@Service("reportService")
public class ReportService implements IReportService{

	@Autowired
	private ReportMapper mapper;
	
	@Override
	public String getPurchaseReport(Pager pager, String startTime, String endTime, String milkInfo) {
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		try {
			
			/*汇总数据*/
			ReportPurchaseSummaryDataQuery summaryDataQuery = new ReportPurchaseSummaryDataQuery();
			summaryDataQuery.setStartTime(startTime);
			summaryDataQuery.setEndTime(endTime);
			summaryDataQuery.setMilkInfo(milkInfo);
			summaryDataQuery = mapper.getPurchaseReportSummaryData(summaryDataQuery);
			result.put("summaryPurchaseOrderCount", summaryDataQuery.getSummaryPurchaseOrderCount());
			result.put("summaryPurchaseMilkNumber", summaryDataQuery.getSummaryPurchaseMilkNumber());
			result.put("summaryPurchaseMilkPrice", summaryDataQuery.getSummaryPurchaseMilkPrice());
			if(summaryDataQuery.getSummaryFirstThreeMilkName() != null && summaryDataQuery.getSummaryFirstThreeMilkName() != "" && !summaryDataQuery.getSummaryFirstThreeMilkName().equals("")){
				result.put("summaryFirstThreeMilkName", summaryDataQuery.getSummaryFirstThreeMilkName().substring(1, summaryDataQuery.getSummaryFirstThreeMilkName().length()));
			}
			else {
				result.put("summaryFirstThreeMilkName", "");
			}
			
			/*表格数据*/
			List<ReportPurchaseTableQuery> tableList = mapper.getPurchaseReportTableData(startTime, endTime, pager, milkInfo);
			if(tableList.size() == 0){
				result.put("tableDatas", "");
				pager.setTotal(0);
				result.put("pager", pager);
			}
			else{
				Map<String, List<ReportPurchaseTableQuery>> tableMap = new HashMap<>();
				for(ReportPurchaseTableQuery temp: tableList){
					if(tableMap.containsKey(temp.getMilk_name())){
						tableMap.get(temp.getMilk_name()).add(temp);
						tableMap.get(temp.getMilk_name()).get(0).setTotalPurchasePrice(tableMap.get(temp.getMilk_name()).get(0).getTotalPurchasePrice() + temp.getTotal_price());
						tableMap.get(temp.getMilk_name()).get(0).setTotalPurchaseQuantity(tableMap.get(temp.getMilk_name()).get(0).getTotalPurchaseQuantity() + temp.getQuantity());
					}
					else {
						List<ReportPurchaseTableQuery> temp_list = new ArrayList<>();
						temp_list.add(temp);
						temp.setTotalPurchasePrice(temp.getTotal_amount());
						temp.setTotalPurchaseQuantity(temp.getQuantity());
						tableMap.put(temp.getMilk_name(), temp_list);
					}
				}
				Set<String> tableKeySet = tableMap.keySet();
				Iterator<String> tableIterator = tableKeySet.iterator();
				List<List<ReportPurchaseTableQuery>> tableDataList = new ArrayList<>();
				while(tableIterator.hasNext()){
					String key = tableIterator.next();
					tableDataList.add(tableMap.get(key));
				}
				List<?> json = ReturnJsonData.genJsonData(tableDataList);
				result.put("tableDatas", json);
				pager.setTotal(tableList.size());
				result.put("pager", pager);
			}
			
			/*折线图数据*/
			/*折线图日期x轴*/
			List<LineDateQuery> dateList = mapper.getPurchaseReportDateData(startTime, endTime, milkInfo);
			List<String> lineXData = new ArrayList<>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for(int i=0;i<dateList.size();i++){
				lineXData.add(sdf.format(dateList.get(i).getTime()));
			}
			result.put("lineXData", lineXData);
			/*折线图价格y轴*/
			List<LineChartQuery> lineDataList = mapper.getPurchaseReportLineData(startTime, endTime, milkInfo);
			Map<String, List<LineChartQuery>> lineDataMap = new HashMap<>();
			for (LineChartQuery lineChartQuery : lineDataList) {
				if(lineDataMap.get(lineChartQuery.getMilk_name()) != null){
					lineDataMap.get(lineChartQuery.getMilk_name()).add(lineChartQuery);
				}
				else{
					List<LineChartQuery> temp = new ArrayList<>();
					temp.add(lineChartQuery);
					lineDataMap.put(lineChartQuery.getMilk_name(), temp);
				}
			}
			Set<String> keySet = lineDataMap.keySet();
			Iterator<String> iterator = keySet.iterator();
			List<LineChart> lineChartList = new ArrayList<>();
			while(iterator.hasNext()){
				String key = iterator.next();
				List<LineChartQuery> value = lineDataMap.get(key);
				LineChart lineChart = new LineChart();
				String[] lineDatas = new String[dateList.size()];
				for(int k=0;k<dateList.size();k++){
					boolean isExit = false;
					int j=0;
					for(;j<value.size();j++){
						if(value.get(j).getTime().getTime() == dateList.get(k).getTime().getTime()){
							isExit = true;
							break;
						}
					}
					if(isExit){
						lineDatas[k] = String.valueOf(value.get(j).getTotal_price());
					}
					else{
						lineDatas[k] = null;
					}
				}
				lineChart.setName(value.get(0).getMilk_name());
				lineChart.setDatas(lineDatas);
				lineChartList.add(lineChart);
			}
			String lineYData = ReturnJsonData.currentLineChartData(lineChartList);
			result.put("lineYData", lineYData);
			
			/*饼状图数据*/
			List<PieChartQuery> pieChartQueryList = mapper.getPurchaseReportPieData(startTime, endTime, milkInfo);
			List pieData;
			if(pieChartQueryList.size() == 0){
				pieData = new ArrayList<>();
			}
			else {
				pieData = ReturnJsonData.genJsonData(pieChartQueryList);
			}
			result.put("pieData", pieData);
			result.put("succ", true);
			result.put("message", "");
			return JSONObject.fromObject(result).toString();
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(result).toString();			
		}
	}

	@Override
	public String getSaleReport(Pager pager, String startTime, String endTime, String info, String type) {
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		try {
			/*汇总数据*/
			ReportSaleSummaryDataQuery reportSaleSummaryDataQuery = mapper.getSaleReportSummaryData(startTime, endTime, info, type);
			result.put("summarySaleOrderCount", reportSaleSummaryDataQuery.getSummarySaleOrderCount());
			result.put("summarySaleGoodsQuantity", reportSaleSummaryDataQuery.getSummarySaleGoodsQuantity());
			result.put("summarySaleGoodsPrice", reportSaleSummaryDataQuery.getSummarySaleGoodsPrice());
			result.put("summarySaleGoodsProfit", reportSaleSummaryDataQuery.getSummarySaleGoodsProfit());
			
			/*表格数据*/
			List<ReportSaleTableQuery> saleList = mapper.getSaleReportTableData(startTime, endTime, type, pager, info);
			Map<String, List<ReportSaleTableQuery>> saleMap = new HashMap<>();
			int type_int = Integer.parseInt(type);
			if(type_int == 1){
				/*商品分组*/
				for(ReportSaleTableQuery reportSale: saleList){
					if(saleMap.containsKey(reportSale.getMilk_name())){
						saleMap.get(reportSale.getMilk_name()).add(reportSale);
					}
					else{
						List<ReportSaleTableQuery> temp = new ArrayList<>();
						temp.add(reportSale);
						saleMap.put(reportSale.getMilk_name(), temp);
					}
				}
			}
			else if(type_int == 2){
				/*商家分组*/
				for(ReportSaleTableQuery reportSale: saleList){
					if(saleMap.containsKey(reportSale.getDistributor_name())){
						saleMap.get(reportSale.getMilk_name()).add(reportSale);
					}
					else{
						List<ReportSaleTableQuery> temp = new ArrayList<>();
						temp.add(reportSale);
						saleMap.put(reportSale.getDistributor_name(), temp);
					}
				}
			}
			List<List<ReportSaleTableQuery>> tableDatas = new ArrayList<>();
			Set<String> keys = saleMap.keySet();
			Iterator<String> iterator = keys.iterator();
			while(iterator.hasNext()){
				String key = iterator.next();
				tableDatas.add(saleMap.get(key));
			}
			pager.setTotal(tableDatas.size());
			result.put("pager", pager);
			if(tableDatas.size() != 0)
				result.put("tableDatas", ReturnJsonData.genJsonData(tableDatas));
			else
				result.put("tableDatas", "");
			
			/*折线图X轴时间数据*/
			List<LineDateQuery> dateList = mapper.getSaleReportDateData(startTime, endTime, info, type);
			List<String> lineXData = new ArrayList<>();
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-mm-dd");
			for (LineDateQuery lineDateQuery : dateList) {
				lineXData.add(sdf.format(lineDateQuery.getTime()));
			}
			if(lineXData.size() != 0)
				result.put("lineXData", lineXData);
			else
				result.put("lineXData", "");
			
			/*折线图y轴数据*/
			List<LineChartQuery> lineDataList = mapper.getSaleReportLineData(startTime, endTime, type, info);
			Map<String, List<LineChartQuery>> lineDataMap = new HashMap<>();
			if(type_int == 1){
				for (LineChartQuery lineChartQuery : lineDataList) {
					if(lineDataMap.get(lineChartQuery.getMilk_name()) != null){
						lineDataMap.get(lineChartQuery.getMilk_name()).add(lineChartQuery);
					}
					else{
						List<LineChartQuery> temp = new ArrayList<>();
						temp.add(lineChartQuery);
						lineDataMap.put(lineChartQuery.getMilk_name(), temp);
					}
				}
			}
			else if(type_int == 2){
				for (LineChartQuery lineChartQuery : lineDataList) {
					if(lineDataMap.get(lineChartQuery.getDistributor_name()) != null){
						lineDataMap.get(lineChartQuery.getMilk_name()).add(lineChartQuery);
					}
					else{
						List<LineChartQuery> temp = new ArrayList<>();
						temp.add(lineChartQuery);
						lineDataMap.put(lineChartQuery.getDistributor_name(), temp);
					}
				}
			}
			Set<String> keySet = lineDataMap.keySet();
			Iterator<String> lineIterator = keySet.iterator();
			List<LineChart> lineChartList = new ArrayList<>();
			while(lineIterator.hasNext()){
				String key = lineIterator.next();
				List<LineChartQuery> value = lineDataMap.get(key);
				LineChart lineChart = new LineChart();
				String[] lineDatas = new String[dateList.size()];
				for(int k=0;k<dateList.size();k++){
					boolean isExit = false;
					int j=0;
					for(;j<value.size();j++){
						if(value.get(j).getTime().getTime() == dateList.get(k).getTime().getTime()){
							isExit = true;
							break;
						}
					}
					if(isExit){
						lineDatas[k] = String.valueOf(value.get(j).getTotal_price());
					}
					else{
						lineDatas[k] = null;
					}
				}
				lineChart.setName(value.get(0).getMilk_name());
				lineChart.setDatas(lineDatas);
				lineChartList.add(lineChart);
			}
			if(lineChartList.size() != 0)
				result.put("lineYData", ReturnJsonData.currentLineChartData(lineChartList));
			else
				result.put("lineYData", "");
			
			
			/*饼状图数据*/
			/*饼状图数据*/
			List<PieChartQuery> pieChartQueryList = mapper.getSaleReportPieData(startTime, endTime, type, info);
			List pieData;
			if(pieChartQueryList.size() == 0){
				pieData = new ArrayList<>();
			}
			else {
				pieData = ReturnJsonData.genJsonData(pieChartQueryList);
			}
			result.put("pieData", pieData);
			result.put("succ", true);
			result.put("message", "");
			return JSONObject.fromObject(result).toString();
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(result).toString();
		}
	}

	@Override
	public String getGoodsAnalysisReport(String startStartTime, String startEndTime, String endStartTime,
			String endEndTime, String info, Pager pager, String type) {
		int typeInt = Integer.parseInt(type);
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		boolean isLastDay = false;
		if(!CommonTool.isNull(startStartTime) && !CommonTool.isNull(startEndTime) && CommonTool.isNull(endStartTime) &&
				CommonTool.isNull(endEndTime)){
			isLastDay = true;
		}
		/*汇总数据*/
		ReportSaleSummaryDataQuery lastReportSaleSummaryDataQuery;
		ReportSaleSummaryDataQuery nowReportSaleSummaryDataQuery;
		if(isLastDay){
			lastReportSaleSummaryDataQuery = mapper.getAnalysisSummaryData(startStartTime, startStartTime, info, type);
			nowReportSaleSummaryDataQuery = mapper.getAnalysisSummaryData(startEndTime, startEndTime, info, type);
		}
		else {
			lastReportSaleSummaryDataQuery = mapper.getAnalysisSummaryData(startStartTime, startEndTime, info, type);
			nowReportSaleSummaryDataQuery = mapper.getAnalysisSummaryData(endStartTime, endEndTime, info, type);
		}
		result.put("lastSummarySaleOrderCount", lastReportSaleSummaryDataQuery.getSummarySaleOrderCount());
		result.put("lastSummarySaleGoodsQuantity", lastReportSaleSummaryDataQuery.getSummarySaleGoodsQuantity());
		result.put("lastSummarySaleGoodsPrice", lastReportSaleSummaryDataQuery.getSummarySaleGoodsPrice());
		
		result.put("nowSummarySaleOrderCount", nowReportSaleSummaryDataQuery.getSummarySaleOrderCount());
		result.put("nowSummarySaleGoodsQuantity", nowReportSaleSummaryDataQuery.getSummarySaleGoodsQuantity());
		result.put("nowSummarySaleGoodsPrice", nowReportSaleSummaryDataQuery.getSummarySaleGoodsPrice());

		/*涨幅数据*/
		List<LineChartQuery> lastRoseList;
		List<LineChartQuery> nowRoseList;
		if(isLastDay){
			lastRoseList = mapper.getAnalysisRoseData(startStartTime, startStartTime, info, type);
			nowRoseList = mapper.getAnalysisRoseData(startEndTime, startEndTime, info, type);
		}
		else{
			lastRoseList = mapper.getAnalysisRoseData(startStartTime, startEndTime, info, type);
			nowRoseList = mapper.getAnalysisRoseData(endStartTime, endEndTime, info, type);
		}
		int i=0, j=0;
		Map<String, LineChartQuery> lastRoseMap = new HashMap<>();
		Map<String, LineChartQuery> nowRoseMap = new HashMap<>();
		/*转成map格式*/
		while(true){
			if(i<lastRoseList.size()){
				if(typeInt == 1){
					lastRoseMap.put(lastRoseList.get(i).getMilk_name(), lastRoseList.get(i));
				}
				else if(typeInt == 2){
					lastRoseMap.put(lastRoseList.get(i).getDistributor_name(), lastRoseList.get(i));
				}
				i++;
			}
			if(j<nowRoseList.size()){
				if(typeInt == 1){
					nowRoseMap.put(nowRoseList.get(j).getMilk_name(), nowRoseList.get(j));
				}
				else if(typeInt == 2){
					nowRoseMap.put(nowRoseList.get(j).getDistributor_name(), nowRoseList.get(j));
				}
				j++;
			}
			if(i==lastRoseList.size() && j==nowRoseList.size()) break;
		}
		/*计算比例*/
		List<Rose> roseList = new ArrayList<>();
		Iterator<String> nowRoseIte = nowRoseMap.keySet().iterator();
		while(nowRoseIte.hasNext()){
			String key = nowRoseIte.next();
			if(lastRoseMap.containsKey(key)){
				double roseDouble = (nowRoseMap.get(key).getTotal_price() - lastRoseMap.get(key).getTotal_price()) / lastRoseMap.get(key).getTotal_price();
				Rose teRose = new Rose();
				teRose.setLastPrice(lastRoseMap.get(key).getTotal_price());
				teRose.setName(key);
				teRose.setNowPrice(nowRoseMap.get(key).getTotal_price());
				teRose.setRose(CommonTool.decimalNumber(roseDouble, 2));
				roseList.add(teRose);
				lastRoseMap.remove(key);
			}
			else{
				Rose teRose = new Rose();
				teRose.setLastPrice(0);
				teRose.setName(key);
				teRose.setNowPrice(nowRoseMap.get(key).getTotal_price());
				teRose.setRose(1);
				roseList.add(teRose);
			}
		}
		if(lastRoseMap.keySet().size()!=0){
			Iterator<String> lastRoseIte = lastRoseMap.keySet().iterator();
			while(lastRoseIte.hasNext()){
				String key = lastRoseIte.next();
				Rose teRose = new Rose();
				teRose.setLastPrice(lastRoseMap.get(key).getTotal_price());
				teRose.setName(key);
				teRose.setNowPrice(0);
				teRose.setRose(-1);
				roseList.add(teRose);
			}
		}
		/*从大到小排序*/
		for(int k=0;k<roseList.size();k++){
			int max = k;
			for(int l=k;l<roseList.size();l++){
				if(roseList.get(max).getRose() < roseList.get(l).getRose()){
					max = l;
				}
			}
			if(k!=max){
				Rose temp = roseList.get(max);
				roseList.set(max, roseList.get(k));
				roseList.set(k, temp);
			}
		}
		pager.setTotal(roseList.size());
		result.put("pager", pager);
		if(roseList.size() != 0)
			result.put("tableDatas", ReturnJsonData.genJsonData(roseList));
		else
			result.put("tableDatas", new ArrayList<>());
		List<Rose> roseUpList = new ArrayList<>();
		List<Rose> roseDownList = new ArrayList<>();
		for (Rose rose : roseList) {
			if(rose.getRose() >= 0.2){
				roseUpList.add(rose);
			}
			else if (rose.getRose() <= -0.2) {
				roseDownList.add(rose);
			}
		}
		if(roseUpList.size() != 0)
			result.put("roseUpData", ReturnJsonData.genJsonData(roseUpList));
		else
			result.put("roseUpData", new ArrayList<>());
		if(roseDownList.size() != 0)
			result.put("roseDownData", ReturnJsonData.genJsonData(roseDownList));
		else
			result.put("roseDownData", new ArrayList<>());
		/*折线图数据*/
		if(!info.equals("") && info != null){
			/*x轴*/
			Set<String> lineDateSet = new LinkedHashSet<>();
			List<LineDateQuery> lastLineDateList;
			List<LineDateQuery> nowLineDateList;
			if(isLastDay){
				lastLineDateList = mapper.getAnalysisReportDateData(startStartTime, startStartTime, type, info);
				nowLineDateList = mapper.getAnalysisReportDateData(startEndTime, startEndTime, type, info);
			}
			else{
				lastLineDateList = mapper.getAnalysisReportDateData(startStartTime, startEndTime, type, info);
				nowLineDateList = mapper.getAnalysisReportDateData(endStartTime, endEndTime, type, info);
			}
			i=0;j=0;
			while(true){
				if(i<lastLineDateList.size()){
					lineDateSet.add(String.valueOf(lastLineDateList.get(i).getTime().getDate()) + "号");
					i++;
				}
				if(j<nowLineDateList.size()){
					lineDateSet.add(String.valueOf(nowLineDateList.get(i).getTime().getDate()) + "号");
					j++;
				}
				if(i==lastLineDateList.size() && j==nowLineDateList.size())
					break;
			}
			List<String> lineXData = new ArrayList<>(lineDateSet);
			result.put("lineXData", lineXData);
			/*y轴*/
			List<LineChartQuery> lastLineDataList;
			List<LineChartQuery> nowLineDataList;
			if(isLastDay){
				lastLineDataList = mapper.getAnalysisReportLineData(startStartTime, startStartTime, type, info);
				nowLineDataList = mapper.getAnalysisReportLineData(startEndTime, startEndTime, type, info);
			}
			else{
				lastLineDataList = mapper.getAnalysisReportLineData(startStartTime, startEndTime, type, info);
				nowLineDataList = mapper.getAnalysisReportLineData(endStartTime, endEndTime, type, info);
			}
			List<LineChart> lineYData = new ArrayList<>();
			Iterator<String> dateIte = lineDateSet.iterator();
			lineYData.add(new LineChart());
			lineYData.add(new LineChart());
			String[] lastXData = new String[lineDateSet.size()];
			String[] nowXData = new String[lineDateSet.size()];
			i = 0;
			while(dateIte.hasNext()){
				int key = Integer.parseInt(dateIte.next().substring(0, 1));
				for(LineChartQuery last: lastLineDataList){
					boolean exit = false;
					if(last.getTime().getDate() == key){
						exit = true;
					}
					if(exit) lastXData[i] = String.valueOf(CommonTool.decimalNumber(last.getTotal_price(), 2)); 
					else lastXData[i] = null;
				}
				for(LineChartQuery now: nowLineDataList){
					boolean exit = false;
					if(now.getTime().getDate() == key){
						exit = true;
					}
					if(exit) nowXData[i] = String.valueOf(CommonTool.decimalNumber(now.getTotal_price(), 2)); 
					else lastXData[i] = null;			
				}
			}
			lineYData.get(0).setDatas(lastXData);
			lineYData.get(1).setDatas(nowXData);
			if(isLastDay){
				lineYData.get(0).setName(startStartTime);
				lineYData.get(1).setName(startEndTime);
			}
			else{
				lineYData.get(0).setName("\"" + startStartTime + " - " + startEndTime + "\"");
				lineYData.get(1).setName("\"" + endStartTime + " - " + endEndTime + "\"");
			}
			result.put("lineYData", ReturnJsonData.currentLineChartData(lineYData));
		}
		result.put("succ", true);
		result.put("message", "");
		return JSONObject.fromObject(result).toString();
	}

	@Override
	public Map<String, Object> exportExcel(String path, String startTime, String endTime, String type) {
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		try {
			// 声明一个工作薄 
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成表格
			HSSFSheet sheet = workbook.createSheet();
			// 设置表格默认列宽度
			sheet.setDefaultColumnWidth(15);
			// 生成row
			HSSFRow rowFirst = sheet.createRow(0);
			// 生成cell
			HSSFCell cell = rowFirst.createCell(0);
			List<?> datas = new ArrayList<>();
			HSSFRow rowSecond = sheet.createRow(1);
			if(type.equals("1")){
				// 设置单元格内容
				cell.setCellValue(startTime + " - " + endTime + "采购表");
				datas = mapper.getExportDatasByPurchase(startTime, endTime);
				rowSecond.createCell(0).setCellValue("采购单号");
				rowSecond.createCell(1).setCellValue("采购时间");
				rowSecond.createCell(2).setCellValue("商品名称");
				rowSecond.createCell(3).setCellValue("商品数量（件）");
				rowSecond.createCell(4).setCellValue("商品单价（￥）");
				rowSecond.createCell(5).setCellValue("商品采购总价（￥）");
				rowSecond.createCell(6).setCellValue("状态");
			}
			else {
				cell.setCellValue(startTime + " - " + endTime + "销售表");
				datas = mapper.getExportDatasBySale(startTime, endTime);
				rowSecond.createCell(0).setCellValue("销售单号");
				rowSecond.createCell(1).setCellValue("销售时间");
				rowSecond.createCell(2).setCellValue("商家名称");
				rowSecond.createCell(3).setCellValue("商品名称");
				rowSecond.createCell(4).setCellValue("商品数量（件）");
				rowSecond.createCell(5).setCellValue("商品销售单价（￥）");
				rowSecond.createCell(6).setCellValue("商品销售总价（￥）");
				rowSecond.createCell(7).setCellValue("商品成本单价（￥）");
				rowSecond.createCell(8).setCellValue("商品成本总价（￥）");
				rowSecond.createCell(9).setCellValue("商品利润（￥）");
				rowSecond.createCell(10).setCellValue("状态");
				
			}
			sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));
			if(datas.size() == 0){
				result.put("message", "该时间段没有数据，导出失败");
				return result;
			}
			List<Field> fields = new ArrayList<>();
			Class clazz = datas.get(0).getClass();
			while(clazz != null){
				fields.addAll(Arrays.asList(clazz.getDeclaredFields()));
				clazz = clazz.getSuperclass();
			}
			clazz = datas.get(0).getClass();
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
			for(int i=0;i<datas.size();i++){
				HSSFRow row = sheet.createRow(i+2);
				if(type.equals("1")){
					row.createCell(0).setCellValue(String.valueOf((int)(new PropertyDescriptor(fields.get(4).getName(), clazz).getReadMethod().invoke(datas.get(i)))));
					row.createCell(1).setCellValue(sdf.format((Timestamp)new PropertyDescriptor(fields.get(5).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(2).setCellValue((String)new PropertyDescriptor(fields.get(0).getName(), clazz).getReadMethod().invoke(datas.get(i)));
					row.createCell(3).setCellValue(String.valueOf((int)new PropertyDescriptor(fields.get(1).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(4).setCellValue(String.valueOf((double)new PropertyDescriptor(fields.get(2).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(5).setCellValue(String.valueOf((double)new PropertyDescriptor(fields.get(3).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					int status = (int)new PropertyDescriptor(fields.get(9).getName(), clazz).getReadMethod().invoke(datas.get(i));
					if(status == 1)row.createCell(6).setCellValue("启用");
					else row.createCell(6).setCellValue("废弃");
				}
				else{
					row.createCell(0).setCellValue(String.valueOf((int)new PropertyDescriptor(fields.get(8).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(1).setCellValue(sdf.format((Timestamp)new PropertyDescriptor(fields.get(13).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(2).setCellValue((String)new PropertyDescriptor(fields.get(4).getName(), clazz).getReadMethod().invoke(datas.get(i)));
					row.createCell(3).setCellValue((String)new PropertyDescriptor(fields.get(0).getName(), clazz).getReadMethod().invoke(datas.get(i)));
					row.createCell(4).setCellValue(String.valueOf((int)new PropertyDescriptor(fields.get(1).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(5).setCellValue(String.valueOf((double)new PropertyDescriptor(fields.get(2).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(6).setCellValue(String.valueOf((double)new PropertyDescriptor(fields.get(3).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(7).setCellValue(String.valueOf((double)new PropertyDescriptor(fields.get(5).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(8).setCellValue(String.valueOf((double)new PropertyDescriptor(fields.get(6).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					row.createCell(9).setCellValue(String.valueOf((double)new PropertyDescriptor(fields.get(9).getName(), clazz).getReadMethod().invoke(datas.get(i))));
					int status = (int)new PropertyDescriptor(fields.get(17).getName(), clazz).getReadMethod().invoke(datas.get(i));
					if(status == 1) row.createCell(6).setCellValue("已支付");
					else if(status == 2) row.createCell(6).setCellValue("未支付");
					else row.createCell(6).setCellValue("废弃");
				}
			}
			File folder = new File("D:\\导出报表");
			if(!folder.exists() && !folder.isDirectory()){
				folder.mkdir();
			}
			FileOutputStream outputStream = new FileOutputStream(new File("D:\\导出报表\\"+System.currentTimeMillis()+".xls"));
			workbook.write(outputStream);
			workbook.close();
			outputStream.close();
			result.put("message", "导出成功");
			result.put("succ", true);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
	}

	@Override
	public Map<String, Object> getSaleToday() {
		Map<String, Object> result = new HashMap<>();
		result.put("succ", false);
		result.put("message", "系统繁忙，请稍后再试");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Timestamp now = DateTool.getNowTime();
		now.setHours(0);
		now.setMinutes(0);
		now.setSeconds(0);
		SaleTodayQuery data = mapper.getSaleToday(sdf.format(now));
		if(data == null){
			data = new SaleTodayQuery();
			data.setFirstGoodsName("");
			data.setSaleCount(0);
			data.setSaleQuantity(0);
			data.setSaleTotalPrice(0);
		}
		result.put("succ", true);
		result.put("message", "");
		result.put("saleCount", data.getSaleCount());
		result.put("saleQuantity", data.getSaleQuantity());
		result.put("saleTotalPrice", data.getSaleTotalPrice());
		result.put("firstGoodsName", data.getFirstGoodsName());
		return result;
	}
	
	
}
