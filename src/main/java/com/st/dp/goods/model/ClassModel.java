package com.st.dp.goods.model;

import com.st.dp.util.Pager;

public class ClassModel extends Pager{
	private Integer id;
	private String code;
	private String name;
	private String parcode;
	private String des;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParcode() {
		return parcode;
	}
	public void setParcode(String parcode) {
		this.parcode = parcode;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	@Override
	public String toString() {
		return "ClassModel [id=" + id + ", code=" + code + ", name=" + name + ", parcode=" + parcode + ", des=" + des
				+ "]";
	}
	
}
