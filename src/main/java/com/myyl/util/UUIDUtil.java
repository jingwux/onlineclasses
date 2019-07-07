package com.myyl.util;

import java.util.UUID;

/**
 * 功能：产生一个唯一随机字符串
 * @author
 * @date
 */
public final class UUIDUtil {

	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
