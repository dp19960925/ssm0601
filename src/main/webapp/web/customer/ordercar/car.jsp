<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="/ssm0601/web/common/css/static/css/main.css">
<link rel="stylesheet" type="text/css" href="/ssm0601/layui/css/layui.css">
<script type="text/javascript" src="/ssm0601/layui/layui.js"></script>
<script type="text/javascript" src="/ssm0601/layui/layui.all.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" type="text/css" href="/ssm0601/web/common/css/style2.css">

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
	

	<div class="content content-nav-base shopcart-content">
		<div class="cart w1200">
			<div class="cart-table-th">
				<div class="th th-chk">
					<div class="select-all">
						<div class="cart-checkbox">
							<input class="check-all check" id="allCheckked" type="checkbox"
								value="true">
						</div>
						<label>&nbsp;&nbsp;全选</label>
					</div>
				</div>
				<div class="th th-item">
					<div class="th-inner">商品</div>
				</div>
				<div class="th th-price">
					<div class="th-inner">单价</div>
				</div>
				<div class="th th-amount">
					<div class="th-inner">数量</div>
				</div>
				<div class="th th-sum">
					<div class="th-inner">小计</div>
				</div>
				<div class="th th-op">
					<div class="th-inner">操作</div>
				</div>
			</div>
			<div class="OrderList">
				<div class="order-content" id="list-cont"></div>
			</div>

			<div class="FloatBarHolder layui-clear">
				<div class="th th-chk">
					<div class="select-all">
						<div class="cart-checkbox">
							<input class="check-all check" id="" name="" type="checkbox"
								value="true">
						</div>
						<label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件
						</label>
					</div>
				</div>
				<div class="th batch-deletion">
					<span class="batch-dele-btn">批量删除</span>
				</div>
				<div class="th Settlement">
					<button class="layui-btn" onclick="add()">结算</button>
				</div>
				<div class="th total">
					<p>
						应付：<span class="pieces-total">0</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/html" id="addit">
       <ul class="item-content layui-clear">
            <li class="th th-chk">
              <div class="select-all">
                <div class="cart-checkbox">
                  <input class="CheckBoxShop check" id="check" type="checkbox" num="all" name="select-all" value="{{d.id}}">
                </div>
              </div>
            </li>
            <li class="th th-item">
              <div class="item-cont">
                <a href="javascript:;"><img src="/tupian/{{d.location}}" alt=""></a>
                <div class="text">
                  <div class="title">{{d.name}}</div>
					<div>{{d.id}}</div>
                  <p><span>{{d.name}}</span>  <span></span>cm</p>
                </div>
              </div>
            </li>
            <li class="th th-price">
              <span class="th-su">{{d.price}}</span>
            </li>
            <li class="th th-amount">
              <div class="box-btn layui-clear">
                <div class="less layui-btn">-</div>
                <input class="Quantity-input" type="" name="{{d.id}}" value="{{d.num}}" disabled="disabled">
                <div class="add layui-btn">+</div>
              </div>
            </li>
            <li class="th th-sum">
              <span class="sum">{{d.total}}</span>
            </li>
            <li class="th th-op">
              <span class="dele-btn" >删除</span>
            </li>
          </ul>
	</script>
	<script type="text/javascript" src="/ssm0601/web/common/css/static/js/util/car.js"></script>
	
	<script type="text/javascript">
	aa()
	function aa(){
    	var car = layui.car;
	
  	 var userCode='${yonghu.code}';
// 	var userCode='b001';

  	
	$.ajax({
		type : "post",
		url : con.app + "/orderCar/selectModel.do",
		dataType : "json",
		data : {
			userCode : userCode
		}, //data发送到服务器

		success : function(data) {
			var html = "";
			$.each(data.list, function(i, dom) {
				var id = dom.id ? dom.id : '';
				var location = dom.location ? dom.location : '';
				var num = dom.num;
				var price = dom.price ? dom.price : '';
				var name = dom.name;
				var total = dom.total;
				var d = {
					location : location,
				    num:  num,
					price : price,
					name : name,
					id:id,
					total:total
				};
				
				var laytpl = layui.laytpl;
				var ht = $("#addit").html()
				var st = laytpl(ht).render(d)
				$("#list-cont").append(st);
			});
			car.init();
		}
	});
	}

</script>

	<script type="text/javascript">
function add(){
//*******************
// 	把选择的信息s以数组的方式传到下个界面
//**********************

	var quanxuan=$("input[name='select-all']:checked");
	var ids=[];

	quanxuan.each(function(index,dom){
		ids.push($(this).val());
		
	})
	if(ids.length==0){//说明一个都没选中
		layer.msg('请您选择商品');
		return;
	}
	//将数组传到下个页面
	location.href= con.app+"/web/customer/ordercar/car2.jsp?ids="+ids;
}

</script>
</body>
<%@ include file="/web/customer/footer.jsp"%>
</html>