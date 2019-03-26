package com.form.www.mybatis.mapper;

import java.util.List;

import com.form.www.entity.Admin;
import com.formdesign.util.MyMapper;

public interface AdminMapper extends MyMapper<Admin> {

	List<Admin> selectPageByAdmin(Admin admin,Integer page);
}