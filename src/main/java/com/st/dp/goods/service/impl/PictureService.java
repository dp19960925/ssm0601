package com.st.dp.goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dp.goods.mapper.PictureMapper;
import com.st.dp.goods.model.PictureModel;
import com.st.dp.goods.service.IPictureService;

@Service
public class PictureService implements IPictureService {
	@Autowired
	private PictureMapper pictureMapper;

	@Override
	public int insert(PictureModel t) {
		// TODO Auto-generated method stub
		return pictureMapper.insert(t);
	}

	@Override
	public int delete(Object id) {
		// TODO Auto-generated method stub
		return pictureMapper.delete(id);
	}

	@Override
	public int deleteModel(PictureModel t) {
		// TODO Auto-generated method stub
		return pictureMapper.deleteModel(t);
	}

	@Override
	public int update(PictureModel t) {
		// TODO Auto-generated method stub
		return pictureMapper.update(t);
	}

	@Override
	public int updateActive(PictureModel t) {
		// TODO Auto-generated method stub
		return pictureMapper.updateActive(t);
	}

	@Override
	public PictureModel selectUQ(Object id) {
		// TODO Auto-generated method stub
		return pictureMapper.selectUQ(id);
	}

	@Override
	public List<PictureModel> selectModel(PictureModel t) {
		// TODO Auto-generated method stub
		return pictureMapper.selectModel(t);
	}

	@Override
	public List<PictureModel> selectAll(PictureModel t) {
		// TODO Auto-generated method stub
		return pictureMapper.selectAll(t);
	}

	@Override
	public int selectCount(PictureModel t) {
		// TODO Auto-generated method stub
		return pictureMapper.selectCount(t);
	}

}
