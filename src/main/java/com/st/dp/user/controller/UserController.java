package com.st.dp.user.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.st.dp.user.model.UserModel;
import com.st.dp.user.service.impl.UserService;



@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private  UserService userService;
	
	//验证码初始化配置
	private static Random r 					=new Random();
	private static char[] chs				 ="1234567890".toCharArray();
	private static int  NUMBER_OF_CHS=4;
	private static int IMG_WIDTH=75;
	private static int IMG_HEIGHT=35;
	//验证码刷新
	@ResponseBody 
	@RequestMapping("/authcode")
	private void authCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BufferedImage image = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, BufferedImage.TYPE_INT_RGB); // 实例化BufferedImage
        // Graphics2D g = (Graphics2D) image.getGraphics();
        Graphics2D g = image.createGraphics();
        g.setColor(new Color(200, 200, 255));// 验证码图片的背景颜色
        g.fillRect(0, 0, IMG_WIDTH, IMG_HEIGHT); // 图片的边框
        g.setFont(new Font("隶书", Font.BOLD, 20));// 设定字体

        StringBuffer sb = new StringBuffer(); // 用于保存验证码字符串
        for (int i = 0; i < NUMBER_OF_CHS; i++) {
            int index = r.nextInt(chs.length); // 随机一个下标
            g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255))); // 随机一个颜色
            g.drawString(chs[index] + "", 15 * i + 3, 18); // 画出字符
            sb.append(chs[index]); // 验证码字符串
        }       
        request.getSession().setAttribute("authCode", sb.toString()); // 将验证码字符串保存到session中
        ImageIO.write(image, "jpg", response.getOutputStream()); // 向页面输出图像
	}

 	//验证码核对
    private String isAuthCode(HttpServletRequest request) {
        Object authCode = request.getSession().getAttribute("authCode");           
        return authCode.toString();
    }
	
	@ResponseBody 
	@RequestMapping("/reg")
	public String reg(UserModel userModel,String authCode,HttpServletRequest request) {
		//注册默认为顾客
		userModel.setIsAdmin("1");
		
		//先判断验证码
		if(!isAuthCode(request).equalsIgnoreCase(authCode)) {
			return "3";
		}		
		return userService.insert(userModel)+"";
	}
	
	@ResponseBody 
	@RequestMapping("/login")
	public String login(UserModel userModel,String authCode,HttpServletRequest request) {
		//先判断验证码
		if(!isAuthCode(request).equalsIgnoreCase(authCode)) {
			return "3";
		}			
		System.out.println(userModel.getIsAdmin()+"啊");
		return userService.login(userModel,request);
	}
	//查询
	@ResponseBody 
	@RequestMapping("/search")
	private Map<String, Object> getList(UserModel userModel) {
		userModel.setCode("%" + userModel.getCode() + "%");
		userModel.setName("%" + userModel.getName() + "%");
        userModel.setPageOn(true);
        List<UserModel> list = userService.selectList(userModel);
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("count", userService.selectCount(userModel));
        return map;
    }
	
	//主键删除
	@ResponseBody
	@RequestMapping("/del")
	private String delete(String code) {
		return userService.delete(code);
	}
	//单个回显(用于修改)
	@RequestMapping("/getupd")
	private String getUpd(String code,Model model) {
		//按code查找 并放到域中
		model.addAttribute("updUser", userService.selectCode(code));
		return "/admin/user/addOrUpd";
	}
	//添加或修改
	@ResponseBody
	@RequestMapping("/addorupd")
	private String addOrUpd(UserModel userModel) {
		//先通过id判断添加或修改
		if(userModel.getId()==null) {//添加
			return userService.insert(userModel)+"";
		}else {//修改
			return userService.update(userModel)+"";
		}
	}
	@ResponseBody
	@RequestMapping("/pass")
	private String pass(UserModel userModel) {
		return userService.update(userModel);
	}
	
	
	//注销
	@RequestMapping("/goOut")
	public String goOut(String name,HttpServletRequest request) {
		request.getSession().removeAttribute(name);
		return "public/login";
	}
}
