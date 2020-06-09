/*
*@Author:周永哲
*@Description:
*@Param:
*@return:
*@Date:2020/6/8 15860799877
**/
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>学员管理</title>
    <link rel="stylesheet" href=<%=path+"/layui/css/layui.css"%>>
    <script type="text/javascript" src=<%=path+"/layui/layui.js"%>></script>
        <style>
            body{margin: 10px;}
            .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
        </style>
    </head>
<body>

<table class="layui-hide" id="demo" lay-filter="demo"></table>
<script type="text/html" id="toolbarTest">
    <div class="demoTable">
        <div class="layui-inline">
            <input type="text" class="layui-input" name="adminname" id="demoReload" autocomplete="off"placeholder="请输入管理员姓名">
        </div>
        <button class="layui-btn layui-btn-normal" lay-event="search"  lay-submit lay-filter="search" data-type="reload">搜索</button>
        <button class="layui-btn " lay-event="add" style="margin-left: 10%">添加管理员</button>
    </div>
<%--    <div class="layui-form-item">--%>
<%--        <button class="layui-btn  layui-btn-normal" lay-submit lay-filter="search" style="margin-top: 10px">搜 索</button>--%>
<%--        <button class="layui-btn " lay-event="add" style="margin-left: 10%" style="margin-top: 12px">添加管理员</button>--%>
<%--        <div class="layui-input-inline">--%>
<%--            <input type="text" name="adminsearch" lay-verify="title" autocomplete="off" placeholder="请输入姓名" class="layui-input" style="margin-top: 10px">--%>
<%--        </div>--%>
<%--    </div>--%>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<%--<script src="//res.layui.com/layui/dist/layui.js?t=1586046995289"></script>--%>
<script>
    layui.use(['jquery','laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        var $ = layui.jquery,
            laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element //元素操作
            ,slider = layui.slider //滑块


        //执行一个 table 实例
    var $table=table.render({
            elem: '#demo'
            ,height: 420
            ,method: "POST"
            ,toolbar: '#toolbarTest' //开启头部工具栏，并为其绑定左侧模板
            ,url: '/sharefile/AdminControl/selectadmininfo' //数据接口
            ,title: '用户表'
            ,page: true //开启分页
            ,limit: 5 //每行显示5页
            // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // ,totalRow: true //开启合计行
            // ,id: 'testReload'
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'adminId', title: 'adminId', width:100, sort: true, fixed: 'left', }
                ,{field: 'adminName', title: '管理员姓名', width:150}
                ,{field: 'adminPwd', title: '密码', width: 100, sort: true, totalRow: true}
                ,{field: 'sex', title: '性别', width:100, sort: true}
                ,{field: 'score', title: '评分', width: 100, sort: true, totalRow: true}
                ,{field: 'city', title: '城市', width:100}
                ,{field: 'sign', title: '签名', width: 100}
                // ,{field: 'classify', title: '职业', width: 100}
                // ,{field: 'wealth', title: '财富', width: 135, sort: true, totalRow: true}
                ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
            ]]
        });

        //监听头工具栏事件
        var addadmin =null;
        var adminId2 = null;
            table.on('toolbar(demo)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                 addadmin = layer.open({
                        type: 1,
                        title:"管理员添加"
                        , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                        ,id: 'layerDemo'+'auto' //防止重复弹出
                        ,content: $('#add')
                        // ,btn: '关闭全部'
                        ,btnAlign: 'c' //按钮居中
                        ,shade: 0 //不显示遮罩
                        , yes: function(){
                            layer.closeAll();
                        }
                    });
                    // layer.msg('添加');
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
                case "search":
                    var demoReload = $('#demoReload').val();
                    //执行重载
                    table.reload('demo', {
                        url: "/sharefile/AdminControl/selectadmininfo",
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,where: {
                            adminName: demoReload,
                            dealtype: "search",
                        }
                    });
                    $('#demoReload').val(demoReload);
                    break;
            };
        });

        //监听行工具事件

        table.on('tool(demo)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            }

            else if(layEvent === 'del'){       //删除管理员
                var adminId = data.adminId;
               var adminName= data.adminName;
                layer.alert('adminId='+adminId);
                var data ={
                    adminId: adminId,
                    dealtype: "delete"
                }
                layer.alert('data='+JSON.stringify(data));
                layer.confirm('确认删除此管理员信息？', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    $.ajax({
                        url: "/sharefile/AdminControl/deleteadmin",
                        type: "POST",
                        dataType: "text",
                        data: data,
                        success: function (msg) {
                            if (msg.trim() == "success") {
                                alert("管理员"+adminName+"删除成功！");
                                layer.close(addadmin);
                                // location.href = "userlogin.jsp";
                            } else {
                                alert(msg)
                            }
                        }
                    });
                    //向服务端发送删除指令
                });
            }

            else if(layEvent === 'edit'){ //修改管理员
               adminId2 = data.adminId;
                addadmin = layer.open({
                    type: 1,
                    title:"管理员信息修改"
                    , offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemo'+'auto' //防止重复弹出
                    ,content: $('#update')
                    // ,btn: '关闭全部'
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    , yes: function(){
                        layer.closeAll();
                    }
                });
            }
        });

        layui.use(['layer', 'form'], function () {
            var layer = layui.layer
                , form = layui.form;
            var $ = layui.jquery;
            form.on('submit(formDemo1)', function (data) {//添加管理员
                alert(JSON.stringify(data.field));
                var account = $("input[name='account']").val();
                var pwd = $("input[name='pwd']").val();
                var pwd2 = $("input[name='pwd2']").val();
                if (pwd != pwd2) {
                    alert("密码不一致！")
                } else if (account == '' || pwd == '' || pwd2 == '') {
                    alert("姓名或密码不能为空！")
                } else if (pwd == pwd2) {
                    $.ajax({
                        url: "/sharefile/AdminControl/insertadmin",
                        type: "POST",
                        dataType: "text",
                        data: data.field,
                        success: function (msg) {
                            if (msg.trim() == "success") {
                                alert("管理员添加成功！");
                                layer.close(addadmin);
                                // location.href = "userlogin.jsp";
                            } else {
                                alert(msg)
                            }
                        }
                    });

                }
                return false;
            });
        });

        layui.use(['layer', 'form'], function () {
            var layer = layui.layer
                , form = layui.form;
            var $ = layui.jquery;
            form.on('submit(formDemo)', function (data) {//修改管理员信息
                // alert(JSON.stringify(data.field));
                var account = $("input[name='account1']").val();
                var pwd = $("input[name='adminpwd']").val();
                var pwd2 = $("input[name='adminpwd2']").val();
                var data={
                    account1:account,
                    pwd:pwd,
                    dealtype: "updateadmin",
                    adminId2:adminId2,
                }
                alert("data="+JSON.stringify(data));
                if (pwd != pwd2) {
                    alert("密码不一致！")
                } else if (account == '' || pwd == '' || pwd2 == '') {
                    alert("姓名或密码不能为空!！")
                } else if (pwd == pwd2) {
                    $.ajax({
                        url: "/sharefile/AdminControl/updateadmin",
                        type: "POST",
                        dataType: "text",
                        data: data,
                        success: function (msg) {
                            if (msg.trim() == "success") {
                                alert("管理员信息修改成功！");
                                layer.close(addadmin);
                                // location.href = "userlogin.jsp";
                            } else {
                                alert(msg)
                            }
                        }
                    });

                }
                return false;
            });
        });

        // layui.use(['layer', 'form'], function () {
        //     var layer = layui.layer
        //         , form = layui.form;
        //     var $ = layui.jquery;
        //     form.on('submit(search)', function (data) {//搜索
        //         var adminsearch = $("input[name='adminsearch']").val();
        //         var data={
        //             adminsearch:adminsearch,
        //             dealtype: "search",
        //         }
        //         alert("data="+JSON.stringify(data));
        //             $.ajax({
        //                 url: "/sharefile/AdminControl/searchadmininfo",
        //                 type: "POST",
        //                 dataType: "text",
        //                 data: data,
        //                 success: function (msg) {
        //                     alert(msg+"\n"+typeof msg)
        //                     $table.render();//刷新
        //                     if (msg.trim() == "failed") {
        //                         alert("查无此管理员，请重新输入")
        //                     }
        //                 }
        //             });
        //         return false;
        //     });
        // });

        // var $ = layui.$, active = {
        //     reload: function(){
        //         // alert("dddddddddd")
        //
        //     }
        // };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        $("#cancle").click(function () {
            layer.close(addadmin);
        })
        $("#cancle2").click(function () {
            layer.close(addadmin);
        })
    });
