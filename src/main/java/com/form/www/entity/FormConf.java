package com.form.www.entity;

import javax.persistence.*;

@Table(name = "form_conf")
public class FormConf {
    /**
     * 表单配置id
     */
    @Id
    private Long id;

    /**
     * 表单字段名称
     */
    @Column(name = "form_field_name")
    private String formFieldName;

    /**
     * 字段是否必须填写1必须 0非必须
     */
    private String required;

    /**
     * 字段类型 select/radio/text/textarea/file
     */
    private String type;

    /**
     * 默认值
     */
    @Column(name = "default_val")
    private String defaultVal;

    /**
     * 表单id
     */
    @Column(name = "form_id")
    private Long formId;

    /**
     * 获取表单配置id
     *
     * @return id - 表单配置id
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置表单配置id
     *
     * @param id 表单配置id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取表单字段名称
     *
     * @return form_field_name - 表单字段名称
     */
    public String getFormFieldName() {
        return formFieldName;
    }

    /**
     * 设置表单字段名称
     *
     * @param formFieldName 表单字段名称
     */
    public void setFormFieldName(String formFieldName) {
        this.formFieldName = formFieldName;
    }

    /**
     * 获取字段是否必须填写1必须 0非必须
     *
     * @return required - 字段是否必须填写1必须 0非必须
     */
    public String getRequired() {
        return required;
    }

    /**
     * 设置字段是否必须填写1必须 0非必须
     *
     * @param required 字段是否必须填写1必须 0非必须
     */
    public void setRequired(String required) {
        this.required = required;
    }

    /**
     * 获取字段类型 select/radio/text/textarea/file
     *
     * @return type - 字段类型 select/radio/text/textarea/file
     */
    public String getType() {
        return type;
    }

    /**
     * 设置字段类型 select/radio/text/textarea/file
     *
     * @param type 字段类型 select/radio/text/textarea/file
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取默认值
     *
     * @return default_val - 默认值
     */
    public String getDefaultVal() {
        return defaultVal;
    }

    /**
     * 设置默认值
     *
     * @param defaultVal 默认值
     */
    public void setDefaultVal(String defaultVal) {
        this.defaultVal = defaultVal;
    }

    /**
     * 获取表单id
     *
     * @return form_id - 表单id
     */
    public Long getFormId() {
        return formId;
    }

    /**
     * 设置表单id
     *
     * @param formId 表单id
     */
    public void setFormId(Long formId) {
        this.formId = formId;
    }
}