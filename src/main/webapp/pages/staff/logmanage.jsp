<%--
  Created by IntelliJ IDEA.
  User: 刘海
  Date: 2020/6/8
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>日志管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href=<%=path+"/static/layui/css/layui.css"%>>
    <script type="text/javascript" src=<%=path+"/static/layui/layui.js"%>></script>
</head>
<body>

<table class="layui-hide" id="test"></table>


<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'<%=path%>/logControl/findLogList'
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                ,groups: 1 //只显示 1 个连续页码
                ,first: false //不显示首页
                ,last: false //不显示尾页

            }
            ,cols: [[
                {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'actionType', width:100, title: '操作类型'}
                ,{field:'content', width:80, title: '操作内容', sort: true}
                ,{field:'createTime', width:80, title: '操作时间'}
                ,{field:'operatorName', title: '操作对象', minWidth: 150}
                ,{field:'opertorNo', width:80, title: '操作账号', sort: true}
            ]]

        });
    });
</script>

</body>
</html>