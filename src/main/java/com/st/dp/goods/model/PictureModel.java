package com.st.dp.goods.model;

import com.st.dp.util.Pager;

/**
 * 商品图片
 */
public class PictureModel extends Pager {
	private Integer	id;
	private String	productCode;// 对应的商品编号
	private String	location;	// 图片地址
	private String	type;		// 图片类型(在什么位置展示)

	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "PictureModel [id=" + id + ", productCode=" + productCode + ", location=" + location + ", type=" + type
				+ "]";
	}

}
