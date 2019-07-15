package com.st.dp.goods.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.st.dp.goods.model.PictureModel;

@Repository
public interface PictureMapper {
	// 插入记录
	int insert(PictureModel t);

	// 根据物理主键id进行删除
	int delete(Object id);

	// 根据model中属性进行删除
	int deleteModel(PictureModel t);

	// 根据model.code修改全部属性
	int update(PictureModel t);

	// 根据model.code修改不为空的属性
	int updateActive(PictureModel t);

	// 根据逻辑主键model.code查询model
	PictureModel selectUQ(Object id);

	// 根据model中属性查询符合条件的model集合
	List<PictureModel> selectModel(PictureModel t);

	// 查询所有的model
	List<PictureModel> selectAll(PictureModel t);

	// 查询总的记录条数
	int selectCount(PictureModel t);
}
