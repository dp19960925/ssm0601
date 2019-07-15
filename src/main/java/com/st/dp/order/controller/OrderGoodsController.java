package com.st.dp.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.dp.order.model.OrderGoodsModel;
import com.st.dp.order.service.impl.OrderGoodsServiceImpl;


@Controller
@RequestMapping("/orderGoods")
public class OrderGoodsController {

	@Autowired 
	private OrderGoodsServiceImpl orderGoodService;	
	@ResponseBody
	@RequestMapping("/add")
	public int add(OrderGoodsModel OrderGoodsModel,String entryTime1) {								    
	  return orderGoodService.insert(OrderGoodsModel);

	} 
	
	
	
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(OrderGoodsModel OrderGoodsModel, Model model) {
	    return  orderGoodService.delete(OrderGoodsModel);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public int update(OrderGoodsModel OrderGoodsModel) {
	    return  orderGoodService.update(OrderGoodsModel);
		
	}
	
	@ResponseBody
	@RequestMapping("/selectById")
	private OrderGoodsModel selectById(OrderGoodsModel OrderGoodsModel) {
		OrderGoodsModel um = orderGoodService.selectById(OrderGoodsModel.getId());
		return um;
	}
	@ResponseBody
	@RequestMapping("/selectByCode")
	private OrderGoodsModel selectByCode(OrderGoodsModel OrderGoodsModel) {
		OrderGoodsModel um = orderGoodService.selectByCode(OrderGoodsModel.getOrderCode());
		System.out.println("++++++++"+um);
		return um;
	}
	
	@ResponseBody
	@RequestMapping("/selectAll")
	private List<OrderGoodsModel> selectAll(OrderGoodsModel OrderGoodsModel) {
		List<OrderGoodsModel> list = orderGoodService.selectAll(OrderGoodsModel);
		
		return list;
	}

	@ResponseBody
	@RequestMapping("/selectModel")
	private Map<String,Object> selectModel(OrderGoodsModel OrderGoodsModel) {
		OrderGoodsModel.setPageOn(true);
		List<OrderGoodsModel> list = orderGoodService.selectModel(OrderGoodsModel);
		
	    Map<String,Object> map=new HashMap<>();
	    map.put("list", list);
	   
	    map.put("count", orderGoodService.selectCount(OrderGoodsModel));
	   
		
		
		return map;
	}
	
	@RequestMapping("/upGoods")
	private String upGoods(OrderGoodsModel OrderGoodsModel,Model model) {
//		OrderGoodsModel um = service.selectByCode(OrderGoodsModel.getOrderCode());
//		model.addAttribute("user",um);	
		List<OrderGoodsModel> list = orderGoodService.selectModel(OrderGoodsModel);
		model.addAttribute("list",list);
		return "order/order/pic";
	}
	
	@RequestMapping("/upGoods2")
	private String upGoods2(OrderGoodsModel OrderGoodsModel,Model model) {

		List<OrderGoodsModel> list = orderGoodService.selectModel(OrderGoodsModel);
		for( OrderGoodsModel a:list) {
			 int sum0=Integer.parseInt(a.getNum())*Integer.parseInt(a.getPrice());
			a.setSum(sum0+"");
		}
		model.addAttribute("list",list);
		return "customer/ordercar/orderGoods";
	}
	
	
}
