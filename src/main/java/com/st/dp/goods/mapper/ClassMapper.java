package com.st.dp.goods.mapper;

import java.util.List;

import com.st.dp.goods.model.ClassModel;


public interface ClassMapper {
	int insert(ClassModel t);//添加
	int delete(String code);	//按主键删除
	int deleteModel(ClassModel t);//按其他条件删除
	
	int update(ClassModel t);//全部字段修改
	int updateActive(ClassModel t);//部分字段修改
	
	ClassModel selectId(String code);//按编号找

	List<ClassModel> selectAll(ClassModel t);//查全部
	List<ClassModel> selectModel(ClassModel t);//按条件查
	List<ClassModel> selectModelOut(ClassModel t);//按条件查 无lim
	int selectCount(ClassModel t);//查个数
}
