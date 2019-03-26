package com.form.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.form.www.entity.Form;
import com.form.www.mybatis.mapper.FormMapper;

import tk.mybatis.mapper.entity.Example;

@Service
public class FormService {
	
	@Autowired
	private FormMapper formMapper;
	
	public Integer insertForm(Form form){
		return formMapper.insertUseGeneratedKeys(form);
	}
	public  int deleteForm(Integer id) {
		return formMapper.deleteByPrimaryKey(id);
	}
	public List<Form> findAllForm(Integer adminId) {
		Example example = new Example(Form.class);
		example.createCriteria().andEqualTo("adminId", adminId);
		return formMapper.selectByExample(example);
	}
	public Form selectForm(Integer id) {
		return formMapper.selectByPrimaryKey(id);
	}
}
