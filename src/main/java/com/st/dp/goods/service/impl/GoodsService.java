package com.st.dp.goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dp.goods.mapper.ClassMapper;
import com.st.dp.goods.mapper.GoodsMapper;
import com.st.dp.goods.model.ClassModel;
import com.st.dp.goods.model.GoodsModel;
import com.st.dp.goods.service.IGoodsService;
@Service
public class GoodsService implements IGoodsService {
	@Autowired
	private GoodsMapper goodsMapper;
	@Autowired
	private ClassMapper classMapper;
	//添加
	public int insert(GoodsModel goodsModel) {
		//先判断账号重复
		if(goodsMapper.selectId(goodsModel.getCode())!=null) {
			return 0;
		}
		return goodsMapper.insert(goodsModel);
		}
		
	//修改
	public String update(GoodsModel goodsModel) {
		return goodsMapper.updateActive(goodsModel)+"";
	}
	//取一级二级分类
	public List<ClassModel> select12(String parentcode) {
		
		ClassModel classModel=new ClassModel();
		classModel.setParcode(parentcode);
		return classMapper.selectModelOut(classModel);
	}
	//按code查找
		public GoodsModel selectCode(String code) {
			return goodsMapper.selectId(code);
		}
		//按code删除
		public String delete(String code) {
	
			return goodsMapper.delete(code)+"";
		}
		
		//个数
		public int selectCount(GoodsModel goodsModel) {
			return goodsMapper.selectCount(goodsModel);
		}
		//按条件取List
		public List<GoodsModel> selectList(GoodsModel goodsModel){
			return goodsMapper.selectModel(goodsModel);
		}  
}
