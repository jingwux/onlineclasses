package com.myyl.util;

import java.util.Date;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public final class UtilTools {
	
	public static String createId(){
		Date date = new Date();
		return "U"+date.getTime()+"";
	}

}
