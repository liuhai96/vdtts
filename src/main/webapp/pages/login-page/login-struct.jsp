<%@ page import="com.lsjbc.vdtts.utils.Tool" %><%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/15
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String thisTime = new Tool().getDate("yyyy年MM月dd日");
%>
<html>
<input hidden="hidden" value="<%=path%>" id="path">
<head>
    <meta charset="utf-8">
    <title>登录学员登录</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path+"/pages/login-page/login-page_files/layui.css"%>" media="all" rel="stylesheet">
    <link href="<%=path+"/pages/login-page/login-page_files/common.css"%>" rel="stylesheet">
    <link href="<%=path+"/pages/login-page/login-page_files/common2.css"%>" rel="stylesheet" type="text/css">
    <link href="<%=path+"/pages/login-page/login-page_files/login.css"%>" rel="stylesheet" type="text/css">
    <link href="<%=path+"/pages/login-page/login-page_files/layer.css"%>" id="layuicss-layer" media="all" rel="stylesheet">
    <script src="<%=path+"/pages/login-page/login-page_files/stuLogin.js"%>" type="text/javascript"></script>
    <script src="<%=path+"/pages/login-page/login-page_files/layer.js"%>"></script>
    <script src="<%=path+"/static/custom_tool.js"%>"></script>
</head>
    <body>
        <div>
            <p style="font-family: newword;color: #f7fcff;font-size: 26px;text-align: center;height: 80px; margin-left: -230px;line-height: 110px;">
                欢迎登录驾驶培训公共服务平台！</p>
            <div class="main-box">
                <form action="<%=path+"/userLogin"%>" id="toService" method="get">
                    <p style="">学员登录</p>
                    <ul class="reg-box">
                        <li>
                            <label for="" style="letter-spacing: 3px;">学员账号：</label>
                            <input name="aAccount" type="text" value=""
                                   placeholder="请输入你的账号"
                                   style="margin-left: 2px;" class="account accounts"
                                   onblur="textBlur(this)" onfocus="textFocus(this)">
                            <span class="error error5"></span>
                        </li>
                        <%--                            <li>--%>
                        <%--                                <label for="">身份证号码：</label>--%>
                        <%--                                <input class="idcard errorC" name="idcard" onblur="textBlur(this)" onfocus="textFocus(this)" style="color: rgb(153, 153, 153);" type="text" value="请输入学员身份证号码">--%>
                        <%--                                <span class="error error1" style="display: block;"></span>--%>
                        <%--                            </li>--%>
                        <%--                            <li>--%>
                        <%--                                <label for="" style="letter-spacing: 3px;">手机号码：</label>--%>
                        <%--                                <input class="phone admin_pwds errorC" name="phone" onblur="textBlur(this)" onfocus="textFocus(this)" style="color: rgb(153, 153, 153);" type="text" value="请输入信息采集时所填写的手机号">--%>
                        <%--                                <span class="error error6" style="display: block;">手机号码不能为空！</span>--%>
                        <%--                            </li>--%>
                        <li>
                            <label for="" style="letter-spacing: 3px;">登录密码：</label>
                            <input name="aPassword" type="password" value=""
                                   placeholder="请输入登录密码"
                                   style="margin-left: 2px;" class="idcard errorC"
                                   onblur="textBlur(this)" onfocus="textFocus(this)">
                            <span class="error error5"></span>
                        </li>
                        <li>
                            <label for="" style="letter-spacing: 7px;">验证码：</label>
                            <input class="sradd photokey" name="vcode" onblur="textBlur(this)" onfocus=" textFocus(this) " style="color: rgb(153, 153, 153); ime-mode: disabled; margin-left: 1px;" type="text" value="验证码">
                            <span class="add phoKey"></span>
                            <span class="error error7"></span>
                        </li>

                    </ul>
                    <div class="sub space">
                        <button class="" id="dd" type="submit">登录</button>
                        <div class="" style="margin: 20px 0;">
                            <input id="remember" style="width: 15px;height: 15px;float: left;margin: 1px 5px;" type="checkbox">
                            <label>记住登录信息</label>
                        </div>
                        <button class="" id="cc" onclick="resetMsg();" style="display: block;" type="button">重置</button>
                    </div>
                </form>
            </div>
            <div class="layui-layer-move"></div>
        </div>
    </body>
</html>
