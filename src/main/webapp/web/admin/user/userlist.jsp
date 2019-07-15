<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/web/public/header.jsp" %>
<title></title>
<style type="text/css">
.window{
	width:400px;
	position:center;	
	display:block;	

	padding :20 0;
}
</style>
</head>
<body>
<fieldset class="layui-elem-field window" 
				style="margin:20px; padding:20px;">
		<legend>用户信息操作</legend>
		<div class="layui-field-box">			
			<form class="layui-form layui-form-pane"  method="post">				
					<label class="layui-form-label">账号</label>
				
						<input type="text" name="code"
								class="layui-input"
								line-height:30px;
								placeholder="请输入账号" require
								autocomplete="off">																		
												
					<label class="layui-form-label">姓名</label>
					
						<input type="text" name="name"
								class="layui-input"
								
								placeholder="请输入姓名" require
								autocomplete="off">																		
					
					<div class="layui-form-item">
					<div class="layui-input-inline">
						<input value="查询" type="button"
							class="layui-btn"
							lay-submit lay-filter="search" />
						<input value="重置" type="reset"
								class="layui-btn layui-btn-primary"/>
					</div>
					<input value="添加" type="button"
							class="layui-btn" onclick="openUserAdd()"/>
				</div>
				<input type="hidden" name="action" value="list"/>
				<input type="hidden" name="pageIndex" value="1"/>
				<input type="hidden" name="pageLimit" value="10"/>							
			</form>
		</div>		
</fieldset>	

<table class="layui-table">
<colgroup>
	<col width="10%" ><col width="10%" ><col width="10%" >
	<col width="10%" ><col width="10%" ><col><col>
</colgroup>
	<thead>
		<tr>
		<td>序号</td><td>账号</td><td>姓名</td><td>操作</td>
		</tr>
	</thead>
	<tbody id="user_tbody"></tbody>
</table>
<div id="pageInfoUser"
style="text-align:right;padding-right:30px"></div>		


<script type="text/javascript">
formSubmit('/user/search.do','submit(search)','json',
		function(data){
					console.log(data)
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
				        var name = dom.name?dom.name:'';		 
				        var d={i:(i+1+(curr-1)*limit),name:name,code:code
				        		};
				        html += getlaytpl('#tradd',d);// html += laytpl($("#tradd").html()).render(d);
				    });
				    $("#user_tbody").html(html);			
});

refresh();
function refresh(){
    $("input[value='查询']").click();
}

// 以下都是用弹窗的形式打开新的网页
function openUserAdd(){
	openLayer('/web/admin/user/addOrUpd.jsp',refresh)
}
function openUserUpd(code){
	//先到后台取回显
	openLayer('/user/getupd.do?code='+code,refresh)
}
function openUserPas(code){
    openLayer('/web/admin/user/pass.jsp?code='+code,refresh)
}
// function openPic(code){
//     openLayer('/web/system/employee/emppic.jsp?code='+code,refresh)
// }
function delUser(code){
	openConfirm(function(index){
		ajax('/user/del.do', {code:code}, 'text', function(data){
	        if (data == 1) {
	            layer.msg('删除成功');
	            $("input[name='pageIndex']").val(1);
	            refresh();
	        } else if (data == 2){
	            layer.msg('删除失败--管理员账号不允许删除');
	        }else{
            	layer.msg('删除失败');
            }
	    })
	})
}
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.code }}</td><td>{{ d.name }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openUserUpd("{{ d.code }}")'/>&nbsp;
    <a href="javascript:delUser('{{ d.code }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
    <input type='button' class='layui-btn' value='重置密码' 
           onclick='openUserPas("{{ d.code }}")'/>
	<input type='button' class='layui-btn' value='更改头像' 
           onclick='openPic("{{ d.code }}")'/>
</td>
</tr>
</script>
</body>
</html>