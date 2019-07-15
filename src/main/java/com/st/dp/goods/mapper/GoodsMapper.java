package com.st.dp.goods.mapper;

import java.util.List;


import com.st.dp.goods.model.GoodsModel;

public interface GoodsMapper {
	int insert(GoodsModel t);//添加
	int delete(String code);	//按主键删除
	int deleteModel(GoodsModel t);//按其他条件删除
	
	int update(GoodsModel t);//全部字段修改
	int updateActive(GoodsModel t);//部分字段修改
	
	GoodsModel selectId(String code);//按编号找

	List<GoodsModel> selectAll(GoodsModel t);//查全部
	List<GoodsModel> selectModel(GoodsModel t);//按条件查
	
	int selectCount(GoodsModel t);//查个数
}
