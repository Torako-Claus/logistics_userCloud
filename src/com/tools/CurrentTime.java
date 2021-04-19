package com.tools;

import java.text.DateFormat;
import java.util.Date;

public class CurrentTime {
	//获取系统时间的方法，在页面中显示的格式为：年-月-日 星期几
	public String currentlyTime() {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL);
		return dateFormat.format(date);
	}
	//获取系统时间，返回值为自1970年1月1日 00:00:00 GMT 以来此Date对象表示的毫秒数
	public long autoNumber() {
		Date date = new Date();
		long autoNumber = date.getTime();
		return autoNumber;
	}
}
