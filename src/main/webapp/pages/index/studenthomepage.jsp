<%@ page import="com.lsjbc.vdtts.utils.Tool" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/6/11
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String today = new Tool().getDate("yyyy年MM月dd日");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>机动车驾驶员计时培训系统</title>
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path+"/zjh_test/css/common.css"%>">
    <link rel="shortcut icon" type="image/x-icon" href="http://47.96.140.98:20034/static/img/logo_favicon.ico">

    <link rel="stylesheet" href="<%=path+"/zjh_test/css/style.css"%>">
    <link rel="stylesheet" href="<%=path+"/zjh_test/css/home_main.css"%>">
</head>
<body>
    <div class="login-inf">
        <div class="inf-box">
            <div class="inf-time">
                今天是<%=today%>,欢迎您！
            </div>
            <div class="inf-login">
                <a target="_blank" href="http://118.178.227.161/web/">管理部门登录</a> |
                <a target="_blank" href="http://47.98.242.153:8666/">驾培机构登录</a> |
                <a href="http://47.96.140.98:20034/coaLogin">教练员登录</a> |
                <a href="<%=path+"/student"%>">学员登录</a>
            </div>
        </div>
    </div>
    <div class="top">
        <div class="top-box">
            <img class="top-logo" src="<%=path+"/zjh_test/pic/psp-logo.png"%>">
            <div class="top-title">
                <p class="top-title-p1">机动车驾驶员计时培训系统</p>
                <p class="top-title-p2">Timing training system for motor vehicle drivers</p>
            </div>
            <div class="top-search">
                <select id="selectType" name="selectType">
                    <option value="1">驾培机构</option>
                    <option value="2">教练员</option>
                    <option value="3">教练车</option>
                </select>
                <input type="text" name="" id="selectName" value="">
                <label><a style="cursor: pointer;" onclick="topSelect();"><img src="<%=path+"/zjh_test/pic/search.png"%>">搜索</a></label>
            </div>
        </div>
    </div>
    <div class="menu">
        <div class="menu-box">
            <ul id="menu-title" class="menu-title">
                <li id="menu-title-one" class="layui-this menu-title-bg">
                    <img src="<%=path+"/zjh_test/pic/menu_home1.png"%>">
                    <a href="<%=path+"/zjh/index"%>">首页</a>
                </li>
                <li id="menu-title-two">
                    <img src="<%=path+"/zjh_test/pic/menu_publicity1.png"%>">
                    <a href="<%=path+"/zjh/publicity"%>">公开公示</a>
                </li>
                <li id="menu-title-three">
                    <img src="<%=path+"/zjh_test/pic/menu_inquire1.png"%>">
                    <a href="http://47.96.140.98:20034/inquire">信息查询</a></li>
                </li>
                <li id="menu-title-six">
                    <img src="<%=path+"/zjh_test/pic/menu_student1.png"%>">
                    <a href="http://47.96.140.98:20034/studentCoaInfo">学教专区</a>
                </li>
            </ul>
        </div>
    </div>
    <div id="share">
        <a id="totop" title="返回顶部" style="display: none;">返回顶部</a>
        <a href="javascript:void(0)" title="返回上一页" class="sina" onclick="history.go(-1);"></a>
        <a href="javascript:void(0)" title="刷新" class="tencent" onclick="history.go(0);"></a>
    </div>
    <div class="main">
        <div class="content">
            <div class="layui-carousel" id="homeBox" lay-anim="" lay-indicator="inside"
                 style="width: 380px; height: 280px;">
                <div carousel-item="" id="homeTopFile">
                    <div class="layui-this">
                        <img src="<%=path+"/zjh_test/pic/{2}_46407.jpg"%>" onclick="publicNotice('1','976');"
                             style="width: 380px;height: 280px;cursor:pointer"><a class="carousel-title"
                                                                                  title="省运管局举办全省重点道路运输企业主要负责人安全管理培训">省运管局举办全省重点道路运输企业主要负责人安全管理...</a>
                    </div>
                </div>
                <div class="layui-carousel-ind">
                    <ul>
                        <li class="layui-this"></li>
                    </ul>
                </div>
            </div>
            <div class="layui-tab layui-tab-brief main-tab" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">学时记录查看</li>
                    <li>政策法规</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <table class="layui-table" lay-skin="line">
                            <colgroup>
                                <col width="200">
                                <col width="120">
                                <col width="120">
                                <col width="120">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>学时开始时间</th>
                                <th>本次所挂学时</th>
                                <th>学时是否减半</th>
                                <th>学时是否有效</th>
                                <th>科目</th>
                            </tr>
                            </thead>
                            <tbody class="title-png" id="noticeList">
                                <c:forEach items="${studentTimeList}" var="examTime">
                                    <tr>
                                        <td>${examTime.etStart}</td>
                                        <td>${examTime.etTime}</td>
                                        <c:choose>
                                            <c:when test="${examTime.etHalf=='false'}">
                                                <td>否</td>
                                            </c:when>
                                            <c:when test="${examTime.etHalf=='true'}">
                                                <td>是</td>
                                            </c:when>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${examTime.etEffective=='false'}">
                                                <td>否</td>
                                            </c:when>
                                            <c:when test="${examTime.etHalf=='true'}">
                                                <td>是</td>
                                            </c:when>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${examTime.etLevel==2}">
                                                <td>科目一</td>
                                            </c:when>
                                            <c:when test="${examTime.etLevel==3}">
                                                <td>科目二</td>
                                            </c:when>
                                            <c:when test="${examTime.etLevel==4}">
                                                <td>科目三</td>
                                            </c:when>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="4"><a onclick="publicNotice('notice',1,-1);" style="cursor: pointer;">更多&gt;&gt;</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="layui-tab-item">
                        <table class="layui-table" lay-skin="line">
                            <colgroup>
                                <col width="200">
                                <col width="100">
                                <col width="100">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>标题</th>
                                <th>发布日期</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody class="title-png" id="policyInfoList">
                                <c:forEach items="${lawList}" var="nc">
                                    <tr>
                                        <td title="${nc.NName}"><a
                                                onclick="publicNotice('law',1,${nc.NId});"
                                                style="cursor: pointer;color: #8ea8d8;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 450px;display: block;text-align: left;">${nc.NName}</a>
                                        </td>
                                        <td>${nc.NTime}</td>
                                        <td></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="4"><a onclick="publicNotice('law',1,-1);" style="cursor: pointer;">更多&gt;&gt;</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


            <img src="<%=path+"/zjh_test/pic/home_logoJiangxi.jpg"%>" class="home-banner" width="1100px;">

            <img src="<%=path+"/zjh_test/pic/home_logo2.jpg"%>" class="home-banner">
        </div>
        <div id="industryTop" class="main table-inf-list" style="margin-bottom: 25px">
            <blockquote class="layui-elem-quote">
                <img src="<%=path+"/zjh_test/pic/square.png"%>">
                <span>行业信息排名</span>
            </blockquote>
            <div class="inf-list list-style">
                <blockquote class="layui-elem-quote bg-red-img">
                    <img src="<%=path+"/zjh_test/pic/car.png"%>">驾校资源排名
                    <span id="vehUpdateTime"><img src="<%=path+"/zjh_test/pic/date1.png"%>">2020年6月11日</span>
                </blockquote>
                <table class="layui-table" lay-size="sm" lay-skin="line">
                    <colgroup>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>排名</th>
                        <th>驾培机构名称</th>
                        <th>地区</th>
                        <th>教练车(辆)</th>
                    </tr>
                    </thead>
                    <tbody class="title-center" id="vehInfoOrder">
                    <tr>
                        <td><img src="<%=path+"/zjh_test/pic/first.png"%>"></td>
                        <td title="蓝天驾校">蓝天驾校</td>
                        <td title="东湖区">东湖区</td>
                        <td>350</td>
                    </tr>
                    <tr>
                        <td><img src="<%=path+"/zjh_test/pic/second.png"%>"></td>
                        <td title="蓝盾驾校">蓝盾驾校</td>
                        <td title="安源区">安源区</td>
                        <td>224</td>
                    </tr>
                    <tr>
                        <td><img src="<%=path+"/zjh_test/pic/second.png"%>"></td>
                        <td title="瑞金世通驾校">瑞金世通驾...</td>
                        <td title="瑞金市">瑞金市</td>
                        <td>193</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td title="蓝天昌北">蓝天昌北</td>
                        <td title="新建县">新建县</td>
                        <td>173</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td title="航大驾校">航大驾校</td>
                        <td title="新建县">新建县</td>
                        <td>167</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td title="白云总校">白云总校</td>
                        <td title="东湖区">东湖区</td>
                        <td>153</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td title="亿安达驾校">亿安达驾校...</td>
                        <td title="青山湖区">青山湖区</td>
                        <td>142</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td title="昌南驾校">昌南驾校</td>
                        <td title="昌江区">昌江区</td>
                        <td>140</td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td title="宜春泰极驾校">宜春泰极驾...</td>
                        <td title="袁州区">袁州区</td>
                        <td>139</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td title="南昌金盾驾校">南昌金盾驾...</td>
                        <td title="东湖区">东湖区</td>
                        <td>133</td>
                    </tr>
                    <tr>
                        <td colspan="4"><a href="http://47.96.140.98:20034/industryList#type=1">更多&gt;&gt;</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="inf-list list-style">
                <blockquote class="layui-elem-quote bg-dark-blue-img">
                    <img src="<%=path+"/zjh_test/pic/people.png"%>">年新增学员排名
                    <span id="yearAddStuUpdateTime"><img src="<%=path+"/zjh_test/pic/date1.png"%>">2020年6月11日</span>
                </blockquote>
                <table class="layui-table" lay-size="sm" lay-skin="line">
                    <colgroup>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>排名</th>
                        <th>驾培机构名称</th>
                        <th>地区</th>
                        <th>年新增学员(人)</th>
                    </tr>
                    </thead>
                    <tbody class="title-center" id="yearAddStuOrder">
                    <tr>
                        <td><img src="<%=path+"/zjh_test/pic/first.png"%>"></td>
                        <td title="蓝天驾校">蓝天驾校</td>
                        <td title="东湖区">东湖区</td>
                        <td>3755</td>
                    </tr>
                    <tr>
                        <td><img src="<%=path+"/zjh_test/pic/second.png"%>"></td>
                        <td title="天一驾校">天一驾校</td>
                        <td title="安源区">安源区</td>
                        <td>3645</td>
                    </tr>
                    <tr>
                        <td><img src="<%=path+"/zjh_test/pic/second.png"%>"></td>
                        <td title="亿安达驾校">亿安达驾校...</td>
                        <td title="青山湖区">青山湖区</td>
                        <td>3326</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td title="成功驾校">成功驾校</td>
                        <td title="乐平市">乐平市</td>
                        <td>3324</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td title="瑞金世通驾校">瑞金世通驾...</td>
                        <td title="瑞金市">瑞金市</td>
                        <td>2656</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td title="赣洪驾校">赣洪驾校</td>
                        <td title="进贤县">进贤县</td>
                        <td>2551</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td title="国力驾校">国力驾校</td>
                        <td title="南昌县">南昌县</td>
                        <td>2523</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td title="现代驾校">现代驾校</td>
                        <td title="安远县">安远县</td>
                        <td>2477</td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td title="蓝盾驾校">蓝盾驾校</td>
                        <td title="安源区">安源区</td>
                        <td>2469</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td title="众安驾校">众安驾校</td>
                        <td title="浮梁县">浮梁县</td>
                        <td>2262</td>
                    </tr>
                    <tr>
                        <td colspan="4"><a href="http://47.96.140.98:20034/industryList#type=2">更多&gt;&gt;</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="inf-list">
                <blockquote class="layui-elem-quote bg-blue-img">
                    <img src="<%=path+"/zjh_test/pic/people.png"%>">今日新增学员排名
                    <span id="dayAddStuUpdateTime"><img src="<%=path+"/zjh_test/pic/date1.png"%>">2020年6月11日</span>
                </blockquote>
                <table class="layui-table" lay-size="sm" lay-skin="line">
                    <colgroup>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>排名</th>
                        <th>驾培机构名称</th>
                        <th>地区</th>
                        <th>今日新增学员(人)</th>
                    </tr>
                    </thead>
                    <tbody class="title-center" id="dayAddStuOrder">
                    <tr>
                        <td><img src="<%=path+"/zjh_test/pic/first.png"%>"></td>
                        <td title="成功驾校">成功驾校</td>
                        <td title="乐平市">乐平市</td>
                        <td>13</td>
                    </tr>
                    <tr>
                        <td><img src="<%=path+"/zjh_test/pic/second.png"%>"></td>
                        <td title="天一驾校">天一驾校</td>
                        <td title="安源区">安源区</td>
                        <td>9</td>
                    </tr>
                    <tr>
                        <td><img src="<%=path+"/zjh_test/pic/second.png"%>"></td>
                        <td title="福祥驾校">福祥驾校</td>
                        <td title="庐山市">庐山市</td>
                        <td>9</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td title="萍乡民扬驾校">萍乡民扬驾...</td>
                        <td title="湘东区">湘东区</td>
                        <td>7</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td title="余江县瑶池驾校">余江县瑶池...</td>
                        <td title="余江县">余江县</td>
                        <td>7</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td title="江西江科驾校">江西江科驾...</td>
                        <td title="进贤县">进贤县</td>
                        <td>6</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td title="国力驾校">国力驾校</td>
                        <td title="南昌县">南昌县</td>
                        <td>6</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td title="亿安达驾校">亿安达驾校...</td>
                        <td title="青山湖区">青山湖区</td>
                        <td>6</td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td title="宜春泰极驾校">宜春泰极驾...</td>
                        <td title="袁州区">袁州区</td>
                        <td>6</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td title="运销驾校">运销驾校</td>
                        <td title="南城县">南城县</td>
                        <td>5</td>
                    </tr>
                    <tr>
                        <td colspan="4"><a href="http://47.96.140.98:20034/industryList#type=3">更多&gt;&gt;</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="footer-box">
            <p class="footer-p" style="text-align: center;">友情链接</p>
            <div class="footer-friend">

                <c:forEach items="${linkList}" varStatus="item" var="link">
                    <c:if test="${item.index % 5 == 0}">
                        <br><br>
                    </c:if>
                    <a target="_blank" href="${link.lkUrl}">
                        <img class="footer-img" src='<%=path%>${link.lkPic}'>
                    </a>
                </c:forEach>

            </div>
        </div>

    </div>
    <div class="footer-inf">
        <ul style="text-align: center;display: table;">
            <li style="margin: 0 60px 0 0px;">
                <a href="javascript:void(0);">版权所有：传一科技</a>
            </li>
            <li style="margin: 0 60px 0 0px;">
                <a href="javascript:void(0);">技术支持：传一科技</a>
            </li>
        </ul>
    </div>
    <script src="<%=path+"/zjh_test/js/jquery.min.js"%>"></script>
    <script src="<%=path+"/zjh_test/js/City_data.js"%>"></script>
    <script src="<%=path+"/zjh_test/js/areadata.js"%>"></script>
    <script src="<%=path+"/zjh_test/js/auto_area.js"%>"></script>
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <script src="<%=path+"/zjh_test/js/common.js"%>"></script>
    <script src="<%=path+"/zjh_test/js/commonpage.js"%>"></script>


    <script src="<%=path+"/zjh_test/js/index.js"%>"></script>

</body>
</html>
