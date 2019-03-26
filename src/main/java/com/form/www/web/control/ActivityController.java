package com.form.www.web.control;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.form.www.entity.Activity;
import com.form.www.entity.Form;
import com.form.www.entity.Result;
import com.form.www.service.ActivityService;
import com.form.www.service.FormService;
import com.form.www.service.PublicService;
import com.formdesign.util.CurrentUserUtil;
import com.formdesign.util.JSONUtil;
import com.github.gserv.serv.commons.util.DateUtils;
import com.github.pagehelper.PageInfo;

import util.FileUtil;

@RequestMapping("sign/activity")
@Controller
public class ActivityController {
	
	@Resource
	private ActivityService activityService;
	
	@Resource
	private FormService formService;

	/**
	 * 添加活动
	 * 
	 * @param request
	 * @param banner
	 * @return
	 */
	@RequestMapping("addActivity")
	@ResponseBody
	public Map<String, Object> addActivity(HttpServletRequest request, @RequestParam("banner") MultipartFile banner,
			@RequestParam("music") MultipartFile music) {
		HashMap<String, Object> rspMap = new HashMap<String, Object>();
		try {
			String name = request.getParameter("name") != null ? request.getParameter("name") : "";
			String startTime = request.getParameter("startTime") != null ? request.getParameter("startTime") : "";
			String endTime = request.getParameter("endTime") != null ? request.getParameter("endTime") : "";
			String remark = request.getParameter("remark") != null ? request.getParameter("remark") : "";

			String bgColor = request.getParameter("bgColor") != null ? request.getParameter("bgColor") : "";

			// 校验参数
			if (StringUtils.isBlank(name) || StringUtils.isBlank(startTime) || StringUtils.isBlank(endTime)) {
				rspMap.put("rspCode", "0");
				rspMap.put("rspMsg", "提交的参数有误！");
				return rspMap;
			}
			if (banner.isEmpty() || !FileUtil.isImage(banner)) {
				rspMap.put("rspCode", "0");
				rspMap.put("rspMsg", "上传的图片格式错误！");
				return rspMap;
			}

			if (music.isEmpty() || !FileUtil.isAudio(music)) {
				rspMap.put("rspCode", "0");
				rspMap.put("rspMsg", "上传的音乐格式错误！");
				return rspMap;
			}


			String regex = "[0-9a-f]{6}";
			Pattern colorPattern = Pattern.compile(regex);
			if (!colorPattern.matcher(bgColor).matches()) {
				rspMap.put("rspCode", "0");
				rspMap.put("rspMsg", "背景色值格式有误！");
				return rspMap;
			}



			String pattern = PublicService.DATETIME_PATTERN;

			Date startDate = DateUtils.parseDate(startTime, pattern);
			Date endDate = DateUtils.parseDate(endTime, pattern);

			if ((startDate.getTime() - endDate.getTime()) > 0) {
				// 开始时间大于了结束时间
				rspMap.put("rspCode", "0");
				rspMap.put("rspMsg", "活动开始时间不能大于活动结束时间！");
				return rspMap;
			}

			// 添加活动
			Activity activity = new Activity();
			activity.setName(name);
			activity.setStartTime(startDate);
			activity.setEndTime(endDate);
			activity.setCreateTime(new Date());
			activity.setRemark(remark);
			activity.setBgColor(bgColor);
			activity.setPageViewCount(1);
			activity.setStatus(1);
			activity.setAdminId(CurrentUserUtil.getCurrUserId(request));
			Integer res = activityService.addOne(activity);

			if (res != 1) {
				throw new Exception();
			}
			Integer id = activity.getId();

			String basePath = PublicService.basePath;
			// 存储banner图片
			String path_banner = "images/" + id;
			String dirPath = basePath + path_banner;
			String bannerFileName = FileUtil.storeFile(basePath, dirPath, banner, id);

			// 存储音乐
			String path_music = "audio/" + id;
			String audioDirPath = basePath + path_music;
			String musicFileName = FileUtil.storeFile(basePath, audioDirPath, music, id);

			
			// 图片和音乐上传成功后，存储路径到数据库
			Activity activity2 = new Activity();
			activity2.setId(id);
			activity2.setImgUrl(path_banner + "/" + bannerFileName);
			activity2.setMusicUrl(path_music + "/" + musicFileName);

			
			Integer res2 = activityService.updateOne(activity2);
			if (res2 != 1) {
				throw new Exception();
			}

			rspMap.put("rspCode", "1");
			rspMap.put("rspMsg", "添加成功！");
			return rspMap;
		} catch (Exception e) {
			rspMap.put("rspCode", "-1");
			rspMap.put("rspMsg", "系统繁忙！");
			return rspMap;
		}
	}
	
