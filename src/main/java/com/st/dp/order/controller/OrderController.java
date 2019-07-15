package com.st.dp.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.dp.goods.model.GoodsModel;
import com.st.dp.goods.service.impl.GoodsService;
import com.st.dp.order.model.OrderCarModel;
import com.st.dp.order.model.OrderGoodsModel;
import com.st.dp.order.model.OrderModel;
import com.st.dp.order.service.impl.OrderCarServiceImpl;
import com.st.dp.order.service.impl.OrderGoodsServiceImpl;
import com.st.dp.order.service.impl.OrderServiceImpl;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderServiceImpl orderService;	
	
	@Autowired
	private OrderCarServiceImpl orderCarService;	
	
	@Autowired
	private OrderGoodsServiceImpl orderGoodService;	
	
	@Autowired
	private GoodsService goodsService;
	
	//查询
		@ResponseBody 
		@RequestMapping("/search")
		private Map<String, Object> getList(OrderModel userModel) {	
			userModel.setCode("%" + userModel.getCode() + "%");
			userModel.setUserCode("%" + userModel.getUserCode() + "%");			
	        userModel.setPageOn(true);
	        List<OrderModel> list = orderService.selectModel(userModel);
	        Map<String, Object> map = new HashMap<>();
	        map.put("list", list);
	        map.put("count", orderService.selectCount(userModel));
	        return map;
	    }

		//前台订单查询 根据usercode 还得分页
		@ResponseBody 
		@RequestMapping("/selectModel")
		private Map<String, Object> getList0(OrderModel userModel) {			
	        userModel.setPageOn(true);
	        List<OrderModel> list = orderService.selectModel(userModel);
	        Map<String, Object> map = new HashMap<>();
	        map.put("list", list);
	        map.put("count", orderService.selectCount(userModel));
	        return map;
	    }

		
		
		
		
		//查一个(回显)
		@ResponseBody 
		@RequestMapping("/searchmodel")
		private OrderModel getModel(String code) {
			return orderService.selectByCode(code);
		}
	//单个回显(用于修改)  数据初始化
		@RequestMapping("/Upd")
		private String getUpd(String code,Model model) {
			//按code查 找 并放到域中
			OrderModel dbmodel= orderService.selectByCode(code);
			model.addAttribute("updOrder", dbmodel);
			return "/admin/order/orderUpd";
		}
		

	//修改
		@ResponseBody
		@RequestMapping("/getupd")
		private String addOrUpd(OrderModel classModel) {
				return orderService.update(classModel)+"";

		}
	//主键删除
		@ResponseBody
		@RequestMapping("/del")
		private String delete(String code) {
			return orderService.delete(code)+"";
		}
		
		// 打开订单商品详情
//		@RequestMapping("/goods")
//		private String pic(String code, Model model) {
//			OrderModel im1 = orderService.selectCode(code);
//			model.addAttribute("key", im1);
//			return "admin/goodsinfor/informationPic";
//		}
		
		
		//前台的添加
		@ResponseBody
		@RequestMapping("/add")
		public int add(OrderModel OrderModel, String vids) {
			String[] ids = vids.split(",");
			//先得出    订单生成时间
			Date currentTime=new Date();//生成当前时间
			SimpleDateFormat fmt= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			OrderModel.setEntryTime(fmt.format(currentTime));
			
			//用订单时间的毫秒数作为订单号（永远不会重复）
			String code =currentTime.getTime()+"";
			System.out.println("订单号"+code);
			OrderModel.setCode(code);
			
//添加订单号对应的商品信息
//并删除购物车表对应信息：
			List<OrderCarModel> list = new ArrayList<>();
			for (int i = 0; i < ids.length; i++) {
				OrderCarModel model = orderCarService.selectById(Integer.parseInt(ids[i]));
				list.add(model);
				String goodsCode = model.getGoodsCode(); // 商品编号
				String num = model.getNum(); // 数量
				String price = model.getPrice();// 价格
				orderCarService.delete(model);
			//减掉库存：
				GoodsModel g=goodsService.selectCode(goodsCode);
				int stocka=Integer.parseInt(g.getStock());
				int stockb=Integer.parseInt(num);
				String stock=(stocka-stockb)+"";//更新后的库存
				g.setStock(stock);
				goodsService.update(g);
				
				
//				商品信息从购物车转移到订单，并删除购物车内容
				OrderGoodsModel om = new OrderGoodsModel();
				om.setGoodsCode(goodsCode);
				om.setOrderCode(code);
				om.setNum(num);
				om.setPrice(price);
				orderGoodService.insert(om);
			}
//添加订单信息：
			return orderService.insert(OrderModel);
		}
}		
