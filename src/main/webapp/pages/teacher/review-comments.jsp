<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/14
  Time: 11:21
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
    <title>查看学生评论</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
</head>
    <body>
        <div>
            <input hidden="hidden" value="<%=path%>" id="path">
            <div class="comment_list">
                <h2 >全部评论</h2>
                <hr>
                <div class="comment">
                    <div class="imgdiv"><img class="imgcss"  src="./images/user.jpg"/></div>
                    <div class="conmment_details">
                        <span class="comment_name">大白 </span>     <span>22分钟前</span>
                        <div class="comment_content" >  感觉林丹越来越帅了，好棒</div>
                        <div class="del"> <i class="icon layui-icon"  >赞(164)</i>
                            <a class="del_comment" data-id="1"> <i class="icon layui-icon" >删除</i></a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="comment">
                    <div class="imgdiv"><img class="imgcss"  src="./images/user.jpg"/></div>
                    <div class="conmment_details">
                        <span class="comment_name">大白 </span>     <span>22分钟前</span>
                        <div class="comment_content" >  感觉林丹越来越帅了，好棒</div>
                        <div class="del"> <i class="icon layui-icon"  >赞(164)</i>
                            <a class="del_comment" data-id="1"> <i class="icon layui-icon" >删除</i></a>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </body>
</html>
