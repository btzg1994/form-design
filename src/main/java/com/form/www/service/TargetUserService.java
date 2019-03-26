package com.form.www.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.form.www.entity.Admin;
import com.form.www.entity.SendDetail;
import com.form.www.entity.TargetUser;
import com.form.www.mybatis.mapper.SendDetailMapper;
import com.form.www.mybatis.mapper.TargetUserMapper;
import com.formdesign.util.JavaMailUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class TargetUserService {

	@Autowired
	private TargetUserMapper targetUserMapper;
	
	@Autowired
	private SendDetailMapper sendDetailMapper;
	
	public int addTargetUser(TargetUser targetUser) {
		return targetUserMapper.insert(targetUser);
	}

	public List<TargetUser> findAllTargetUser() {
		return targetUserMapper.selectAll();
	}

	public int updateTargetUser(TargetUser targetUser) {
		return targetUserMapper.updateByPrimaryKeySelective(targetUser);
	}

	public int deleteTargetUser(Integer id) {
		Example example = new Example(TargetUser.class);
		example.createCriteria().andEqualTo("id", id);
		return targetUserMapper.deleteByExample(example);
	}

	public Integer insertList(List<TargetUser> list) {
		return targetUserMapper.insertList(list);
	}

	public PageInfo<TargetUser> findTargetUserByPage(Integer pageNum, Integer pageSize, TargetUser targetUser) {
		Example example = new Example(TargetUser.class);
		Criteria criteria = example.createCriteria();

		if (null != targetUser.getGender()) {
			criteria.andEqualTo("gender", targetUser.getGender());
		}
		if (StringUtils.isNotBlank(targetUser.getName())) {
			criteria.andLike("name", "%" + targetUser.getName() + "%");
		}
		if (StringUtils.isNotBlank(targetUser.getEmail())) {
			criteria.andLike("email", "%" + targetUser.getEmail() + "%");
		}
		if (StringUtils.isNotBlank(targetUser.getAddr())) {
			criteria.andLike("addr", "%" + targetUser.getAddr() + "%");
		}
		if (StringUtils.isNotBlank(targetUser.getPhone())) {
			criteria.andLike("phone", "%" + targetUser.getPhone() + "%");
		}
		PageHelper.startPage(pageNum, pageSize);
		List<TargetUser> list = targetUserMapper.selectByExample(example);
		return new PageInfo<TargetUser>(list);
	}
	
	public List<TargetUser> findTargetUsers(List<Long> ids){
		Example example = new Example(TargetUser.class);
		example.createCriteria().andIn("id",ids);
		return targetUserMapper.selectByExample(example);
	}
	
	@Async
	public void sendEmail(SendDetail sendDetail, List<TargetUser> users) {
		try {
			for (TargetUser tu : users) {
				JavaMailUtils.send(tu.getEmail(), sendDetail.getTitle(), "ces");
			}
			sendDetail.setStatus("2");
			sendDetailMapper.updateByPrimaryKeySelective(sendDetail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
