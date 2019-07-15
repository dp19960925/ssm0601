<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/web/public/header.jsp" %>
<title>注册</title>
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
<body class='tab'>
	<fieldset class="layui-elem-field window "
				style="margin:1px; padding:1px;border:none;">
		<legend>注册</legend>		
				
		<div class="layui-field-box">			
			<form class="layui-form layui-form-pane"  method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">账号</label>
					<div class="layui-input-inline">
						<input type="text" name="code"
								class="layui-input" style="width:150px;"
								lay-verify="required" 
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
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="name"
								class="layui-input" 
								lay-verify="required" style="width:150px;"
								placeholder="请输入用户名" require
								autocomplete="off">																		
					</div>
				</div>	
				<div class="layui-form-item">
					<img src="/ssm0601/user/authcode.do"
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
						<input value="注册" type="button"
							class="layui-btn"
							lay-submit lay-filter="reg" />
						<input value="重置" type="reset"
								class="layui-btn layui-btn-primary"/>
					</div>
					<input value="返回登录" type="button" 
							class="layui-btn" onclick="goJspLogin()"/>
				</div>			
			</form>								
		</div>		
	</fieldset>
	<script type="text/javascript">
		form.on('submit(reg)',function(data){
			console.log(data)			
			$.ajax({
				url:'/ssm0601/user/reg.do',
				data:data.field,
				dataType:'text',
				type:'post',
				success: function(data){
					console.log(data)
					if(data==1){
					layer.msg('注册成功');
					}else if (data==0){
						layer.msg("账号已存在");
					}else if(data==3){
						layer.msg("验证码错误");
					
					}else{
						layer.msg('注册失败');
					}
				}	
			})
		});
	</script>
	
</body>
</html>