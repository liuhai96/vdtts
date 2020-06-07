<%--
  Created by IntelliJ IDEA.
  User: Lilang9725
  Date: 2020/6/5
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
    <head>
        <meta charset="utf-8">
        <title>文件共享系统————用户文件</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <script src="https://www.layuicdn.com/layui/layui.js"></script>
        <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>

        <script src="<%=path+"/pages/js/home-page.js"%>"></script>
    </head>
    <body>
    <input hidden="hidden" value="<%=path%>" id="path">
        <div class="layui-col-md12">
            <ul class="layui-nav layui-bg-green">
                <label class="layui-bg-green" style="font-size: 40px; color: yellow;">老司机驾考</label>
                <li class="layui-nav-item layui-this"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe68e;</i>&nbsp;&nbsp;首页</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe60a;</i>&nbsp;&nbsp;科目一</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe60a;</i>&nbsp;&nbsp;科目四</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe663;</i>&nbsp;&nbsp;题库</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe630;</i>&nbsp;&nbsp;车型</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe66c;</i>&nbsp;&nbsp;驾校</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe705;</i>&nbsp;&nbsp;资讯</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe6ed;</i>&nbsp;&nbsp;视频</a></li>
                <c:if test="${resultData eq null}">
                    <li class="layui-nav-item" style="float: right"><a href="">登录</a></li>|
                    <li class="layui-nav-item" style="float: right"><a href="">注册</a></li>
                </c:if>
                <c:if test="${resultData ne null}">
                    <li class="layui-nav-item layui-bg-green" style="float: right" lay-unselect=""><a href="javascript:;">
                        <img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;">修改信息</a></dd>
                            <dd><a href="javascript:;">安全管理</a></dd>
                            <dd><a href="javascript:;">安全退出</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-bg-green" style="float: right;">
                        <a href="" style="color:orange">个人中心<span class="layui-badge-dot"></span>
                    </a></li>
                </c:if>
            </ul>
        </div>
    </body>
</html>
