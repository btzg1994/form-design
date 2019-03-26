package com.form.www.web.control;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.form.www.entity.AccessDetail;
import com.form.www.entity.Admin;
import com.form.www.entity.Result;
import com.form.www.entity.TargetUser;
import com.form.www.service.AccessDetailService;
import com.form.www.service.TargetUserService;
import com.formdesign.util.CurrentUserUtil;
import com.formdesign.util.JSONUtil;
import com.formdesign.util.POIUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("accessDetail")
public class AccessDetailController {

	@Resource
	private AccessDetailService  accessDetailService;
	
	@RequestMapping("findAccessDetailByPage/{pageNum}/{pageSize}")
	@ResponseBody
	public String findTargetUserByPage(@PathVariable(value = "pageNum", required = false) Integer pageNum,
			@PathVariable(value = "pageSize", required = false) Integer pageSize,  AccessDetail accessDetail,
			HttpServletRequest request) {
		Result result = new Result(-1, "查找错误!");
		if (pageNum == null || pageNum < 0) {
			pageNum = 1;
		}
		if (pageSize == null || pageSize < 0) {
			pageSize = 10;
		}
		accessDetail.setAdminId(CurrentUserUtil.getCurrUserId(request));
		PageInfo<AccessDetail> pageInfo = accessDetailService.findByPage(pageNum, pageSize, accessDetail);
		if (pageInfo != null) {
			result.setCode(0);
			result.setInfo("成功");
			result.setData(pageInfo);
		}
		return JSONUtil.toString(result);
	}

}
