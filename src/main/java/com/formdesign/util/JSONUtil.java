package com.formdesign.util;

import java.util.HashMap;
import java.util.Map;

import com.github.gserv.serv.commons.util.JsonMapper;

public class JSONUtil {
	public static String toString(Object obj){
		return JsonMapper.toJsonString(obj);
	}
	
	@SuppressWarnings("unchecked")
	public static HashMap<String, Object>  toMap(String str){
		return (HashMap<String, Object>) JsonMapper.fromJsonString(str, Map.class);
	}
}