</script>
<div id="add" style="display: none">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">姓名：</label>
                <div class="layui-input-inline">
                    <input type="text" name="account" placeholder="" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码：</label>
                <div class="layui-input-inline">
                    <input type="password" name="pwd" placeholder="" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">再次输入：</label>
                <div class="layui-input-inline">
                    <input type="password" name="pwd2" placeholder="" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">角色：</label>
                <div class="layui-input-inline">
                    <select name="role" lay-filter="aihao">
                        <option value=""></option>
                        <option value="boss">boss</option>
                        <option value="管理员" selected="">管理员</option>
                        <option value="普通人员">普通人员</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-block">
                   <input type="radio" name="sex" value="男" title="男" checked="">
                    <input type="radio" name="sex" value="女" title="女">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="hidden" name="dealtype" value="addadmin" placeholder="" autocomplete="off" class="layui-input"
                           lay-verify="required">
                    <button class="layui-btn layui-btn-primary" lay-submit lay-filter="formDemo1">添加</button>
                    <button type="button" id="cancle2"class="layui-btn layui-btn-primary" style="margin-right: 60px">取消</button>
                </div>
            </div>
        </form>
</div>
<div id="update" style="display: none">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-inline">
                <input type="text" name="account1" placeholder="" autocomplete="off" class="layui-input"
                       lay-verify="required" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-inline">
                <input type="password" name="adminpwd" placeholder="" autocomplete="off" class="layui-input"
                       lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">再次输入：</label>
            <div class="layui-input-inline">
                <input type="password" name="adminpwd2" placeholder="" autocomplete="off" class="layui-input"
                       lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色：</label>
            <div class="layui-input-inline">
                <select name="role1" lay-filter="aihao">
                    <option value=""></option>
                    <option value="boss">boss</option>
                    <option value="管理员" selected="">管理员</option>
                    <option value="普通人员">普通人员</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-block">
                <input type="radio" name="sex1" value="男" title="男" checked="">
                <input type="radio" name="sex1" value="女" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="hidden" name="dealtype" value="updateadmin" placeholder="" autocomplete="off" class="layui-input"
                       lay-verify="required">
<%--                <input type="hidden" name="adminId2" value="" placeholder="" autocomplete="off" class="layui-input"--%>
<%--                       lay-verify="required">--%>
                <button class="layui-btn layui-btn-primary" lay-submit lay-filter="formDemo">确认修改</button>
                <button type="button" id="cancle" class="layui-btn layui-btn-primary" style="margin-right: 60px">取消</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>

