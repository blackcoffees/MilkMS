package com.cy.milkms.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTool {
	public static Timestamp getNowTime(){
		Date date = new Date();
		return new Timestamp(date.getTime());
	}
	
	public static String getNowMonthFirst(){
		/*获得当前月的第一天*/
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DAY_OF_MONTH, 1);   
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(calendar.getTime());
	}
	
	public static String getNowMonthLast(){
		/*获得当前月的最后一天*/
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DATE, 1);
		calendar.roll(Calendar.DATE, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(calendar.getTime());
	}
	
	public static boolean isExceedOneYear(String startTime, String endTime){
		/*开始时间和结束时间之间的差是否大于1年, 是的话返回true, 否则返回false*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date start = sdf.parse(startTime);
			Date end = sdf.parse(endTime);
			Calendar startDay = Calendar.getInstance();
			Calendar endDay = Calendar.getInstance();
			startDay.setTime(start);
			endDay.setTime(end);
			long sl = startDay.getTimeInMillis();
			long el = endDay.getTimeInMillis();
			long days = (el - sl) / (1000 * 60 * 60 *24);
			if(days >= 365){
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("deprecation")
	public static boolean compareToDate(String startTime, String endTime){
		/*比价开始时间和结束时间，开始时间在结束时间后面返回false, 否则返回true*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date start = sdf.parse(startTime);
			Date end = sdf.parse(endTime);
			if(start.after(end)){
				return false;
			}
			return true;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
