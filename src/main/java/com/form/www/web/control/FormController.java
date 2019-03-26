package com.form.www.web.control;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.form.www.entity.Form;
import com.form.www.entity.Form;
import com.form.www.entity.Form;
import com.form.www.entity.FormConf;
import com.form.www.entity.Result;
import com.form.www.service.FormService;
import com.formdesign.util.CurrentUserUtil;
import com.formdesign.util.JSONUtil;

@Controller
@RequestMapping("form")
public class FormController {
	
	@Autowired
	private FormService formService;
	
	@Autowired
	private com.form.www.service.FormConfService formConfService;
	
	@RequestMapping("addForm")
	@ResponseBody
	public String addForm(@RequestBody Form form,HttpServletRequest request){
		Result result = new Result(-1, "添加失败!");
		// 获取字段list
		List<FormConf> fieldList = form.getFieldList();
		// 判断是否合法
		if (fieldList == null || fieldList.size() == 0) {
			result.setInfo("内容不能为空!");
			return JSONUtil.toString(result);
		}
		// 插入
		form.setCreateTime(new Date());
		form.setAdminId(CurrentUserUtil.getCurrUserId(request));
		Integer insertStatus = formService.insertForm(form);
		
		if (insertStatus > 0) {
			Integer id = form.getId();
			for (FormConf formConf : fieldList) {
				formConf.setFormId(Long.parseLong(id+""));
			}
			
			// 插入字段list
			insertStatus = formConfService.insertList(fieldList);
			if (insertStatus > 0) {
				result.setCode(0);
				result.setInfo("添加成功!");
				return JSONUtil.toString(result);
			}
		}
		return JSONUtil.toString(result);
	}
	
	/**
	 * 根据id删除
	 * 
	 * @param Form
	 * @return
	 */
	@RequestMapping("deleteForm")
	@ResponseBody
	public String deleteForm(Form form) {
		Result result = new Result(-1, "删除失败!");
		Integer id = form.getId();
		// 删除的id不能为空
		if (id == null) {
			result.setInfo("id不能为空!");
			return JSONUtil.toString(result);
		}
		//TODO 删除配置
		int deleteStatus = formService.deleteForm(form.getId());
		if (deleteStatus > 0) {
			result.setCode(0);
			result.setInfo("删除成功");
		}
		return JSONUtil.toString(result);
	}

	

	/**
	 * 查找当前 list为空也算成功
	 * 
	 * @return
	 */
	@RequestMapping("findAllForm")
	@ResponseBody
	public String findAllForm(HttpServletRequest request) {
		Result result = new Result(-1, "查找所有失败!");
		Integer currUserId = CurrentUserUtil.getCurrUserId(request);
		List<Form> list = formService.findAllForm(currUserId);
		if (list != null) {
			result.setCode(0);
			result.setInfo("查找所有成功");
		}
		return JSONUtil.toString(result.setData(list));
	}

	@RequestMapping("findForm")
	@ResponseBody
	public String selectForm(Form Form) {
		Result result = new Result(-1, "查找表单失败!");
		Integer id = Form.getId();
		if (id == null) {
			result.setInfo("传入id不能为空");
		}
		Form form = formService.selectForm(id);
		result.setCode(0);
		result.setInfo("查找表单成功");
		return JSONUtil.toString(result.setData(form));
	}
}
