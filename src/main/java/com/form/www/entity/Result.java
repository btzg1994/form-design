package com.form.www.entity;

public class Result {
	private Integer code;
	private String info;
	private Object data;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Object getData() {
		return data;
	}

	public Result setData(Object data) {
		this.data = data;
		return this;
	}

	public Result(Integer code, String info) {
		super();
		this.code = code;
		this.info = info;
	}

}
