<%--
  Created by IntelliJ IDEA.
  User: 刘海
  Date: 2020/6/11
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href=<%=path+"/static/layui/css/layui.css"%>>
    <script type="text/javascript" src=<%=path+"/static/layui/layui.js"%>></script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">驾校名字</label>
        <div class="layui-input-block">
            <input type="text" name="sName" lay-verify="title" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">驾校账号</label>
        <div class="layui-input-block">
            <input type="text" name="aAccount" lay-verify="title" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">法人代表名字</label>
        <div class="layui-input-block">
            <input type="text" name="sOwnerName" lay-verify="title" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">驾校注册时间</label>
        <div class="layui-input-block">
            <input type="text" name="sName" lay-verify="title" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">信用代码</label>
        <div class="layui-input-block">
            <input type="text" name="sBusinessId" lay-verify="title" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    layui.use('table',function() {
        var $ = layui.jquery;
        $.ajax({
            type: 'POST',
            dataType:'JSON',
            url: '/SchoolControl/findSchoolInfo',
            success: function (remsg) {
                alert(JSON.stringify(remsg.data.school));
                $("input[name='sName']").val(remsg.data['school'].sname);
            },
            error:function () {
                layer.alert("网络错误，请联系运营商");
            }
        });
    });

    layui.use('form', function(){

        var form = layui.form;
        form.on('submit(formDemo)', function(data){

            return false;
        });
    });
</script>
</body>
</html>
