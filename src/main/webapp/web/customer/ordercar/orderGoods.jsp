<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/public/header.jsp" %>
<title>商品维护</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>商品管理</legend>
		
	</fieldset>
<form class="layui-form">

	<br>
	<table class="layui-table">
		<tr>
		    <td>序号</td>
			<td>商品名称</td>
			<td>商品</td>
			<td>数量</td>
			<td>单价</td>
			<td>总计</td>

	
		</tr>

		<tbody id="tbody_id">				
			<c:forEach items="${list}" var="W" varStatus="WW">
                    
             <tr>
             <td>${W.id}</td>
		    <td>${W.goodsName}</td>
		    <td><img src="/tupian/${W.location} " alt=" ${W.location}" class="layui-upload-img"></td>
			<td>${W.num}</td>
			<td>${W.price}</td>
			<td>${W.sum}</td>
		
		</tr> 
                                 
               </c:forEach>
		
		
		
		</tbody>
	</table>
</form>

<script type="text/javascript">
form.render();//渲染一下
</script>
</body>
</html>