<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/21
  Time: 12:56
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
    <title>人脸录入</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <%--调用摄像头--%>
    <script type="text/javascript" src=<%=path + "/static/jqueryFaceDetection/camera.js"%>></script>
    <%--人脸检测--%>
    <script type="text/javascript" src=<%=path + "/static/jqueryFaceDetection/cascade.js"%>></script>
    <script type="text/javascript" src=<%=path + "/static/jqueryFaceDetection/ccv.js"%>></script>
    <script type="text/javascript" src=<%=path + "/static/jqueryFaceDetection/jquery.facedetection.js"%>></script>
    <script type="text/javascript" src="<%=path+"/static/custom_tool.js"%>"></script>
</head>
<body style="text-align: center;">
<input hidden="hidden" value="<%=path%>" id="path">
<c:if test="${sessionScope.student.getSId() eq null}">
    <script>alert("请先登录！");</script>
</c:if>
<c:if test="${xx == 1}">
    <script>
        setTimeout(function () {
            history.go(0);
        },15000);
    </script>
</c:if>
<c:if test="${resultAddFace == 1}">
    <script>alert("你已经成功录入！");</script>
    <%request.getSession().setAttribute("resultAddFace",null);%>
</c:if>
<c:if test="${resultAddFace == -1}">
    <script>alert("人脸录入失败！");</script>
    <%request.getSession().setAttribute("resultAddFace",null);%>
</c:if>
    <div style="text-align: start">
        <div class="alone-buy layui-btn-container" style="text-align: center;">
            <button id="openCamera" type="button" class="layui-btn" style="position: relative;">开启录入</button>
            <button type="button" class="layui-btn" onclick="history.go(0)">关闭摄像头</button>
        </div>
    </div>
    <label style="font-size: 20px;color: coral">人脸录入</label><br>
    <div style="display: none;">
        <div id="videoDiv" style="">
            <video id="video" ></video>
        </div>
        <img id="image">
        <form id="userInCameraForm" action="<%=path+"/addFace"%>" method="post">
            <input id="faceImg" type="hidden" name="base64">
            <input hidden name="sId" value="${student.SId}">
        </form>
    </div>
    <div class="layui-main alone-items">
        <div class="methodContent">
            <div id="cameraDiv">
                <canvas id="myCanvas" style="display: block;margin: auto;background-color: black" width="500px" height=350px"></canvas>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //人脸识别js
        var layer;
        var form;
        var table;
        var laydate;
        layui.use(['layer','upload'], function () {
            var $ = layui.$;
            layer = layui.layer;
            upload=layui.upload;

            $("#openCamera").on("click",function () {
                var clock2=setInterval(function () {
                    $('#image').faceDetection({
                        complete: function (faces) {
                            if (faces.length == 0) { //说明没有检测到人脸
                                console.log("无人脸");
                            } else {
                                console.log("识别到人脸");
                                let base64 = $('#image').attr("src");
                                $("#faceImg").attr("value",base64);
                                $("#userInCameraForm").submit();
                                alert("已识别到人脸！服务器正在为了存储......");
                                history.go(0);
                            }
                        },
                        error: function (code, message) {
                            console.log("complete回调函数出错");
                        }
                    });
                }, 1000);
            });
        });
    </script>
</body>
</html>
