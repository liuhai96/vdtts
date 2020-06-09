
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>驾校后台管理端</title>
    <link rel="stylesheet" href=<%=path+"/static/layui/css/layui.css"%>>
    <script type="text/javascript" src=<%=path+"/static/layui/layui.js"%>></script>
    <style>
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">传一驾校系统后台管理</div>
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
<%--                    hello,${user.userName}--%>
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
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">日常工作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="studentmanage.jsp;" target="okframe">学员管理</a></dd>
                        <dd><a href="studentmanage.jsp;" target="okframe">驾校管理</a></dd>
                        <dd><a href="studentmanage.jsp;" target="okframe">教练车管理</a></dd>
                        <dd><a href="studentmanage.jsp;" target="okframe">教练管理</a></dd>
                        <dd><a href="studentmanage.jsp;" target="okframe">题库管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">统计报表</a>
                    <dl class="layui-nav-child">
                        <dd><a href="usermanage.jsp;" target="okframe">学员人数统计</a></dd>
                        <dd><a href="usermanage.jsp;" target="okframe">科目考试人数统计</a></dd>
<%--                        <dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">门户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="usermanage.jsp;" target="okframe">行业动态发布</a></dd>
                        <dd><a href="usermanage.jsp;" target="okframe">友情链接管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">系统管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="usermanage.jsp;" target="okframe">日志管理</a></dd>
                        <dd><a href="usermanage.jsp;" target="okframe">参数管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">其他</a>
                    <dl class="layui-nav-child">
                        <dd><a href="usermanage.jsp;" target="okframe">退出</a></dd>
                        <dd><a href="usermanage.jsp;" target="okframe">修改账号密码</a></dd>
                        <dd><a href="usermanage.jsp;" target="okframe">登录</a></dd>
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
