<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 2020/5/15
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理端</title>
    <link rel="stylesheet" href=<%=path+"/layui/css/layui.css"%>>
    <script type="text/javascript" src=<%=path+"/layui/layui.js"%>></script>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">共享文件系统用戶端</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">用户管理</a></li>
            <li class="layui-nav-item"><a href="">用户中心</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    养猪场大姐
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
<%--                <li class="layui-nav-item layui-nav-itemed">--%>
<%--                    <a class="" href="javascript:;">个人信息</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;"title="fontlogin.jsp" onclick="changepath(this)" target="okframe">我的信息</a></dd>--%>
<%--                        <dd><a href="register.jsp;" target="okframe">我的文档</a></dd>--%>
<%--                        <dd><a href="javascript:;">我的积分</a></dd>--%>
<%--&lt;%&ndash;                        <dd><a href="">超链接</a></dd>&ndash;%&gt;--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">文档中心</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;">上传文档</a></dd>--%>
<%--                        <dd><a href="javascript:;">下载文档</a></dd>--%>
<%--&lt;%&ndash;                        <dd><a href="">超链接</a></dd>&ndash;%&gt;--%>
<%--                    </dl>--%>
<%--                </li>--%>
                <li class="layui-nav-item">
                    <a href="javascript:;">管理员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="adminmanage.jsp;" target="okframe">管理员管理</a></dd>
<%--                        <dd><a href="javascript:;">下载文档</a></dd>--%>
                        <%--                        <dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="usermanage.jsp;" target="okframe">用户查询</a></dd>
                        <dd><a href="javascript:;">用户管理</a></dd>
<%--                        <dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">文档管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">文档审核</a></dd>
                        <dd><a href="javascript:;">文档配置</a></dd>
<%--                        <dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">日志管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">日志列表</a></dd>
                        <dd><a href="javascript:;">日志查看</a></dd>
<%--                        <dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">系统配置</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">奖励配置</a></dd>
<%--                        <dd><a href="javascript:;">下载文档</a></dd>--%>
<%--                        <dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe name="okframe" frameborder="0" src="" style="width: 100%;height: 100%"></iframe>
    </div>

    <div class="layui-footer">
<%--        <!-- 底部固定区域 -->--%>
<%--        © layui.com - 底部固定区域--%>
    </div>
</div>
<%--<script src="../src/layui.js"></script>--%>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
<%--<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->--%>
<%--<!--[if lt IE 9]>--%>
<%--<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>--%>
<%--<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>--%>
<%--<![endif]-->--%>
</body>
</html>
