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
<%--    <link rel="stylesheet" href=<%=path+"/static/laydate/theme/default/laydate.css"%>>--%>
    <script type="text/javascript" src=<%=path+"/static/layui/layui.js"%>></script>
<%--    <script type="text/javascript" src=<%=path+"/static/laydate/laydate.js"%>></script>--%>
</head>
<body>
<blockquote class="layui-elem-quote">
<%--    layDate 是目前 layui 独立维护的三大组件（即：layer、layim、layDate）之一。在 layui 2.0 的版本中，layDate 完成了一次巨大的逆袭。--%>
    <a class="layui-btn layui-btn-normal" href="http://www.layui.com/laydate/" target="_blank">layDate官网</a>
</blockquote>
<div class="layui-container" style="margin-top: 15px">
    <table class="layui-hide" id="test" lay-filter="test"></table>
</div>
<form action="" id="addTeacher" style="display: none" class="layui-form">
    <div class="layui-form-item" id="accountDiv">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline" id="teacherAccount">
            <input type="text"  name="aAccount" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="idNumberDiv">
        <label class="layui-form-label">身份证号</label>
        <div class="layui-input-inline" id="idNumber">
            <input type="text"  name="tSfz" required  lay-verify="required" placeholder="请输入身份证号码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="teacherNameDiv">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline" id="teacherName">
            <input type="text" name="tName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="aPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" name="tPhone" required  lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="tSex" value="男" title="男" checked="">
            <input type="radio" name="tSex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<form id="updateTeacher" style="display: none" class="layui-form">
    <div class="layui-form-item" style="display:none" >
        <label class="layui-form-label" >教练Id</label>
        <div class="layui-input-inline">
            <input id="teacherId" type="text" name="tId" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="account_div">
    <label class="layui-form-label">账号</label>
    <label class="layui-form-label" id="account"></label>
    </div>
    <div class="layui-form-item" id="name_div">
        <label class="layui-form-label">姓名</label>
        <label class="layui-form-label" id="name"></label>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" name="tPhone" required  lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">修改本月限制人数</label>
        <div class="layui-input-inline">
            <input type="text"  name="tLimit" required  lay-verify="required" placeholder="请输修改数量" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>
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
                ,{title:'账号',templet: '<div>{{d.account.aAccount}}</div>'}
                ,{field:'tName', title:'姓名', edit: 'text'}
                ,{field:'tSfz', title:'身份证号'}
                ,{field:'tSex', title:'性别'}
                ,{field:'tBirthday', title:'生日'}
                ,{field:'tPhone', title:'电话'}
                ,{field:'tLicenseTime', title:'获取驾照时间'}
                ,{field:'tLimit', title:'本月限制通过学员人数'}
                ,{title:'所属驾校名',templet:'<div>{{d.school.sName}}</div>'}
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
                              var index =   layer.open({
                                    type: 1,
                                    area:["400","300px"],
                                    skin: 'layui-layer-rim',
                                    shadeClose: true,//点击其他地方关闭
                                    content:$("#addTeacher"),
                                    cancel:function (index) {
                                        layer.close(index);
                                    }
                });
                 layui.use('form', function(){
                     var form = layui.form;
                     form.on('submit(demo1)', function(data){
                         $.ajax({
                             type: 'POST',
                             url: '/teacherController/addTeacher',
                             dataType: 'JSON',
                             data: data.field,
                             success: function (msg) {
                               if (msg.code==1){
                                   layer.msg("添加教练成功");
                               }else if (msg.code==0 ) {
                                   layer.msg("该账号已存在");
                               }else{
                                   layer.msg("添加教练失败");
                               }
                                 layer.close(index);
                             }
                         });

                         return false;
                     });
                 });
                 break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;

            };

        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var $ = layui.jquery;
            var data = obj.data
            alert(JSON.stringify(data.tId));
            var tId = data.tId;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么',{
                    btn:["确定","取消"],
                    btn2:function (index) {
                        alert(data.tId);
                        layer.close(index);
                    },
                    btn1:function () {
                       $.ajax({
                           type: 'POST',
                           url: '/teacherController/deleteTeacher',
                           dataType: 'JSON',
                           data:{
                               tId:tId
                           },
                           success: function (msg) {
                               if(msg.code==1){
                                   layer.msg("您已成功删除该教练信息");
                               }else if(msg.code==0 ){
                                   layer.msg("删除失败");
                               }else{
                                   layer.msg("该教练的账号信息不存在");
                               }
                           }
                       });
                    }
                    }
                );
            } else if(obj.event === 'edit'){
                $("#account").html(data.account.aAccount);
                $("#name").html(data.tName);
                $("#teacherId").val(data.tId);
                var index1 = layer.open({
                    type: 1,
                    area:["400","300px"],
                    skin: 'layui-layer-rim',
                    shadeClose: true,//点击其他地方关闭
                    content:$("#updateTeacher"),
                    cancel:function (index) {
                        layer.close(index);
                    }
                });
                layui.use('form', function(){
                    var form = layui.form;
                    form.render();
                    form.on('submit(demo2)', function(data){
                        $.ajax({
                            type: 'POST',
                            url: '/teacherController/updateTeacherInfo',
                            dataType:'JSON',
                            data: data.field,
                            success: function (msg) {
                                if (msg.code==1){
                                    layer.alert("修改教练基本信息成功");
                                    $table.reload();
                                }
                                layer.close(index1);
                            }
                        });
                        return false;
                    });
                });
            }
        });
    });
    //
    // laydate.render({
    //     elem: '#test1'
    // });

</script>
</html>
