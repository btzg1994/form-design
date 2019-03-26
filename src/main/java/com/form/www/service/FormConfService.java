package com.form.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.form.www.entity.FormConf;
import com.form.www.mybatis.mapper.FormConfMapper;

import tk.mybatis.mapper.entity.Example;

@Service
public class FormConfService {
	
	@Autowired
	FormConfMapper formConfMapper;
	
	
	public Integer insertList(List<FormConf> fieldList){
		try {
			for (FormConf formConf : fieldList) {
				formConfMapper.insertSelective(formConf);
			}
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}
	
	public List<FormConf> getFormConfByFormId(Integer formId){
		Example example = new Example(FormConf.class);
		example.createCriteria().andEqualTo("formId", formId);
		return formConfMapper.selectByExample(example);
	}
}
