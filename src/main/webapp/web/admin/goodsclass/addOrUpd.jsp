<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/web/public/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
	<div class="layui-field-box">			
			<form class="layui-form layui-form-pane" lay-filter="upduser" method="post">
			
				<div class="layui-form-item">
	   				 <label class="layui-form-label">所属分类</label>
	  				  <div class="layui-input-block">
	    				  <select name="parcode" lay-filter="aihao" ></select>
	   				 </div>
	  			</div>
				<div class="layui-form-item">
					<label class="layui-form-label">编号</label>
					<div class="layui-input-inline">
						<input type="text" name="code" value='${updClass.code}'
								class="layui-input"
								lay-verify="required"
								placeholder="请输入编号" require
								autocomplete="off">																		
					</div>
				</div>		
				<div class="layui-form-item" >
					<label class="layui-form-label">名称</label>
					<div class="layui-input-inline" >
						<input type="text" name="name" value='${updClass.name}'
								class="layui-input"
								lay-verify="required"
								placeholder="请输入名称" require
								autocomplete="off">																		
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">描述</label>
					<div class="layui-input-inline">
						<input type="text" name="des" value='${updClass.des}'
								class="layui-input"
								
								placeholder="请填写描述" require
								autocomplete="off">																		
					</div>
				</div>	
				
				<div class="layui-form-item">
					<div class="layui-input-inline">
						<input value="确定" type="button"
							class="layui-btn"
							lay-submit lay-filter="addorupd" />
						<input value="重置" type="reset"
								class="layui-btn layui-btn-primary"/>
					</div>
				</div>			
				<input type="hidden" name='id' value='${updClass.id}'>
			</form>								
		</div>	
<script type="text/javascript">
ajax('/class/getall.do',{code:'000'},'json',function(data){
	console.log(typeof data);
	var html='';
	$.each(data,function(i,d){
		html+=laytpl($('#opt').html()).render(d);
	})
	$("select[name='parcode']").html(html);
//		form.render();
	selected();
	form.render(); 
})	

function selected(){
	$("select[name='parcode']").val('${updClass.parcode}')
}

form.on('submit(addorupd)',function(data){
			console.log(data)			
			$.ajax({
				url:'/ssm0601/class/addorupd.do',
				data:data.field,
				dataType:'text',
				type:'post',
				success: function(data){
					if(data==1){
					layer.msg('成功');
					  closeThis(2000);
					}else if (data==0){
						layer.msg("编号已存在");
					}
					else{
						layer.msg('失败');
					}
				}	
			})
		});
		form.render(); 


</script>
<script type="text/html"  id='opt'>
		<option value='{{ d.code }}'>{{ d.name }}</option>
</script>
</body>
</html>