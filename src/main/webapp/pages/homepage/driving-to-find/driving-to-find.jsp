<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/9
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String schoolName = "老司机驾考";//名称
    int aId = 0;
    try{ aId = Integer.valueOf(request.getSession().getAttribute("aId").toString());} catch (Exception e){}
    String path = request.getContextPath();
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie:cookies){
        if(cookie.getName().equals("schoolName"))schoolName = cookie.getValue();
    }
%>
<html xmlns="">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>老司机驾考网——驾校查询</title>
    <meta name="keywords" content="驾校,驾校一点通,学车,陪驾,陪练">
    <meta name="description" content="驾考提供全国驾校查询、驾校点评、驾校考试、驾校口碑、驾校排名、学车价格、驾校位置、驾校投诉等驾考服务。元贝驾考还提供驾校一点通2020模拟考试。">
    <meta name="mobile-agent" content="format=html5;url=http://m.jiaxiao.ybjk.com/">
    <link rel="stylesheet" type="text/css" href="<%=path+"/pages/homepage/driving-to-find/driving-to-find_files/css_jx.css"%>">
    <link rel="stylesheet" type="text/css" href="<%=path+"/pages/homepage/driving-to-find/driving-to-find_files/font-awesome.css"%>">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" type="text/javascript" src="<%=path+"/pages/homepage/driving-to-find/driving-to-find_files/app.js"%>"></script>
    <script src="<%=path+"/static/custom_tool.js"%>"></script>
</head>
<body>
    <input hidden="hidden" value="<%=path%>" id="path">
    <c:if test="${!isInit}"><%-- 初始化界面 --%>
        <form action="<%=path+"/SchoolControl/drivingFindInit"%>" method="post" id="init"></form>
        <script type="text/javascript">$(function () {$("#init").submit();})</script>
    </c:if><%-- 初始化界面 --%>
    <div class="layui-col-md12">
        <ul class="layui-nav layui-bg-blue">
            <label class="layui-bg-blue" style="font-size: 40px; color: yellow;"><%=schoolName%></label>
            <li class="layui-nav-item"><a href="<%=path+"/pages/homepage/home-page.jsp"%>"><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe68e;</i>&nbsp;&nbsp;首页</a></li>
            <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe60a;</i>&nbsp;&nbsp;科目一</a></li>
            <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe60a;</i>&nbsp;&nbsp;科目四</a></li>
            <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe663;</i>&nbsp;&nbsp;题库</a></li>
            <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe630;</i>&nbsp;&nbsp;车型</a></li>
            <li class="layui-nav-item layui-this"><a href="<%=path+"/pages/homepage/driving-to-find/driving-to-find.jsp"%>"><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe66c;</i>&nbsp;&nbsp;驾校</a></li>
            <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe705;</i>&nbsp;&nbsp;资讯</a></li>
            <li class="layui-nav-item"><a href=""><i class="layui-icon" style="font-size:
                    22px; color: #FF5722;">&#xe6ed;</i>&nbsp;&nbsp;视频</a></li>
        </ul>
    </div>
    <div class="MainBox head">
        <div class="MainL headL" style="float:right;"></div>
        <div class="MainR headR" style="float:left;">
            <a href="" target="_self"><img src="" alt="<%=schoolName%> www.lsjjk.com" align="absmiddle"></a>
            <strong><a href="" target="_self">找驾校</a></strong>
        </div>
    </div>
    <div class="fcc"></div>
    <div class="Nav">
        <div class="fcc">
<%--            <a href="<%=path+"/pages/homepage/home-page.jsp"%>" target="_blank"><%=schoolName%></a>--%>
            <a href="" class="h" target="_self">找驾校</a>
            <a href="" target="_self">驾校认证</a>
