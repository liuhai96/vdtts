<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/16
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>链接管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
            <div style="margin: 0 15% 0 15%">
                <div style="margin-bottom: 5px;">

                    <!-- 示例-970 -->
                    <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>

                </div>
                <table class="layui-table" lay-data="{width: 892, height:330, url:<%=path%>'/link/selectLink',
                page:true, id:'idTest',page: {limit: 6,limits: [6, 12, 18, 24,30],}}" lay-filter="demo">
                    <thead>
                    <tr>
                        <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
                        <th lay-data="{field:'lkId', width:80, sort: true, fixed: true}">ID</th>
                        <th lay-data="{field:'lkName', width:150}">链接标签</th>
                        <th lay-data="{field:'lkUrl', width:200}">跳转路径</th>
                        <th lay-data="{field:'lkPic', width:350}">友情图标路径</th>
                        <th lay-data="{fixed: 'right', width:150, align:'center', toolbar: '#barDemo'}">操作</th>
                    </tr>
                    </thead>
                </table>
                <script type="text/html" id="barDemo">
<%--                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
                    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
            </div>
        </div>
        <script>
            layui.use('table', function(){
                var table = layui.table;
                //监听表格复选框选择
                table.on('checkbox(demo)', function(obj){
                    console.log(obj)
                });
                //监听工具条
                table.on('tool(demo)', function(obj){
                    let path = $("#path").val();
                    var data = obj.data;
                    if(obj.event === 'del'){
                        layer.confirm('真的删除行么', function(index){
                            AjaxTransfer(path+"/link/deleteLink","lkId="+data.lkId,function (mag) {
                                if (mag.code > 0){
                                    obj.del();
                                    layer.close(index);
                                    alert(mag.msg);
                                }
                            })
                        });
                    } else if(obj.event === 'edit'){//编辑
                        if (confirm("            你是要去编辑：\n\n“"+data.lkName+"” " +
                                "\n\n             友情链接吗？\n\n") > 0) {
                            skipPage(path+"/back/updateLink.jsp?lkId="+data.lkId+"&lkName="+data.lkName
                                +"&lkUrl="+data.lkUrl+"&lkPic="+data.lkPic);
                        } else{
                            alert("否");
                        }
                    }
                });

                $('.demoTable .layui-btn').on('click', function(){
                    var type = $(this).data('type');
                    active[type] ? active[type].call(this) : '';
                });
            });
        </script>
    </body>
</html>
