package com.form.www.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.form.www.entity.Activity;
import com.form.www.mybatis.mapper.ActivityMapper;
import com.formdesign.util.CurrentUserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.entity.Example;

@Service
public class ActivityService {
	
	@Resource
	private ActivityMapper activityMapper;

	/**
	 * 分页查询
	 * @param pageNum
	 * @param pageSize
	 * @param request 
	 * @return
	 */
	public PageInfo<Activity> getActivityByPage(Integer pageNum, Integer pageSize, HttpServletRequest request) {
		Example example = new Example(Activity.class);
		example.createCriteria().andEqualTo("adminId", CurrentUserUtil.getCurrUserId(request));
		example.setOrderByClause("id desc");
		PageHelper.startPage(pageNum, pageSize);
		List<Activity> list = activityMapper.selectByExample(example);
		return  new PageInfo<Activity>(list);
	}
	
	/**
	 *  添加活动
	 * @param activity
	 * @return
	 */
	public Integer addOne(Activity activity){
		return activityMapper.insertUseGeneratedKeys(activity);
	}
	
	/**
	 * 更新
	 * @param activity
	 * @return
	 */
	public Integer updateOne(Activity activity){
		return activityMapper.updateByPrimaryKeySelective(activity);
	}
	
	/**
	 *  根据id查询
	 * @param id
	 * @return
	 */
	public Activity findById(Integer id){		
		return activityMapper.selectByPrimaryKey(id);
	}

	public List<Activity> findAll(Integer adminId) {
		Example example = new Example(Activity.class);
		example.createCriteria().andEqualTo("adminId", adminId);
		return activityMapper.selectByExample(example);
	}
	
}
