<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/7
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String schoolName = null;//名称
    String path = request.getContextPath();
    int type = 1011010;
    try { type = Integer.parseInt(request.getParameter("type")); } catch (Exception e){}
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie:cookies)
        if(cookie.getName().equals("schoolName"))schoolName = cookie.getValue();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path+"/static/custom_tool.js"%>"></script>
</head>
    <body background="<%=path+"/image/home-page/loginGround.png"%>" style="background-size: 100%">
        <div class="layui-col-md12" style="height: 20%;">
            <br><label class="layui-col-md-offset3" style="font-size: 35px;color:#ffda90;"><%=schoolName%></label>
            <br><label class="layui-col-md-offset4" style="font-size: 25px;color: crimson">
                <c:if test="<%=type==1011010%>"><label>学员</label></c:if>
                <c:if test="<%=type==1101010%>"><label>驾校</label></c:if>
                <c:if test="<%=type==1010110%>"><label>教练</label></c:if>登录
            </label><br>
            <div class="layui-col-md-offset9" style="font-size: 18px;">
                <a href="<%=path+"/pages/homepage/home-page.jsp"%>" style="color: #2aa8ff">首页</a>&nbsp;|
                <a href="<%=path%>" style="color: #ffb840;background-color: #528bff">登录</a>&nbsp;|
                <a href="<%=path+"/pages/homepage/register.jsp"%>" style="color: #2aa8ff">注册</a>
            </div>
        </div>
        <div class="layui-col-md3 layui-col-md-offset7" style="height: 70%;text-align: center;background: rgba(82,139,255,0.3);">
            <br><br><label style="font-size: 30px">欢迎登录</label><br><br><br>
            <form class="layui-form" action="<%=path+"/userLogin"%>" id="login" method="post">
                <input type="text" name="aAccount" required placeholder="请输入你的账号"
                       class="layui-input" style="width: 67%;margin: 0 0 0 18%">
                <label id="idNotify" style="color:#ff0a29;text-align: left;"></label>
                <br><br>
                <input type="password" name="aPassword" required placeholder="请输入你的密码"
                       class="layui-input" style="width: 67%;margin: 0 0 0 18%">
                <label id="passNotify" style="color:#ff0a29;text-align: left;"></label>
                <br><br>
                <a href="" class="layui-col-md-offset6" style="color:#229bff;">忘记密码</a>|
                <a href="<%=path+"/pages/homepage/register.jsp"%>" style="color:#229bff;">快速注册</a><br><br><br>

               <input type="button" style="font-size: 25px" class="layui-btn layui-btn-normal"
                       value="&nbsp;&nbsp;登&nbsp;录&nbsp;&nbsp;" onclick="ToLogin()"><br><br><br>
                <a href="https://graph.qq.com/oauth2.0/show?which=Login&display=pc&response_type=code&client_id=100227517
                &redirect_uri=http%3A%2F%2Fauth.cysq.com%2Flogin%2Fapp_QQ.php%3Fstyle%3D" class="layui-col-md-offset7">
                    <i class="layui-icon" style="width: 40px;height: 40px;color: crimson">&#xe676;</i>QQ登录账号</a><!-- QQ登录接口 -->
            </form>
        </div>
        <script>
            function ToLogin() {
                let aAccount = $("input[name = 'aAccount']").val();
                let idNotify = $("#idNotify");
                let aPassword = $("input[name = 'aPassword']").val();
                let passNotify = $("#passNotify");
                let isStop = false;
                if (aAccount.length < 1) {idNotify.html("*请输入账号！");isStop = true;} else
                if (aAccount.length < 6) {idNotify.html("*账号长度应大于5位！");isStop = true;}
                else if (!done(aAccount,0,aAccount.length)){idNotify.html("*账号中含有法字符！");isStop = true;}
                else idNotify.html("");

                if (aPassword.length < 1) {passNotify.html("*请输入密码！");isStop = true;}else
                if (aPassword.length < 6) {passNotify.html("*密码长度不得少于6位！");isStop = true;}
                else if (!done(aPassword,0,aPassword.length)){passNotify.html("*密码中含有法字符！");isStop = true;}
                else passNotify.html("");
                if (!isStop) $("#login").submit();
            }
        </script>
    </body>
</html>
