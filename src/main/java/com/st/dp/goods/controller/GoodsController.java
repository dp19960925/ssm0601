package com.st.dp.goods.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.dp.goods.model.ClassModel;
import com.st.dp.goods.model.GoodsModel;
import com.st.dp.goods.service.impl.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	//查询
		@ResponseBody 
		@RequestMapping("/search")
		private Map<String, Object> getList(GoodsModel userModel) {
		
			userModel.setCode("%" + userModel.getCode() + "%");
			userModel.setName("%" + userModel.getName() + "%");			
	        userModel.setPageOn(true);
//	       userModel.setRowStart(userModel.getRowStart());
//	        userModel.setPageIndex(Integer.parseInt(pageIndex));
//	        userModel.setPageLimit(Integer.parseInt(pageLimit));
	        List<GoodsModel> list = goodsService.selectList(userModel);
	      
	        Map<String, Object> map = new HashMap<>();
	        map.put("list", list);
	        map.put("count", goodsService.selectCount(userModel));
	        return map;
	    }
		//前台的查询
		@ResponseBody 
		@RequestMapping("/search1")
		private Map<String, Object> getList1(GoodsModel userModel) {
			userModel.setName("%" + userModel.getName() + "%");	
			userModel.setState("上架");
	        userModel.setPageOn(true);
	        System.out.println(userModel.getName());
	        List<GoodsModel> list = goodsService.selectList(userModel);
	      
	        Map<String, Object> map = new HashMap<>();
	        map.put("list", list);
	        map.put("count", goodsService.selectCount(userModel));
	        return map;
	    }
		//查一个
		@ResponseBody 
		@RequestMapping("/searchmodel")
		private GoodsModel getModel(String code) {
			return goodsService.selectCode(code);
		}
	//单个回显+下拉框(用于添加or修改)  数据初始化
		@RequestMapping("/getAddOrUpd")
		private String getUpd(String code,Model model) {
			//按code查 找 并放到域中
			GoodsModel dbmodel= goodsService.selectCode(code);
//			通过code的有无来判断是add还是upd
			model.addAttribute("updGoods",code==null?new GoodsModel():dbmodel);
			
			//下面是下拉框
			//一级分类的记录集合list从数据库获取出来，存到model中
			List l1=goodsService.select12("A0001");
			model.addAttribute("firstList",l1);
			//二级分类，根据dbmodel的一级分类来查询该一级分类下的全部二级分类的集合
			model.addAttribute("secondList",code==null?new ArrayList<>():goodsService.select12(dbmodel.getOnecode()));
			return "/admin/goodsinfor/addOrUpd";
		}
		
		//对二级分类下拉框的监听
		@ResponseBody
		@RequestMapping("/get2")
		private List<ClassModel> getall(String parentcode) {
			return goodsService.select12(parentcode);
		}
	//添加或修改
		@ResponseBody
		@RequestMapping("/addorupd")
		private String addOrUpd(GoodsModel classModel) {
			//先通过id判断添加或修改
			if(classModel.getId()==null) {//添加
				return goodsService.insert(classModel)+"";
			}else {//修改
				return goodsService.update(classModel)+"";
			}
		}
	//主键删除
		@ResponseBody
		@RequestMapping("/del")
		private String delete(String code) {
			return goodsService.delete(code);
		}
		
		// 打开上传图片
		@RequestMapping("/pic")
		private String pic(String code, Model model) {
			GoodsModel im1 = goodsService.selectCode(code);
			model.addAttribute("key", im1);
			return "admin/goodsinfor/informationPic";
		}

}
