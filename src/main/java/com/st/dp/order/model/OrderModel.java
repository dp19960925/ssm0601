package com.st.dp.order.model;


import com.st.dp.util.Pager;

public class OrderModel  extends Pager{

 private Integer id;
 private  String code;		//订单号
 private  String userCode;  //用户号
 private String entryTime;   //订单生成时间
 private String address;  //收货地址
 private  String state;  //订单状态
 
//从别的表查
 private  String userName; //用户昵称
 
 
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
public String getUserCode() {
	return userCode;
}
public void setUserCode(String userCode) {
	this.userCode = userCode;
}
public String getEntryTime() {
	return entryTime;
}
public void setEntryTime(String entryTime) {
	this.entryTime = entryTime;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
@Override
public String toString() {
	return "OrderModel [id=" + id + ", code=" + code + ", userCode=" + userCode + ", entryTime=" + entryTime
			+ ", address=" + address + ", state=" + state + ", userName=" + userName + "]";
}


}
