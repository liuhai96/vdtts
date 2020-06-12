<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/6/12
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>信息查询</title>
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path+"/zjh_test/css/common.css"%>">
    <link rel="shortcut icon" type="image/x-icon" href="http://47.96.140.98:20034/static/img/logo_favicon.ico">
    <script src="<%=path+"/zjh_test/js/hm.js"%>"></script>
    <style type="text/css" abt="234"></style>
    <style type="text/css" abt="234"></style>

    <link rel="stylesheet" href="<%=path+"/zjh_test/css/inquire.css"%>">
    <link rel="stylesheet" href="<%=path+"/zjh_test/css/starScore.css"%>">
    <link id="layuicss-layer" rel="stylesheet" href="<%=path+"/zjh_test/css/layer.css"%>">
</head>
<body style="background: #fafbfd;">
    <div class="login-inf">
        <div class="inf-box">
            <div class="inf-time">
                今天是2020年6月11日,欢迎您！
            </div>
            <div class="inf-login">
                <a target="_blank" href="http://118.178.227.161/web/">管理部门登录</a> |
                <a target="_blank" href="http://47.98.242.153:8666/">驾培机构登录</a> |
                <a href="http://47.96.140.98:20034/coaLogin">教练员登录</a> |
                <a href="http://47.96.140.98:20034/stuLogin">学员登录</a>
            </div>
        </div>
    </div>
    <div class="top">
        <div class="top-box">
            <img class="top-logo" src="<%=path+"/zjh_test/pic/psp-logo.png"%>">
            <div class="top-title">
                <p class="top-title-p1">机动车驾驶员计时培训系统</p>
                <p class="top-title-p2">Timing training system for motor vehicle drivers</p>
            </div>
            <div class="top-search">
                <select id="selectType" name="selectType">
                    <option value="1">驾培机构</option>
                    <option value="2">教练员</option>
                    <option value="3">教练车</option>
                </select>
                <input type="text" name="" id="selectName" value="">
                <label><a style="cursor: pointer;" onclick="topSelect();"><img src="<%=path+"/zjh_test/pic/search.png"%>">搜索</a></label>
            </div>
        </div>
    </div>
    <div class="menu">
        <div class="menu-box">
            <ul id="menu-title" class="menu-title">
                <li id="menu-title-one" class="layui-this menu-title-bg">
                    <img src="<%=path+"/zjh_test/pic/menu_home1.png"%>">
                    <a href="<%=path+"/zjh/index"%>">首页</a>
                </li>
                <li id="menu-title-two">
                    <img src="<%=path+"/zjh_test/pic/menu_publicity1.png"%>">
                    <a href="<%=path+"/zjh/publicity/notice/1/-1"%>">公开公示</a>
                </li>
                <li id="menu-title-three">
                    <img src="<%=path+"/zjh_test/pic/menu_inquire1.png"%>">
                    <a href="http://47.96.140.98:20034/inquire">信息查询</a></li>
                </li>
                <li id="menu-title-six">
                    <img src="<%=path+"/zjh_test/pic/menu_student1.png"%>">
                    <a href="http://47.96.140.98:20034/studentCoaInfo">学教专区</a>
                </li>
            </ul>
        </div>
    </div>
    <div id="share">
        <a id="totop" title="返回顶部" style="display: none;">返回顶部</a>
        <a href="javascript:void(0)" title="返回上一页" class="sina" onclick="history.go(-1);"></a>
        <a href="javascript:void(0)" title="刷新" class="tencent" onclick="history.go(0);"></a>
    </div>
    <div class="main">
        <div class="layui-tab">
            <ul id="selectParent" class="layui-tab-title" style="float: left;width: 150px;height: 200px;top: 45px;">
                <li onclick="selectSchInfoJump();" class="layui-this">查驾培机构</li>
                <li id="selectTwo" onclick="selectCoaInfoJump();" class="">查教练员</li>
                <li id="selectThree" onclick="selectVueInfoJump();" class="">查教练车</li>
            </ul>
            <span class="inq-inf"><img src="./信息查询_files/inquires.png">信息查询</span>
            <div id="tab-item-parent" class="layui-tab-content" style="margin-left: 165px;">
                <div class="layui-tab-item layui-show">

                    <div class="inq-rank">
                        <ul id="schOrder">
                            <li class="li1" id="schStarOrder" onclick="schStarOrderClick();">综合星级<img
                                    src="./信息查询_files/sort2.png" alt=""></li>
                            <li id="coacountOrder" onclick="coacountOrderClick();">教练员数<img src="./信息查询_files/sort2.png"
                                                                                            alt=""></li>
                            <li id="vuecountOrder" onclick="vuecountOrderClick();">教练车数<img src="./信息查询_files/sort2.png"
                                                                                            alt=""></li>
                            <li id="yearaddstucountOrder" onclick="yearaddstucountOrderClick();">年新增学员数<img
                                    src="./信息查询_files/sort2.png" alt=""></li>
                            <li id="yearendstucountOrder" onclick="yearendstucountOrderClick();">年结业学员数<img
                                    src="./信息查询_files/sort2.png" alt=""></li>
                        </ul>
                    </div>
                    <hr>
                    <div class="inq-school">
                        <ul id="schoolList">
                            <li class="list-school"><a
                                    href="http://47.96.140.98:20034/schInfoDetail?inscode=3322210509142226"><img
                                    src="./信息查询_files/sch6.jpg"></a>
                                <div class="inf-school"><a
                                        href="http://47.96.140.98:20034/schInfoDetail?inscode=3322210509142226"><p
                                        class="word-1" title="南动驾校">南动驾校</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="5"
                                                                                      style="width: 150px;float: none;"></p>
                                    </div>
                                    <span>5分</span>
                                    <p></p>
                                    <p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1,C2">经营范围：C1,C2</span>
                                    </p>
                                    <p><span>教练员数：91人</span><span style="margin-left: 35px;">教练车数：70台</span></p>
                                    <p><span>年新增学员数：1408人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p>
                                    <p title="江西省南昌市新建区长堎工业园工业四路第八区块">地址：江西省南昌市新建区长堎工业园工业……</p></div>
                            </li>
                            <li class="list-school"><a
                                    href="http://47.96.140.98:20034/schInfoDetail?inscode=4083475956533623"><img
                                    src="./信息查询_files/sch6.jpg"></a>
                                <div class="inf-school"><a
                                        href="http://47.96.140.98:20034/schInfoDetail?inscode=4083475956533623"><p
                                        class="word-1" title="天祥驾校">天祥驾校</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="5"
                                                                                      style="width: 150px;float: none;"></p>
                                    </div>
                                    <span>5分</span>
                                    <p></p>
                                    <p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1,C2">经营范围：C1,C2</span>
                                    </p>
                                    <p><span>教练员数：85人</span><span style="margin-left: 35px;">教练车数：61台</span></p>
                                    <p><span>年新增学员数：870人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p>
                                    <p title="南昌市天祥驾驶员培训有限公司">地址：南昌市天祥驾驶员培训有限公司</p></div>
                            </li>
                            <li class="list-school"><a
                                    href="http://47.96.140.98:20034/schInfoDetail?inscode=6315934699523615"><img
                                    src="./信息查询_files/sch6.jpg"></a>
                                <div class="inf-school"><a
                                        href="http://47.96.140.98:20034/schInfoDetail?inscode=6315934699523615"><p
                                        class="word-1" title="新余华鑫驾校">新余华鑫驾校</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="5"
                                                                                      style="width: 150px;float: none;"></p>
                                    </div>
                                    <span>5分</span>
                                    <p></p>
                                    <p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1">经营范围：C1</span></p>
                                    <p><span>教练员数：70人</span><span style="margin-left: 35px;">教练车数：32台</span></p>
                                    <p><span>年新增学员数：467人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p>
                                    <p title="江西省新余市渝水区仙来办事处丁家管理处">地址：江西省新余市渝水区仙来办事处丁家……</p></div>
                            </li>
                            <li class="list-school"><a
                                    href="http://47.96.140.98:20034/schInfoDetail?inscode=6535079904217333"><img
                                    src="./信息查询_files/sch6.jpg"></a>
                                <div class="inf-school"><a
                                        href="http://47.96.140.98:20034/schInfoDetail?inscode=6535079904217333"><p
                                        class="word-1" title="桃沅驾校">桃沅驾校</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="5"
                                                                                      style="width: 150px;float: none;"></p>
                                    </div>
                                    <span>5分</span>
                                    <p></p>
                                    <p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1,C2">经营范围：C1,C2</span>
                                    </p>
                                    <p><span>教练员数：69人</span><span style="margin-left: 35px;">教练车数：60台</span></p>
                                    <p><span>年新增学员数：1207人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p>
                                    <p title="赣州市赣县梅林镇桃源村石岩前安置区9栋1-8号">地址：赣州市赣县梅林镇桃源村石岩前安置……</p></div>
                            </li>
                            <li class="list-school"><a
                                    href="http://47.96.140.98:20034/schInfoDetail?inscode=4433189359306340"><img
                                    src="./信息查询_files/sch6.jpg"></a>
                                <div class="inf-school"><a
                                        href="http://47.96.140.98:20034/schInfoDetail?inscode=4433189359306340"><p
                                        class="word-1" title="众达驾校">众达驾校</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="5"
                                                                                      style="width: 150px;float: none;"></p>
                                    </div>
                                    <span>5分</span>
                                    <p></p>
                                    <p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1,C2">经营范围：C1,C2</span>
                                    </p>
                                    <p><span>教练员数：69人</span><span style="margin-left: 35px;">教练车数：37台</span></p>
                                    <p><span>年新增学员数：937人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p>
                                    <p title="江西省乐平市众埠镇黎桥村">地址：江西省乐平市众埠镇黎桥村</p></div>
                            </li>
                            <li class="list-school"><a
                                    href="http://47.96.140.98:20034/schInfoDetail?inscode=2254957325170638"><img
                                    src="./信息查询_files/sch6.jpg"></a>
                                <div class="inf-school"><a
                                        href="http://47.96.140.98:20034/schInfoDetail?inscode=2254957325170638"><p
                                        class="word-1" title="华恩驾校">华恩驾校</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="5"
                                                                                      style="width: 150px;float: none;"></p>
                                    </div>
                                    <span>5分</span>
                                    <p></p>
                                    <p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1">经营范围：C1</span></p>
                                    <p><span>教练员数：68人</span><span style="margin-left: 35px;">教练车数：27台</span></p>
                                    <p><span>年新增学员数：290人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p>
                                    <p title="江西省抚州市崇仁县郭圩乡县园艺场内">地址：江西省抚州市崇仁县郭圩乡县园艺场……</p></div>
                            </li>
                        </ul>
                        <hr>
                        <div id="demo0" style="float: right;">
                            <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-12"><a
                                    href="javascript:;" class="layui-laypage-prev layui-disabled" data-page="0">上一页</a><span
                                    class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>1</em></span><a
                                    href="javascript:;" data-page="2">2</a><a href="javascript:;" data-page="3">3</a><a
                                    href="javascript:;" data-page="4">4</a><a href="javascript:;" data-page="5">5</a><span
                                    class="layui-laypage-spr">…</span><a href="javascript:;" class="layui-laypage-last"
                                                                         title="尾页" data-page="129">129</a><a
                                    href="javascript:;" class="layui-laypage-next" data-page="2">下一页</a></div>
                        </div>
                    </div>
                </div>
                <div id="tab-item-two" class="layui-tab-item">
                    <div class="inq-con">
                        <span class="title-con">查询条件</span>
                        <div class="title-num">共<span id="coaNum">29507</span>名教练员</div>
                    </div>
                    <ul class="ul1">
                        <li>
                            <span class="title-area">驾培机构：</span>
                            <select id="coaProvince" name="quiz1" class="inq-sel" style="margin-left: 20px;width: 100px;">
                                <option value="360000">江西省</option>
                            </select>
                            <img src="./信息查询_files/arrows1.png" style="margin: 0 10px;">
                            <select onchange="selectCoaCity(this.value);" id="coaCity" name="quiz2" class="inq-sel"
                                    style="width: 100px;">
                                <option value="" selected="">地市级</option>
                                <option value="360100">南昌市</option>
                                <option value="360200">景德镇市</option>
                                <option value="360300">萍乡市</option>
                                <option value="360400">九江市</option>
                                <option value="360500">新余市</option>
                                <option value="360600">鹰潭市</option>
                                <option value="360700">赣州市</option>
                                <option value="360800">吉安市</option>
                                <option value="360900">宜春市</option>
                                <option value="361000">抚州市</option>
                                <option value="361100">上饶市</option>
                            </select>
                            <img src="./信息查询_files/arrows1.png" style="margin: 0 10px;">
                            <select onchange="selectCoaCounty(this.value);" id="coaCounty" name="quiz3" class="inq-sel"
                                    style="width: 100px;">
                                <option value="" selected="">区县级</option>
                            </select>
                            <img src="./信息查询_files/arrows1.png" style="margin: 0 10px;">
                            <select onchange="selectCoaSch(this.value);" id="coaSch" name="quiz3" class="inq-sel"
                                    style="width: 100px;">
                                <option value="" selected="">驾培机构</option>
                            </select>
                        </li>
                        <li id="coaSexParent">
                            <span class="title-area">性　　别：</span>
                            <button id="coaSexzero" onclick="coaSexClick('','coaSexzero');"
                                    class="button1 buttonbackground">不限
                            </button>
                            <button id="coaSex1" onclick="coaSexClick(1,'coaSex1');">男</button>
                            <button id="coaSex2" onclick="coaSexClick(2,'coaSex2');">女</button>
                        </li>

                        <li id="dripermittedParent">
                            <span class="title-area">准教车型：</span>
                            <button id="dripermittedzero" onclick="teachpermitted('','dripermittedzero');"
                                    class="button1 buttonbackground">不限
                            </button>
                            <button id="dripermittedA1" onclick="teachpermitted('A1','dripermittedA1');">
                                A1
                            </button>
                            <button id="dripermittedA2" onclick="teachpermitted('A2','dripermittedA2');">
                                A2
                            </button>
                            <button id="dripermittedA3" onclick="teachpermitted('A3','dripermittedA3');">
                                A3
                            </button>
                            <button id="dripermittedB1" onclick="teachpermitted('B1','dripermittedB1');">
                                B1
                            </button>
                            <button id="dripermittedB2" onclick="teachpermitted('B2','dripermittedB2');">
                                B2
                            </button>
                            <button id="dripermittedC1" onclick="teachpermitted('C1','dripermittedC1');">
                                C1
                            </button>
                            <button id="dripermittedC2" onclick="teachpermitted('C2','dripermittedC2');">
                                C2
                            </button>
                        </li>
                        <li id="ageParent">
                            <span class="title-area">年龄范围：</span>
                            <button id="agezero" onclick="ageClick('','agezero');"
                                    class="button1 buttonbackground">不限
                            </button>
                            <button id="age1" onclick="ageClick('1','age1');">18岁以下</button>
                            <button id="age2" onclick="ageClick('2','age2');">18-30岁</button>
                            <button id="age3" onclick="ageClick('3','age3');">30-45岁</button>
                            <button id="age4" onclick="ageClick('4','age4');">45-60岁</button>
                            <button id="age5" onclick="ageClick('5','age5');">60岁以上</button>
                        </li>
                    </ul>
                    <div class="inq-rank">
                        <ul style="width: 270px;" id="coaOrder">
                            <li class="li1" id="coaStarOrder" onclick="coaStarOrderClick();">综合星级<img
                                    src="./信息查询_files/sort2.png" alt=""></li>
                            <li id="ageOrder" onclick="ageOrderClick();">年龄<img src="./信息查询_files/sort2.png" alt=""></li>
                            <li id="yearteachcountOrder" onclick="yearteachcountOrderClick();">年带教学员数<img
                                    src="./信息查询_files/sort2.png" alt=""></li>
                        </ul>
                    </div>
                    <hr>
                    <div class="inq-student">
                        <ul id="studentList">
                            <li class="list-student"><a
                                    href="http://47.96.140.98:20034/coaInfoDetail?coachnum=5363211982410150"><img
                                    width="142px;" height="191px;" src="./信息查询_files/23224146047214003_87879.buffer"></a>
                                <div class="inf-student"><a
                                        href="http://47.96.140.98:20034/coaInfoDetail?coachnum=5363211982410150"><p
                                        class="word-1">刘君</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="0"
                                                                                      style="width: 0px;float: none;"></p>
                                    </div>
                                    <span>0分</span>
                                    <p></p>
                                    <p><span>性别：男</span><span style="margin-left: 45px;">年龄：45岁</span></p>
                                    <p><span>准教车型：C1</span><span style="margin-left: 35px;">年带教学员数：233人</span></p>
                                    <p title="萍乡市天一机动车驾驶员培训有限公司">所属驾培机构：萍乡市天一机动车驾驶员培……</p></div>
                            </li>
                            <li class="list-student"><a
                                    href="http://47.96.140.98:20034/coaInfoDetail?coachnum=9504141894143293"><img
                                    width="142px;" height="191px;" src="./信息查询_files/53461368581418814_23418.jpg"></a>
                                <div class="inf-student"><a
                                        href="http://47.96.140.98:20034/coaInfoDetail?coachnum=9504141894143293"><p
                                        class="word-1">陈明洪</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="0"
                                                                                      style="width: 0px;float: none;"></p>
                                    </div>
                                    <span>0分</span>
                                    <p></p>
                                    <p><span>性别：男</span><span style="margin-left: 45px;">年龄：51岁</span></p>
                                    <p><span>准教车型：C1</span><span style="margin-left: 35px;">年带教学员数：230人</span></p>
                                    <p title="萍乡市天一机动车驾驶员培训有限公司">所属驾培机构：萍乡市天一机动车驾驶员培……</p></div>
                            </li>
                            <li class="list-student"><a
                                    href="http://47.96.140.98:20034/coaInfoDetail?coachnum=1577423844668336"><img
                                    width="142px;" height="191px;" src="./信息查询_files/52083266777751344_95350.jpg"></a>
                                <div class="inf-student"><a
                                        href="http://47.96.140.98:20034/coaInfoDetail?coachnum=1577423844668336"><p
                                        class="word-1">周小艳</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="0"
                                                                                      style="width: 0px;float: none;"></p>
                                    </div>
                                    <span>0分</span>
                                    <p></p>
                                    <p><span>性别：女</span><span style="margin-left: 45px;">年龄：49岁</span></p>
                                    <p><span>准教车型：C1</span><span style="margin-left: 35px;">年带教学员数：227人</span></p>
                                    <p title="萍乡市天一机动车驾驶员培训有限公司">所属驾培机构：萍乡市天一机动车驾驶员培……</p></div>
                            </li>
                            <li class="list-student"><a
                                    href="http://47.96.140.98:20034/coaInfoDetail?coachnum=5890645214742125"><img
                                    width="142px;" height="191px;" src="./信息查询_files/1528508565372.jpg"></a>
                                <div class="inf-student"><a
                                        href="http://47.96.140.98:20034/coaInfoDetail?coachnum=5890645214742125"><p
                                        class="word-1">邹华平</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="0"
                                                                                      style="width: 0px;float: none;"></p>
                                    </div>
                                    <span>0分</span>
                                    <p></p>
                                    <p><span>性别：男</span><span style="margin-left: 45px;">年龄：41岁</span></p>
                                    <p><span>准教车型：C1</span><span style="margin-left: 35px;">年带教学员数：218人</span></p>
                                    <p title="高安市奥丰驾驶员培训学校">所属驾培机构：高安市奥丰驾驶员培训学校</p></div>
                            </li>
                            <li class="list-student"><a
                                    href="http://47.96.140.98:20034/coaInfoDetail?coachnum=4243193654814371"><img
                                    width="142px;" height="191px;" src="./信息查询_files/56832833104750363_46548.jpg"></a>
                                <div class="inf-student"><a
                                        href="http://47.96.140.98:20034/coaInfoDetail?coachnum=4243193654814371"><p
                                        class="word-1">傅建强</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="0"
                                                                                      style="width: 0px;float: none;"></p>
                                    </div>
                                    <span>0分</span>
                                    <p></p>
                                    <p><span>性别：男</span><span style="margin-left: 45px;">年龄：44岁</span></p>
                                    <p><span>准教车型：C1</span><span style="margin-left: 35px;">年带教学员数：217人</span></p>
                                    <p title="新干县新河西汽车驾驶员培训有限公司">所属驾培机构：新干县新河西汽车驾驶员培……</p></div>
                            </li>
                            <li class="list-student"><a
                                    href="http://47.96.140.98:20034/coaInfoDetail?coachnum=5517572254326951"><img
                                    width="142px;" height="191px;" src="./信息查询_files/1521862515182_864.JPG"></a>
                                <div class="inf-student"><a
                                        href="http://47.96.140.98:20034/coaInfoDetail?coachnum=5517572254326951"><p
                                        class="word-1">刘萍</p></a>
                                    <p style="float: left;">综合星级：</p>
                                    <div class="atar_Show" style="display:inline;"><p tip="0"
                                                                                      style="width: 0px;float: none;"></p>
                                    </div>
                                    <span>0分</span>
                                    <p></p>
                                    <p><span>性别：男</span><span style="margin-left: 45px;">年龄：53岁</span></p>
                                    <p><span>准教车型：C1</span><span style="margin-left: 35px;">年带教学员数：215人</span></p>
                                    <p title="萍乡市天一机动车驾驶员培训有限公司">所属驾培机构：萍乡市天一机动车驾驶员培……</p></div>
                            </li>
                        </ul>
                        <hr>
                        <div id="demo123" style="float: right;">
                            <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-11"><a
                                    href="javascript:;" class="layui-laypage-prev layui-disabled" data-page="0">上一页</a><span
                                    class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>1</em></span><a
                                    href="javascript:;" data-page="2">2</a><a href="javascript:;" data-page="3">3</a><a
                                    href="javascript:;" data-page="4">4</a><a href="javascript:;" data-page="5">5</a><span
                                    class="layui-laypage-spr">…</span><a href="javascript:;" class="layui-laypage-last"
                                                                         title="尾页" data-page="4918">4918</a><a
                                    href="javascript:;" class="layui-laypage-next" data-page="2">下一页</a></div>
                        </div>
                    </div>
                </div>
                <div id="tab-item-three" class="layui-tab-item">
                    <div class="inq-con">
                        <span class="title-con">查询条件</span>
                        <div class="title-num">共<span id="vehNum">26301</span>辆教练车</div>
                    </div>
                    <ul class="ul1">
                        <li>
                            <span class="title-area">驾培机构：</span>
                            <select id="vehProvince" name="quiz1" class="inq-sel" style="margin-left: 20px;width: 100px;">
                                <option value="360000">江西省</option>
                            </select>
                            <img src="./信息查询_files/arrows1.png" style="margin: 0 10px;">
                            <select onchange="selectVehCity(this.value);" id="vehCity" name="quiz2" class="inq-sel"
                                    style="width: 100px;">
                                <option value="" selected="">地市级</option>
                                <option value="360100">南昌市</option>
                                <option value="360200">景德镇市</option>
                                <option value="360300">萍乡市</option>
                                <option value="360400">九江市</option>
                                <option value="360500">新余市</option>
                                <option value="360600">鹰潭市</option>
                                <option value="360700">赣州市</option>
                                <option value="360800">吉安市</option>
                                <option value="360900">宜春市</option>
                                <option value="361000">抚州市</option>
                                <option value="361100">上饶市</option>
                            </select>
                            <img src="./信息查询_files/arrows1.png" style="margin: 0 10px;">
                            <select onchange="selectVehCounty(this.value);" id="vehCounty" name="quiz3" class="inq-sel"
                                    style="width: 100px;">
                                <option value="" selected="">区县级</option>
                            </select>
                            <img src="./信息查询_files/arrows1.png" style="margin: 0 10px;">
                            <select onchange="selectVehSch(this.value);" id="vehSch" name="quiz3" class="inq-sel"
                                    style="width: 100px;">
                                <option value="" selected="">驾培机构</option>
                            </select>
                        </li>
                        <li id="perdritypeParent">
                            <span class="title-area">培训车型：</span>
                            <button id="perdritypezero" onclick="perdritype('','perdritypezero');"
                                    class="button1 buttonbackground">不限
                            </button>
                            <button id="perdritypeA1" onclick="perdritype('A1','perdritypeA1');">A1</button>
                            <button id="perdritypeA2" onclick="perdritype('A2','perdritypeA2');">A2</button>
                            <button id="perdritypeA3" onclick="perdritype('A3','perdritypeA3');">A3</button>
                            <button id="perdritypeB1" onclick="perdritype('B1','perdritypeB1');">B1</button>
                            <button id="perdritypeB2" onclick="perdritype('B2','perdritypeB2');">B2</button>
                            <button id="perdritypeC1" onclick="perdritype('C1','perdritypeC1');">C1</button>
                            <button id="perdritypeC2" onclick="perdritype('C2','perdritypeC2');">C2</button>
                        </li>
                    </ul>

                    <div class="inq-school">
                        <ul id="vehList">
                            <li class="list-school"><img src="./信息查询_files/1484884782359.png" style="width:295px;">
                                <div class="inf-school"><p class="word-1">晋A0038学</p>
                                    <p>培训车型：A2</p>
                                    <p title="上饶市信州区兴荣驾驶员培训学校">所属驾培机构：上饶市信州区兴荣驾驶员培……</p></div>
                            </li>
                            <li class="list-school"><img src="./信息查询_files/1484884911366.png" style="width:295px;">
                                <div class="inf-school"><p class="word-1">苏A1323学</p>
                                    <p>培训车型：A2</p>
                                    <p title="上饶市信州区兴荣驾驶员培训学校">所属驾培机构：上饶市信州区兴荣驾驶员培……</p></div>
                            </li>
                            <li class="list-school"><img src="./信息查询_files/1484884968354.png" style="width:295px;">
                                <div class="inf-school"><p class="word-1">苏A0119学</p>
                                    <p>培训车型：A2</p>
                                    <p title="上饶市信州区兴荣驾驶员培训学校">所属驾培机构：上饶市信州区兴荣驾驶员培……</p></div>
                            </li>
                            <li class="list-school"><img src="./信息查询_files/1484885061400.png" style="width:295px;">
                                <div class="inf-school"><p class="word-1">苏A8329学</p>
                                    <p>培训车型：A2</p>
                                    <p title="上饶市信州区兴荣驾驶员培训学校">所属驾培机构：上饶市信州区兴荣驾驶员培……</p></div>
                            </li>
                            <li class="list-school"><img src="./信息查询_files/1484885106369.png" style="width:295px;">
                                <div class="inf-school"><p class="word-1">苏A2122学</p>
                                    <p>培训车型：A2</p>
                                    <p title="上饶市信州区兴荣驾驶员培训学校">所属驾培机构：上饶市信州区兴荣驾驶员培……</p></div>
                            </li>
                            <li class="list-school"><img src="./信息查询_files/1484885202415.png" style="width:295px;">
                                <div class="inf-school"><p class="word-1">苏A1289学</p>
                                    <p>培训车型：A2</p>
                                    <p title="上饶市信州区兴荣驾驶员培训学校">所属驾培机构：上饶市信州区兴荣驾驶员培……</p></div>
                            </li>
                        </ul>
                        <hr>
                        <div id="demo456" style="float: right;margin-right: 10px;">
                            <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-8"><a
                                    href="javascript:;" class="layui-laypage-prev layui-disabled" data-page="0">上一页</a><span
                                    class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>1</em></span><a
                                    href="javascript:;" data-page="2">2</a><a href="javascript:;" data-page="3">3</a><a
                                    href="javascript:;" data-page="4">4</a><a href="javascript:;" data-page="5">5</a><span
                                    class="layui-laypage-spr">…</span><a href="javascript:;" class="layui-laypage-last"
                                                                         title="尾页" data-page="4384">4384</a><a
                                    href="javascript:;" class="layui-laypage-next" data-page="2">下一页</a></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="footer">
        <div class="footer-box">
            <p class="footer-p" style="text-align: center;">友情链接</p>
            <div class="footer-friend">

                <c:forEach items="${linkList}" varStatus="item" var="link">
                    <c:if test="${item.index % 5 == 0}">
                        <br><br>
                    </c:if>
                    <a target="_blank" href="${link.lkUrl}">
                        <img class="footer-img" src='<%=path%>${link.lkPic}'>
                    </a>
                </c:forEach>

            </div>
        </div>

    </div>
    <div class="footer-inf">
        <ul style="text-align: center;display: table;">
            <li style="margin: 0 60px 0 0px;">
                <a href="javascript:void(0);">版权所有：传一科技</a>
            </li>
            <li style="margin: 0 60px 0 0px;">
                <a href="javascript:void(0);">技术支持：传一科技</a>
            </li>
        </ul>
    </div>
    <script src="<%=path+"/zjh_test/js/jquery.min.js"%>"></script>
    <script src="<%=path+"/zjh_test/js/City_data.js"%>"></script>
    <script src="<%=path+"/zjh_test/js/areadata.js"%>"></script>
    <script src="<%=path+"/zjh_test/js/auto_area.js"%>"></script>
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <script src="<%=path+"/zjh_test/js/common.js"%>"></script>
    <script src="<%=path+"/zjh_test/js/commonpage.js"%>"></script>


    <script src="<%=path+"/zjh_test/js/inquire.js"%>"></script>


</body>
</html>
