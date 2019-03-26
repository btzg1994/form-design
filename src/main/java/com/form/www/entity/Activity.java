package com.form.www.entity;

import java.util.Date;
import javax.persistence.*;

public class Activity {
    /**
     * 活动id
     */
    @Id
    private Integer id;

    /**
     * 活动名称
     */
    private String name;

    /**
     * 状态 0关闭1开启
     */
    private Integer status;

    /**
     * 图片地址
     */
    @Column(name = "img_url")
    private String imgUrl;

    /**
     * 音乐地址
     */
    @Column(name = "music_url")
    private String musicUrl;

    /**
     * 页浏览量
     */
    @Column(name = "page_view_count")
    private Integer pageViewCount;

    /**
     * 背景色
     */
    @Column(name = "bg_color")
    private String bgColor;

    /**
     * 开始时间
     */
    @Column(name = "start_time")
    private Date startTime;

    /**
     * 结束时间
     */
    @Column(name = "end_time")
    private Date endTime;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    private String remark;

    /**
     * 表单id
     */
    @Column(name = "form_id")
    private Integer formId;

    /**
     * 管理员id
     */
    @Column(name = "admin_id")
    private Integer adminId;

    /**
     * 获取活动id
     *
     * @return id - 活动id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置活动id
     *
     * @param id 活动id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取活动名称
     *
     * @return name - 活动名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置活动名称
     *
     * @param name 活动名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取状态 0关闭1开启
     *
     * @return status - 状态 0关闭1开启
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置状态 0关闭1开启
     *
     * @param status 状态 0关闭1开启
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取图片地址
     *
     * @return img_url - 图片地址
     */
    public String getImgUrl() {
        return imgUrl;
    }

    /**
     * 设置图片地址
     *
     * @param imgUrl 图片地址
     */
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    /**
     * 获取音乐地址
     *
     * @return music_url - 音乐地址
     */
    public String getMusicUrl() {
        return musicUrl;
    }

    /**
     * 设置音乐地址
     *
     * @param musicUrl 音乐地址
     */
    public void setMusicUrl(String musicUrl) {
        this.musicUrl = musicUrl;
    }

    /**
     * 获取页浏览量
     *
     * @return page_view_count - 页浏览量
     */
    public Integer getPageViewCount() {
        return pageViewCount;
    }

    /**
     * 设置页浏览量
     *
     * @param pageViewCount 页浏览量
     */
    public void setPageViewCount(Integer pageViewCount) {
        this.pageViewCount = pageViewCount;
    }

    /**
     * 获取背景色
     *
     * @return bg_color - 背景色
     */
    public String getBgColor() {
        return bgColor;
    }

    /**
     * 设置背景色
     *
     * @param bgColor 背景色
     */
    public void setBgColor(String bgColor) {
        this.bgColor = bgColor;
    }

    /**
     * 获取开始时间
     *
     * @return start_time - 开始时间
     */
    public Date getStartTime() {
        return startTime;
    }

    /**
     * 设置开始时间
     *
     * @param startTime 开始时间
     */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取结束时间
     *
     * @return end_time - 结束时间
     */
    public Date getEndTime() {
        return endTime;
    }

    /**
     * 设置结束时间
     *
     * @param endTime 结束时间
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
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
     * 获取表单id
     *
     * @return form_id - 表单id
     */
    public Integer getFormId() {
        return formId;
    }

    /**
     * 设置表单id
     *
     * @param formId 表单id
     */
    public void setFormId(Integer formId) {
        this.formId = formId;
    }

    /**
     * 获取管理员id
     *
     * @return admin_id - 管理员id
     */
    public Integer getAdminId() {
        return adminId;
    }

    /**
     * 设置管理员id
     *
     * @param adminId 管理员id
     */
    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }
}