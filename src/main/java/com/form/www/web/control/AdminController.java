package com.form.www.web.control;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.form.www.entity.Admin;
import com.form.www.entity.Result;
import com.form.www.service.AdminService;
import com.formdesign.util.JSONUtil;
import com.github.pagehelper.PageInfo;

@RequestMapping("admin")
@Controller
public class AdminController {

	/**
	 * 管理员服务service
	 */
	@Autowired
	private AdminService adminService;

	@RequestMapping("findAdminByPage/{pageNum}/{pageSize}")
	@ResponseBody
	public String findAdminByPage(@PathVariable(value = "pageNum", required = false) Integer pageNum,
			@PathVariable(value = "pageSize", required = false) Integer pageSize,  Admin admin,
			HttpServletRequest request) {
		Result result = new Result(-1, "查找错误!");
		if (pageNum == null || pageNum < 0) {
			pageNum = 1;
		}
		if (pageSize == null || pageSize < 0) {
			pageSize = 10;
		}
		PageInfo<Admin> pageInfo = adminService.findAdminByPage(pageNum, pageSize, admin);
		if (pageInfo != null) {
			result.setCode(0);
			result.setInfo("成功");
			result.setData(pageInfo);
		}
		return JSONUtil.toString(result);
	}

	/**
	 * 添加管理用户
	 * 
	 * @param admin
	 * @return
	 */
	@RequestMapping("addAdmin")
	@ResponseBody
	public String addAdmin(Admin admin) {
		Result result = new Result(-1, "失败!");
		// 判断传入数据是否存在为空的
		if (StringUtils.isBlank(admin.getAdminName()) || StringUtils.isBlank(admin.getName())
				|| StringUtils.isBlank(admin.getPwd()) || null == admin.getGender()) {
			result.setInfo("参数存在为空,添加失败");
			return JSONUtil.toString(result);
		}
		String adminName = admin.getAdminName();
		boolean isExist = adminService.isExist(adminName);
		if (isExist) {
			result.setInfo("当前用户名已存在!");
			return JSONUtil.toString(result);
		}
		admin.setCreateTime(new Date());
		int saveStatus = adminService.saveAdmin(admin);
		if (saveStatus > 0) {
			result.setCode(0);
			result.setInfo("管理员添加成功");
		}
		// 将结果转为字符串返回
		String res = JSONUtil.toString(result);
		return res;

	}

	/**
	 * 根据id删除管理用户
	 * 
	 * @param admin
	 * @return
	 */
	@RequestMapping("deleteAdmin")
	@ResponseBody
	public String deleteAdmin(Admin admin) {
		Result result = new Result(-1, "删除管理员失败!");
		Integer id = admin.getId();
		// 删除的id不能为空
		if (id == null) {
			result.setInfo("管理员id不能为空!");
			return JSONUtil.toString(result);
		}

		int deleteStatus = adminService.deleteAdmin(admin.getId());
		if (deleteStatus > 0) {
			result.setCode(0);
			result.setInfo("删除管理员成功");
		}
		return JSONUtil.toString(result);
	}

	/**
	 * 根据id更新admin
	 * 
	 * @param admin
	 * @return
	 */
	@RequestMapping("updateAdmin")
	@ResponseBody
	public String updateAdmin(Admin admin) {
		Result result = new Result(-1, "管理员更新失败!");
		if (admin.getId() == null) {
			result.setInfo("管理员id不能为空");
			return JSONUtil.toString(result);
		}
		// 判断传入的数据是否都为空
		if (StringUtils.isBlank(admin.getAdminName()) && StringUtils.isBlank(admin.getName())
				&& StringUtils.isBlank(admin.getPwd()) && null == admin.getGender()
				&& StringUtils.isBlank(admin.getRemark())) {
			result.setInfo("更新字段不能全部为空,更新失败");
			return JSONUtil.toString(result);
		}
		// 更新状态大于0表示成功
		int updateStatus = adminService.updateAdmin(admin);
		if (updateStatus > 0) {
			result.setCode(0);
			result.setInfo("更新管理员信息成功");
		}
		return JSONUtil.toString(result);
	}

	/**
	 * 查找所有管理用户 list为空也算成功
	 * 
	 * @return
	 */
	@RequestMapping("findAllAdmin")
	@ResponseBody
	public String findAllAdmin() {
		Result result = new Result(-1, "查找所有管理员失败!");
		List<Admin> list = adminService.findAllAdmin();
		if (list != null) {
			result.setCode(0);
			result.setInfo("查找所有管理员成功");
		}
		return JSONUtil.toString(result.setData(list));
	}

	/**
	 * 根据id查找用户
	 * 
	 * @param admin
	 * @return
	 */
	@RequestMapping("findAdmin")
	@ResponseBody
	public String selectAdmin(Admin admin) {
		Result result = new Result(-1, "查找管理员失败!");
		Integer id = admin.getId();
		if (id == null) {
			result.setInfo("传入id不能为空");
		}
		Admin ad = adminService.selectAdmin(id);
		result.setCode(0);
		result.setInfo("查找管理员成功");
		return JSONUtil.toString(result.setData(ad));
	}

}
