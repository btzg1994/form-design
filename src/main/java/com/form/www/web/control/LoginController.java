package com.form.www.web.control;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.form.www.entity.Admin;
import com.form.www.service.AdminService;
import com.form.www.service.PublicService;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("home")
	public String index(){
		return "back/login";
	}
	
	@RequestMapping("doLogin")
	public String doLogin( String username, String password,Model model,HttpServletRequest request){
		
		Admin ad = new Admin();
		ad.setAdminName(username);
		ad.setPwd(password);;
		HttpSession session = request.getSession();
		session.removeAttribute(PublicService.SUPER_ADMIN_NAME_SESSION);
		session.removeAttribute(PublicService.ADMIN_ID);
		if(PublicService.SUPER_ADMIN_NAME.equals(username) && PublicService.SUPER_ADMIN_PWD.equals(password))
		{
			session.setAttribute(PublicService.SUPER_ADMIN_NAME_SESSION, "true");
			return "back/admin_add";
		}
		Admin admin = adminService.selectAdmin(ad);
		if (admin != null) {
			session.setAttribute(PublicService.ADMIN_ID, "true");
			return "back/activity_add";
		}
		return "redirect:/login/home";
	}
}
