<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/14
  Time: 0:47
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
    <title>修改信息</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path+"/driving-in_files/main.css"%>" rel="stylesheet" type="text/css">
    <script src="<%=path+"/static/custom_tool.js"%>"></script>
</head>
    <body>
    <div>
        <input hidden="hidden" value="<%=path%>" id="path">
        <input hidden="hidden" value="${aId}" id="aId">
        <div style="text-align: center;">
            <br> <br> <br>
            <div class="cooperate-form">
                <div class="form">
                    <div style="padding-left: 630px">
                    <div class="form-group radio-form" id="test10" onclick="" type="button" style="padding: auto">
                        <%--                        <label skip="true" >修改头像<i>*</i></label>--%>
                        <div class="user-type-conatiner layui-upload" style="height: 15%;width: 15% ;">
                            <div class="user-type active layui-upload-list" ref="radioWrap" data-index="0"
                                 style="height:150px ;width: 200px; margin: auto;border: 0px solid black;">
                                <b skip="true">修改头像</b>
                                <img src="" style="height: 100%;width: 100%" class="layui-upload-img" id="demo10"  property="" alt="修改头像">
                                <p id="demoText10"></p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <div class="layui-form-item" id="oldPass">
                        <div class="layui-inline">
                            <label class="layui-form-label">原密码:</label>
                            <div class="layui-input-inline">
                                <input type="password" class="layui-input " value="" onfocusout="verifyPass()">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" id="newPass">
                        <div class="layui-inline">
                            <label class="layui-form-label">设置密码:</label>
                            <div class="layui-input-inline">
                                <input type="password" class="layui-input" value="">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" id="newPass2">
                        <div class="layui-inline">
                            <label class="layui-form-label">确认密码:</label>
                            <div class="layui-input-inline">
                                <input type="password" class="layui-input" value="">
                            </div>
                        </div>
                    </div>
                    <button type="button" class="layui-btn layui-btn-warm" id="toPass" onclick="changePassword()">修改密码</button>
                    <button type="button" hidden class="" id="not" onclick="passNot()">取消</button>


                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">新手机号码:</label>
                            <div class="layui-input-inline">
                                <input id="phone" type="text" class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">验证码:</label>
                            <div class="layui-input-inline">
                                <input id="code" type="text" class="layui-input">
                            </div>
                        </div>
                    </div>


                    </div>
                    <input id="codeBtn" class="layui-btn layui-btn-warm" data-send="true" type="button" value="获取验证码">
                    <button type="button" class="layui-btn layui-btn-warm" id="updatePhone">修改手机号</button>



                </div>


            </div>
        </div>
    </div>

    <script type="text/javascript" src=<%=path+"/js/pages/index/jquery.min.js"%>></script>
    <script type="text/javascript" src=<%=path+"/js/pages/index/jquery.cookie.js"%>></script>
    <script type="text/javascript" src=<%=path+"/js/pages/index/60sCountdown.js"%>></script>
    <script>


        let path = window.document.location.href.substring(0, (window.document.location.href).indexOf(window.document.location.pathname));

        $(document).on('click',"#codeBtn",function(){
            if(checkPhone()){
                $.cookie("total",5);
                timekeeping();
                $.get(path + "/api/sms/update/", {
                    phone: $("#phone").val()
                },function (res) {
                    layui.use('layer',function () {
                        let layer = layui.layer;

                        if(res.code!=0){
                            layer.msg(res.msg);
                        }


                    })
                });
                alert("模拟验证码为：000000     6个零")
            }
        });

        $(document).on("click","#updatePhone",function () {
            if($("#code").val().length==6){
                $.post(path + "/api/student/phone/", {
                    phone: $("#phone").val()
                    , code: $("#code").val()
                    , _method: "put"
                },function (res) {
                    alert(res.msg);
                });
            }else{
                alert("验证码不符合规范");
            }
        });

        function checkPhone() {
            let PhoneStr=$("#phone").val().trim();

            if(!/^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\d{8}$/.test(PhoneStr)){
                layer.msg("电话号码格式不正确,请重试");
                return false;
            }else{
                return true;
            }
        }



        let verify = -1;
        let passTypes = true;
        let sPic = "";//修改头像
        Layui_uploadImage("#test10",$("#path").val()+'/upImage',$('#demo10'),function (mag) {
        sPic = mag.fPath;},$('#demoText10'));//修改头像
        function verifyPass(){//旧密码验证
            AjaxTransfer($("#path").val()+"/verifyAdmin","aId="+$("#aId").val()+
                "&aPassword="+ $("#oldPass input").val(),function (mag) {
                if (mag.msg > 0);
                else {alert("验证密码失败！");}
                verify = mag.msg;
            });
        }//密码验证

        function changePassword() {//更改密码
            let toPass = $("#toPass");
            let not = $("#not");
            let newPass = $("#newPass input"),newPass2 = $("#newPass2 input");
            if (passTypes){//修改按钮
                toPass.html("提交");
                not.attr("class","layui-btn layui-btn-warm");
            } else {//提交按钮
                if (verify > 0){
                    if (newPass.val().length < 6) alert("密码长度应大于6位");
                    else if (!done(newPass.val(),0,newPass.val().length)) alert("密码有非法字符！");
                    else if (newPass.val() != newPass2.val()) alert("设置密码不一致");
                    else {
                        AjaxTransfer($("#path").val()+"/changePassword","aPassword="+newPass.val()
                            +"&aId="+$("#aId").val(), function (mag) {
                            if (mag.msg) {
                                alert("修改成功！请重新登录");
                                skipAbsolute("/transfer?logo=logout");//跳出iframe到指定位置
                            } else{
                                alert("修改失败,请检查网络!");
                            }
                        });
                    }

                } else {
                    alert("验证密码失败！");
                    return;
                }
            }
            passNot();
        }//更改密码
        function passNot(){//取消修改更改密码
            if (!passTypes){
                $("#oldPass").val("");
                $("#newPass").val("");
                $("#newPass2").val("");
                $("#toPass").html("修改");
                $("#not").attr("class","");
            }
            passTypes = !passTypes;
        }
    </script>
    </body>
</html>
