package com.form.www.web.control;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.form.www.entity.SendDetail;
import com.form.www.entity.TargetUser;
import com.form.www.entity.Activity;
import com.form.www.entity.FormConf;
import com.form.www.entity.FormRecord;
import com.form.www.entity.Result;
import com.form.www.service.ActivityService;
import com.form.www.service.FormConfService;
import com.form.www.service.FormRecordService;
import com.form.www.service.SendDetailService;
import com.form.www.service.TargetUserService;
import com.formdesign.util.CurrentUserUtil;
import com.formdesign.util.JSONUtil;
import com.formdesign.util.JavaMailUtils;
import com.github.pagehelper.PageInfo;

@RequestMapping("sendDetail")
@Controller
public class SendDetailController {

	/**
	 * 推送记录服务service
	 */
	@Autowired
	private SendDetailService sendDetailService;

	@Autowired
	private FormConfService formConfService;

	@Autowired
	private TargetUserService targetUserService;

	@Autowired
	private ActivityService activityService;

	@Autowired
	private FormRecordService formRecordService;

	@SuppressWarnings("unchecked")
	@RequestMapping("getFormSendDetail")
	@ResponseBody
	public void getFormSendDetail(String activityId, HttpServletRequest request, HttpServletResponse response) {
		try {
			Activity ac = activityService.findById(Integer.parseInt(activityId));
			Integer formId = ac.getFormId();
			StringBuilder sb = new StringBuilder();
			if (formId != null) {
				List<FormConf> formConfs = formConfService.getFormConfByFormId(formId);
				for (int i = 0; i < formConfs.size(); i++) {
					String fieldName = formConfs.get(i).getFormFieldName();
					sb.append(fieldName.equals("files") ?"文件路径" :fieldName.substring(0, fieldName.indexOf("_"))).append(",");
				}
				sb.append("\r");
				List<FormRecord> frs = formRecordService.findAllFormRecord(activityId);
				for (FormRecord fr : frs) {
					String val = fr.getVal();
					HashMap<String, Object> map = JSONUtil.toMap(val);
					for (int i = 0; i < formConfs.size(); i++) {
						List<Object> fieldValue = (List<Object>) map.get(formConfs.get(i).getFormFieldName());
						String f = "";
						for (int j = 0; j < fieldValue.size(); j++) {
							f += fieldValue.get(j);
							if(fieldValue.size() == 1){
								f += ",";
							} else {
								f +=  "、";
							}
						}
						if(fieldValue.size() > 1){
							f += ",";
						}
						sb.append(f);
					}
					sb.append("\r");
				}
			}

			OutputStream os = response.getOutputStream();

			String filename = ac.getName() + "_表单填写数据.csv";
			filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("content-disposition", "attachment;filename=" + filename);

			os.write(sb.toString().getBytes("gbk"));
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 添加管理用户
	 * 
	 * @param SendDetail
	 * @return
	 */
	@RequestMapping("addSendDetail")
	@ResponseBody
	public String addSendDetail(SendDetail sendDetail, HttpServletRequest request) {
		Result result = new Result(-1, "失败!");
		sendDetail.setCreateTime(new Date());
		sendDetail.setAdminId(CurrentUserUtil.getCurrUserId(request));
		sendDetail.setStatus("0"); // 0初始化 1正在发送 2推送完成
		int saveStatus = sendDetailService.saveSendDetail(sendDetail);
		if (saveStatus > 0) {
			result.setCode(0);
			result.setInfo("推送记录添加成功");
		}
		// 将结果转为字符串返回
		String res = JSONUtil.toString(result);
		return res;

	}

	@RequestMapping("beginSendDetail")
	@ResponseBody
	public String beginSendDetail(SendDetail sendDetail, HttpServletRequest request) {
		Result result = new Result(-1, "失败!");

		sendDetail.setStatus("1"); // 0初始化 1正在发送 2推送完成
		int saveStatus = sendDetailService.updateSendDetail(sendDetail);
		String listStr = sendDetail.getUserListStr();
		String[] split = listStr.split(",");
		List<Long> list = new ArrayList<Long>();
		for (int i = 0; i < split.length; i++) {
			list.add(Long.parseLong(split[i]));
		}
		List<TargetUser> users = targetUserService.findTargetUsers(list);
		targetUserService.sendEmail(sendDetail, users);
		if (saveStatus > 0) {
			result.setCode(0);
			result.setInfo("推送记录添加成功");
		}
		// 将结果转为字符串返回
		String res = JSONUtil.toString(result);
		return res;

	}

	// /**
	// * 根据id删除管理用户
	// *
	// * @param SendDetail
	// * @return
	// */
	@RequestMapping("deleteSendDetail")
	@ResponseBody
	public String deleteSendDetail(SendDetail SendDetail) {
		Result result = new Result(-1, "删除推送记录失败!");
		Integer id = SendDetail.getId();
		// 删除的id不能为空
		if (id == null) {
			result.setInfo("推送记录id不能为空!");
			return JSONUtil.toString(result);
		}

		int deleteStatus = sendDetailService.deleteSendDetail(SendDetail.getId());
		if (deleteStatus > 0) {
			result.setCode(0);
			result.setInfo("删除推送记录成功");
		}
		return JSONUtil.toString(result);
	}

	//
	// /**
	// * 根据id更新SendDetail
	// *
	// * @param SendDetail
	// * @return
	// */
	// @RequestMapping("updateSendDetail")
	// @ResponseBody
	// public String updateSendDetail(SendDetail SendDetail) {
	// Result result = new Result(-1, "推送记录更新失败!");
	// if (SendDetail.getId() == null) {
	// result.setInfo("推送记录id不能为空");
	// return JSONUtil.toString(result);
	// }
	// // 判断传入的数据是否都为空
	// if (StringUtils.isBlank(SendDetail.getSendDetailName()) &&
	// StringUtils.isBlank(SendDetail.getName())
	// && StringUtils.isBlank(SendDetail.getPwd()) && null ==
	// SendDetail.getGender()
	// && StringUtils.isBlank(SendDetail.getRemark())) {
	// result.setInfo("更新字段不能全部为空,更新失败");
	// return JSONUtil.toString(result);
	// }
	// // 更新状态大于0表示成功
	// int updateStatus = SendDetailService.updateSendDetail(SendDetail);
	// if (updateStatus > 0) {
	// result.setCode(0);
	// result.setInfo("更新推送记录信息成功");
	// }
	// return JSONUtil.toString(result);
	// }
	//
	// /**
	// * 查找所有管理用户 list为空也算成功
	// *
	// * @return
	// */
	@RequestMapping("findAllSendDetail")
	@ResponseBody
	public String findAllSendDetail(HttpServletRequest request) {
		Result result = new Result(-1, "查找所有推送记录失败!");

		List<SendDetail> list = sendDetailService.findAllSendDetail(CurrentUserUtil.getCurrUserId(request));
		if (list != null) {
			result.setCode(0);
			result.setInfo("查找所有推送记录成功");
		}
		return JSONUtil.toString(result.setData(list));
	}
	//
	// /**
	// * 根据id查找用户
	// *
	// * @param SendDetail
	// * @return
	// */
	// @RequestMapping("findSendDetail")
	// @ResponseBody
	// public String selectSendDetail(SendDetail SendDetail) {
	// Result result = new Result(-1, "查找推送记录失败!");
	// Integer id = SendDetail.getId();
	// if (id == null) {
	// result.setInfo("传入id不能为空");
	// }
	// SendDetail ad = sendDetailService.selectSendDetail(id);
	// result.setCode(0);
	// result.setInfo("查找推送记录成功");
	// return JSONUtil.toString(result.setData(ad));
	// }

}
