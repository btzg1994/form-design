package com.form.www.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class PublicService {
	
	public static final String ADMIN_ID = "ADMIN_ID";
	
	public static final String SUPER_ADMIN_NAME_SESSION = "SUPER_ADMIN_NAME_SESSION";
	
	/**
	 * 时间格式
	 */
	public static final String DATETIME_PATTERN = "yyyy-MM-dd HH:mm:ss"; 
	/**
	 * 本地资源路径
	 */
	public static String basePath;
	
	
	/**
	 * 管理员账号
	 */
	public static final String SUPER_ADMIN_NAME = "super_root";
	
	/**
	 * 管理员密码
	 */
	public static final String SUPER_ADMIN_PWD="algdgdyms";
	

	@Value("${local_basepath}")
	public void setBasePath(String basePath) {
		PublicService.basePath = basePath;
	}

	
	/**
	 * 检查活动是否开启
	 * @param startTime
	 * @return
	 */
	public static boolean activityIsStarted(Date startTime){
		Date now = new Date();
		if(startTime.before(now)){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 检查活动是否结束
	 * @param startTime
	 * @return
	 */
	public static boolean activityIsEnded(Date endTime){
		Date now = new Date();
		if(endTime.before(now)){
			return true;
		}else{
			return false;
		}
	}
	
	 public static boolean JudgeIsMoblie(HttpServletRequest request) {
	        boolean isMoblie = false;
	        String[] mobileAgents = { "iphone", "android", "phone", "mobile",
	                "wap", "netfront", "java", "opera mobi", "opera mini", "ucweb",
	                "windows ce", "symbian", "series", "webos", "sony",
	                "blackberry", "dopod", "nokia", "samsung", "palmsource", "xda",
	                "pieplus", "meizu", "midp", "cldc", "motorola", "foma",
	                "docomo", "up.browser", "up.link", "blazer", "helio", "hosin",
	                "huawei", "novarra", "coolpad", "webos", "techfaith",
	                "palmsource", "alcatel", "amoi", "ktouch", "nexian",
	                "ericsson", "philips", "sagem", "wellcom", "bunjalloo", "maui",
	                "smartphone", "iemobile", "spice", "bird", "zte-", "longcos",
	                "pantech", "gionee", "portalmmm", "jig browser", "hiptop",
	                "benq", "haier", "^lct", "320x320", "240x320", "176x220",
	                "w3c ", "acs-", "alav", "alca", "amoi", "audi", "avan", "benq",
	                "bird", "blac", "blaz", "brew", "cell", "cldc", "cmd-", "dang",
	                "doco", "eric", "hipt", "inno", "ipaq", "java", "jigs", "kddi",
	                "keji", "leno", "lg-c", "lg-d", "lg-g", "lge-", "maui", "maxo",
	                "midp", "mits", "mmef", "mobi", "mot-", "moto", "mwbp", "nec-",
	                "newt", "noki", "oper", "palm", "pana", "pant", "phil", "play",
	                "port", "prox", "qwap", "sage", "sams", "sany", "sch-", "sec-",
	                "send", "seri", "sgh-", "shar", "sie-", "siem", "smal", "smar",
	                "sony", "sph-", "symb", "t-mo", "teli", "tim-", /*"tosh",*/ "tsm-",
	                "upg1", "upsi", "vk-v", "voda", "wap-", "wapa", "wapi", "wapp",
	                "wapr", "webc", "winw", "winw", "xda", "xda-",
	                "Googlebot-Mobile" };
	        String agent = request.getHeader("User-Agent");
	        if (agent != null) {
	            for (String mobileAgent : mobileAgents) {
	                if (agent.toLowerCase().indexOf(mobileAgent) >= 0) {
	                    isMoblie = true;
	                    break;
	                }
	            }
	        }
	        return isMoblie;
	    }
	
}
