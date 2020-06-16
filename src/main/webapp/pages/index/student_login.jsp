<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>学员登录</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path+"/css/pages/index/login.css"%>" rel="stylesheet" type="text/css">
    <script src="<%=path+"/js/pages/index/stuLogin.js"%>" type="text/javascript"></script>
    <script src="<%=path+"/static/custom_tool.js"%>"></script>
</head>
<body>

<input type="hidden" id="path" value="<%=path%>">

<p style="font-family: newword;color: #274472;font-size: 26px;text-align: center;height: 80px; margin-left: -230px;line-height: 110px;">
    欢迎登录驾驶培训公共服务平台！</p>
<div class="main-box">
    <form action="<%=path+"/api/login/student"%>" method="post">
        <p style="">学员登录</p>
        <ul class="reg-box">
            <li>
                <label style="letter-spacing: 3px;">学员账号：</label>
                <input name="aAccount" type="text" value="${username}"
                       placeholder="请输入你的账号"
                       style="margin-left: 2px;" class="account accounts"
                       onblur="textBlur(this)" onfocus="textFocus(this)">
                <span class="error error5"></span>
            <li>
                <label style="letter-spacing: 3px;">登录密码：</label>
                <input name="aPassword" type="password" value=""
                       placeholder="请输入登录密码"
                       style="margin-left: 2px;" class="idcard"
                       onblur="textBlur(this)" onfocus="textFocus(this)">
                <span class="error error5"></span>
            </li>
            <li>
                <label style="letter-spacing: 7px;">验证码：</label>
                <input class="sradd photokey" name="vcode" onblur="textBlur(this)"
                       onfocus=" textFocus(this) "
                       style="color: rgb(153, 153, 153); ime-mode: disabled; margin-left: 1px;" type="text"
                       value="验证码">
                <span id="vk" class="add phoKey"></span>
                <span class="error error7"></span>
            </li>

        </ul>
        <div class="sub space">
            <button class="" id="dd" type="submit">登录</button>
            <br>
            <br>
            <br>
            <button class="" id="cc" onclick="resetMsg();" style="display: block;" type="button">重置</button>
        </div>
    </form>
</div>
<div class="layui-layer-move"></div>
</body>
</html>
