package com.st.dp.goods.service;

import java.util.List;

import com.st.dp.goods.model.PictureModel;

public interface IPictureService {
	public int insert(PictureModel t);

	public int delete(Object id);

	
	public int deleteModel(PictureModel t) ;

	public int update(PictureModel t) ;
	

	public int updateActive(PictureModel t);

	public PictureModel selectUQ(Object id) ;

	public List<PictureModel> selectModel(PictureModel t);

	public List<PictureModel> selectAll(PictureModel t);

	public int selectCount(PictureModel t) ;

}
