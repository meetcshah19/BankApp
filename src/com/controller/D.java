package com.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class D {
public static void main(String[] args) {
	Date d=Calendar.getInstance().getTime();
	System.out.println(d);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd.hhmmss");
	String tp=sdf.format(d);
    System.out.println(tp);
    
    System.out.println(new Date());
}
}
