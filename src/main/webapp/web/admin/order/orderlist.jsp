<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/web/public/header.jsp" %>
<title>订单信息</title>
</head>
<body>
<fieldset class="layui-elem-field window" 
				style="margin:20px; padding:20px;">
		<legend>订单信息操作</legend>
		<div class="layui-field-box">			
			<form class="layui-form layui-form-pane"  method="post">				
					<label class="layui-form-label">订单号</label>				
						<input type="text" name="code"
								class="layui-input"
								line-height:30px;
								placeholder="请输入订单号" require
								autocomplete="off">																		
												
					<label class="layui-form-label">用户编号</label>				
						<input type="text" name="userCode"
								class="layui-input"								
								placeholder="请输入用户名" require
								autocomplete="off">																			
					
					<div class="layui-form-item">
					<div class="layui-input-inline">
						<input value="查询" type="button"
							class="layui-btn"
							lay-submit lay-filter="search" />
						<input value="重置" type="reset"
								class="layui-btn layui-btn-primary"/>
					</div>
<!-- 					<input value="添加" type="button" -->
<!-- 							class="layui-btn" onclick="openGoodsAdd()"/> -->
				</div>
				<input type="hidden" name="pageIndex" value="1"/>
				<input type="hidden" name="pageLimit" value="10"/>							
			</form>
		</div>		
</fieldset>	

<table class="layui-table">
<colgroup>
	<col width="10%" ><col width="10%" ><col width="10%" >
	<col width="10%" ><col width="10%" ><col width="10%" >
	<col width="10%" ><col width="10%" ><col width="20%" ><col>
</colgroup>
	<thead>
		<tr>
		<td>序号</td><td>订单号</td><td>用户编号</td><td>用户名</td><td>时间</td>
		<td>收货地址</td><td>状态</td><td>操作</td>
		</tr>
	</thead>
	<tbody id="goods_tbody"></tbody>
</table>
<div id="pageInfoUser"
style="text-align:right;padding-right:30px"></div>		

<script type="text/javascript">
formSubmit('/order/search.do','submit(search)','json',
		function(data){
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
				    $("#goods_tbody").html(html);		
				    form.render();
}
);

refresh();
function refresh(){
    $("input[value='查询']").click();
}

// 以下都是用弹窗的形式打开新的网页
// function openGoodsAdd(){
// 	openLayer('/goods/getAddOrUpd.do',refresh)
// }
function openUserUpd(code){
	//先到后台取回显
	openLayer('/order/Upd.do?code='+code,refresh)
}
//商品详情预览
function openGoods(code){
	openLayer('/orderGoods/upGoods2.do?orderCode='+code,refresh)
}
 function delUser(code){
 	openConfirm(function(index){
		ajax('/order/del.do', {code:code}, 'text', function(data){
 	        if (data == 1) {
 	            layer.msg('删除成功');
 	            $("input[name='pageIndex']").val(1);
 	            refresh();
 	        }else{
             	layer.msg('删除失败');
             }
	    })
 	})
 }
<!-- </script> -->
<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.code }}</td><td>{{ d.usercode }}</td><td>{{ d.name }}</td>
<td>{{ d.time }}</td><td>{{ d.address }}</td><td>{{ d.state }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openUserUpd("{{ d.code }}")'/>&nbsp;
    <a href="javascript:delUser('{{ d.code }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;   
	<input type='button' value='订单商品详情' class='layui-btn' 
           onclick='openGoods("{{ d.code }}")'/>&nbsp;
</td>
</tr>
</script>
</body>
</html>