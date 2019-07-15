package com.st.dp.user.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dp.user.mapper.UserMapper;
import com.st.dp.user.model.UserModel;
import com.st.dp.user.service.IUserService;
import com.st.dp.util.MD5;
@Service
public class UserService implements IUserService{
	@Autowired
	private UserMapper userMapper;
	//注册、添加
	public int insert(UserModel userModel) {
		//先判断账号重复
		if(userMapper.selectId(userModel.getCode())!=null) {
			return 0;
		}
		//MD5加密
		userModel.setPass(MD5.encode(userModel.getPass()));
		return userMapper.insert(userModel);
	}
	//登录
	public String login(UserModel userModel,HttpServletRequest request) {
		//先判断账号是否存在
		if(userMapper.selectId(userModel.getCode())==null) {
			return "2";
		}
		//判断密码是否正确
		if(!MD5.encode(userModel.getPass()).equals(userMapper.selectId(userModel.getCode()).getPass())) {
			return "4";
		}
		//登录成功
		//user存域
		//判断身份		
		UserModel dbmodel=userMapper.selectId(userModel.getCode());
		
		if(dbmodel.getIsAdmin().equals("0")) {
			request.getSession().setAttribute("admin", dbmodel);
			return "0";		//管理员	
		}else {
			request.getSession().setAttribute("yonghu", dbmodel);
			return "1";		//顾客
		}
	}
	//按条件取List
	public List<UserModel> selectList(UserModel userModel){
		List<UserModel> list =userMapper.selectModel(userModel);
		for (UserModel a : list) {
			System.out.println(a);
		}
		return userMapper.selectModel(userModel);
	}
	//个数
	public int selectCount(UserModel userModel) {
		return userMapper.selectCount(userModel);
	}
	//按code删除
	public String delete(String code) {
		//先判断该对象能否被删（是否为管理员）？
		if(userMapper.selectId(code).getIsAdmin().equals("0")) {
			return "2";//为管理员，不能删
		}		
		return userMapper.delete(code)+"";
	}
	//按code查找
	public UserModel selectCode(String code) {
		return userMapper.selectId(code);
	}
	//修改
	public String update(UserModel userModel) {
		return userMapper.updateActive(userModel)+"";
	}
	
}
