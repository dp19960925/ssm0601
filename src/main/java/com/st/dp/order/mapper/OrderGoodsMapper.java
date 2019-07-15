package com.st.dp.order.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.st.dp.order.model.OrderGoodsModel;

@Repository
public interface OrderGoodsMapper {
	int insert(OrderGoodsModel model);
	int delete(OrderGoodsModel model);
	int update(OrderGoodsModel model) ;
	OrderGoodsModel selectById(Object id);
    OrderGoodsModel selectByCode(String code);
	List<OrderGoodsModel> selectAll(OrderGoodsModel model);
	List<OrderGoodsModel> selectModel(OrderGoodsModel model);
    int selectCount(OrderGoodsModel model);
}
