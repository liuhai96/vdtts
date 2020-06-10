<%@ page import="com.lsjbc.vdtts.utils.Tool" %>
<%--
  Created by IntelliJ IDEA.
  User: Lilang9725
  Date: 2020/6/5
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String thisYear = new Tool().getDate("yyyy");
    String schoolName = "老司机驾考";
    Cookie cookie = new Cookie("schoolName",schoolName);//存放学校名称
    int aId = 0;
    try{ aId = Integer.valueOf(request.getSession().getAttribute("aId").toString());} catch (Exception e){}
    cookie.setMaxAge(-3);
    cookie.setPath(request.getContextPath());
    response.addCookie(cookie);
//    resultData = request.getSession().getAttribute("account");
    String[] bulletinInformation = {"恭喜学员：李*科目二通过","恭喜学员：郑*威从本驾校毕业","恭喜学员：刘*科目三通过"};
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
    <head>
        <meta charset="utf-8">
        <title><%=schoolName%></title>
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <script src="https://www.layuicdn.com/layui/layui.js"></script>
        <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
    <input hidden="hidden" value="<%=path%>" id="path">
        <!-- 顶部功能所在区代码 -->
        <div class="layui-col-md12">
            <ul class="layui-nav layui-bg-blue">
                <label class="layui-bg-blue" style="font-size: 40px; color: yellow;"><%=schoolName%></label>
                <li class="layui-nav-item layui-this"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe68e;</i>&nbsp;&nbsp;首页</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe60a;</i>&nbsp;&nbsp;科目一</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe60a;</i>&nbsp;&nbsp;科目四</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe663;</i>&nbsp;&nbsp;题库</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe630;</i>&nbsp;&nbsp;车型</a></li>
                <li class="layui-nav-item"><a href="<%=path+"/pages/homepage/driving-to-find/driving-to-find.jsp"%>"><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe66c;</i>&nbsp;&nbsp;驾校</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe705;</i>&nbsp;&nbsp;资讯</a></li>
                <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe6ed;</i>&nbsp;&nbsp;视频</a></li>
                <c:if test="<%=aId == 0%>">
                    <li class="layui-nav-item" style="float: right"><a href="<%=path+"/pages/homepage/register.jsp"%>">注册</a></li>|
                    <li class="layui-nav-item layui-bg-blue" style="float: right" lay-unselect=""><a href="javascript:;">登录</a>
                        <dl class="layui-nav-child">
                            <dd><a href="<%=path+"/pages/homepage/login.jsp?type=1011010"%>">学员登录</a></dd>
                            <dd><a href="<%=path+"/pages/homepage/login.jsp?type=1101010"%>">驾校登录</a></dd>
                            <dd><a href="<%=path+"/pages/homepage/login.jsp?type=1010110"%>">教练登录</a></dd>
                        </dl>
                    </li>
                </c:if>
                <c:if test="<%=aId != 0%>">
                    <li class="layui-nav-item layui-bg-blue" style="float: right" lay-unselect=""><a href="javascript:;">
                        <img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;">修改信息</a></dd>
                            <dd><a href="javascript:;">安全管理</a></dd>
                            <dd><a href="javascript:;">安全退出</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-bg-green" style="float: right;">
                        <a href="" style="color:orange">个人中心<span class="layui-badge-dot"></span>
                    </a></li>
                </c:if>
            </ul>
        </div>

        <!-- 左侧功能所在区代码 -->
        <div style="background-color: white;height: 80%" class="layui-col-md1">

        </div>

        <!-- 公告区 -->
        <div style="background-color: seashell;" class="layui-col-md10">
            <div class="layui-carousel" id="test0" lay-anim="default" lay-indicator="none" lay-arrow="none">
                <div carousel-item="">
                    <c:forEach items="<%=bulletinInformation%>" begin="0" step="1" end="100" var="bi">
                        <div style="margin: auto;"><i class="layui-icon" style="font-size:22px;color: darksalmon;">
                            &#xe645;</i><a>${bi}</a></div>
                    </c:forEach>
                </div>
                <style>#test0 .layui-carousel-ind,.layui-carousel-arrow {position:static;}</style>
            </div>
        </div>

        <!-- 推送区 -->
        <div style="background-color: yellow;height: 30%;" class="layui-col-md10">
            <div class="layui-carousel layui-col-md5" id="test1">
                <div carousel-item="">
                    <div class="layui-bg-orange">1号广告位</div>
                    <div class="layui-bg-red">2号广告位</div>
                    <div class="layui-bg-black">3号广告位</div>
                </div>
            </div>
            <div class="layui-carousel layui-col-md5" id="test2">
                <div carousel-item="">
                    <div><img src="<%=path+"/image/home-page/1.png"%>"></div>
                    <div><img src="<%=path+"/image/home-page/2.png"%>"></div>
                    <div><img src="<%=path+"/image/home-page/3.png"%>"></div>
                </div>
            </div>
        </div>

        <!-- 功能区 -->
        <div style="background-color: wheat;" class="layui-col-md10">
            <div><%--  科一  --%>
                <label style="font-size: 22px;">&nbsp;&nbsp;科目一</label><br>
                <hr class="layui-bg-orange">
                <label class="layui-col-md-offset7" style="font-size: 25px;color:seagreen"><%=thisYear%> 年驾驶员理论考试最新资料</label><br>
                <label class="layui-col-md-offset8" style="font-size: 30px;color:red">基础知识理论考试</label><br>
                <label style="font-size: 22px;">&nbsp;&nbsp;阶段目标：</label>
                <label style="font-size: 18px">根据公安部123号令，学员需要了解机动车基础知识，掌握道路安全法律、法规及交通信号的规定。</label><br><br>
                <div style="margin: auto; text-align: center;">
                    <a href="" class="layui-btn" target="_blank">顺序练习</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" class="layui-btn" target="_blank">随机练习</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" class="layui-btn" target="_blank">章节练习</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" class="layui-btn" target="_blank">专项练习</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" class="layui-btn" target="_blank">模拟考试</a>
                </div><br>
                <a href="" style="font-size: 22px;color: cornflowerblue;" target="_blank" class="layui-col-md-offset1">
                    <%=schoolName%><%=thisYear%>科目一　<%=schoolName%><%=thisYear%>新题库小车科目一考试和2020新交规驾照考试科目</a>
            </div><%--  科一简绍  --%><br><br><br>
            <div><%--  科二  --%>
                <label style="font-size: 22px;">&nbsp;&nbsp;科目二</label><br>
                <hr class="layui-bg-orange">
                <label class="layui-col-md-offset7" style="font-size: 25px;color:seagreen"><%=thisYear%> 大路考后的安全模拟考试</label><br>
                <label class="layui-col-md-offset8" style="font-size: 30px;color:red">安全文明驾驶常识考试</label><br>
                <label style="font-size: 22px;">&nbsp;&nbsp;阶段目标：</label>
                <label style="font-size: 18px">根据公安部123号令，学员需要掌握安全文明驾驶知识，具备对车辆的综合控制能力；
                    了解行人、非机动车的动态特点及险情预测和分析方法；熟悉掌握一般道路和夜间驾车方法，能够根据不同的道路状况
                    安全驾驶；形成自觉遵守交通法规、有效处置随机交通状况、无意识合理操作车辆的能力。</label><br><br>
                <div style="margin: auto; text-align: center;">
                    <a href="" class="layui-btn" target="_blank">顺序练习</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" class="layui-btn" target="_blank">随机练习</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" class="layui-btn" target="_blank">章节练习</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" class="layui-btn" target="_blank">专项练习</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" class="layui-btn" target="_blank">模拟考试</a>
                </div><br>
                <a  href="" style="font-size: 22px;color: cornflowerblue;" class="layui-col-md-offset1" target="_blank">
                    <%=schoolName%><%=thisYear%> 科目四　提供<%=thisYear%>新题库小车科目四模拟考试和2020新交规小车安全文明</a>
            </div><%--  科二简绍  --%><br><br><br><br><br>
            <div><!-- 数据库链接 -->
                <c:forEach items="${resultData.data}" begin="0" step="1" end="100" var="data">
                    <c:forEach items="${data.key eq 'advertising'}" begin="0" step="1" end="100" var="key">
                        <c:forEach items="${key.value}" begin="0" step="1" end="100" var="advertising">
                            <a href="${advertising.href}" class="layui-btn layui-btn-warm" target="_blank">${advertising.name}</a>
                        </c:forEach>
                    </c:forEach>
                </c:forEach>
            </div>
        </div>

        <!-- 右侧功能所在区代码 -->
        <div style="background-color: white;height: 80%" class="layui-col-md-offset11">

        </div>

        <%--  底部备注区  --%>
        <div style="height: 5%; text-align: center;" class="layui-col-md12">
            <br><br><div>
                <a href="">&nbsp;<%=schoolName%>&nbsp;</a>&nbsp;&nbsp;|
                <a href="">&nbsp;<%=schoolName%>网&nbsp;</a>&nbsp;&nbsp;|
                <a href="">&nbsp;科目一考试&nbsp;</a>&nbsp;&nbsp;|
                <a href="">&nbsp;科目二考试&nbsp;</a>&nbsp;&nbsp;
            </div><br><br>
            <div>
                <label style="font-size: 15px">xxxxxx &nbsp;&nbsp;驾考辅导平台!驾校推荐网站!!<%=thisYear%>中国好驾网!!!</label><br><br>
                <label>版权所有：传一科技有限公司&nbsp;&nbsp;JX1910班老司机生产组&nbsp;&nbsp;</label>
                <label>xx网备：1910xxxxxxxxx&nbsp;&nbsp;</label>
                <label>xxx许可证：1910xxxxxxxxx&nbsp;&nbsp;</label><br><br>
                <img src="<%=path+"/image/home-page/realNameAuthentication.png"%>" style="height: 80%;width: 8%">&nbsp;&nbsp;
                <img src="<%=path+"/image/home-page/realNameAuthentication2.png"%>" style="height: 80%;width: 8%">
                <br><br>

            </div>
        </div>

        <!-- js响应方法 -->
        <script>
            layui.use('element', function(){//
                var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

                //监听导航点击
                element.on('nav(demo)', function(elem){
                    //console.log(elem)
                    layer.msg(elem.text());
                });
            });
            layui.use(['carousel', 'form'], function(){
                var carousel = layui.carousel,form = layui.form;

                carousel.render({//改变下时间间隔、动画类型、高度
                    elem: '#test0'
                    ,interval: 2000
                    ,anim: 'fade'
                    ,width: '100%'
                    ,height: '30px'
                });
                carousel.render({
                    elem: '#test1'
                    ,interval: 1800
                    ,anim: 'fade'
                    ,width: '50%'
                    ,height: 'auto'
                });
                carousel.render({
                    elem: '#test2'
                    ,interval: 1800
                    ,anim: 'fade'
                    ,width: '50%'
                    ,height: 'auto'
                });
            });
        </script><!-- js响应方法 -->
    </body>
</html>
