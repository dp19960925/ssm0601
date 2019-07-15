package com.st.dp.order.model;

import com.st.dp.util.Pager;

public class OrderGoodsModel  extends Pager{
//订单号可能对应多个商品信息
//商品信息可能对应多个订单号
	private  Integer id;
	private String orderCode;//订单号
	private String  goodsCode;//商品编号
	private String  num;//数量
	private String price;//价格
	
	//从别的表查
	private String  goodsName;
	private String  location;
	
	//通过计算得总计
	private String  sum;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	

	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "OrderGoodsModel [id=" + id + ", orderCode=" + orderCode + ", goodsCode=" + goodsCode + ", num=" + num
				+ ", price=" + price + ", goodsName=" + goodsName + ", location=" + location + "]";
	}
	
}
