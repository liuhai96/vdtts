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
        <label class="layui-form-label">图片地址</label>
        <div class="layui-input-block">
            <input type="text" name="sPicUrl"  autocomplete="off" class="layui-input" disabled="disabled">
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
            <input type="text" name="sAddress" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-block">
            <input type="text" name="sPhone" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片地址</label>
        <div class="layui-input-block">
            <input type="text" name="sImageUrl"  autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div>
    <div class="layui-form-item" style="display:inline-block;margin-right:20px">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="update">立即提交</button>
            </div>
        </div>
    </div>
    <div class="layui-upload" style="display:inline-block; margin-top:40px">
        <button type="button" class="layui-btn" id="test1">上传图片</button>
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="demo1">
            <p id="demoText"></p>
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
            url: '<%=path%>/SchoolControl/findSchoolInfo',
            success: function (remsg) {
                $("input[name='sName']").val(remsg.data['school'].sname);
                $("input[name='aAccount']").val(remsg.data['school'].aaccount);
                $("input[name='schoolPhone']").val(remsg.data['school'].sphone);
                $("input[name='sOwnerName']").val(remsg.data['school'].sownername );
                $("input[name='schoolAddress']").val(remsg.data['school'].saddress);
                $("input[name='sBusinessId']").val(remsg.data['school'].sbusinessid);
                $("input[name='schoolId']").val(remsg.data['school'].sid);
                $("input[name='sPicUrl']").val(remsg.data['school'].simageUrl);
            },
            error:function () {
                layer.alert("网络错误，请联系运营商");
            }
        });
    });

    layui.use(['form','layer','upload'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer,upload=layui.upload;
        var index1="";
        var sImageUrl = "";
        form.on('submit(formDemo)', function(data){
            $("input[name='sId']").val($("input[name='schoolId']").val())

            index1 = layer.open({
                type: 1,
                area:["800","600px"],
                skin: 'layui-layer-rim',
                shadeClose: true,//点击其他地方关闭
                content:$("#updateSchoolInfo"),
                cancel:function (index) {
                    layer.close(index);
                }
            });
            return false;
        });

        var uploadInst = upload.render({
            elem: '#test1'
            , url: '<%=path%>/upImage' //改成您自己的上传接口
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }else{
                    sImageUrl = res.fPath;
                    $("input[name='sImageUrl']").val(sImageUrl)
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

        form.on('submit(update)', function(data){
            form.render();
          var index = layer.confirm('您确定修改驾校的基本信息？',{
                btn:["确定","取消"],
                btn2:function (index) {
                    layer.close(index);
                    layer.close(index1)
                    $('#updateSchoolInfo')[0].reset();//重置表单
                    form.render();
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
                                form.render();
                            } else {
                                layer.msg(resmsg.msg);
                            }
                            layer.close(index)
                            layer.close(index1);
                            $('#updateSchoolInfo')[0].reset();//重置表单
                            form.render();
                            $('#demo1').attr('src', ""); //图片链接（base64）
                        }
                    });
                }
            });
            return false;
        });


        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });



    });

</script>
</body>
</html>
