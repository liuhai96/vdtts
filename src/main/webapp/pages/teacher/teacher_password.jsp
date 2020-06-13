<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/14
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
</head>
    <body>
    <div>
        <input hidden="hidden" value="<%=path%>" id="path">
        <input hidden="hidden" value="${aId}" id="aId">
        <input hidden="hidden" value="${teacher.TPhone}" id="tPhone">
        <div style="text-align: center;">
            <br> <br> <br>
            <div class="layui-form-item" id="oldPass">
                <div class="layui-inline">
                    <label class="layui-form-label">原密码:</label>
                    <div class="layui-input-inline">
                        <input type="password" class="layui-input " value="" onfocusout="verifyPass()">
                    </div>
                </div>
            </div>
            <div class="layui-form-item" id="newPass">
                <div class="layui-inline">
                    <label class="layui-form-label">设置密码:</label>
                    <div class="layui-input-inline">
                        <input type="password" class="layui-input" value="">
                    </div>
                </div>
            </div>
            <div class="layui-form-item" id="newPass2">
                <div class="layui-inline">
                    <label class="layui-form-label">确认密码:</label>
                    <div class="layui-input-inline">
                        <input type="password" class="layui-input" value="">
                    </div>
                </div>
            </div>
            <button type="button" class="layui-btn layui-btn-warm" id="toPass" onclick="changePassword()">修改</button>
            <button type="button" hidden class="" id="not" onclick="passNot()">取消</button>
        </div>
    </div>
    <script>
        let verify = false;
        let passTypes = true;
        function verifyPass(){//旧密码验证
            AjaxTransfer($("#path").val()+"/verifyAdmin","aId="+$("#aId").val()+
                "&aPassword="+ $("#oldPass input").val(),function (mag) {
                verify = mag.msg;
                if (!verify) alert("密码不正确！");
            });
        }//密码验证

        function changePassword() {//更改密码
            let toPass = $("#toPass");
            let not = $("#not");
            let newPass = $("#newPass input"),newPass2 = $("#newPass2 input");
            if (passTypes){//修改按钮
                toPass.html("提交");
                not.attr("class","layui-btn layui-btn-warm");
            } else {//提交按钮
                if (verify){
                    if (newPass.val().length < 6) alert("密码长度应大于6位");
                    else if (!done(newPass.val(),0,newPass.val().length)) alert("密码有非法字符！");
                    else if (newPass.val() != newPass2.val()) alert("设置密码不一致");
                    else
                        AjaxTransfer($("#path").val()+"/changePassword","aPassword="+newPass.val()
                            +"&aId="+$("#aId").val(), function (mag) {
                            if (mag.msg) {
                                alert("修改成功！请重新登录");
                                skipPage($("#path").val()+"/pages/homepage/home-page.jsp?logout=cc632ef332fex2ee3010012e");
                            } else{
                                alert("修改失败,请检查网络!");
                            }
                        });
                } else alert("原密码错误！");
            }
            passNot();
        }//更改密码
        function passNot(){//取消修改更改密码
            if (!passTypes){
                $("#oldPass").val("");
                $("#newPass").val("");
                $("#newPass2").val("");
                $("#toPass").html("修改");
                $("#not").attr("class","");
            }
            passTypes = !passTypes;
        }
    </script>
    </body>
</html>