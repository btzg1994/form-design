package com.form.www.entity;

import java.util.Date;
import javax.persistence.*;

public class Admin {
    @Id
    private Integer id;

    /**
     * 登录名
     */
    @Id
    @Column(name = "admin_name")
    private String adminName;

    /**
     * 登录密码
     */
    private String pwd;

    /**
     * 性别(0/1,女/男)
     */
    private Integer gender;

    /**
     * 姓名
     */
    private String name;

    @Column(name = "create_time")
    private Date createTime;

    private String remark;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取登录名
     *
     * @return admin_name - 登录名
     */
    public String getAdminName() {
        return adminName;
    }

    /**
     * 设置登录名
     *
     * @param adminName 登录名
     */
    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    /**
     * 获取登录密码
     *
     * @return pwd - 登录密码
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * 设置登录密码
     *
     * @param pwd 登录密码
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    /**
     * 获取性别(0/1,女/男)
     *
     * @return gender - 性别(0/1,女/男)
     */
    public Integer getGender() {
        return gender;
    }

    /**
     * 设置性别(0/1,女/男)
     *
     * @param gender 性别(0/1,女/男)
     */
    public void setGender(Integer gender) {
        this.gender = gender;
    }

    /**
     * 获取姓名
     *
     * @return name - 姓名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置姓名
     *
     * @param name 姓名
     */
    public void setName(String name) {
        this.name = name;
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
}