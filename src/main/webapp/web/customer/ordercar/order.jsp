<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>我的订单</title>
<link rel="stylesheet" type="text/css" href="/ssm0601/web/common/css/style.css">

</head>
<%@ include file="/web/customer/head.jsp"%>
<body>
	<!-- start banner_x -->
	<div class="banner_x center">
				
		<div class="nav fl">
				<ul>
						<li><a href="/ssm0601/web/customer/shouye.jsp" >
									<img src="/ssm0601/华为商城img/logo.png " style="width: 200px;height:70px"/>
									</a>
									</li>
					<li><a href="/ssm0601/web/customer/liebiao.jsp?name=华为" target="_blank">华为专区</a></li>
					<li>|</li>
					<li><a href="/ssm0601/web/customer/liebiao.jsp?name=荣耀">荣耀专区</a></li>
					<li>||</li>
					<li><a href="/ssm0601/web/customer/liebiao.jsp?name=手机">手机</a></li>
					<li><a href="/ssm0601/web/customer/liebiao.jsp?name=笔记本">笔记本</a></li>
					<li><a href="/ssm0601/web/customer/liebiao.jsp?name=平板">平板</a></li>
					<li><a href="/ssm0601/web/customer/liebiao.jsp?name=watch">watch</a></li>
					<li><a href="/ssm0601/web/customer/liebiao.jsp?name=手环">手环</a></li>
					<li><a href="/ssm0601/web/customer/liebiao.jsp?name=路由">路由</a></li>
				</ul>
			</div>
		<div class="search fr">
			<form action="/ssm0601/web/customer/liebiao.jsp" method="get">
				<div class="text fl">
					<input type="text" class="shuru"  name="name" placeholder="荣耀20&nbsp;华为P30现货">
				</div> 
				<div class="submit fl">
					<input type="submit" class="sousuo" value="搜索">
				</div>
				<div class="clear"></div>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	


		<input type="hidden"  id="pi" name="pageIndex" value="1" /> <input
			type="hidden"   id="pl" name="pageLimit" value="10" />
<!-- <div style="float: right;"> -->
<table class="layui-table">
		<tr>
			<td>序号</td>
			<td>订单编号</td>
			<td>用户编号</td>
			<td>用户昵称</td>
			
			<td>时间</td>
           <td>收货地址</td>
			<td>状态</td>
           <td>商品详情</td>
		</tr>

		<tbody id="tbody_id">
		</tbody>
	</table>
<!-- 	</div> -->
	
<!-- 	<div  > -->
<!-- <ul> -->

<!-- <li>地址管理</li> -->
<!-- <li>个人信息管理</li> -->
<!-- </ul> -->

<!--  </div> -->
	
	
	<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>


<script type="text/javascript" src="/ssm0601/web/common/css/static/js/util/car.js"></script>
<script type="text/javascript">

 var userCode='${yonghu.code}';
// alert(userCode)
refresh();
function refresh(){
	 var pageIndex=$("#pi").val();
	 var pageLimit=$("#pl").val();
$.ajax({
	type : "post",
	url : con.app
			+ "/order/selectModel.do",
	dataType : "json",
	data : {pageIndex:pageIndex,  pageLimit:pageLimit,  userCode : userCode}, //data发送到服务器

	success : function(data) {
		var curr =$("input[name='pageIndex']").val();
		var limit =$("input[name='pageLimit']").val();
		setPageInfo('pageInfoUser',data.count,curr,limit,
				function(obj,first){
			$("input[name='pageIndex']").val(obj.curr);
			$("input[name='pageLimit']").val(obj.limit);
			if(!first){refresh();}//首次不执行						
		})
		   var html = "" ;//加载表格中数据
	    $.each(data.list,function(i, dom) {
	    	var code = dom.code?dom.code:'';
	    	var usercode = dom.userCode?dom.userCode:'';
	        var name = dom.userName?dom.userName:'';
	        var time = dom.entryTime?dom.entryTime:'';
	        var address = dom.address?dom.address:'';
	        var state = dom.state?dom.state:'';
	        var d={i:(i+1+(curr-1)*limit),name:name,code:code,usercode:usercode,
	        		time:time,address:address,state:state
	        };
	        html += getlaytpl('#tradd',d);// html += laytpl($("#tradd").html()).render(d);
	    });
	    $("#tbody_id").html(html);		
	    form.render();
	}
});
}
function openGoods(code){
	// alert(code)
	openLayer('/orderGoods/upGoods2.do?orderCode='+code,refresh)

}
</script>

<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.code }}</td><td>{{ d.usercode }}</td><td>{{ d.name }}</td>
<td>{{ d.time }}</td><td>{{ d.address }}</td><td>{{ d.state }}</td>
<td>   
	<input type='button' value='订单商品详情' class='layui-btn' 
           onclick='openGoods("{{ d.code }}")'/>&nbsp;
</td>
</tr>
</script>


</body>
<%@ include file="/web/customer/footer.jsp"%>
</html>