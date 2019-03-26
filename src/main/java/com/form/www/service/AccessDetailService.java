package com.form.www.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.form.www.entity.AccessDetail;
import com.form.www.entity.TargetUser;
import com.form.www.mybatis.mapper.AccessDetailMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class AccessDetailService {

	
	@Resource
	private AccessDetailMapper mapper;
	
	
	public Integer addOne(AccessDetail detail){
		return mapper.insertSelective(detail);
	}
	
	
	public PageInfo<AccessDetail> findByPage(Integer pageNum, Integer pageSize, AccessDetail accessDetail) {
		Example example = new Example(AccessDetail.class);
		Criteria criteria = example.createCriteria();

		if (null != accessDetail.getIp()) {
			criteria.andLike("ip", "%" + accessDetail.getIp() + "%");
		}
		if (StringUtils.isNotBlank(accessDetail.getType())) {
			criteria.andLike("type", "%" + accessDetail.getType() + "%");
		}
		
		if (null != accessDetail.getAdminId()) {
			criteria.andEqualTo("adminId", accessDetail.getAdminId());
		}
		
		if (null != accessDetail.getActivityId()) {
			criteria.andEqualTo("activityId", accessDetail.getActivityId());
		}
		
		
		PageHelper.startPage(pageNum, pageSize);
		List<AccessDetail> list = mapper.selectByExample(example);
		return new PageInfo<AccessDetail>(list);
	}
}