	/**
	 * 分页查询活动
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("findActivities/{pageNum}/{pageSize}")
	public String findActivities(@PathVariable(value = "pageNum", required = false) Integer pageNum,
			@PathVariable(value = "pageSize", required = false) Integer pageSize, HttpServletRequest request) {
		try {
			if (pageNum == null || pageNum < 1) {
				pageNum = 1;
			}
			if (pageSize == null || pageSize < 1) {
				pageSize = 10;
			}
			PageInfo<Activity> info = activityService.getActivityByPage(pageNum, pageSize,request);
			request.setAttribute("pageInfo", info);
		} catch (Exception e) {
		}
		return "back/activity_list";
	}
	
	@RequestMapping("findAll")
	@ResponseBody
	public String findAll(HttpServletRequest request){
		Result result = new Result(-1, "");
			Integer adminId = CurrentUserUtil.getCurrUserId(request);
			List<Activity> list = activityService.findAll(adminId);
			result.setCode(0);
			result.setInfo("成功");
			result.setData(list);
			return JSONUtil.toString(result);
	}
	
	@RequestMapping("frozen")
	@ResponseBody
	public String frozen(Integer id){
		
		try {
			Activity activity = new Activity();
			activity.setId(id);
			activity.setStatus(0);
			Integer i = activityService.updateOne(activity);
			if(i == 1){
				return "1";
			}else{
				return "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	@RequestMapping("active")
	@ResponseBody
	public String active(Integer id){
		
		try {
			Activity activity = new Activity();
			activity.setId(id);
			activity.setStatus(1);
			Integer i = activityService.updateOne(activity);
			if(i == 1){
				return "1";
			}else{
				return "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	
	/**
	 * 根据id查活动
	 * 
	 * @param request
	 */
	@RequestMapping("findActivityById")
	public String findActivityById(HttpServletRequest request, @RequestParam("id") String id) {
		try {
			if (id == null) {
				return "404";
			}
			int id_ = Integer.parseInt(id);
			Activity activity = activityService.findById(id_);
			
			List<Form> forms = formService.findAllForm(CurrentUserUtil.getCurrUserId(request));
			request.setAttribute("activity", activity);
			request.setAttribute("forms", forms);
			return "back/activity_edit";
		} catch (Exception e) {
			return "404";
		}
	}
	
	
	/**
	 * 编辑活动
	 * 
	 * @return
	 */
	@RequestMapping("editActivity")
	@ResponseBody
	public Map<String, Object> editActivity(HttpServletRequest request, @RequestParam("banner") MultipartFile banner,
			@RequestParam("music") MultipartFile music) {
		HashMap<String, Object> rspMap = new HashMap<String, Object>();
		try {
			String id_ = request.getParameter("id") != null ? request.getParameter("id") : "";
			String name = request.getParameter("name") != null ? request.getParameter("name") : "";
			String startTime = request.getParameter("startTime") != null ? request.getParameter("startTime") : "";
			String endTime = request.getParameter("endTime") != null ? request.getParameter("endTime") : "";
			String remark = request.getParameter("remark") != null ? request.getParameter("remark") : "";
			String formId = request.getParameter("formId") != null ? request.getParameter("formId") : "";

			String bgColor = request.getParameter("bgColor") != null ? request.getParameter("bgColor") : "";

			// 校验参数
			if (StringUtils.isBlank(name) || StringUtils.isBlank(startTime) || StringUtils.isBlank(endTime)
					|| StringUtils.isBlank(id_)) {
				rspMap.put("rspCode", "0");
				rspMap.put("rspMsg", "提交的参数有误！");
				return rspMap;
			}
			String pattern = PublicService.DATETIME_PATTERN;

			Date startDate = DateUtils.parseDate(startTime, pattern);
			Date endDate = DateUtils.parseDate(endTime, pattern);

			if ((startDate.getTime() - endDate.getTime()) > 0) {
				// 开始时间大于了结束时间
				rspMap.put("rspCode", "0");
				rspMap.put("rspMsg", "活动开始时间不能大于活动结束时间！");
				return rspMap;
			}

			String regex = "[0-9a-f]{6}";
			Pattern colorPattern = Pattern.compile(regex);
			if (!colorPattern.matcher(bgColor).matches()) {
				rspMap.put("rspCode", "0");
				rspMap.put("rspMsg", "背景色值格式有误！");
				return rspMap;
			}

			Integer id = Integer.parseInt(id_);
			Activity activity = new Activity();
			activity.setId(id);
			activity.setName(name);
			activity.setStartTime(startDate);
			activity.setEndTime(endDate);
			activity.setRemark(remark);
			activity.setBgColor(bgColor);
			if(StringUtils.isNotBlank(formId) && StringUtils.isNumeric(formId)){
				activity.setFormId(Integer.parseInt(formId));
			}
			String basePath = PublicService.basePath;
			if (!banner.isEmpty()) {// 文件不为空
				if (!FileUtil.isImage(banner)) {// 文件类型错误
					rspMap.put("rspCode", "0");
					rspMap.put("rspMsg", "上传的活动图片格式错误！");
					return rspMap;
				}
				// 存储banner图片

				String path_banner = "images/" + id;
				String dirPath = basePath + path_banner;

				String bannerFileName = FileUtil.storeFile(basePath, dirPath, banner, id);

				activity.setImgUrl((path_banner + "/" + bannerFileName));
			}

			if (!music.isEmpty()) {// 文件不为空
				if (!FileUtil.isAudio(music)) {// 文件类型错误
					rspMap.put("rspCode", "0");
					rspMap.put("rspMsg", "上传的音乐格式错误！");
					return rspMap;
				}
				// 存储音乐
				String path_music = "audio/" + id;
				String audioDirPath = basePath + path_music;
				String musicFileName = FileUtil.storeFile(basePath, audioDirPath, music, id);
				activity.setMusicUrl(path_music + "/" + musicFileName);
			}

			// 修改数据库
			Integer res2 = activityService.updateOne(activity);
			if (res2 != 1) {
				throw new Exception();
			}

			rspMap.put("rspCode", "1");
			rspMap.put("rspMsg", "编辑成功！");
			return rspMap;
		} catch (Exception e) {
			rspMap.put("rspCode", "-1");
			rspMap.put("rspMsg", "系统繁忙！");
			e.printStackTrace();
			return rspMap;
		}
	}
	
	/**
	 * 分页查询活动
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("formdata/{pageNum}/{pageSize}")
	public String formdata(@PathVariable(value = "pageNum", required = false) Integer pageNum,
			@PathVariable(value = "pageSize", required = false) Integer pageSize, HttpServletRequest request) {
		try {
			if (pageNum == null || pageNum < 1) {
				pageNum = 1;
			}
			if (pageSize == null || pageSize < 1) {
				pageSize = 10;
			}
			PageInfo<Activity> info = activityService.getActivityByPage(pageNum, pageSize,request);
			request.setAttribute("pageInfo", info);
		} catch (Exception e) {
		}
		return "form/form_data";
	}

	
	

}
