package com.cy.milkms.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CommonTool {
	public static boolean isNumber(String str){
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if( !isNum.matches() ){
            return false;
        }
        return true;
	}
}
