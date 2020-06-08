<%--
  Created by IntelliJ IDEA.
  User: 刘海
  Date: 2020/6/7
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>驾校门户管理</title>
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href=<%=path+"/static/layui/css/layui.css"%>>
    <script type="text/javascript" src=<%=path+"/static/layui/layui.js"%>></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">宏鑫驾校</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">驾校首页</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">驾校信息</a>
                <dl class="layui-nav-child">
                    <dd><a href="">驾校基础信息</a></dd>
                    <dd><a href="">学员评价</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出账号</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">驾校管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=path%>/pages/staff/teachermanage.jsp" target="iframe_div_iframe">教练管理</a></dd>
                        <dd><a href="javascript:;">教练违规处罚</a></dd>
                        <dd><a href="javascript:;">教练车管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">学员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">学员考试安排</a></dd>
                        <dd><a href="javascript:;">学员考试结果录入</a></dd>
                        <dd><a href="">学员培训情况</a></dd>
                        <dd><a href="">学员报名审核</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <iframe id="iframe_div" style="width: 100%;height: 100%;" name="iframe_div_iframe" src=" " height="100%" width="100%" ></iframe>
    </div>

</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
