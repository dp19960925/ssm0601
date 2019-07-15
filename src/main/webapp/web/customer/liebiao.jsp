<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<!-- saved from location=(0068)http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/liebiao.html -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>华为商品列表</title>
<link rel="stylesheet" type="text/css" href="/ssm0601/web/common/css/style2.css">


<%-- <%@   include file="/web/header.jsp"%> --%>
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
	
	
	<div class="danpin center">
			
			<div class="biaoti center"></div>
			<div class="main center" id='main'>
				
		
				
				
			</div>
		</div>
		<div class="clear"></div>
	<input type="hidden"  id="pi" name="pageIndex" value="1" /> <input
			type="hidden"   id="pl" name="pageLimit" value="10" />
				<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	<script type="text/javascript">
var name='<%=request.getParameter("name")==null?"":request.getParameter("name")%>';


 refresh();
 function refresh(){
 	 var pageIndex=$("#pi").val();
 	 var pageLimit=$("#pl").val();
		$.ajax({
			type : "post",
			url : '/ssm0601/goods/search1.do',
			dataType : "json",
			data : {
				name : name,pageIndex:pageIndex,pageLimit:pageLimit
			}, //data发送到服务器
           
			success : function(data) {
				var curr = $("input[name='pageIndex']").val();
		var limit = $("input[name='pageLimit']").val();
		setPageInfo('pageInfoUser',data.count,curr,limit,
				function(obj, first) {
					$("input[name='pageIndex']").val(obj.curr);
					$("input[name='pageLimit']").val(obj.limit);
					if (!first) {
						refresh();
					}//首次不执行
				})
				var html = "";
				$.each(data.list, function(i, dom) {
					var location = dom.location ? dom.location : '';
					var code = dom.code ? dom.code : '';
					var price = dom.price ? dom.price : '';
					var des = dom.des;
					var name = dom.name
					var d = {
						location : location,
						code : code,
						des : des,
						price : price,
						name : name
					};
					var laytpl = layui.laytpl;
					var ht = $("#addit").html()
					var st = laytpl(ht).render(d)
				    html+= st;
					
				});
				$("#main").html(html);
			}
		});
 }
	</script>
	<script type="text/html" id="addit">

<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<div class="sub_mingxing"><a href="/ssm0601/web/customer/xiangqing.jsp?code={{d.code}}" ><img src="/tupian/{{d.location}}" alt=""></a></div>
					<div class="pinpai"><a href="/ssm0601/web/customer/xiangqing.jsp?code={{d.code}}" >{{d.name}}</a></div>
					<div class="youhui">{{d.des}}</div>
					<div class="jiage">{{d.price}}元</div>
				</div>



	</script>

</body>
	<%@ include file="/web/customer/footer.jsp"%>
</html>