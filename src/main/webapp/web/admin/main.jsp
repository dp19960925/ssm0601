<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/web/public/header.jsp" %>
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>维护中心</title>
<link rel="stylesheet" type="text/css" href='/ssm0601/layui/css/layui.css'>
<script type="text/javascript" src='/ssm0601/layui/layui.js'></script> 
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
	  <div class="layui-header">
	    <div class="layui-logo">商城维护</div>
	    <!-- 头部区域（可配合layui已有的水平导航） -->
	   
	    <ul class="layui-nav layui-layout-right">
	      <li class="layui-nav-item">
	        <a href="javascript:;">          
	        <label>管理员</label>
	        </a>
	      </li>
	      <li class="layui-nav-item"><a href="javascript:goLogout('admin');">注销</a></li>
	    </ul>
	  </div>
	  
	  <div class="layui-side layui-bg-black">
	    <div class="layui-side-scroll">
	      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
	      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
	        <li class="layui-nav-item layui-nav-itemed">
	          <a class="" href="javascript:;">信息维护</a>
	          <dl class="layui-nav-child">
	            <dd><a href="javascript:openUrl('/ssm0601/web/admin/user/userlist.jsp');">用户信息维护</a></dd>
	            <dd><a href="javascript:openUrl('/ssm0601/web/admin/goodsclass/classlist.jsp');">商品分类维护</a></dd>
	            <dd><a href="javascript:openUrl('/ssm0601/web/admin/goodsinfor/goodslist.jsp');">商品信息维护</a></dd>
	             <dd><a href="javascript:openUrl('/ssm0601/web/admin/order/orderlist.jsp');">订单信息维护</a></dd>
	          </dl>
	        </li>
	       
	      </ul>
	    </div>
	  </div>
	  
	  <div class="layui-body ">
	    <!-- 内容主体区域 -->
		<iframe src='/ssm0601/web/admin/user/userlist.jsp' width="99%" height="99%" name="aaa"></iframe>
	  
	  </div>
	  
	  </div>
	
	<script type="text/javascript">
	//JavaScript代码区域

	function openUrl(url){
		window.open(url,'aaa')
	}
	layui.use('element', function(){
	  var element = layui.element;
	  
	});
	</script>
</body>
</html>