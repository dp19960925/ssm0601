package com.st.dp.order.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.st.dp.order.model.OrderModel;


@Repository
public interface OrderMapper {
	int insert(OrderModel model);
	int delete(String code);
	int update(OrderModel model) ;
	OrderModel selectById(Object id);
    OrderModel selectByCode(String code);
	List<OrderModel> selectAll(OrderModel model);
	List<OrderModel> selectModel(OrderModel model);
    int selectCount(OrderModel model);
}
