package com.st.dp.order.service;

import java.util.List;

import com.st.dp.order.model.OrderModel;


public interface IOrderService {
	int insert(OrderModel model);
	int delete(String code);
	int update(OrderModel model) ;
	OrderModel selectById(Object id);
    OrderModel selectByCode(String code);
	List<OrderModel> selectAll(OrderModel model);
	List<OrderModel> selectModel(OrderModel model);
    int selectCount(OrderModel model);
}
