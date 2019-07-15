<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
   <%@ taglib prefix="c"
   uri="http://java.sun.com/jsp/jstl/core"%>
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
	   				 <label class="layui-form-label">一级分类</label>
	  				  <div class="layui-input-block">
	    				  <select name="onecode"  lay-filter="onecode" >
	    				  <c:forEach   items="${firstList}"    var="it">
	    				  <option value='${it.code }'>${it.name }</option>
	    				  </c:forEach>
	    				  </select>
	   				 </div>
	  			</div>
	  			<div class="layui-form-item">
	   				 <label class="layui-form-label">二级分类</label>
	  				  <div class="layui-input-block">
	    				  <select name="classcode"  >
	    				   <c:forEach   items="${secondList}"    var="it2">
	    				  <option value='${it2.code }'>${it2.name }</option>
	    				  </c:forEach>
	    				  </select>
	   				 </div>
	  			</div>
	  			
				<div class="layui-form-item">
					<label class="layui-form-label">编码</label>
					<div class="layui-input-inline">
						<input type="text" name="code" value='${updGoods.code}'
								class="layui-input"
								lay-verify="required"
								placeholder="请输入编号" require
								autocomplete="off">																		
					</div>
				</div>		
				<div class="layui-form-item" >
					<label class="layui-form-label">名称</label>
					<div class="layui-input-inline" >
						<input type="text" name="name" value='${updGoods.name}'
								class="layui-input"
								lay-verify="required"
								placeholder="请输入名称" require
								autocomplete="off">																		
					</div>
				</div>
				
				<div class="layui-form-item" >
					<label class="layui-form-label">单价</label>
					<div class="layui-input-inline" >
						<input type="text" name="price" value='${updGoods.price}'
								class="layui-input"
								lay-verify="required"
								placeholder="请输入单价" require
								autocomplete="off">																		
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">描述</label>
					<div class="layui-input-inline">
						<input type="text" name="des" value='${updGoods.des}'
								class="layui-input"
								placeholder="请填写描述" require
								autocomplete="off">																		
					</div>
				</div>	
						<div class="layui-form-item">
					<label class="layui-form-label">库存</label>
					<div class="layui-input-inline">
						<input type="text" name="stock" value='${updGoods.stock}'
								class="layui-input"
								placeholder="请填写库存" require
								autocomplete="off">																		
					</div>
				</div>	
						<div class="layui-form-item">
					<label class="layui-form-label">状态</label>
					 <div class="layui-input-block">
	    				  <select name="state"  >
	    				  <option value='上架' title="上架">上架</option>
	    				  <option value='下架' title="下架">下架</option>
	    				  </select>
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
				<input type="hidden" name='id' value='${updGoods.id}'>
			</form>								
		</div>	
<script type="text/javascript">
// getSelect('onecode','A0001');
// 注意规范
// 初始化、操作（级联）、确定 三个互不干扰的过程！！！！！！
function getSelect(selectid,parentcode){
	if(parentcode==''){
		$("select[name='onecode']").empty();
		$("select[name='classcode']").empty();
		form.render('select');
		return;
	}
	ajax('/goods/get2.do',{parentcode:parentcode},'json',function(data){
		
		var html="<option value=''>请选择</option>";
		$.each(data,function(i,d){
			html+="<option value='"+d.code+"'>"+d.name+"</option>";
		});
		$("select[name='"+selectid+"']").html(html);
//			form.render();
// 		selected();
		form.render('select'); 
	})	
}

function initOnSelect(){
		//form.on 加了个监听
		// 取它的值，然后传进方法：
		form.on('select(onecode)',function(data){
//		 	二级分类的回显
			getSelect('classcode',data.value);
			
//		 	//两个下拉框的回显
//		 	$("select[name='onecode']").val('${updGoods.onecode}')
//		 	$("select[name='classcode']").val('${updGoods.classcode}')
		});
}

init()
function init(){
	if('${updGoods.id}'!=''){
	 	$("select[name='onecode']").val('${updGoods.onecode}')
	 	$("select[name='classcode']").val('${updGoods.classcode}')
	 	$("select[name='state']").val('${updGoods.state}')
	}
	 	form.render(); 
	 	initOnSelect();
	 	initOnSubmit();
}
function initOnSubmit(){

	// 最后的确定
	form.on('submit(addorupd)',function(data){
		console.log(data)			
		$.ajax({
			url:'/ssm0601/goods/addorupd.do',
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
}
</script>
		
</body>
</html>