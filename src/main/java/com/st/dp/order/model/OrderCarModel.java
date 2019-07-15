package com.st.dp.order.model;

import com.st.dp.util.Pager;
//购物车
public class OrderCarModel  extends Pager{

	private Integer id;
	private String userCode; // 用户编号
	private String goodsCode;  //商品编号
	private String num;//数量
	private String location;
	private String price;
	private String name;
	private String total; //总和
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "OrderCarModel [id=" + id + ", userCode=" + userCode + ", goodsCode=" + goodsCode + ", num=" + num
				+ ", location=" + location + ", price=" + price + ", name=" + name + ", total=" + total + "]";
	}
	
	
	
}
