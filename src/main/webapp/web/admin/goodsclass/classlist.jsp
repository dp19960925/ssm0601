<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/web/public/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<fieldset class="layui-elem-field window" 
				style="margin:20px; padding:20px;">
		<legend>商品分类操作</legend>
		<div class="layui-field-box">			
			<form class="layui-form layui-form-pane"  method="post">				
					<label class="layui-form-label">编号</label>				
						<input type="text" name="code"
								class="layui-input"
								line-height:30px;
								placeholder="请输入编号" require
								autocomplete="off">																		
												
					<label class="layui-form-label">名称</label>				
						<input type="text" name="name"
								class="layui-input"								
								placeholder="请输入名称" require
								autocomplete="off">		
								
									<label class="layui-form-label">上级编号</label>					
						<input type="text" name="parcode"
								class="layui-input"								
								placeholder="请输入上级编号" require
								autocomplete="off">			
								
								
									<label class="layui-form-label">描述</label>
						<input type="text" name="des"
								class="layui-input"								
								placeholder="请输入描述" require
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
							class="layui-btn" onclick="openClassAdd()"/>
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
	<col width="10%" ><col width="20%" ><col>
</colgroup>
	<thead>
		<tr>
		<td>序号</td><td>编号</td><td>名称</td><td>上级编号</td><td>描述</td><td>操作</td>
		</tr>
	</thead>
	<tbody id="class_tbody"></tbody>
</table>
<div id="pageInfoUser"
style="text-align:right;padding-right:30px"></div>		

<script type="text/javascript">
formSubmit('/class/search.do','submit(search)','json',
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
				        var parcode = dom.parcode?dom.parcode:'';
				        var des = dom.des?dom.des:'';
				        var d={i:(i+1+(curr-1)*limit),name:name,code:code,parcode:parcode,des:des
				        		};
				        html += getlaytpl('#tradd',d);// html += laytpl($("#tradd").html()).render(d);
				    });
				    $("#class_tbody").html(html);		
				    form.render();
});

refresh();
function refresh(){
    $("input[value='查询']").click();
}

// 以下都是用弹窗的形式打开新的网页
function openClassAdd(){
	openLayer('/web/admin/goodsclass/addOrUpd.jsp',refresh)
}
function openUserUpd(code){
	//先到后台取回显
	openLayer('/class/getupd.do?code='+code,refresh)
}

// function openPic(code){
//     openLayer('/web/system/employee/emppic.jsp?code='+code,refresh)
// }
function delUser(code){
	openConfirm(function(index){
		ajax('/class/del.do', {code:code}, 'text', function(data){
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
<td>{{ d.parcode }}</td><td>{{ d.des }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openUserUpd("{{ d.code }}")'/>&nbsp;
    <a href="javascript:delUser('{{ d.code }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
</td>
</tr>
</script>
</body>
</html>