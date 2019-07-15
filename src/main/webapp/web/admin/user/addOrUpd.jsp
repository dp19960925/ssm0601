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
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" value='${updUser.code}' lay-verify="required" placeholder="请输入账号" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
 		<div class="layui-form-item" id='abc'>
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="pass" value='${updUser.pass}' lay-verify="required" placeholder="请输入密码" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
				
			 <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" value='${updUser.name}' lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
				<div class="layui-form-item">
				    <label class="layui-form-label">管理员</label>
				    <div class="layui-input-block">
				      <input type="radio" name="isAdmin" value="0" ${updUser.isAdmin=='0'?'checked':''} title='是'>
				      <input type="radio" name="isAdmin" value="1" ${updUser.isAdmin=='1'?'checked':''} title='否'>
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
				<input type="hidden" name='id' value='${updUser.id}'>
			</form>								
		</div>	
		
		<script type="text/javascript">
		aaa()
		function aaa(){
			if('${updUser}'!=''){
				 $("#abc").html("");
				 $("input[name='code']").prop("readonly","readonly");
			}
		}
		
		
		form.on('submit(addorupd)',function(data){
			console.log(data)			
			$.ajax({
				url:'/ssm0601/user/addorupd.do',
				data:data.field,
				dataType:'text',
				type:'post',
				success: function(data){
					if(data==1){
					layer.msg('成功');
					  closeThis(2000);
					}else if (data==0){
						layer.msg("账号已存在");
					}
					else{
						layer.msg('失败');
					}
				}	
			})
		});
		form.render(); 
	</script>
</body>
</html>