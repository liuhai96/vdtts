<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/8
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String schoolName = "老司机驾考";//名称
    String path = request.getContextPath();
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie:cookies)
        if(cookie.getName().equals("schoolName"))schoolName = cookie.getValue();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>学员注册</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path+"/static/custom_tool.js"%>"></script>
</head>
    <body background="<%=path + "/image/home-page/loginGround.png"%>" style="background-size: 100%">
        <input hidden="hidden" value="<%=path%>" id="path">
        <div class="layui-col-md12" style="height: 20%;">
            <br><label class="layui-col-md-offset2" style="font-size: 35px;color:#ffda90;"><%=schoolName%></label>
            <br><label class="layui-col-md-offset3" style="font-size: 25px;color: crimson">学员注册</label><br>
            <div class="layui-col-md-offset9" style="font-size: 18px;">
                <a href="<%=path+"/pages/homepage/home-page.jsp"%>" style="color: #2aa8ff">首页</a>&nbsp;|
                <a href="<%=path+"/pages/homepage/login.jsp"%>" style="color: #2aa8ff">登录</a>&nbsp;|
                <a href="<%=path%>" style="color: #ffb840;background-color: #528bff">注册</a>
            </div>
        </div>
        <div style="width: 50%;font-size: 25px;
        margin: 0 0 0 20%;text-align: center;background: rgba(69,255,209,0.3);">
            <br><br><label style="text-align: center;font-size: 35px;">学员注册</label><br>
            <br>
            <div class="layui-col-md-offset2" style="text-align: center;">
                <label class="layui-col-md3">用户名:</label>
                <input name="sName" value="" placeholder="请输入你的姓名" type=
                        "text" style="height: 35px;width: 50%;"><br>
                <label id="sNameNotify" style="color: crimson"></label><br>
                <label class="layui-col-md3">密码:</label>
                <input name="aPassword" value="" placeholder="请输入你的密码" type=
                        "password" style="height: 35px;width: 50%;"><br>
                <label id="aPasswordNotify" style="color: crimson"></label><br>
                <label class="layui-col-md3">确认密码:</label>
                <input name="aPassword2" value="" placeholder="请确认你的密码" type=
                        "password" style="height: 35px;width: 50%;"><br>
                <label id="aPassword2Notify" style="color: crimson"></label><br>
                <label class="layui-col-md3">身份证号:</label>
                <input name="sSfz" value="" placeholder="请输入你的身份证号" type=
                        "text" style="height: 35px;width: 50%;"><br>
                <label id="sSfzNotify" style="color: crimson"></label><br>
                <label class="layui-col-md3">手机号码:</label>
                <input name="sPhone" value="" placeholder="请输入你的手机号" type=
                        "text" style="height: 35px;width: 50%;"><br>
                <label id="sPhoneNotify" style="color: crimson"></label><br>
                <label class="layui-col-md3 ">性别:</label>
                <label class="layui-col-md1 layui-col-md-offset2">男<i class="layui-icon ">&#xe662;</i>
                    <input type="checkbox" checked="checked" onclick="Change(true)" id="boy"></label>
                <label class="layui-col-md1 layui-col-md-offset2">女<i class="layui-icon">&#xe661;</i>
                <input type="checkbox" onclick="Change(false)" id="girl"></label><br><br>
                <input type="text" value="" placeholder="请输入验证码" class="input-val" style="height: 35px;width: 30%;">
                <canvas id="canvas" class="layui-col-md3" style="height: 35px;background-color: ghostwhite; margin: 0 0 0 10%;"></canvas>
            </div><br>
            <input hidden name="sSex" vocab="男">
            <label style="font-size: 20px"><input type="checkbox" id="deal" checked="checked">我已经同意<a>xxx协调</a></label>
            <br><br><button class="btn layui-btn layui-btn-normal layui-btn-radius" style="width: 150px;font-size: 25px;">&nbsp;&nbsp;提&nbsp;交&nbsp;&nbsp;</button><br><br>
            <br><label style="font-size: 18px;">我已经有账号，<a href="<%=path+"/pages/homepage/login.jsp"%>" style="color: crimson">去登录</a></label>
        </div>
    </body>
    <script>
        let genders = true;

        function Change(gender) {//男女转换
            genders = gender;
            $("#boy").attr("checked", gender);
            $("#girl").attr("checked", !gender);
        }
        function toService() {
            let isPass = true;
            let sName = $("input[name = 'sName']"), aPassword = $("input[name = 'aPassword']"),
                aPassword2 = $("input[name = 'aPassword2']"),sSfz = $("input[name = 'sSfz']"),
                sPhone = $("input[name = 'sPhone']"),sSex = $("input[name = 'sSex']"),sNameNotify =
                $("#sNameNotify"),aPasswordNotify = $("#aPasswordNotify"),sPhoneNotify =
                $("#sPhoneNotify"), aPassword2Notify = $("#aPassword2Notify"), sSfzNotify = $("#sSfzNotify");
            if (genders) sSex.attr("value","男"); else sSex.attr("value","女");
            //校验姓名
            if (sName.val().length < 1){sNameNotify.html("*名字为必填项目！");isPass = false;}
            else if (number.test(sName.val())){sNameNotify.html("*名字中不能含有数字！");isPass = false;}
            else {sNameNotify.html("");}
            //校验密码格式
            if (aPassword.val().length < 1){aPasswordNotify.html("*密码为必填项目！");isPass = false;}
            else if (!done(aPassword.val(),0,aPassword.val().length)){aPasswordNotify.html("*密码中含有非法字符！");isPass = false;}
            else {aPasswordNotify.html("");}
            //校验密码真正准确性
            if (aPassword2.val().length < 1){aPassword2Notify.html("");isPass = false;}
            else if (aPassword2.val() != aPassword.val()){aPassword2Notify.html("*密码不一致");isPass = false;}
            else {aPassword2Notify.html("");}
            //校验联系方式
            if (sPhone.val().length < 1){sPhoneNotify.html("*联系方式为必填项目！");isPass = false;}
            else if (sPhone.val().length < 3 || sPhone.val().length  > 11){sPhoneNotify.html("*联系方式长度大于3,小于12位！");isPass = false;}
            else if (!number.test(sPhone.val())){sPhoneNotify.html("*联系方式仅限制数字号码！");isPass = false;}
            else {sPhoneNotify.html("");}
            //校验身份证
            if (sSfz.val().length < 1){sSfzNotify.html("*身份证号为必填项目！");isPass = false;}
            else if (sSfz.val().length != 15 && sSfz.val().length  != 18){sSfzNotify.html("*身份证号长度未15位,或18位！");isPass = false;}
            else if (!number.test(cutOut(sSfz.val(),undefined,sSfz.val().length-1))){sSfzNotify.html("*身份证号中含有非法字符！");isPass = false;}
            else if (!done(sSfz.val(),sSfz.val().length-2,sSfz.val().length)){sSfzNotify.html("*身份证号中含有非法字符！");isPass = false;}
            else {sSfzNotify.html("");}
            if (isPass){
                AjaxTransfer("/studentController/studentRegister","sName="+sName.val()+"&aPassword="+aPassword.val() +"&sSfz="+
                    sSfz.val()+"&sPhone="+ sPhone.val()+"&sSex="+sSex.val()+"&sPic=//t.cn/RCzsdCq",function (mag) {
                    alert(mag.msg);
                    skipPage("/pages/homepage/register.jsp");
                });
            }
        }
    </script>
</html>
