package com.st.dp.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.dp.goods.model.ClassModel;
import com.st.dp.goods.service.impl.ClassService;


@Controller
@RequestMapping("/class")
public class ClassController {
	@Autowired
	private ClassService classService;
	
	//查询
		@ResponseBody 
		@RequestMapping("/search")
		private Map<String, Object> getList(ClassModel userModel,String pageIndex,String pageLimit) {
		
			userModel.setCode("%" + userModel.getCode() + "%");
			userModel.setName("%" + userModel.getName() + "%");
			userModel.setParcode("%" + userModel.getParcode() + "%");
			userModel.setDes("%" + userModel.getDes() + "%");
	        userModel.setPageOn(true);
//	       userModel.setRowStart(userModel.getRowStart());
//	        userModel.setPageIndex(Integer.parseInt(pageIndex));
//	        userModel.setPageLimit(Integer.parseInt(pageLimit));
	        List<ClassModel> list = classService.selectList(userModel);
	      
	        Map<String, Object> map = new HashMap<>();
	        map.put("list", list);
	        map.put("count", classService.selectCount(userModel));
	        return map;
	    }
	
	//分类下拉框回显
		
	@ResponseBody
	@RequestMapping("/getall")
	private List<ClassModel> getall(String code) {
		return classService.select12(code);
	}
	//单个回显(用于修改)
		@RequestMapping("/getupd")
		private String getUpd(String code,Model model) {
			//按code查找 并放到域中
			model.addAttribute("updClass", classService.selectCode(code));
			return "/admin/goodsclass/addOrUpd";
		}
	
	//添加或修改
		@ResponseBody
		@RequestMapping("/addorupd")
		private String addOrUpd(ClassModel classModel) {
			//先通过id判断添加或修改
			if(classModel.getId()==null) {//添加
				return classService.insert(classModel)+"";
			}else {//修改
				return classService.update(classModel)+"";
			}
		}
	//主键删除
		@ResponseBody
		@RequestMapping("/del")
		private String delete(String code) {
			return classService.delete(code);
		}
}
