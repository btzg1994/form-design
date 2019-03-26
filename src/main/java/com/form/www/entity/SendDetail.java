package com.form.www.entity;

import java.util.Date;
import javax.persistence.*;

@Table(name = "send_detail")
public class SendDetail {
    @Id
    private Integer id;

    private String title;

    @Column(name = "admin_id")
    private Integer adminId;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "activity_id")
    private Integer activityId;

    /**
     * 0 初始化 1正在推送 2 推送完成
     */
    private String status;

    /**
     * 推送人数
     */
    @Column(name = "send_count")
    private Integer sendCount;

    private String remark;

    @Column(name = "user_list_str")
    private String userListStr;

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
     * @return title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
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
     * @return activity_id
     */
    public Integer getActivityId() {
        return activityId;
    }

    /**
     * @param activityId
     */
    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    /**
     * 获取0 初始化 1正在推送 2 推送完成
     *
     * @return status - 0 初始化 1正在推送 2 推送完成
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置0 初始化 1正在推送 2 推送完成
     *
     * @param status 0 初始化 1正在推送 2 推送完成
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取推送人数
     *
     * @return send_count - 推送人数
     */
    public Integer getSendCount() {
        return sendCount;
    }

    /**
     * 设置推送人数
     *
     * @param sendCount 推送人数
     */
    public void setSendCount(Integer sendCount) {
        this.sendCount = sendCount;
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
     * @return user_list_str
     */
    public String getUserListStr() {
        return userListStr;
    }

    /**
     * @param userListStr
     */
    public void setUserListStr(String userListStr) {
        this.userListStr = userListStr;
    }
}