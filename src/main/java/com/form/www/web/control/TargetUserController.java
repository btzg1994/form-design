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

import com.form.www.entity.Admin;
import com.form.www.entity.Result;
import com.form.www.entity.TargetUser;
import com.form.www.service.TargetUserService;
import com.formdesign.util.CurrentUserUtil;
import com.formdesign.util.JSONUtil;
import com.formdesign.util.POIUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("targetUser")
public class TargetUserController {

	@Resource
	private TargetUserService targetUserService;
	
	@RequestMapping("findTargetUserByPage/{pageNum}/{pageSize}")
	@ResponseBody
	public String findTargetUserByPage(@PathVariable(value = "pageNum", required = false) Integer pageNum,
			@PathVariable(value = "pageSize", required = false) Integer pageSize,  TargetUser targetUser,
			HttpServletRequest request) {
		Result result = new Result(-1, "查找错误!");
		if (pageNum == null || pageNum < 0) {
			pageNum = 1;
		}
		if (pageSize == null || pageSize < 0) {
			pageSize = 10;
		}
		targetUser.setAdminId(CurrentUserUtil.getCurrUserId(request));
		PageInfo<TargetUser> pageInfo = targetUserService.findTargetUserByPage(pageNum, pageSize, targetUser);
		if (pageInfo != null) {
			result.setCode(0);
			result.setInfo("成功");
			result.setData(pageInfo);
		}
		return JSONUtil.toString(result);
	}

	@RequestMapping("upload")
	@ResponseBody
	public String upload(MultipartFile myFile,HttpServletRequest request){
		String msg;
		Workbook workbook;
		Result result = new Result(-1, "上传失败!");
		try {
			try {
				// 检查上传的文件格式是否为excel
				POIUtil.checkFile(myFile);
				// 将上传的文件转化为workbook
				workbook = POIUtil.getWorkBook(myFile);
			} catch (Exception e) {
				msg = "请上传excel文件";
				result.setInfo(msg);
				return JSONUtil.toString(result);
			}
			Sheet sheet = workbook.getSheetAt(0);// 获得第一个sheet页
			
			Date date=new Date();
			// 遍历sheet页
			List<TargetUser> list = new ArrayList<TargetUser>();
			for (Row row : sheet) {
				// 取得当前行号
				int rowNum = row.getRowNum();
				
				if(rowNum != 0){
					//拿到一行数据
					String name = POIUtil.getCellValue(row.getCell(0));
					String email = POIUtil.getCellValue(row.getCell(1));
					String addr = POIUtil.getCellValue(row.getCell(2));
					String gender = POIUtil.getCellValue(row.getCell(3));
					String phone = POIUtil.getCellValue(row.getCell(4));
					
					if(StringUtils.isBlank(name) || StringUtils.isBlank(email) ){
						continue;
					}
					TargetUser user = new TargetUser();
					user.setAddr(addr);
					user.setCreateTime(date);
					user.setEmail(email);
					user.setGender("女".equals(gender) ? 0 : 1);
					user.setPhone(phone);
					user.setName(name);
					user.setAdminId(CurrentUserUtil.getCurrUserId(request));
					list.add(user);
				}
					
			}//遍历结束
			if (list.size() == 0) {
				result.setInfo("内容不能为空!");
				return JSONUtil.toString(result);
			}
			Integer insertList = targetUserService.insertList(list);
			if(insertList > 0){
				result.setCode(0);
				result.setInfo("批量上传成功!");
			}
			return JSONUtil.toString(result.setData(list));
		} catch (Exception e) {
			return JSONUtil.toString(result);
		}
	}
	
	/**
	 * 根据实体字段添加目标用户
	 * @param targetUser
	 * @return
	 */
	@RequestMapping("addTargetUser")
	@ResponseBody
	public String addTargetUser(TargetUser targetUser, HttpServletRequest request) {
		Result result = new Result(0, "成功!");
		
		targetUser.setCreateTime(new Date());
		targetUser.setAdminId(CurrentUserUtil.getCurrUserId(request));
		int i = targetUserService.addTargetUser(targetUser);
		if (i < 0) {
			result.setCode(-1);
			result.setInfo("添加目标用户失败");
		}
		return JSONUtil.toString(result);

	}

	/**
	 * 根据实体中id删除目标用户
	 * @param targetUser
	 * @return
	 */
	@RequestMapping("deleteTargetUser")
	@ResponseBody
	public String deleteTargetUser(TargetUser targetUser) {
		Result result = new Result(0, "成功!");
		int i = targetUserService.deleteTargetUser(targetUser.getId());
		if (i < 0) {
			result.setCode(-1);
			result.setInfo("添加目标用户失败");
		}
		return JSONUtil.toString(result);
	}

	/**
	 * 根据实体内不为空字段更新用户
	 * 依赖id
	 * @param targetUser
	 * @return
	 */
	@RequestMapping("updateTargetUser")
	@ResponseBody
	public String updateTargetUser(TargetUser targetUser) {
		Result result = new Result(0, "成功!");
		int i = targetUserService.updateTargetUser(targetUser);
		if (i < 0) {
			result.setCode(-1);
			result.setInfo("添加目标用户失败");
		}
		return JSONUtil.toString(result);
	}

	/*
	 * 查找所有的目标用户
	 * 查找集合不为空时返回成功,其他按照失败处理
	 */
	@RequestMapping("findAllTargetUser")
	@ResponseBody
	public String findAllTargetUser() {
		Result result = new Result(-1, "未找到目标用户");
		List<TargetUser> userList = targetUserService.findAllTargetUser();
		if (userList != null) {
			result.setCode(0);
			result.setInfo("成功");
			result.setData(userList);
		}
		return JSONUtil.toString(result.setData(userList));
	}

}
