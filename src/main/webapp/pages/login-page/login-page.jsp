<%@ page import="com.lsjbc.vdtts.utils.Tool" %>
<%--
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
    <title>登录</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/pages/login-page/login-page_files/layui.css" media="all" rel="stylesheet">
    <link href="<%=path%>/pages/login-page/login-page_files/common.css" rel="stylesheet">
    <link href="<%=path%>/pages/login-page/login-page_files/common2.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/pages/login-page/login-page_files/login.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/pages/login-page/login-page_files/layer.css" id="layuicss-layer" media="all" rel="stylesheet">
    <script charset="utf-8" src="<%=path+"/pages/login-page/login-page_files/layui.js"%>" type="text/javascript"></script>
    <script src="<%=path+"/pages/login-page/login-page_files/common.js"%>"></script>
    <script src="<%=path+"/pages/login-page/login-page_files/stuLogin.js"%>" type="text/javascript"></script>
    <script src="<%=path+"/pages/login-page/login-page_files/hm.js"%>"></script>
    <script src="<%=path+"/pages/login-page/login-page_files/layer.js"%>"></script>
    <script src="<%=path+"/pages/login-page/login-page_files/stuLogin.js"%>" type="text/javascript"></script>
</head>
    <body>
        <div>
            <div>

            </div>
            <div class="login-inf">
                <div class="inf-box">
                    <div class="inf-time">
                        今天是<%=thisTime%>,欢迎您！
                    </div>
                    <div class="inf-login">
                        <a href="" target="_blank">管理部门登录</a> |
                        <a href="" target="_blank">驾培机构登录</a> |
                        <a href="">教练员登录</a> |
                        <a href="">学员登录</a>
                    </div>
                </div>
            </div>
            <div class="top">
                <div class="top-box">
                    <img class="top-logo" src="<%=path%>/pages/login-page/login-page_files/psp-logo.png">
                    <div class="top-title">
                        <p class="top-title-p1">江西省驾驶培训公共服务平台</p>
                        <p class="top-title-p2">Jiangxi driving training public service platform </p>
                    </div>
                    <div class="top-search">
                        <select id="selectType" name="selectType">
                            <option selected="selected" value="1">驾培机构</option>
                            <option value="2">教练员</option>
                            <option value="3">教练车</option>
                        </select>
                        <input id="selectName" name="" type="text">
                        <label style=""><a onclick="topSelect();" style="cursor: pointer;">
                            <img src="<%=path%>/pages/login-page/login-page_files/search.png">搜索</a></label>
                    </div>
                </div>
            </div>
            <div class="menu mainavi">
                <div class="menu-box">
                    <ul class="menu-title">
                        <li class="layui-this">
                            <img src="<%=path%>/pages/login-page/login-page_files/menu_home1.png">
                            <a href="">首页</a>
                        </li>
                        <li class="" style="">
                            <img src="<%=path%>/pages/login-page/login-page_files/menu_publicity1.png">
                            <a href="">公开公示</a>
                        </li>
                        <li class="" style="">
                            <img src="<%=path%>/pages/login-page/login-page_files/menu_inquire1.png">
                            <a href="">信息查询</a></li>
                        <li class="" style="">
                            <img src="<%=path%>/pages/login-page/login-page_files/menu_list1.png">
                            <a href="t">行业榜单</a>
                        </li>
                        <li class="" style="">
                            <img src="<%=path%>/pages/login-page/login-page_files/menu_service1.png">
                            <a href="">服务导航</a>
                        </li>
                        <li class="" style="">
                            <img src="<%=path%>/pages/login-page/login-page_files/menu_student1.png">
                            <a href="">学教专区</a>
                        </li>
                        <li class="" style="border-right: 1px solid #e4e5e6;">
                            <img src="<%=path%>/pages/login-page/login-page_files/menu_download1.png">
                            <a href="">资料下载</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main" style="background: url(/image/sch.jpg)/*更换背景图片*/
            no-repeat;height: 63%;background-size: cover;">
                <iframe src="<%=path+"/pages/login-page/login-struct.jsp"%>" style="width: 100%;height: 100%"></iframe>
            </div>

            <div class="footer-inf">
                <ul style="text-align: center;display: table;">
                    <li style="margin: 0 60px 0 0px;">
                        <a href="javascript:void(0);">版权所有：江西省道路运输管理局</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);">技术支持：国交信息股份有限公司</a>
                    </li>
                </ul>
            </div>
            <div class="layui-layer-move"></div>
        </div>
    </body>
</html>
