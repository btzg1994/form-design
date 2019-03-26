package com.form.www.web.control;


import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.form.www.entity.AccessDetail;
import com.form.www.entity.Activity;
import com.form.www.entity.Form;
import com.form.www.service.AccessDetailService;
import com.form.www.service.ActivityService;
import com.form.www.service.FormService;
import com.form.www.service.PublicService;
import com.formdesign.util.CurrentUserUtil;
import com.github.gserv.serv.commons.util.IpUtil;




@Controller
public class GlobalController {
	
	@Resource
	private ActivityService activityService;
	
	@Resource
	private FormService formService;
	
	@Resource
	private AccessDetailService  accessDetailService;
	/**
	 * 后台登出
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "back/login";
	}
	
	
	/**
	 * 活动主页
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("index/{id}")
	public String index(@PathVariable("id") String id,HttpServletRequest request){
		try {
			if(!StringUtils.isNumeric(id)){
				throw new Exception("活动id为空！");
			}	
			int id_ = Integer.parseInt(id);
			
			Activity activity = activityService.findById(id_);
			if(activity ==null){
				throw new Exception("活动不存在");
			}
			AccessDetail ad = new AccessDetail();
			ad.setActivityId(Integer.parseInt(id));
			ad.setCreateTime(new Date());
			
			String ip = IpUtil.getRemoteIp(request);
			ad.setIp(ip);
			String name = activity.getName();
			ad.setRemark(name);
			
			ad.setAdminId(CurrentUserUtil.getCurrUserId(request));
			
			String type=PublicService.JudgeIsMoblie(request)? "移动端" : "pc端";
			ad.setType(type);
			accessDetailService.addOne(ad);
			
			
			Date startTime = activity.getStartTime();
			boolean isStarted = PublicService.activityIsStarted(startTime);
			Integer status = activity.getStatus();
			if(!isStarted || status == 0){//活动未开启
				return "not_start";
			}
			
			
			
			Integer pv = activity.getPageViewCount() + 1;
			Activity activity2 = new Activity();
			activity2.setId(activity.getId());
			activity2.setPageViewCount(pv);
			activityService.updateOne(activity2);
			
			long endTime = activity.getEndTime().getTime();
			request.setAttribute("activity", activity);//活动对象
			request.setAttribute("endTime", endTime);//活动结束时间
			Integer formId = activity.getFormId();
			Form form = formService.selectForm(formId);
			request.setAttribute("form", form);//表单
			
			
		} catch (Exception e) {
			return "404";
		}
		
		return "front/index";
	}
}
