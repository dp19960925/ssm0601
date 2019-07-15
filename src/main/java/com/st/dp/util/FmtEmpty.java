package com.st.dp.util;

import java.util.Collection;
import java.util.Map;

//判空工具类
//类中有五个重载方法 
// 1.字符串  2.Object对象   3.map集合   4.Connection集合  5.Object 数组  
public class FmtEmpty {
	
	//判断是否为空(null||length==0)
	public static boolean isEmpty(String str) {
		if(str==null||str.trim().isEmpty()) {
			return true;
		}
		return false;
	}
	
	public static boolean isEmpty(Object str) {
		if(str==null||isEmpty(str.toString())) {
			return true;
		}
		return false;
	}
	//判断是否为空（null||isEmpty）
	public static boolean isEmpty(Map<?,?> map) {
		if(map==null||map.isEmpty()) {
			return true;
		}
		return false;
	}
	//判断是否为空（null||isEmpty）
	public static boolean isEmpty(Collection<?> list) {
		if(list==null||list.isEmpty()) {
			return true;
		}
		return false;
	}
	//判断是否为空(null||length==0)
	public static boolean isEmpty(Object[] array) {
		if(array==null||array.length==0) {
			return true;
		}
		return false;
	}
}
