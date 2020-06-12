<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/12
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    int aId = 0;
    try{ aId = Integer.valueOf(request.getSession().getAttribute("aId").toString()); } catch (Exception e){}
%>
<html>
<head>
    <meta charset="utf-8">
    <title>教练信息</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path+"/static/custom_tool.js"%>"></script>
</head>
<body>
<div>
    <input hidden="hidden" value="<%=path%>" id="path">
    <input hidden="hidden" value="<%=aId%>" id="aId">
    <%
        request.getSession().setAttribute("userHome",path+"/teacherController/teacherInit");
    %>
    <%--教练信息--%>
    <div style="background-color: cornflowerblue;width: 100%;height:auto ">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <label style="color: #51ffd5;font-size: 25px;text-align: start"> 欢迎 xx 教练</label>
        <div style="text-align: right">
            <a style="color: coral;font-size: 20px;" href="<%=path+"/home"%>">首页</a>
            <i style="color: #cb53ff;font-size: 20px;">|</i>

            <a style="color: coral;font-size: 20px;" href="<%=path+"/pages/homepage/home-page.jsp?logout=cc632ef332fex2ee3010012e"%>">注销登录</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">查看学员</li>
            <li>我的信息</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div>
                    <div class="demoTable" style="text-align: center;">
                        搜索ID：
                        <div class="layui-inline">
                            <input class="layui-input" name="id" id="demoReload" autocomplete="off">
                        </div>
                        <button class="layui-btn" data-type="reload">搜索</button>
                    </div>
                    <div style="width: 60%;margin: 0 0 0 20%">
                        <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">
                我的信息界面
            </div><%--界面2--%>

        </div>
    </div>

    
</div>
<script>
    layui.use('table', function(){
        $ = jQuery;
        var table = layui.table;
        //方法级渲染
        table.render({//表格
            elem: '#LAY_table_user'
            ,url: '/teacherController/stuTableData?sTeacherId='+$("#aId").val()
            ,cols: [[
                {field:'sId', title: 'ID', width:80, sort: true, fixed: true}
                ,{field:'sName', title: '学生姓名', width:150}
                ,{field:'sSex', title: '性别', width:100}
                ,{field:'sBirthday', title: '出生日期', width:150, sort: true}
                ,{field:'sPhone', title: '联系方式', width:150}
                ,{field:'sLicenseTime', title: '驾考情况', width:150}
                ,{field:'schoolName', title: '驾校', width:150}
            ]]
            ,id: 'testReload'
            ,height: 400
            ,page: {limit: 8,//指定每页显示的条数
                limits: [8, 16, 24, 32,],},//每页条数的选择项
        });
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');

                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        sName:demoReload.val()
                    }
                }, 'data');
            }
        };
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });
    });
</script>
</body>
</html>
