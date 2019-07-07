package com.myyl.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {


    private static final String YYYY_MM_DD_PATTERN = "yyyy-MM-dd";
    private static final String YYYY_MM_DD_HH_MM_SS_PATTERN = "yyyy-MM-dd hh:mm:ss";

    public static String getFormatDate(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(YYYY_MM_DD_PATTERN);
        return simpleDateFormat.format(date);
    }

    public static String getCurrentFormatDate() {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(YYYY_MM_DD_PATTERN);
        return simpleDateFormat.format(date);
    }

    public static String getFormatDateTime(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(YYYY_MM_DD_HH_MM_SS_PATTERN);
        return simpleDateFormat.format(date);
    }

    public static String getCurrentFormatDateTime() {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(YYYY_MM_DD_HH_MM_SS_PATTERN);
        return simpleDateFormat.format(date);
    }


    public static String getLongTimeString() {
        return "" + new Date().getTime();
    }

}
