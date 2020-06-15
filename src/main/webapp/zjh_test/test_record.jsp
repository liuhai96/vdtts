<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/6/15
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>模拟考试记录</title>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css"/>
</head>
<body>

<input type="hidden" id="userToken" value="${sessionScope.student.sId}">

<div class="layui-inline layui-form">
    <label class="layui-form-label">选择科目</label>
    <div class="layui-input-inline">
        <select lay-filter="search_level">
            <option value="-1">全部科目</option>
            <option value="1">科目一</option>
            <option value="4">科目四</option>
        </select>
    </div>
</div>


<table id="aaa" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">查看错题</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="https://www.layuicdn.com/layui/layui.js"></script>
<script>
    layui.use(['form', 'table', 'element', 'layer'], function () {
        let table = layui.table;
        let $ = layui.$;
        let form = layui.form;
        let element = layui.element;
        let layer = layui.layer;

        form.render();
        form.render('select');

        form.on('select(search_level)', function (data) {
            table.reload('examResult', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }, where: {
                    level: data.value
                }
            }, 'data');

        });


        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('删除记录将无法找回，确认删除吗？', function (index) {


                    $.post("http://127.0.0.1:8080/api/exam/record", {
                        recordId: data.esrId
                        , _method: 'delete'
                    }, function (res) {
                        if (res.code == 0) {
                            obj.del();
                        } else {
                            layer.msg(res.msg);
                        }
                    });


                    layer.close(index);
                });
            }
        });


        table.render({
            elem: '#aaa'
            , id: 'examResult'
            , url: 'http://localhost:8080/api/exam/record/' + $("userToken").val()
            , cellMinWidth: 80
            , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                , groups: 1 //只显示 1 个连续页码
                , first: false //不显示首页
                , last: false //不显示尾页

            }
            , cols: [[
                {field: 'esrId', width: 80, title: 'ID', sort: true}
                , {field: 'esrLevel', width: 100, title: '科目等级'}
                , {field: 'esrScore', width: 80, title: '分数', sort: true}
                , {field: 'esrTime', width: 280, title: '模拟考试时间'}
                , {title: '操作', toolbar: '#barDemo', width: 150}
            ]]
            , where: {
                level: -1
            }
            , done: function (res, curr, count) {
                $(".layui-table-box").find("[data-field='esrId']").css("display", "none");

                $("[data-field='esrLevel']").children().each(function () {
                    if ($(this).text() == '1') {
                        $(this).text("科目一")
                    } else if ($(this).text() == '4') {
                        $(this).text("科目四")
                    }
                });
            }
        });
    });
</script>

</body>
</html>
