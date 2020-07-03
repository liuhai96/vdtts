<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>学员登录</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path+"/css/pages/index/login.css"%>" rel="stylesheet" type="text/css">
    <script src="<%=path+"/js/pages/index/stuLogin.js"%>" type="text/javascript"></script>
    <script type="text/javascript" src=<%=path + "/static/jqueryFaceDetection/camera.js"%>></script>
    <script type="text/javascript" src=<%=path + "/static/jqueryFaceDetection/cascade.js"%>></script>
    <script type="text/javascript" src=<%=path + "/static/jqueryFaceDetection/ccv.js"%>></script>
    <script type="text/javascript" src=<%=path + "/static/jqueryFaceDetection/jquery.facedetection.js"%>></script>
</head>
<body>

<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="zjh_msg" value="${zjh_msg}">

<p style="font-family: newword;color: #274472;font-size: 26px;text-align: center;height: 80px; margin-left: -230px;line-height: 110px;">
    欢迎登录驾驶培训公共服务平台！</p>
<div class="main-box">

    <form id="faceLogin" action="<%=path+"/login/student/face"%>" method="post" style="display: none;">
        <input id="faceImg" type="hidden" name="base64">
        <p style="">学员登录</p>
        <div class="reg-box">
            <div class="reg-box" style="width: 585px;">
                <div class="alone-buy layui-btn-container" style="display: none;">
                    <button id="openCamera" type="button" class="layui-btn" style="position: relative;" >开启摄像头</button>
                    <button id="closeCamera" type="button" class="layui-btn" style="position: relative;" >关闭摄像头</button>
                    <div id="videoDiv" style="">
                        <video id="video" ></video>
                    </div>
                    <img id="image">

                </div>
                <div class="layui-main alone-items">
                    <div class="methodContent">
                        <div id="cameraDiv">
                            <canvas id="myCanvas" style="display: block;background-color: black" width="500px" height=350px"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sub space" style="margin-right: 50px;">
                <br>
                <a id="useAccount" href="JavaScript:;" style="float: right;margin-top: 10px;">使用账号登录</a>
            </div>
        </div>
    </form>

    <form id="accountLogin" action="<%=path+"/api/login/student"%>" method="post" style="width: 100%;">
        <p style="">学员登录</p>
        <div style="display: block;">
            <ul class="reg-box">
                <li>
                    <label style="letter-spacing: 3px;">学员账号：</label>
                    <input name="aAccount" type="text"
                           placeholder="请输入你的账号"
                           style="margin-left: 2px;" class="account accounts"
                           onblur="textBlur(this)" onfocus="textFocus(this)">
                    <span class="error error5"></span>
                <li>
                    <label style="letter-spacing: 3px;">登录密码：</label>
                    <input name="aPassword" type="password"
                           placeholder="请输入登录密码"
                           style="margin-left: 2px;" class="idcard"
                           onblur="textBlur(this)" onfocus="textFocus(this)">
                    <span class="error error5"></span>
                </li>
                <li>
                    <label style="letter-spacing: 7px;">验证码：</label>
                    <input class="sradd photokey" name="vcode" onblur="textBlur(this)"
                           onfocus=" textFocus(this) "
                           style="color: rgb(153, 153, 153); ime-mode: disabled; margin-left: 1px;" type="text"
                           value="验证码">
                    <span id="vk" class="add phoKey"></span>
                    <span class="error error7"></span>
                </li>
                <li><a id="registerLink" href="JavaScript:;">没有账号？立马去注册一个</a></li>
            </ul>
            <div class="sub space" style="margin-right: 50px;">
                <button class="" id="dd" type="submit">登录</button>
                <br>
                <br>
                <br>
                <button class="" id="cc" onclick="resetMsg();" style="display: block;" type="button">重置</button>
                <br>
                <br>
                <a id="useFace" href="JavaScript:;" style="float: right;">使用人脸登录</a>
            </div>
        </div>
    </form>
</div>
<div class="layui-layer-move"></div>
<script src="https://www.layuicdn.com/layui/layui.js"></script>
<script>
    layui.use(['form', 'table', 'element', 'layer'], function () {
        let $ = layui.$;
        let layer = layui.layer;

        let clock2;

        $("#iframe",window.parent.document).attr("style","height:"+Number(document.body.scrollHeight)+"px;");

        let msg = $("#zjh_msg").val();

        if (msg.length > 0) {
            layer.msg(msg, {icon: 0});
        }

        $("#useAccount").on("click",function (event) {
            $("#faceLogin").attr("style","display:none;width: 585px;");
            $("#accountLogin").attr("style","display:block;");
            $("#closeCamera").click();
            clearInterval(clock2);
        });

        $("#useFace").on("click",function (event) {
            $("#faceLogin").attr("style","display:block;width: 585px;");
            $("#accountLogin").attr("style","display:none;");
            $("#openCamera").click();
        });

        let path = window.document.location.href.substring(0, (window.document.location.href).indexOf(window.document.location.pathname));

        $("#registerLink").on("click",function (event) {
           top.location.href=path+"/student/register";
        });


        $("#openCamera").on("click",function () {
            clock2=setInterval(function () {
                $('#image').faceDetection({
                    complete: function (faces) {
                        if (faces.length == 0) { //说明没有检测到人脸
                            console.log("无人脸");
                        } else {
                            console.log("识别到人脸");

                            $("#closeCamera").click();

                            clearInterval(clock2);

                            let base64 = $('#image').attr("src");
                            $("#faceImg").attr("value",base64);
                            $("#faceLogin").submit();
                        }
                    },
                    error: function (code, message) {
                        console.log("complete回调函数出错");
                    }
                });
            }, 60);
        });

    });
</script>
</body>
</html>
