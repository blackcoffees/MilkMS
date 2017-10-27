package com.cy.milkms.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTool {
	public static Timestamp getNowTime(){
		Date date = new Date();
		return new Timestamp(date.getTime());
	}
}
