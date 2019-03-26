package com.form.www.web.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("view")
public class ViewController {
	
	@RequestMapping("login")
	public String index(){
		return "back/login";
	}
	
	@RequestMapping("admin_add")
	public String adminAdd(){
		return "back/admin_add";
	}
	
	@RequestMapping("admin_list")
	public String adminList(){
		return "back/admin_list";
	}
	
	
	@RequestMapping("addForm")
	public String addForm(){
		return "form/form_add";
	}
	
	@RequestMapping("formList")
	public String formList(){
		return "form/form_list";
	}
	
	@RequestMapping("target_user_add")
	public String targetUserAdd(){
		return "back/target_user_add";
	}
	
	@RequestMapping("target_user_list")
	public String targetUserList(){
		return "back/target_user_list";
	}
	
	@RequestMapping("activity_add")
	public String activityAdd(){
		return "back/activity_add";
	}

	@RequestMapping("activity_list")
	public String activityList(){
		return "back/activity_list";
	}
	
	@RequestMapping("activity_edit")
	public String activityEdit(){
		return "back/activity_edit";
	}
	
	@RequestMapping("sendRecord")
	public String sendRecord(){
		return "send/send_record";
	}
	
	@RequestMapping("addSend")
	public String addSend(){
		return "send/add_send";
	}
	
	@RequestMapping("target_user_upload")
	public String targetUserUpload(){
		return "back/target_user_upload";
	}
	
	@RequestMapping("access_detail_list")
	public String accessDetailList(){
		return "back/access_detail_list";
	}
	
	@RequestMapping("formData")
	public String formData(){
		return "form/form_data";
	}
}
