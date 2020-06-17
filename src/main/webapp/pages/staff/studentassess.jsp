<%--
  Created by IntelliJ IDEA.
  User: 刘海
  Date: 2020/6/8
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>教练车管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href=<%=path+"/static/layui/css/layui.css"%>>
    <link rel="stylesheet" href="<%=path+"/css/pages/index/starScore.css"%>">
    <script type="text/javascript" src=<%=path+"/static/layui/layui.js"%>></script>
</head>
<body>
<input type="hidden" value="${sessionScope.school.tId}" id="sId">
<div class="coach-stu-evaluate">
        <textarea title="评价模板" id="evaluate_tpl" style="display:none;">
            {{# layui.each(d.data, function(index, item){ }}
            <div>
            {{= item.econtent }}<br>
            {{= item.etime }}
                <div style="float: right;">
                    <div class="atar_Show">
                        <p class="atar_Show scoreStar" tip="{{ item.escore }}"></p>
                    </div>
                    <span style="font-size: 17px;color: #65B0F1;">{{ item.escore }}分</span>
                </div>
            </div>
            <hr>
            {{# }); }}
        </textarea>
    <p>学员评价</p>
    <hr>
    <div id="evaluateDiv">
    </div>
</div>

<script>
    layui.use(['laytpl', 'flow'], function () {
        var laytpl = layui.laytpl
            , $ = layui.jquery
            , flow = layui.flow;


        let path = window.document.location.href.substring(0, (window.document.location.href).indexOf(window.document.location.pathname));


        function showStar() {
            let stars = $("p[class*='scoreStar']");

            for (let i = 0; i < stars.length; i++) {
                let score = $(stars[i]).attr("tip");
                let starWidth = score / 5 * 150;
                $(stars[i]).attr("style", "width:" + starWidth + "px;float:none;");
            }
        }

        //请求消息
        let renderMsg = function (page, callback) {
            var sId =
            $.get(path + "/api/evaluate/school/" + 1, {
                page: page || 1
            }, function (res) {
                if (res.code != 0) {
                    return layer.msg(res.msg);
                }

                callback && callback(res.data, res.pages);
            });
        };

        flow.load({
            elem: '#evaluateDiv' //流加载容器
            , isAuto: true
            , end: "没有更多评价了"
            , done: function (page, next) { //加载下一页
                renderMsg(page, function (data, pages) {
                    let html = laytpl(evaluate_tpl.value).render({
                        data: data
                        , page: page
                    });

                    next(html, page < pages);

                    showStar();
                })
            }
        });
    });

</script>
</body>
</html>