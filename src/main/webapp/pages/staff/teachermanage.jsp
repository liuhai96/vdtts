<%--
  Created by IntelliJ IDEA.
  User: 刘海
  Date: 2020/6/6
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>驾校教练管理</title>
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href=<%=path+"/static/layui/css/layui.css"%>>
    <script type="text/javascript" src=<%=path+"/static/layui/layui.js"%>></script>
</head>
<body>
<div class="layui-container" style="margin-top: 15px">
    <table class="layui-hide" id="test" lay-filter="test"></table>
</div>
<form action="" id="addTeacher" style="display: none" class="layui-form">
    <div class="layui-form-item" id="accountDiv">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline" id="userAccount">
            <input type="text"  name="userAccount" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="userName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" name="userPhone" required  lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked="">
            <input type="radio" name="sex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addTeacher">添加教练</button>
        <button class="layui-btn layui-btn-sm" lay-event="findTeacher">查询</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


</body>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $table =  table.render({
            elem: '#test'
            ,url:'/teacherController/findTeacherList'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'tId', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
                ,{field:'tName', title:'姓名', edit: 'text'}
                ,{field:'tSfz', title:'身份证号'}
                ,{field:'tSex', title:'性别'}
                ,{title:'所属驾校名',templet: '<div>{{d.school.sName}}</div>'}

                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,page: {limit: 5,//指定每页显示的条数
                limits: [5, 10, 15, 20,
                    25, 30, 35, 40, 45, 50],},//每页条数的选择项
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            var $ = layui.jquery;
            switch(obj.event){
             case 'addTeacher':
                layer.open({
                    type: 1,
                    area:["400","300px"],
                    content:$("#addTeacher"),

                })
                 break;
                // case 'addAdmin':
                //     layer.open({
                //         type:1
                //         ,area:["400","300px"]
                //         ,content: $("#addAdmin")
                //         ,btn: ['确定', '取消']
                //         ,yes: function(index, layero){
                //             layer.alert($("select[name='adminRole'] option:selected").val());
                //             $.ajax({
                //                 url:"/text/ManageAdminServlet?methodName=addAdmin"
                //                 ,type:"POST"
                //                 ,dataType:"text"
                //                 ,data:{
                //                     adminAccount:$("input[name='adminAccount']").val(),
                //                     adminName:$("input[name='adminName']").val(),
                //                     adminPwd:$("input[name='password']").val(),
                //                     adminRoleId:$("select[name='adminRole'] option:selected").val()
                //                 },
                //                 success:function (msg) {
                //                     if(msg.trim()=="1"){
                //                         layer.alert("添加成功");
                //                         $table.reload();
                //                         layer.close(index);
                //                     }else {
                //                         layer.alert("添加失败");
                //                         layer.close(index);
                //                     }
                //                 }
                //             })
                //
                //         }
                //         ,cancel: function(index, layero){
                //             //按钮【按钮二】的回调
                //             //return false 开启该代码可禁止点击该按钮关闭
                //         }
                //     });
                //     layui.use('form',function(){
                //         var form = layui.form;
                //         form.render();
                //     });
                //     break;


                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;

            };

        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });
</script>
</html>
