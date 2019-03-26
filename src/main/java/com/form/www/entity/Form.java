package com.form.www.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Table(name = "form")
public class Form {
    /**
     * 表单id
     */
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    /**
     * 名称
     */
    private String title;

    /**
     * 标签
     */
    private String label;

    @Column(name = "create_time")
    private Date createTime;

    private String remark;

    @Column(name = "admin_id")
    private Integer adminId;

    /**
     * html
     */
    private String content;

    /**
     * 表单字段集合
     */
    private List<FormConf> fieldList;
    
    public List<FormConf> getFieldList() {
		return fieldList;
	}

	public void setFieldList(List<FormConf> fieldList) {
		this.fieldList = fieldList;
	}

	/**
     * 获取表单id
     *
     * @return id - 表单id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置表单id
     *
     * @param id 表单id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取名称
     *
     * @return title - 名称
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置名称
     *
     * @param title 名称
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取标签
     *
     * @return label - 标签
     */
    public String getLabel() {
        return label;
    }

    /**
     * 设置标签
     *
     * @param label 标签
     */
    public void setLabel(String label) {
        this.label = label;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return admin_id
     */
    public Integer getAdminId() {
        return adminId;
    }

    /**
     * @param adminId
     */
    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    /**
     * 获取html
     *
     * @return content - html
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置html
     *
     * @param content html
     */
    public void setContent(String content) {
        this.content = content;
    }
}