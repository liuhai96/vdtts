<%--
  Created by IntelliJ IDEA.
  User: 刘海
  Date: 2020/6/16
  Time: 22:59
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
        <label class="layui-form-label">旧密码</label>
        <div class="layui-input-inline">
            <input type="password" name="oldPwd" required lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input type="password" name="newPwd" required lay-verify="required" placeholder="新密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input type="password" name="repeatPwd" required lay-verify="required" placeholder="请重新输入新密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
        </div>
    </div>
</form>
</body>
<script>
    //Demo
    layui.use(['form','layer'], function(){
        var form = layui.form,layer = layui.layer;
        var $ = layui.jquery;
        //监听提交
        form.on('submit(formDemo)', function(data){
            var newPwd = $("input[name='newPwd']").val();
            var repeatPwd = $("input[name='repeatPwd']").val();
            if (newPwd!=repeatPwd){
                layer.msg("两次新密码输入不同请重新输入");
            }else{
                $.ajax({
                    type: 'POST',
                    url: '<%=path%>/updateSchoolPwd',
                    dataType: 'JSON',
                    data:data.field,
                    success: function (resmsg) {
                        if (resmsg.code == 1) {
                            layer.msg(resmsg.msg);
                            $("input[name='sPhone']").val("");
                            $("input[name='sAddress']").val("");
                            form.render();
                        } else {
                            layer.msg(resmsg.msg);
                            layer.close(index);
                        }
                    }
                });
            }

            return false;
        });
    });
</script>

</html>
