package com.st.dp.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dp.order.mapper.OrderGoodsMapper;
import com.st.dp.order.model.OrderGoodsModel;
import com.st.dp.order.service.IOrderGoodsService;




@Service
public class OrderGoodsServiceImpl  implements IOrderGoodsService{

	@Autowired  
	private  OrderGoodsMapper mapper;

	@Override
	public int insert(OrderGoodsModel model) {
		
		return mapper.insert(model);
	}

	@Override
	public int delete(OrderGoodsModel model) {
		
		return mapper.delete(model);
	}

	@Override
	public int update(OrderGoodsModel model) {
		
		return mapper.update(model);
	}

	@Override
	public OrderGoodsModel selectById(Object id) {
		
		return mapper.selectById(id);
	}

	@Override
	public OrderGoodsModel selectByCode(String code) {
		
		return mapper.selectByCode(code);
	}

	@Override
	public List<OrderGoodsModel> selectAll(OrderGoodsModel model) {
		
		return mapper.selectAll(model);
	}

	@Override
	public List<OrderGoodsModel> selectModel(OrderGoodsModel model) {
		
		return mapper.selectModel(model);
	}

	@Override
	public int selectCount(OrderGoodsModel model) {
		
		return mapper.selectCount(model);
	}

	
	
	
}
