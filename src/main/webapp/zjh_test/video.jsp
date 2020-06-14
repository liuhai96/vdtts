<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学车视频</title>

    <link rel="stylesheet" href="<%=path + "/zjh_test/css/jx_video.css"%>">
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" media="all">
</head>

<body>

<input type="hidden" id="videoLevel" value="${level}">

<div class="commonhead_line" style="border-top: 1px solid #00C356;"></div>

<div class="video-page">
    <div class="video-main">
        <p>位置：<a href="http://tv.jxedt.com/">学车视频</a></p>
        <!-- 学车视频左侧 -->
        <div class="video-left">

            <div class="video-left-bottom" id="jinxuan">
                <ul class="car-video">
                    <c:if test="${level == 2}">
                        <li level="2">
                            <a class="active" href="javascript:void(0);">科目二</a>
                        </li>
                        <li level="3">
                            <a href="javascript:void(0);">科目三</a>
                        </li>
                    </c:if>
                    <c:if test="${level == 3}">
                        <li level="2">
                            <a href="javascript:void(0);">科目二</a>
                        </li>
                        <li level="3">
                            <a class="active" href="javascript:void(0);">科目三</a>
                        </li>
                    </c:if>
                </ul>
                <div class="car-video-border"></div>
                <div class="car-video-list">
                    <div class="mediawarp" id="videoList"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://www.layuicdn.com/layui/layui.js"></script>
<script>
    layui.use(['element'], function () {
        var layer = layui.layer
            , $ = layui.jquery
            , element = layui.element;

        let path = window.document.location.href.substring(0, (window.document.location.href).indexOf(window.document.location.pathname));

        function getVideoDetail(level) {
            $.ajax({
                type: "get",
                url: path + "/api/video/level/" + level,
                contentType: "application/json;charset=utf-8",
                async: true,
                statusCode: {
                    404: function () {
                        alert("报了404错误");
                    },
                    500: function () {
                        alert("报了500错误");
                    }
                },
                success: function (res) {

                    //获取
                    let videoList = $("#videoList");

                    let str = "";

                    //生成题目下方的题目标签
                    for (let index = 0; index < res.length; index++) {
                        str +=
                            "<div class='car-video-list-detail'>" +
                            "<a href='" + path + "/zjh/video/" + level + "/" + res[index].vid + "'>" +
                            "<div class='video-img'>" +
                            "<div class='video-play'></div>" +
                            "<img src='" + path + res[index].vpic + "' alt=''>" +
                            "</div>" +
                            "<div class='video-describe'>" +
                            "<div class='video-text'>" +
                            res[index].vtitle +
                            "</div>" +
                            "</div>" +
                            "</a>" +
                            "</div>";
                    }
                    $(videoList).html(str);
                }
            });
        }

        getVideoDetail($("#videoLevel").val());


        $("ul[class*='car-video'] li").on("click", function (event) {
            $("ul[class*='car-video'] li").children().removeClass("active");
            $(this).children().addClass("active");

            getVideoDetail($(this).attr("level"));
        });
    });
</script>
</body>

</html>
