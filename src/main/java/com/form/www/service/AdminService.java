package com.form.www.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.form.www.entity.Admin;
import com.form.www.mybatis.mapper.AdminMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;


@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	public PageInfo<Admin> findAdminByPage(Integer pageNum, Integer pageSize, Admin admin) {
			Example example = new Example(Admin.class);
			Criteria criteria = example.createCriteria();
			
			if(null != admin.getGender()){
				criteria.andEqualTo("gender", admin.getGender());
			}
			if(StringUtils.isNotBlank(admin.getAdminName())){
				criteria.andLike("adminName", "%" + admin.getAdminName() + "%" );
			}
			if(StringUtils.isNotBlank(admin.getName())){
				criteria.andLike("name", "%" + admin.getName()+ "%");
			}
			PageHelper.startPage(pageNum, pageSize);
			List<Admin> list = adminMapper.selectByExample(example);
		return new PageInfo<Admin>(list);
	}
	
	public int saveAdmin(Admin admin) {
		return adminMapper.insertSelective(admin);
	}

	public int deleteAdmin(Integer id) {
		Example example  = new Example(Admin.class);
		example.createCriteria().andEqualTo("id", id);
		return adminMapper.deleteByExample(example);
	}

	public int updateAdmin(Admin admin) {
		return adminMapper.updateByPrimaryKeySelective(admin);
	}

	public List<Admin> findAllAdmin() {
		return adminMapper.selectAll();
	}

	public Admin selectAdmin(Integer id) {
		return adminMapper.selectByPrimaryKey(id);
	}

	public boolean isExist(String adminName) {
		if(adminName.equals(PublicService.SUPER_ADMIN_NAME)){
			return true;
		}
		
		Example example = new Example(Admin.class);
		example.createCriteria().andEqualTo("adminName", adminName);
		List<Admin> list = adminMapper.selectByExample(example);
		
		if (list == null || list.size() == 0) {
			return false;
		}
		
		return true;
	}

	public Admin selectAdmin(Admin ad) {
		// TODO Auto-generated method stub
		return adminMapper.selectOne(ad);
	}

	
}
