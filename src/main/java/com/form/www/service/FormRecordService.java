package com.form.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.form.www.entity.FormRecord;
import com.form.www.mybatis.mapper.FormRecordMapper;

import tk.mybatis.mapper.entity.Example;

@Service
public class FormRecordService {
	
	@Autowired
	private FormRecordMapper formRecordMapper;
	
	public Integer insert(FormRecord formRecord){
		return formRecordMapper.insert(formRecord);
	}

	public int deleteFormRecord(Long id) {
		return formRecordMapper.deleteByPrimaryKey(id);
	}

	public List<FormRecord> findAllFormRecord(String activityId) {
		Example example = new Example(FormRecord.class);
		example.createCriteria().andEqualTo("activityId", Long.parseLong(activityId));
		return formRecordMapper.selectByExample(example);
	}
}
