package com.st.dp.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.st.dp.user.model.UserModel;

public interface IUserService {
	int insert(UserModel userModel);//添加注册
	String login(UserModel userModel,HttpServletRequest request);//登录
	List<UserModel> selectList(UserModel userModel);//按条件取List
	int selectCount(UserModel userModel);//个数
	String delete(String code);//按code删除
	UserModel selectCode(String code);//按code查找
	String update(UserModel userModel);//修改
	
}
