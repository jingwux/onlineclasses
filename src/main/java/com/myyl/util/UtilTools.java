package com.myyl.util;

import java.util.Date;

public final class UtilTools {
	
	public static String createId(){
		Date date = new Date();
		return "U"+date.getTime()+"";
	}

}
