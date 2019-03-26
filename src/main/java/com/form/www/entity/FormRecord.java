package com.form.www.entity;

import javax.persistence.*;

@Table(name = "form_record")
public class FormRecord {
    /**
     * 表单填写记录表
     */
    @Id
    private Long id;

    /**
     * 填写方式 1手动填写2批量导入
     */
    private String type;

    /**
     * 活动id
     */
    @Column(name = "activity_id")
    private Long activityId;

    /**
     * 填写数据内容JSON格式
     */
    private String val;

    /**
     * 获取表单填写记录表
     *
     * @return id - 表单填写记录表
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置表单填写记录表
     *
     * @param id 表单填写记录表
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取填写方式 1手动填写2批量导入
     *
     * @return type - 填写方式 1手动填写2批量导入
     */
    public String getType() {
        return type;
    }

    /**
     * 设置填写方式 1手动填写2批量导入
     *
     * @param type 填写方式 1手动填写2批量导入
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取活动id
     *
     * @return activity_id - 活动id
     */
    public Long getActivityId() {
        return activityId;
    }

    /**
     * 设置活动id
     *
     * @param activityId 活动id
     */
    public void setActivityId(Long activityId) {
        this.activityId = activityId;
    }

    /**
     * 获取填写数据内容JSON格式
     *
     * @return val - 填写数据内容JSON格式
     */
    public String getVal() {
        return val;
    }

    /**
     * 设置填写数据内容JSON格式
     *
     * @param val 填写数据内容JSON格式
     */
    public void setVal(String val) {
        this.val = val;
    }
}