<%--
  Created by IntelliJ IDEA.
  User: 刘海
  Date: 2020/6/11
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href=<%=path+"/static/layui/css/layui.css"%>>
    <script type="text/javascript" src=<%=path+"/static/layui/layui.js"%>></script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">驾校id</label>
        <div class="layui-input-block">
            <input type="text" name="schoolId"  autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">驾校名字</label>
        <div class="layui-input-block">
            <input type="text" name="sName"  autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">驾校账号</label>
        <div class="layui-input-block">
            <input type="text" name="aAccount"  autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">驾校地址</label>
        <div class="layui-input-block">
            <input type="text" name="schoolAddress"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-block">
            <input type="text" name="schoolPhone"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">法人代表名字</label>
        <div class="layui-input-block">
            <input type="text" name="sOwnerName"  autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">驾校注册时间</label>
        <div class="layui-input-block">
            <input type="text" name="sName"  autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">信用代码</label>
        <div class="layui-input-block">
            <input type="text" name="sBusinessId"  autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">修改驾校信息</button>
        </div>
    </div>
</form>


<form class="layui-form" action="" id="updateSchoolInfo" style="display:none">
    <div class="layui-form-item">
        <label class="layui-form-label">驾校id</label>
        <div class="layui-input-block">
            <input type="text" name="sId" required lay-verify="required" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">驾校地址</label>
        <div class="layui-input-block">
            <input type="text" name="sAddress" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-block">
            <input type="text" name="sPhone" required lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="update">立即提交</button>
            </div>
        </div>
    </div>
</form>
<script>
    layui.use('table',function() {
        var $ = layui.jquery;
        $.ajax({
            type: 'POST',
            dataType:'JSON',
            url: '/SchoolControl/findSchoolInfo',
            success: function (remsg) {
                alert(remsg.data['school'].sphone);
                $("input[name='sName']").val(remsg.data['school'].sname);
                $("input[name='aAccount']").val(remsg.data['school'].aaccount);
                $("input[name='schoolPhone']").val(remsg.data['school'].sphone);
                $("input[name='sOwnerName']").val(remsg.data['school'].sownername );
                $("input[name='schoolAddress']").val(remsg.data['school'].saddress);
                $("input[name='sBusinessId']").val(remsg.data['school'].sbusinessid);
                $("input[name='schoolId']").val(remsg.data['school'].sid);
            },
            error:function () {
                layer.alert("网络错误，请联系运营商");
            }
        });
    });

    layui.use(['form','layer'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var index1="";
        form.on('submit(formDemo)', function(data){
            $("input[name='sId']").val($("input[name='schoolId']").val())

            index1 = layer.open({
                type: 1,
                area:["400","300px"],
                skin: 'layui-layer-rim',
                shadeClose: true,//点击其他地方关闭
                content:$("#updateSchoolInfo"),
                cancel:function (index) {
                    layer.close(index);
                }
            });
            return false;
        });
        form.on('submit(update)', function(data){
            form.render();
            layer.confirm('您确定修改驾校的基本信息？',{
                btn:["确定","取消"],
                btn2:function (index) {
                    $("input[name='sPhone']").val("");
                    $("input[name='sAddress']").val("");
                    layer.close(index);
                    layer.close(index1)
                },
                btn1:function () {
                    $.ajax({
                        type: 'POST',
                        url: '<%=path%>/SchoolControl/updateSchoolBasicInfo',
                        dataType: 'JSON',
                        data:data.field,
                        success: function (resmsg) {
                            if (resmsg.code == 1) {
                                layer.msg(resmsg.msg);
                                $("input[name='sPhone']").val("");
                                $("input[name='sAddress']").val("");
                                form.render();
                            } else {
                                layer.msg(resmsg.msg);
                                layer.close(index);
                            }
                        }
                    });
                }
            });
            return false;
        });
    });

</script>
</body>
</html>
