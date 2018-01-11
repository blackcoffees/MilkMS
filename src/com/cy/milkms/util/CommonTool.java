package com.cy.milkms.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CommonTool {
	public static boolean isNumber(String str){
		if(str == null || str == "") return true;
		Pattern pattern = null;
		if(str.indexOf(".") > 1){
			pattern = Pattern.compile("^[1-9]*\\.[0-9]*|[0]\\.[0-9]*$");
	        Matcher isNum = pattern.matcher(str);
	        if(!isNum.matches()){
	            return false;
	        }
	        return true;
		}
		else{
			pattern = Pattern.compile("^[0-9]*$");
	        Matcher isNum = pattern.matcher(str);
	        if(!isNum.matches()){
	            return false;
	        }
	        return true;
		}
	}
}
