package com.form.www.web.control;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.form.www.entity.Activity;
import com.form.www.entity.FormRecord;
import com.form.www.entity.Result;
import com.form.www.service.ActivityService;
import com.form.www.service.FormRecordService;
import com.form.www.service.PublicService;
import com.formdesign.util.JSONUtil;

@Controller
@RequestMapping("formRecord")
public class FromRecordController {

	@Autowired
	private ActivityService activityService;

	@Autowired
	private FormRecordService formRecordService;

	@RequestMapping("test")
	public String test(HttpServletRequest request) {
		return "test";
	}

	/**
	 * 用户提交form表单
	 * @param request
	 * @param files
	 * @return
	 */
	@RequestMapping("addFormRecord")
	@ResponseBody
	public String addFormRecord(HttpServletRequest request, @RequestParam(required = false)MultipartFile[] files) {
		Result result = new Result(-1, "信息提交失败,请稍后尝试!");
		Map<String, String[]> paramMap = request.getParameterMap();
		// 活动id
		System.err.println(JSONUtil.toString(paramMap));
		String activityId = paramMap.get("activityId")[0];
		if (StringUtils.isBlank(activityId)) {
			result.setInfo("活动id不能为空");
			return JSONUtil.toString(result);
		}
		Activity activity = activityService.findById(Integer.parseInt(activityId));
		
		Date startTime = activity.getStartTime();
		Date endTime = activity.getEndTime();
		/*检测当前活动时间是否合法*/
		boolean isStarted = PublicService.activityIsStarted(startTime);
		boolean isEnded = PublicService.activityIsEnded(endTime);
		if(!isStarted || isEnded){
			//活动未开始或者已经结束
			result.setInfo("活动未开始或已结束!");
			return JSONUtil.toString(result);
		}
		
		
		
		HashMap<String, String[]> recordMap = new HashMap<String, String[]>();
		
		for (Entry<String, String[]> eMap : paramMap.entrySet()) {
			String key = eMap.getKey();
			String[] value = eMap.getValue();
			// 将用户提交的表单数据放入Map中
			if (key.equals("form_name") || key.equals("activityId")) {
				continue;
			} else {
				recordMap.put(key, value);
			}
		}
		
		// 如果用户提交的信息中包含文件,将文件进行保存
		if (files != null && files.length > 0) {
			MultipartFile file = files[0];
			String filename = file.getOriginalFilename();
			String fold = "D:/file/" + UUID.randomUUID().toString() + "/";
			File folder = new File(fold);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			File localFile = new File(folder, filename);
			try {
				file.transferTo(localFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			recordMap.put("files", new String[] { fold + filename });

		}
		// 封装活动表单填写记录
		FormRecord formRecord = new FormRecord();
		formRecord.setActivityId(Long.parseLong(activityId));
		formRecord.setType("1");
		formRecord.setVal(JSONUtil.toString(recordMap));
		// 插入数据
		Integer insertStatus = formRecordService.insert(formRecord);
		if (insertStatus > 0) {
			result.setCode(0);
			result.setInfo("信息提交成功!");
		}
		return JSONUtil.toString(result);
	}
	
	
	/**
	 * 根据id删除表单
	 * 
	 * @param Form
	 * @return
	 */
	@RequestMapping("deleteFormRecord")
	@ResponseBody
	public String deleteFormRecord(FormRecord formRecord) {
		Result result = new Result(-1, "删除表单记录失败!");
		Long id = formRecord.getId();
		// 删除的id不能为空
		if (id == null) {
			result.setInfo("表单记录id不能为空!");
			return JSONUtil.toString(result);
		}
		//TODO 删除表单配置
		int deleteStatus = formRecordService.deleteFormRecord(id);
		if (deleteStatus > 0) {
			result.setCode(0);
			result.setInfo("删除表单记录成功");
		}
		return JSONUtil.toString(result);
	}

	

	/**
	 * 查找当前表单 list为空也算成功
	 * 
	 * @return
	 */
	@RequestMapping("findAllFormRecord")
	@ResponseBody
	public String findAllFormRecord(HttpServletRequest request,String activityId) {
		Result result = new Result(-1, "查找所有表单失败!");
		List<FormRecord> list = formRecordService.findAllFormRecord(activityId);
		if (list != null) {
			result.setCode(0);
			result.setInfo("查找所有表单成功");
		}
		return JSONUtil.toString(result.setData(list));
	}


}
