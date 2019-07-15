package com.st.dp.goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dp.goods.mapper.ClassMapper;
import com.st.dp.goods.model.ClassModel;
import com.st.dp.goods.service.IClassService;
import com.st.dp.user.model.UserModel;
@Service
public class ClassService implements IClassService{
	@Autowired
	private ClassMapper classMapper;
	//添加
	public int insert(ClassModel classModel) {
		//先判断账号重复
		if(classMapper.selectId(classModel.getCode())!=null) {
			return 0;
		}
		return classMapper.insert(classModel);
		}
		
	//修改
	public String update(ClassModel classModel) {
		return classMapper.updateActive(classModel)+"";
	}
	//取一级二级分类
	public List<ClassModel> select12(String code) {
		code="%"+code+"%";
		ClassModel classModel=new ClassModel();
		classModel.setCode(code);
		return classMapper.selectModel(classModel);
	}
	//按code查找
		public ClassModel selectCode(String code) {
			return classMapper.selectId(code);
		}
		//按code删除
		public String delete(String code) {
	
			return classMapper.delete(code)+"";
		}
		
		//个数
		public int selectCount(ClassModel userModel) {
			return classMapper.selectCount(userModel);
		}
		//按条件取List
		public List<ClassModel> selectList(ClassModel userModel){
			return classMapper.selectModel(userModel);
		}
}
