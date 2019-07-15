<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>head</title>
<link rel="stylesheet" type="text/css" href="/ssm0601/web/common/css/style.css">
<%@ include file="/web/public/header.jsp" %>
</head>
<body>
	<header>
		<div class="top center">
			<div class="left fl">
				<ul>
					<li><a href="/ssm0601/web/customer/shouye.jsp" >华为商城</a></li>
					<li>|</li>
					<li><a href="">花粉俱乐部</a></li>
					<li>|</li>
					<li><a href="">EMUI</a></li>
					<li>|</li>
					<li><a href="">游戏</a></li>
					<li>|</li>
					<li><a href="">阅读</a></li>
					<li>|</li>
					<li><a href="">云服务</a></li>
					<li>|</li>
					<li><a href="">金融</a></li>
					<li>|</li>
					<li><a href="">华为商城移动版</a></li>
					<li>|</li>
					<li><a href="">问题反馈</a></li>
					<li>|</li>
					<li><a href="">Select Region</a></li>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="right fr">
				<div class="gouwuche fr">
					<a href="javascript:gwc()">购物车</a>
				</div>
				<div class="fr">
					

					<ul>
					<c:if test="${empty yonghu}" var="var01" scope="page">
						<li><a
							href="/ssm0601/web/public/login.jsp"
							>登录</a>
						
							</li>
						<li>|</li>
						<li><a
							href="/ssm0601/web/public/reg.jsp"
							>注册</a></li>
						<li>|</li>
						<li><a href="">消息通知</a></li>
					</c:if>
					<c:if test="${!empty yonghu}" var="var01" scope="page">

						<li>
							<a href="#"> ${yonghu.name}</a>
					</li>
					<li>|</li>
						<li>
							<a href="/ssm0601/web/customer/ordercar/order.jsp">我的订单</a>
						</li>
					<li>|</li>
						<li>
							<a href="javascript: goLogout('yonghu')">注销</a>
						</li>

					</c:if>					
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</header>
	<!--end header -->
	
<script type="text/javascript">
function gwc(){
	if(${empty yonghu}){
		alert('请先登录')
		return;
	}
	window.location.href = "/ssm0601/web/customer/ordercar/car.jsp";
}
 </script> 
</body>
</html>