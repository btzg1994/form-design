package com.form.www.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.form.www.entity.SendDetail;
import com.form.www.mybatis.mapper.SendDetailMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.entity.Example;


@Service
public class SendDetailService {

	@Autowired
	private SendDetailMapper SendDetailMapper;
	
	
	public int saveSendDetail(SendDetail SendDetail) {
		return SendDetailMapper.insertSelective(SendDetail);
	}

	public int deleteSendDetail(Integer id) {
		Example example  = new Example(SendDetail.class);
		example.createCriteria().andEqualTo("id", id);
		return SendDetailMapper.deleteByExample(example);
	}

	public int updateSendDetail(SendDetail SendDetail) {
		return SendDetailMapper.updateByPrimaryKeySelective(SendDetail);
	}

	public List<SendDetail> findAllSendDetail(Integer adminId) {
		Example example = new Example(SendDetail.class);
		example.createCriteria().andEqualTo("adminId", adminId);
		return SendDetailMapper.selectByExample(example);
	}
	

	public SendDetail selectSendDetail(Integer id) {
		return SendDetailMapper.selectByPrimaryKey(id);
	}

	public boolean isExist(String SendDetailName) {
		Example example = new Example(SendDetail.class);
		example.createCriteria().andEqualTo("SendDetailName", SendDetailName);
		List<SendDetail> list = SendDetailMapper.selectByExample(example);
		
		if (list == null || list.size() == 0) {
			return false;
		}
		return true;
	}

	
}
