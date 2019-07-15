package com.st.dp.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dp.order.mapper.OrderMapper;
import com.st.dp.order.model.OrderModel;
import com.st.dp.order.service.IOrderService;
import com.st.dp.util.FmtEmpty;



@Service
public class OrderServiceImpl  implements  IOrderService{
    
	@Autowired OrderMapper mapper;
	
	
	@Override
	public int insert(OrderModel model) {
	OrderModel om = mapper.selectByCode(model.getCode());
	if( FmtEmpty.isEmpty(om)) {
		mapper.insert(model);
		return 0;
	}
		return 1;
	}

	@Override
	public int delete(String code) {
		
		return mapper.delete(code);
	}

	@Override
	public int update(OrderModel model) {
		
		return mapper.update(model);
	}

	@Override
	public OrderModel selectById(Object id) {
		
		return mapper.selectById(id);
	}

	@Override
	public OrderModel selectByCode(String code) {
		
		return mapper.selectByCode(code);
	}

	@Override
	public List<OrderModel> selectAll(OrderModel model) {
		
		return mapper.selectAll(model);
	}

	@Override
	public List<OrderModel> selectModel(OrderModel model) {
		
		return mapper.selectModel(model);
	}

	@Override
	public int selectCount(OrderModel model) {
		
		return mapper.selectCount(model);
	}

	
	
}
