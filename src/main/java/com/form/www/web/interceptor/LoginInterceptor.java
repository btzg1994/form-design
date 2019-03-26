package com.form.www.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import com.form.www.service.PublicService;
import com.github.gserv.serv.commons.util.IpUtil;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String remoteIp = IpUtil.getRemoteIp(request);
		Object object = request.getSession().getAttribute(PublicService.ADMIN_ID);
		Object object2 = request.getSession().getAttribute(PublicService.SUPER_ADMIN_NAME_SESSION);
		if(object == null && object2 == null){
			response.sendRedirect(request.getContextPath() + "/view/login" );
			return false;
		}
		return true;
	}

}
