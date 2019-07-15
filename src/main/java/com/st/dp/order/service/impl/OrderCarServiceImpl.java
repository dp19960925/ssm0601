package com.st.dp.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dp.order.mapper.OrderCarMapper;
import com.st.dp.order.model.OrderCarModel;
import com.st.dp.order.service.IOrderCarService;
import com.st.dp.util.FmtEmpty;


@Service
public class OrderCarServiceImpl  implements IOrderCarService{
@Autowired
private  OrderCarMapper mapper;
	
	
	@Override
	public int insert(OrderCarModel model) {
		OrderCarModel om = selectByCode(model.getUserCode(),model.getGoodsCode());
		  int price =Integer.parseInt(model.getPrice());//单价
		if(FmtEmpty.isEmpty(om)) {//不重复就添加
			 return	 mapper.insert(model);
			
		}else {//重复就修改个数价格
		    int  num = Integer.parseInt(om.getNum());
		    num++;
			om.setNum(String.valueOf(num));
			int total0=num*price;
			om.setTotal(total0+"");
			return mapper.update(om);
		}		
	}

	@Override
	public int delete(OrderCarModel model) {
		
		return mapper.delete(model);
	}

	@Override
	public int update(OrderCarModel model) {
		
		return mapper.update(model);
	}

	@Override
	public OrderCarModel selectById(Object id) {
		
		return mapper.selectById(id);
	}

	@Override
	public OrderCarModel selectByCode(String userCode,String goodsCode) {
		return mapper.selectByCode(userCode,goodsCode);
	}

	@Override
	public List<OrderCarModel> selectAll(OrderCarModel model) {
		
		return mapper.selectAll(model);
	}

	@Override
	public List<OrderCarModel> selectModel(OrderCarModel model) {
		return  mapper.selectModel(model);
	}

	@Override
	public int selectCount(OrderCarModel model) {
		
		return mapper.selectCount(model);
	}

}
