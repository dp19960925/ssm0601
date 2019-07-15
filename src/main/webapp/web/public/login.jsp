<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/web/public/header.jsp" %>
<title>登录</title>
<style type="text/css">
.window{
	width:400px;
	position:center;	
	display:block;	

	padding :20 0;
}
.tab{
	
	background-image:url(/ssm0601/web/common/img/e3e54e37fc21283d752988ad2f0ac837_看图王.jpg);
	position:fixed;
  top: 0;
  left: 0;
  width:70%;
  height:80%;
  min-width: 900px;
  z-index:-10;
  zoom: 1;
  background-color: #fff;
  background-repeat: no-repeat;
  background-size: cover;
  -webkit-background-size: cover;
  -o-background-size: cover;
  background-position: center 0;
}
</style>
</head>
<body class="tab" >
		<fieldset class="layui-elem-field window " 
				style="margin:1px; padding:1px;border:none;">
		<legend>登录</legend>						
		<div class="layui-field-box ">			
			<form class="layui-form layui-form-pane"  method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">账号</label>
					<div class="layui-input-inline">
						<input type="text" name="code"
								class="layui-input" 
								lay-verify="required" style="width:150px;"
								placeholder="请输入账号" require
								autocomplete="off">																		
					</div>
				</div>		
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input type="password" name="pass"
								class="layui-input" 
								lay-verify="required" style="width:150px;"
								placeholder="请输入密码" require
								autocomplete="off">																		
					</div>
				</div>							
				<div class="layui-form-item">
					<img  class="layui-form-image" src="/ssm0601/user/authcode.do"
						onclick="this.src='/ssm0601/user/authcode.do?'+Math.random();"/>
					<div class="layui-input-inline">
						<input type="text" name="authCode"
								class="layui-input" 
								lay-verify="required"
								placeholder="请输入验证码" require
								autocomplete="off">																		
					</div>
				</div>	
				<div class="layui-form-item">
					<div class="layui-input-inline">
						<input value="登录" type="button"
							class="layui-btn"
							lay-submit lay-filter="login" />
						<input value="重置" type="reset"
								class="layui-btn layui-btn-primary"/>
					</div>
					<input value="返回注册" type="button"
							class="layui-btn" onclick="goJspReg()"/>
							
				</div>
				<input type="hidden" name="action" value="login"/>		
				<input type="hidden" name="isauth" value="true" />				
			</form>								
		</div>		
	</fieldset>
	<script type="text/javascript">
		form.on('submit(login)',function(data){
			console.log(data)
			$.ajax({
				url:'/ssm0601/user/login.do',
				data:data.field,
				dataType:'text', 
				type:'post',
				success: function(data){
					if(data==0){
						layer.msg('登录成功管理员');
						location.href ="/ssm0601/web/admin/main.jsp"
					}else if(data==1){
						layer.msg('登录成功顾客');
						location.href ="/ssm0601/web/customer/shouye.jsp"
					}else if (data==2){
						layer.msg("账号不存在");
					}else if(data==3){
						layer.msg("验证码错误");
					
					}else if(data==4){
						layer.msg('密码错误');
					}
				}	
			})
		});
	</script>
</body>
</html>