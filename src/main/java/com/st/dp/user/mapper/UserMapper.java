package com.st.dp.user.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.st.dp.user.model.UserModel;
@Repository
public interface UserMapper {
	int insert(UserModel t);//注册   (添加用户)
	int delete(String code);	//按主键删除
	int deleteModel(UserModel t);//按其他条件删除
	
	int update(UserModel t);//全部字段修改
	int updateActive(UserModel t);//部分字段修改
	
	UserModel selectId(String code);//按编号找

	List<UserModel> selectAll(UserModel t);//查全部
	List<UserModel> selectModel(UserModel t);//按条件查
	
	int selectCount(UserModel t);//查个数
}
