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
			<form class="layui-form layui-form-pane" lay-filter="updOrder" method="post"> 				
				<div class="layui-form-item">
				    <label class="layui-form-label">订单状态</label>
				    <div class="layui-input-block">
				      <input type="radio" name="state" value="未发货" ${updOrder.state=='未发货'?'checked':''} title='未发货'>
				      <input type="radio" name="state" value="已发货" ${updOrder.state=='已发货'?'checked':''} title='已发货'>
				      <input type="radio" name="state" value="已签收" ${updOrder.state=='已签收'?'checked':''} title='已签收'>
				    </div>
				    </div>
				    
				     <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" value='${updOrder.address}' lay-verify="required" placeholder="请输入地址" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
				<input type="hidden" name='code' value='${updOrder.code}'>	
				<div class="layui-form-item">
					<div class="layui-input-inline">
						<input value="确定" type="button"
							class="layui-btn"
							lay-submit lay-filter="addorupd" />
						<input value="重置" type="reset"
								class="layui-btn layui-btn-primary"/>
					</div>
				</div>	
					
			</form>								
		</div>	
		
		<script type="text/javascript">
		form.on('submit(addorupd)',function(data){
			console.log(data)			
			$.ajax({
				url:'/ssm0601/order/getupd.do',
				data:data.field,
				dataType:'text',
				type:'post',
				success: function(data){
					if(data==1){
					layer.msg('成功');
					  closeThis(2000);
					}else{
						layer.msg('失败');
					}
				}	
			})
		});
		form.render(); 
	</script>
</body>
</html>