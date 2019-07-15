<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/public/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>上传图片</legend>
 ${key.name}
<div class="layui-upload">
  <button class="layui-btn layui-btn-normal" id="testList" type="button">选择多文件</button> 
  <button class="layui-btn" id="testListAction" type="button">开始上传</button>
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>
</div>
</fieldset>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>图片列表</legend>

		<div class="layui-upload-list">
			<table class="layui-table">
				<thead>
					<tr>
						<th>文件名</th>
						<th>图片</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="demoList2"></tbody>
			</table>
		</div>
	</fieldset>



<script>
var code = '<%=request.getParameter("code")%>';
var demoListView = $('#demoList')
,uploadListIns = upload.render({
  elem: '#testList'
  ,url: con.app+'/prodpic/upload.do'
  ,data:{code:code}
  ,accept: 'images'
  ,multiple: true
  ,auto: false
  ,bindAction: '#testListAction'
  ,choose: function(obj){   
    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
    //读取本地文件
    obj.preview(function(index, file, result){
      var tr = $(['<tr id="upload-'+ index +'">'
        ,'<td>'+ file.name +'</td>'
        ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
        ,'<td>等待上传</td>'
        ,'<td>'
          ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
          ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
        ,'</td>'
      ,'</tr>'].join(''));
      
      //单个重传
      tr.find('.demo-reload').on('click', function(){
        obj.upload(index, file);
      });
      
      //删除
      tr.find('.demo-delete').on('click', function(){
        delete files[index]; //删除对应的文件
        tr.remove();
        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
      });
      
      demoListView.append(tr);
    });
  }
  ,done: function(res, index, upload){
    if(res.code == 0){ //上传成功
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
      tds.eq(3).html(''); //清空操作
      init();
      return delete this.files[index]; //删除文件队列已经上传成功的文件
    }
    this.error(index, upload);
  }
  ,error: function(index, upload){
    var tr = demoListView.find('tr#upload-'+ index)
    ,tds = tr.children();
    tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
    tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
  }
});

init();

function init(){
	ajax('/prodpic/getList.do', {productCode:code}, 'json', function(data){
		var html = "" ;
	    $.each(data.list,function(i, dom) {
	        var id = dom.id;
	        html+="<tr><td>"+dom.location+"</td><td>"
	            +'<img src="/tupian/'+ dom.location +'" alt="'+ dom.location +'" class="layui-upload-img">'
	            +"</td><td>"
	            +"<input type='button' class='layui-btn' onclick='delPic(\""+id+"\",\""+dom.productCode+"\",\""+dom.location+"\")' value='删除' />&nbsp;"
	            if(dom.type=='1'){
	            	html+="<input type='button' class='layui-btn' onclick='void()' value='主图' />&nbsp;";
	            }else{
	                html+="<input type='button' class='layui-btn' onclick='setMain(\""+id+"\",\""+dom.productCode+"\")' value='设为主图' />&nbsp;"
	            }
	            html+="</td></tr>";
	    });
	    $("#demoList2").html(html);
	})
}
	
function delPic(id,code,url){
	openConfirm(function(index){
        ajax('/prodpic/del.do', {id:id,code:code,url:url}, 'text', function(data){
            if (data == 1) {
                layer.msg('删除成功');
                init();
            } else {
                layer.msg('删除成功，该编号已被使用');
            }
        })
    })
}
function setMain(id){
	openConfirm(function(index){
        ajax('/prodpic/setMain.do', {id:id,productCode:code}, 'text', function(data){
            if (data == 1) {
                layer.msg('设置成功');
                init();
            } 
        })
    })
}
</script>

</body>
</html>