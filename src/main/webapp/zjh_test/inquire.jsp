<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/6/12
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>信息查询</title>
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path+"/zjh_test/css/common.css"%>">
    <link rel="shortcut icon" type="image/x-icon" href="http://47.96.140.98:20034/static/img/logo_favicon.ico">
    <script src="<%=path+"/zjh_test/js/hm.js"%>"></script>
    <style type="text/css" abt="234"></style>
    <style type="text/css" abt="234"></style>

    <link rel="stylesheet" href="<%=path+"/zjh_test/css/inquire.css"%>">
    <link rel="stylesheet" href="<%=path+"/zjh_test/css/starScore.css"%>">
    <link id="layuicss-layer" rel="stylesheet" href="<%=path+"/zjh_test/css/layer.css"%>">
</head>
<body style="background: #fafbfd;">
    <div class="login-inf">
        <div class="inf-box">
            <div class="inf-time">
                今天是2020年6月11日,欢迎您！
            </div>
            <div class="inf-login">
                <a target="_blank" href="http://118.178.227.161/web/">管理部门登录</a> |
                <a target="_blank" href="http://47.98.242.153:8666/">驾培机构登录</a> |
                <a href="http://47.96.140.98:20034/coaLogin">教练员登录</a> |
                <a href="http://47.96.140.98:20034/stuLogin">学员登录</a>
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
                    <a href="<%=path+"/zjh/publicity/notice/1/-1"%>">公开公示</a>
                </li>
                <li id="menu-title-three">
                    <img src="<%=path+"/zjh_test/pic/menu_inquire1.png"%>">
                    <a href="<%=path+"/zjh/inquire"%>">信息查询</a></li>
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
        <div class="layui-tab">
            <ul id="selectParent" class="layui-tab-title" style="float: left;width: 150px;height: 200px;top: 45px;">
                <li onclick="selectSchInfoJump();" class="layui-this">查驾培机构</li>
                <li id="selectTwo" onclick="selectCoaInfoJump();" class="">查教练员</li>
                <li id="selectThree" onclick="selectVueInfoJump();" class="">查教练车</li>
            </ul>
            <span class="inq-inf"><img src="<%=path+"/zjh_test/pic/inquires.png"%>">信息查询</span>
            <div id="tab-item-parent" class="layui-tab-content" style="margin-left: 165px;">
                <div class="layui-tab-item layui-show">

                    <div class="inq-rank">
                        <input type="text" id="schoolName">
                        <input type="button" value="提交" id="selectSchoolByName">
                    </div>
                    <div class="inq-school">
                        <textarea title="消息模版" id="LAY_tpl" style="display:none;">
                                {{# layui.each(d.data, function(index, item){ }}
                                <li class="list-school">
                                    <a href="http://47.96.140.98:20034/schInfoDetail?inscode=3322210509142226">
                                        <img src="<%=path+"/zjh_test/pic/sch6.jpg"%>">
                                    </a>
                                    <div class="inf-school">
                                        <a href="http://47.96.140.98:20034/schInfoDetail?inscode=3322210509142226">
                                            <p class="word-1" title="{{ item.name }}">{{ item.name }}</p>
                                        </a>
                                        <p style="float: left;">综合评分：</p>
                                        <div class="atar_Show" style="display:inline;">
                                            <p class="scoreStar" tip="{{ item.score }}"></p>
                                        </div>
                                        <span>{{ item.score }}分</span>
                                        <p></p>
                                        <p>
                                            <span>教练员数：{{ item.teacherCount }}人</span>
                                            <span style="margin-left: 35px;">教练车数：{{ item.carCount }}台</span>
                                        </p>
                                        <p>
                                            <span>总学员数：{{ item.studentCount }}人</span>
                                        </p>
                                        <p title="{{ item.address }}"
                                           style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 275px;display: block;text-align: left;">地址：{{ item.address }}</p>
                                    </div>
                                </li>
                                {{# }); }}
                            </textarea>
                        <ul id="schoolList" style="width: 929px;">
                        </ul>
                        <hr>
                        <div id="demo0" style="float: right;">

                        </div>
                    </div>
                </div>
                <div id="tab-item-two" class="layui-tab-item">

                </div>
                <div id="tab-item-three" class="layui-tab-item">

                </div>

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


    <script src="<%=path+"/zjh_test/js/inquire.js"%>"></script>


</body>
</html>
