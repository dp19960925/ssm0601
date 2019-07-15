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
<form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" readonly lay-verify="required" placeholder="请输入账号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="pass" lay-verify="required" placeholder="请输入新密码" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="pasUser" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
     <script type="text/javascript">
    $("input[name='code']").val('<%=request.getParameter("code")%>');
//     $("input[name='usercode']").prop("readonly","readonly");
    formSubmit('/user/pass.do', 'submit(pasUser)', 'text', function(data) {
    	if (data == 1) {
            layer.msg('修改成功');
            closeThis(2000);
        } else {
            layer.msg('修改失败');
        }
    });
    </script>
</body>
</html>