package com.st.dp.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.dp.order.model.OrderCarModel;
import com.st.dp.order.service.IOrderCarService;




@Controller
@RequestMapping("/orderCar")
public class OrderCarController {

	@Autowired
	private IOrderCarService  service;

	//添加购物车
	@ResponseBody
	@RequestMapping("/add")
	public int add(OrderCarModel OrderCarModel) {							    
  return service.insert(OrderCarModel);

	} 
	
	
	
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(OrderCarModel OrderCarModel, Model model) {
	   System.out.println("执行delete:"+OrderCarModel);
		
	    return  service.delete(OrderCarModel);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public int update(OrderCarModel OrderCarModel) {
	  
		
		System.out.println("执行UPDATE"+OrderCarModel);
	    return  service.update(OrderCarModel);
		
	}
	
	@ResponseBody
	@RequestMapping("/selectById")
	private OrderCarModel selectById(OrderCarModel OrderCarModel) {
		System.out.println("执行selectById"+OrderCarModel.getId());
		OrderCarModel um = service.selectById(OrderCarModel.getId());
		return um;
	}
	
	@ResponseBody
	@RequestMapping("/selectAll")
	private List<OrderCarModel> selectAll(OrderCarModel OrderCarModel) {
		System.out.println("+++"+OrderCarModel);
		List<OrderCarModel> list = service.selectAll(OrderCarModel);
		return list;
	}
	//查订单 （分页）
	@ResponseBody
	@RequestMapping("/selectModel")
	private Map<String,Object> selectModel(OrderCarModel OrderCarModel) {
		OrderCarModel.setPageOn(true);
		List<OrderCarModel> list = service.selectModel(OrderCarModel);
		
	    Map<String,Object> map=new HashMap<>();
	    map.put("list", list);
	   
	    map.put("count", service.selectCount(OrderCarModel));
	   
		
		
		return map;
	}
	@RequestMapping("/upuser")
	private String upuser(OrderCarModel OrderCarModel,Model model) {
		System.out.println("执行selectByCode"+OrderCarModel);
		OrderCarModel um = service.selectById(OrderCarModel.getId());
		model.addAttribute("user",um);
		
		return "order/car/userupd";
	}
	
	
}