<%--            <a href="" target="_blank">学车视频</a>--%>
            <div class="UC">
                <c:if test="<%=aId == 0%>">
                    <p class="l">
                        <a href="javascript:;" onclick="openLogin();"><i class="layui-icon" style="color: crimson;">&#xe770;</i>登录</a>
                        <u>|</u><a href="javascript:;" onclick="openReg();">注册</a>
                    </p>
                </c:if>
            </div>
        </div>
    </div>
    <div class="fcc"></div>
    <div class="MainBox fcc">
        <div class="MainL"><br>
            <div class="BoxArea BoxP fcc"><p>省份</p>
                <div>
                    A<a target="_self" href="" title="安徽驾校">安徽</a><br>
                    B<a target="_self" href="" title="北京驾校">北京</a><br>
                    C<a target="_self" href="" title="重庆驾校">重庆</a><br>
                    F<a target="_self" href="" title="福建驾校">福建</a>
                </div>
                <div class="BoxP2">
                    G<a target="_self" href="" title="广东驾校">广东</a>
                    <a target="_self" href="" title="广西驾校">广西</a>
                    <a target="_self" href="" title="贵州驾校">贵州</a>
                    <a target="_self" href="" title="甘肃驾校">甘肃</a><br>
                    H<a target="_self" href="" title="河北驾校">河北</a>
                    <a target="_self" href="" title="河南驾校">河南</a>
                    <a target="_self" href="" title="湖北驾校">湖北</a>
                    <a target="_self" href="" title="湖南驾校">湖南</a>
                    <a target="_self" href="" title="海南驾校">海南</a>
                    <a target="_self" href="" title="黑龙江驾校">黑龙江</a><br>
                    J<a target="_self" href="" title="江苏驾校">江苏</a>
                    <a target="_self" href="" title="江西驾校">江西</a>
                    <a target="_self" href="" title="吉林驾校">吉林</a><br>
                    L<a target="_self" href="" title="辽宁驾校">辽宁</a></div>
                <div class="BoxP3">
                    N<a target="_self" href="" title="内蒙古驾校">内蒙古</a>
                    <a target="_self" href="" title="宁夏驾校">宁夏</a><br>
                    Q<a target="_self" href="" title="青海驾校">青海</a><br>
                    S<a target="_self" href="" title="上海驾校">上海</a>
                    <a target="_self" href="" title="山东驾校">山东</a>
                    <a target="_self" href="" title="山西驾校">山西</a>
                    <a target="_self" href="" title="陕西驾校">陕西</a>
                    <a target="_self" href="" title="四川驾校">四川</a><br>
                    T<a target="_self" href="" title="天津驾校">天津</a>
                </div>
                <div>
                    X<a target="_self" href="" title="西藏驾校">西藏</a>
                    <a target="_self" href="" title="新疆驾校">新疆</a><br>
                    Y<a target="_self" href="" title="云南驾校">云南</a><br>
                    Z<a target="_self" href="" title="浙江驾校">浙江</a>
                </div>
            </div>
            <div class="listcnt">
                <div class="listmain">
                    <ul class="fcc">
                        <c:forEach items="${schoola}" begin="0" step="1" end="20" var="school">
                            <li>
                                <dl class="fcc">
                                    <dt><a href="<%=path%>/后端访问地址?sId=${school.SId}" target="_blank">
                                        <img src="<%=path%>${school.SBusinessPic}" alt="${school.SName}"></a></dt><%--头像--%>
                                    <dd>
                                        <h3><a href="<%=path%>/后端访问地址?sId=${school.SId}" target="_blank">${school.SName}</a></h3>
                                        <span><img src="<%=path+"/image/home-page/6.gif"%>"></span><%-- 评价  --%>

                                        电话：<a href="" target="_self">${school.SPhone}</a>
                                        <div><a href="" target="_self">${school.SAddress}</a><u>&gt;</u></div>
                                        <c:if test="${school.SRegisteryFee ne null}">
                                            <strong><i>￥</i>${school.SRegisteryFee}<u>起</u></strong>
                                        </c:if><c:if test="${school.SRegisteryFee eq null}">
                                            <strong><em>电询或面议</em></strong>
                                        </c:if>
                                        <p><i><a href="<%=path%>${school.SAddress}" target="_blank">${school.SName}</a></i><b></b></p>
                                    </dd>
                                </dl>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="MainR"><p style="height:26px;"></p>
            <div class="why_me">怎样找到合适的驾校？
                <ul>
                    <li class="li-why-me-1"><b>看评价</b>通过学员评价看驾校服务</li>
                    <li class="li-why-me-7"><b>看信用</b>通过认证等级看驾校信用</li>
                    <li class="li-why-me-3"><b>看口碑</b>通过口碑值看驾校美誉度</li>
                    <li class="li-why-me-4"><b>看教学</b>通过师资力量看教学环境</li>
                </ul>
            </div>
            <dl class="xckiss">
                <dt><b>最新课程</b></dt>
                <dd>
                    <ul class="kclist">
                        <li class="t"><b>课程</b><i>价格</i><u></u></li>
                        <c:forEach items="${schoolc}" step="1" begin="1" end="10" var="schoolC">
                            <li title="${schoolC.SName}《C1照》"><b>
                                <a href="https://jiaxiao.ybjk.com/kc_yaqg5" target="_blank">C1照</a></b>
                                <i><em>${schoolC.SRegisteryFee}</em>元</i>
                                <u><a href="https://jiaxiao.ybjk.com/kc_yaqg5#bmb" target="_blank">报名</a></u>
                            </li>
                        </c:forEach>
                    </ul>
                </dd>
            </dl>
            <div id="JDKck"></div>
            <div id="JDK"><br>
                <dl class="xckiss">
                    <dt><b>热门课程</b></dt>
                    <dd>
                        <ul class="kclist">
                            <li class="t"><b>课程</b><i>价格</i><u></u></li>
                            <c:forEach items="${schoolr}" step="1" begin="1" end="10" var="shoolR">
                                <li title="${shoolR.SName}《C1照》">
                                    <b><a href="https://jiaxiao.ybjk.com/kc_cace9" target="_blank">C1照</a></b>
                                    <i><em>${shoolR.SRegisteryFee}</em>元</i><u>
                                    <a href="https://jiaxiao.ybjk.com/kc_cace9#bmb" target="_blank">报名</a></u>
                                </li>
                            </c:forEach>
                        </ul>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
    <div class="fcc"></div>
    <div class="MainBox fcc">
        <div class="yqlj">
            <dl class="fcc">
                <dt>友情链接<i>　合作ＱＱ：894888552</i></dt>
                <dd>学车交流ＱＱ群：xxxxxxxxx</dd>
            </dl>
            <ul>
                <c:forEach items="${links}" step="1" begin="0" end="10" var="link">
                    <a href="${link.lkUrl}">${link.lkName}</a>
                </c:forEach>
            </ul>
        </div>
    </div>
    <script>
        try {
            $(".listmain ul li a").attr("target", "_blank");
            $(".listmain ul li dl dd div a").attr("target", "_self");
            qujxlist();
            $("#PCAAll").hover(function () {
                $("#PCACnt").show();
            }, function () {
                $("#PCACnt").hide();
            });
        } catch (e) {
        }
        $(window).bind("scroll", function () {
            scrollfun();
        })
    </script>
    <div class="footerBox">Copyright © 2020 - 2220 xxxxx.COM All Rights Reserved. 　
        <a href="https://jiaxiao.ybjk.com/">找驾校</a> - <a href="<%=path+"///"%>"><%=schoolName%></a>　 版权所有　 吓ICP备xxxxxxxx号
    </div>
    <div class="backTop" onclick='$("html,body").animate({scrollTop:0}, "100");'>
        <i class="layui-icon" style="color: crimson;">&#xe604;</i>
    </div><%-- 顶 --%>
    <script src="<%=path+"/pages/homepage/driving-to-find/driving-to-find_files/tj.js"%>"></script>
</body>
</html>
