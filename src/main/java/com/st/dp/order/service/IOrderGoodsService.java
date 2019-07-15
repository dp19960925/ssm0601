package com.st.dp.order.service;

import java.util.List;

import com.st.dp.order.model.OrderGoodsModel;



public interface IOrderGoodsService {
	int insert(OrderGoodsModel model);
	int delete(OrderGoodsModel model);
	int update(OrderGoodsModel model) ;
	OrderGoodsModel selectById(Object id);
    OrderGoodsModel selectByCode(String code);
	List<OrderGoodsModel> selectAll(OrderGoodsModel model);
	List<OrderGoodsModel> selectModel(OrderGoodsModel model);
    int selectCount(OrderGoodsModel model);
}
