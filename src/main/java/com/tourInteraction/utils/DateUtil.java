package com.tourInteraction.utils;

import com.tourInteraction.config.GlobalConstantKey;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {
    public static Date dateAddOrSub(Date date,int changeValue,String changeType){
        Calendar calendar   =   new GregorianCalendar();
        calendar.setTime(date);
        if (changeType.equals(GlobalConstantKey.CHANGE_YEAR))
            calendar.add(calendar.YEAR, changeValue);//把日期往后增加changeValue年.整数往后推,负数往前移动
        if (changeType.equals(GlobalConstantKey.CHANGE_MONTH))
            calendar.add(calendar.DAY_OF_MONTH, changeValue);//把日期往后增加changeValue月.整数往后推,负数往前移动
        if (changeType.equals(GlobalConstantKey.CHANGE_DAY))
            calendar.add(calendar.DATE,changeValue);//把日期往后增加changeValue天.整数往后推,负数往前移动
//        calendar.add(calendar.WEEK_OF_MONTH, changeValue);//把日期往后增加changeValue月.整数往后推,负数往前移动

        date=calendar.getTime();   //这个时间就是日期往后推一天的结果
//        System.out.println(date.toString());
        return date;
    }
}
