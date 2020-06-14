<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>观看视频</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<%=path + "/zjh_test/css/reset.css"%>">
    <link rel="stylesheet" href="<%=path + "/zjh_test/css/jx_video_detail.css"%>">
</head>

<body>

<input type="hidden" id="userToken" value="${studentId}">

<div class="commonhead_line" style="border-top: 1px solid #00C356;"></div>

<div class="video-detail-page">
    <p>位置：<a href="http://tv.jxedt.com/">学车视频</a> &gt; ${levelName}：<span id="videoTitle">${video.VTitle}</span></p>
    <div class="video-play-detail">
        <div class="detail-video">
            <video id="videoDiv" controls="" style="border: 1px solid blue;max-height: 470px;width: 800px;"
                   title="video element" src="<%=path%>${video.VVideo}"></video>
        </div>
        <div class="detail-content">
            <div class="detail-header">精彩推荐</div>
            <div class="detail-header-border"></div>
            <ul>
                <c:forEach items="${videoList}" var="item">
                    <li>
                        <c:if test="${video.VId == item.VId}">
                            <div class="circle selected-circle"></div>
                        </c:if>
                        <c:if test="${video.VId != item.VId}">
                            <div class="circle"></div>
                        </c:if>

                        <a href="javascript:void(0);" video="<%=path%>${item.VVideo}"
                           class="otherVideoA">${item.VTitle}</a>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>
</div>

<script src="https://www.layuicdn.com/layui/layui.js"></script>


<script>
    layui.use(['element'], function () {

        let $ = layui.$;

        let video = document.getElementById("videoDiv");

        video.play();

        //总计播放时长
        let playTime = 0;

        //定时器的标题
        let countDown = undefined;

        video.addEventListener('play', function () {  //开始播放
            console.log("视频开始播放");

            countDown = setInterval(function () {
                playTime++;
                console.log("记录学时中");
            }, 1000);
        });

        video.addEventListener('pause', function () { //暂停开始执行的函数
            console.log("暂停播放");
            clearInterval(countDown);
        });

        video.addEventListener('ended', function () { //结束
            console.log("播放结束");
            submitTime();
        }, false);

        $("a[class*='otherVideoA']").on("click", function (event) {
            $("a[class*='otherVideoA']").prev().removeClass("selected-circle");
            $(this).prev().addClass("selected-circle");

            submitTime();

            $("#videoTitle").html($(this).html());

            $(video).attr("src", $(this).attr("video"));
            video.load();
            video.play();
        });


        let userId = $("#userToken").val();

        function submitTime() {
            clearInterval(countDown);
            console.log("本次学习共获得学时：" + playTime);
            playTime = 0;
        }
    });
</script>

</body>

</html>