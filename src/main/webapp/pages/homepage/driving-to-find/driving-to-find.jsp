<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/9
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String schoolName = null;//名称
    String path = request.getContextPath();
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie:cookies){
        if(cookie.getName().equals("schoolName"))schoolName = cookie.getValue();
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>老司机驾考网——驾校查询</title>
    <meta name="keywords" content="驾校,驾校一点通,学车,陪驾,陪练">
    <meta name="description" content="驾考提供全国驾校查询、驾校点评、驾校考试、驾校口碑、驾校排名、学车价格、驾校位置、驾校投诉等驾考服务。元贝驾考还提供驾校一点通2020模拟考试。">
    <meta name="mobile-agent" content="format=html5;url=http://m.jiaxiao.ybjk.com/">
    <link rel="stylesheet" type="text/css" href="driving-to-find_files/css_jx.css">
    <link rel="stylesheet" type="text/css" href="driving-to-find_files/font-awesome.css">
    <script language="javascript" type="text/javascript" src="driving-to-find_files/jquery.js"></script>
    <script language="javascript" type="text/javascript" src="driving-to-find_files/app.js"></script>
    <!-- base href="https://jiaxiao.ybjk.com/" --></head>
<body>
    <div class="MainBox head">
        <div class="MainL headL" style="float:right;"></div>
        <div class="MainR headR" style="float:left;">
            <a href="" target="_self"><img src="" alt="<%=schoolName%> www.lsjjk.com" align="absmiddle"></a>
            <strong><a href="" target="_self">找驾校</a></strong>
        </div>
    </div>
    <div class="fcc"></div>
    <div class="Nav">
        <div class="fcc"><a href="<%=path+"/pages/homepage/home-page.jsp"%>" target="_blank"><%=schoolName%></a>
            <a href="" class="h" target="_self">找驾校</a><a
                    href="" target="_self">驾校认证</a>
            <a href="" target="_blank">学车视频</a>
            <div class="UC">
                <p class="l">
                    <a href="javascript:;" onclick="openLogin();"><i class="fa fa-user"></i>登录</a>
                    <u>|</u><a href="javascript:;" onclick="openReg();">注册</a>
                </p>
            </div>
        </div>
    </div>
    <div class="fcc"></div>
    <div class="MainBox fcc">
        <div class="MainL"><br>
            <div class="BoxArea BoxP fcc"><p>省份</p>
                <div>
                    A<a target="_self" href="https://jiaxiao.ybjk.com/ah" title="安徽驾校">安徽</a><br>
                    B<a target="_self" href="https://jiaxiao.ybjk.com/bj" title="北京驾校">北京</a><br>
                    C<a target="_self" href="https://jiaxiao.ybjk.com/cq" title="重庆驾校">重庆</a><br>
                    F<a target="_self" href="https://jiaxiao.ybjk.com/fj" title="福建驾校">福建</a>
                </div>
                <div class="BoxP2">
                    G<a target="_self" href="https://jiaxiao.ybjk.com/gd" title="广东驾校">广东</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/gx" title="广西驾校">广西</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/gz" title="贵州驾校">贵州</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/gs" title="甘肃驾校">甘肃</a><br>
                    H<a target="_self" href="https://jiaxiao.ybjk.com/he" title="河北驾校">河北</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/ha" title="河南驾校">河南</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/hb" title="湖北驾校">湖北</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/hn" title="湖南驾校">湖南</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/hi" title="海南驾校">海南</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/hlj" title="黑龙江驾校">黑龙江</a><br>
                    J<a target="_self" href="https://jiaxiao.ybjk.com/js" title="江苏驾校">江苏</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/jx" title="江西驾校">江西</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/jl" title="吉林驾校">吉林</a><br>
                    L<a target="_self" href="https://jiaxiao.ybjk.com/ln" title="辽宁驾校">辽宁</a></div>
                <div class="BoxP3">
                    N<a target="_self" href="https://jiaxiao.ybjk.com/nmg" title="内蒙古驾校">内蒙古</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/nx" title="宁夏驾校">宁夏</a><br>
                    Q<a target="_self" href="https://jiaxiao.ybjk.com/qh" title="青海驾校">青海</a><br>
                    S<a target="_self" href="https://jiaxiao.ybjk.com/sh" title="上海驾校">上海</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/sd" title="山东驾校">山东</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/sx" title="山西驾校">山西</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/sn" title="陕西驾校">陕西</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/sc" title="四川驾校">四川</a><br>
                    T<a target="_self" href="https://jiaxiao.ybjk.com/tj" title="天津驾校">天津</a>
                </div>
                <div>
                    X<a target="_self" href="https://jiaxiao.ybjk.com/xz" title="西藏驾校">西藏</a>
                    <a target="_self" href="https://jiaxiao.ybjk.com/xj" title="新疆驾校">新疆</a><br>
                    Y<a target="_self" href="https://jiaxiao.ybjk.com/yn" title="云南驾校">云南</a><br>
                    Z<a target="_self" href="https://jiaxiao.ybjk.com/zj" title="浙江驾校">浙江</a>
                </div>
            </div>
            <div class="listcnt">
                <div class="listmain">
                    <ul class="fcc">
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/jyxwjjx" target="_blank">
                                    <img src="driving-to-find_files/sml_006.jfif" alt="靖远县万骏驾校"></a></dt>
                                <dd>
                                    <h3><a href="https://jiaxiao.ybjk.com/jyxwjjx" target="_blank">靖远县万骏驾校</a></h3>
                                    <span><img src="driving-to-find_files/10.gif"></span>
                                    <div>
                                        <a href="https://jiaxiao.ybjk.com/gs" target="_self">甘肃</a><u>&gt;</u>
                                        <a href="https://jiaxiao.ybjk.com/gs-baiyin" target="_self">白银</a><u>&gt;</u>
                                    </div>
                                    <strong><em>电询或面议</em></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/jyxwjjx" target="_blank">万骏驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/shptjx" target="_blank"><img
                                        src="driving-to-find_files/sml_003.png" alt="上海普陀驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/shptjx" target="_blank">上海普陀驾校</a></h3><span><img
                                        src="driving-to-find_files/0.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/sh" target="_self">上海</a><u>&gt;</u>
                                        <a href="https://jiaxiao.ybjk.com/sh-putuo" target="_self">普陀</a><u>&gt;</u>
                                        <a href="https://jiaxiao.ybjk.com/sh-putuo-yichuanlu" target="_self">宜川路</a><u>&gt;</u>普陀区志丹路4号4幢107室
                                    </div>
                                    <strong><i>￥</i>8685<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/shptjx" target="_blank">普陀驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/szjdjx" target="_blank"><img
                                        src="driving-to-find_files/sml.png" alt="池州杰达驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/szjdjx" target="_blank">池州杰达驾校</a></h3><span><img
                                        src="driving-to-find_files/6.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/ah" target="_self">安徽</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/ah-xuancheng" target="_self">宣城</a><u>&gt;</u>池州市贵池区池阳路杰达报名大厅
                                    </div>
                                    <strong><i>￥</i>2200<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/szjdjx" target="_blank">杰达驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/bjhongxiangjx" target="_blank"><img
                                        src="driving-to-find_files/sml_006.png" alt="北京鸿翔驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/bjhongxiangjx" target="_blank">北京鸿翔驾校</a></h3>
                                    <span><img src="driving-to-find_files/10.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/bj" target="_self">北京</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/bj-daxing" target="_self">大兴</a><u>&gt;</u>大兴区
                                    </div>
                                    <strong><i>￥</i>3000<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/bjhongxiangjx"
                                             target="_blank">鸿翔驾校</a></i><b></b></p></dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/hnhhcxtxjx" target="_blank"><img
                                        src="driving-to-find_files/sml_010.png" alt="怀化辰溪泰兴驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/hnhhcxtxjx" target="_blank">怀化辰溪泰兴驾校</a></h3>
                                    <span><img src="driving-to-find_files/10.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/hn" target="_self">湖南</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/hn-huaihua" target="_self">怀化市</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/hn-huaihua-chenxi"
                                            target="_self">辰溪县</a><u>&gt;</u></div>
                                    <strong><em>电询或面议</em></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/hnhhcxtxjx" target="_blank">泰兴驾校</a></i><b></b>
                                    </p></dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/xtsjtjx" target="_blank"><img
                                        src="driving-to-find_files/sml_008.jfif" alt="邢台骏腾驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/xtsjtjx" target="_blank">邢台骏腾驾校</a></h3><span><img
                                        src="driving-to-find_files/0.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/he" target="_self">河北</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/he-xingtai" target="_self">邢台市</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/he-xingtai-shahe"
                                            target="_self">沙河市</a><u>&gt;</u>宏峰矿业有限公司附近
                                    </div>
                                    <strong><em>电询或面议</em></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/xtsjtjx" target="_blank">骏腾驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/whmtjx" target="_blank"><img
                                        src="driving-to-find_files/sml_007.jfif" alt="武汉明涛驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/whmtjx" target="_blank">武汉明涛驾校</a></h3><span><img
                                        src="driving-to-find_files/6.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/hb" target="_self">湖北</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/hb-wuhan" target="_self">武汉</a><u>&gt;</u>武汉市洪山区卓刀泉广场(白沙洲训练场）
                                    </div>
                                    <strong><i>￥</i>4000<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/whmtjx" target="_blank">明涛驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/thytjx" target="_blank"><img
                                        src="driving-to-find_files/sml_002.png" alt="通化运通驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/thytjx" target="_blank">通化运通驾校</a></h3><span><img
                                        src="driving-to-find_files/8.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/jl" target="_self">吉林</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/jl-tonghua" target="_self">通化</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/jl-tonghua-liuhe"
                                            target="_self">柳河</a><u>&gt;</u>柳河县交通前进街155号
                                    </div>
                                    <strong><i>￥</i>2400<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/thytjx" target="_blank">运通驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/szszcjx" target="_blank"><img
                                        src="driving-to-find_files/sml_009.jfif" alt="随州志成驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/szszcjx" target="_blank">随州志成驾校</a></h3><span><img
                                        src="driving-to-find_files/0.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/hb" target="_self">湖北</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/hb-suizhou" target="_self">随州市</a><u>&gt;</u>马家铺村源丰化工厂旁
                                    </div>
                                    <strong><em>电询或面议</em></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/szszcjx" target="_blank">至成驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/hhtdjx" target="_blank"><img
                                        src="driving-to-find_files/sml_009.png" alt="杭后通大驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/hhtdjx" target="_blank">杭后通大驾校</a></h3><span><img
                                        src="driving-to-find_files/8.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/nmg" target="_self">内蒙古</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/nmg-bayannaoer"
                                            target="_self">巴彦淖尔</a><u>&gt;</u>内蒙古巴彦淖尔市杭后
                                    </div>
                                    <strong><em>电询或面议</em></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/hhtdjx" target="_blank">通大驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/qyhdjx" target="_blank"><img
                                        src="driving-to-find_files/sml_004.jfif" alt="庆阳华东驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/qyhdjx" target="_blank">庆阳华东驾校</a></h3><span><img
                                        src="driving-to-find_files/10.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/gs" target="_self">甘肃</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/gs-qingyang" target="_self">庆阳</a><u>&gt;</u>华池县
                                    </div>
                                    <strong><em>电询或面议</em></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/qyhdjx" target="_blank">华东驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/ahhfyhjyjx" target="_blank"><img
                                        src="driving-to-find_files/sml_004.png" alt="合肥金云驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/ahhfyhjyjx" target="_blank">合肥金云驾校</a></h3>
                                    <span><img src="driving-to-find_files/10.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/ah" target="_self">安徽</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/ah-hefei" target="_self">合肥市</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/ah-hefei-yaohai"
                                            target="_self">瑶海区</a><u>&gt;</u></div>
                                    <strong><em>电询或面议</em></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/ahhfyhjyjx" target="_blank">金云驾校</a></i><b></b>
                                    </p></dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/snzzqcjx" target="_blank"><img
                                        src="driving-to-find_files/sml_003.jfif" alt="商南职中汽车驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/snzzqcjx" target="_blank">商南职中汽车驾校</a></h3>
                                    <span><img src="driving-to-find_files/10.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/sn" target="_self">陕西</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/sn-shangluo" target="_self">商洛</a><u>&gt;</u>商南县富水镇富水街东头
                                    </div>
                                    <strong><i>￥</i>3200<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/snzzqcjx" target="_blank">职中汽车驾校</a></i><b></b>
                                    </p></dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/qdqyjx" target="_blank"><img
                                        src="driving-to-find_files/sml_002.jfif" alt="青岛全越驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/qdqyjx" target="_blank">青岛全越驾校</a></h3><span><img
                                        src="driving-to-find_files/8.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/sd" target="_self">山东</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/sd-qingdao" target="_self">青岛</a><u>&gt;</u>胶南市铁山办事处329省道与王宝路交接口西南
                                    </div>
                                    <strong><i>￥</i>3640<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/qdqyjx" target="_blank">全越驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/gdgzjtjx" target="_blank"><img
                                        src="driving-to-find_files/sml_005.png" alt="广州精通驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/gdgzjtjx" target="_blank">广州精通驾校</a></h3>
                                    <span><img src="driving-to-find_files/8.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/gd" target="_self">广东</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/gd-guangzhou" target="_self">广州</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/gd-guangzhou-conghua" target="_self">从化</a><u>&gt;</u>广州城建职业学院第一教学楼130室
                                    </div>
                                    <strong><i>￥</i>3800<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/gdgzjtjx" target="_blank">精通驾校</a></i><b></b>
                                    </p></dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/aslyjx" target="_blank"><img
                                        src="driving-to-find_files/sml_008.png" alt="鞍山蓝鹰驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/aslyjx" target="_blank">鞍山蓝鹰驾校</a></h3><span><img
                                        src="driving-to-find_files/6.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/ln" target="_self">辽宁</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/ln-anshan" target="_self">鞍山</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/ln-anshan-tiedongqu" target="_self">铁东区</a><u>&gt;</u>辽宁省鞍山市铁东区永昌街74号
                                    </div>
                                    <strong><i>￥</i>2600<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/aslyjx" target="_blank">蓝鹰驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/nystjx" target="_blank"><img
                                        src="driving-to-find_files/sml.jfif" alt="宁阳顺通驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/nystjx" target="_blank">宁阳顺通驾校</a></h3><span><img
                                        src="driving-to-find_files/10.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/sd" target="_self">山东</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/sd-taian" target="_self">泰安市</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/sd-taian-ningyang"
                                            target="_self">宁阳县</a><u>&gt;</u>山东省泰安市宁阳县葛石镇谭厂顺通
                                    </div>
                                    <strong><i>￥</i>2000<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/nystjx" target="_blank">顺通驾校</a></i><b></b></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/smxzxjx" target="_blank"><img
                                        src="driving-to-find_files/sml_007.png" alt="厦门新正兴驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/smxzxjx" target="_blank">厦门新正兴驾校</a></h3>
                                    <span><img src="driving-to-find_files/8.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/fj" target="_self">福建</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/fj-shamen" target="_self">厦门</a><u>&gt;</u>厦门湖里区枋湖花园14号204
                                    </div>
                                    <strong><i>￥</i>7200<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/smxzxjx" target="_blank">新正兴驾校</a></i><b></b>
                                    </p></dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/wlcbxsjjx" target="_blank"><img
                                        src="driving-to-find_files/sml_010.jfif" alt="乌兰察布新世纪驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/wlcbxsjjx" target="_blank">乌兰察布新世纪驾校</a></h3>
                                    <span><img src="driving-to-find_files/0.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/nmg" target="_self">内蒙古</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/nmg-wulanchabu"
                                            target="_self">乌兰察布市</a><u>&gt;</u>乌兰察布市化德县轻工业园区208省道东侧
                                    </div>
                                    <strong><em>电询或面议</em></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/wlcbxsjjx" target="_blank">新世纪驾校</a></i><b></b>
                                    </p></dd>
                            </dl>
                        </li>
                        <li>
                            <dl class="fcc">
                                <dt><a href="https://jiaxiao.ybjk.com/ahczxljx" target="_blank"><img
                                        src="driving-to-find_files/sml_005.jfif" alt="池州祥龙驾校"></a></dt>
                                <dd><h3><a href="https://jiaxiao.ybjk.com/ahczxljx" target="_blank">池州祥龙驾校</a></h3>
                                    <span><img src="driving-to-find_files/10.gif"></span>
                                    <div><a href="https://jiaxiao.ybjk.com/ah" target="_self">安徽</a><u>&gt;</u><a
                                            href="https://jiaxiao.ybjk.com/ah-chizhou" target="_self">池州</a><u>&gt;</u>
                                    </div>
                                    <strong><i>￥</i>4000<u>起</u></strong>
                                    <p><i><a href="https://jiaxiao.ybjk.com/ahczxljx" target="_blank">祥龙驾校</a></i><b></b>
                                    </p></dd>
                            </dl>
                        </li>
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
                        <li title="赤峰环宇驾校《C1照》"><b><a href="https://jiaxiao.ybjk.com/kc_yaqg5"
                                                      target="_blank">C1照</a></b><i><em>2300</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_yaqg5#bmb" target="_blank">报名</a></u></li>
                        <li title="赤峰环宇驾校《C1照》"><b><a href="https://jiaxiao.ybjk.com/kc_ec7sg"
                                                      target="_blank">C1照</a></b><i><em>2000</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_ec7sg#bmb" target="_blank">报名</a></u></li>
                        <li title="贵阳凯诚驾校云岩分校《摩托车》"><b><a href="https://jiaxiao.ybjk.com/kc_gqq0d"
                                                          target="_blank">摩托车</a></b><i><em>1200</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_gqq0d#bmb" target="_blank">报名</a></u></li>
                        <li title="贵阳凯诚驾校云岩分校《全包班》"><b><a href="https://jiaxiao.ybjk.com/kc_nb4a4"
                                                          target="_blank">全包班</a></b><i><em>5780</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_nb4a4#bmb" target="_blank">报名</a></u></li>
                        <li title="贵阳凯诚驾校云岩分校《无忧班》"><b><a href="https://jiaxiao.ybjk.com/kc_jg4z7"
                                                          target="_blank">无忧班</a></b><i><em>4780</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_jg4z7#bmb" target="_blank">报名</a></u></li>
                        <li title="贵阳凯诚驾校云岩分校《普通班》"><b><a href="https://jiaxiao.ybjk.com/kc_xrsbq"
                                                          target="_blank">普通班</a></b><i><em>4480</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_xrsbq#bmb" target="_blank">报名</a></u></li>
                        <li title="贵阳凯诚驾校云岩分校《全包班》"><b><a href="https://jiaxiao.ybjk.com/kc_uyskz"
                                                          target="_blank">全包班</a></b><i><em>5280</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_uyskz#bmb" target="_blank">报名</a></u></li>
                        <li title="贵阳凯诚驾校云岩分校《无忧班》"><b><a href="https://jiaxiao.ybjk.com/kc_a8x0d"
                                                          target="_blank">无忧班</a></b><i><em>4280</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_a8x0d#bmb" target="_blank">报名</a></u></li>
                        <li title="贵阳凯诚驾校云岩分校《普通班》"><b><a href="https://jiaxiao.ybjk.com/kc_e8b86"
                                                          target="_blank">普通班</a></b><i><em>3980</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_e8b86#bmb" target="_blank">报名</a></u></li>
                        <li title="贵阳凯诚驾校云岩分校《学生班》"><b><a href="https://jiaxiao.ybjk.com/kc_yywx9"
                                                          target="_blank">学生班</a></b><i><em>3680</em>元</i><u><a
                                href="https://jiaxiao.ybjk.com/kc_yywx9#bmb" target="_blank">报名</a></u></li>
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
                            <li title="邓州驰骋驾校《C1照》"><b><a href="https://jiaxiao.ybjk.com/kc_cace9"
                                                          target="_blank">C1照</a></b><i><em>2700</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_cace9#bmb" target="_blank">报名</a></u></li>
                            <li title="牡丹江龙丹驾校《C1照》"><b><a href="https://jiaxiao.ybjk.com/kc_wr9c8" target="_blank">C1照</a></b><i><em>2600</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_wr9c8#bmb" target="_blank">报名</a></u></li>
                            <li title="河池桂西北驾校《B2照》"><b><a href="https://jiaxiao.ybjk.com/kc_e6mae" target="_blank">B2照</a></b><i><em>3300</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_e6mae#bmb" target="_blank">报名</a></u></li>
                            <li title="河池桂西北驾校《C1照》"><b><a href="https://jiaxiao.ybjk.com/kc_thww4" target="_blank">C1照</a></b><i><em>1600</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_thww4#bmb" target="_blank">报名</a></u></li>
                            <li title="西宁东雁驾校《C1照》"><b><a href="https://jiaxiao.ybjk.com/kc_taaps"
                                                          target="_blank">C1照</a></b><i><em>1700</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_taaps#bmb" target="_blank">报名</a></u></li>
                            <li title="铜仁锦宏驾校《手动挡》"><b><a href="https://jiaxiao.ybjk.com/kc_th64p"
                                                          target="_blank">手动挡</a></b><i><em>4500</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_th64p#bmb" target="_blank">报名</a></u></li>
                            <li title="铜仁锦宏驾校《货车》"><b><a href="https://jiaxiao.ybjk.com/kc_xkcw0" target="_blank">货车</a></b><i><em>9600</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_xkcw0#bmb" target="_blank">报名</a></u></li>
                            <li title="庆阳三星驾校《普通班》"><b><a href="https://jiaxiao.ybjk.com/kc_ngsst"
                                                          target="_blank">普通班</a></b><i><em>3300</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_ngsst#bmb" target="_blank">报名</a></u></li>
                            <li title="内江双安驾校《C1照》"><b><a href="https://jiaxiao.ybjk.com/kc_c0tu9"
                                                          target="_blank">C1照</a></b><i><em>3920</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_c0tu9#bmb" target="_blank">报名</a></u></li>
                            <li title="达州宣汉驾校《C1照》"><b><a href="https://jiaxiao.ybjk.com/kc_czhjc"
                                                          target="_blank">C1照</a></b><i><em>3000</em>元</i><u><a
                                    href="https://jiaxiao.ybjk.com/kc_czhjc#bmb" target="_blank">报名</a></u></li>
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
                <dt>友情链接<i>　合作ＱＱ：1092556677</i></dt>
                <dd>学车交流ＱＱ群：203522850</dd>
            </dl>
            <ul><a href="http://www.jsyks.com/jiaxiao/">驾校考试</a><a href="http://www.jsypj.com/">驾驶员陪驾</a><a
                    href="http://www.jsyks.com/">驾驶员考试</a><a href="http://news.jsyks.com/">驾考资讯</a><a
                    href="http://xcsp.jsyks.com/">学车视频</a><a href="http://jxedt.jsyks.com/">驾校一点通模拟考试2020</a><a
                    href="http://www.jsyks.com/test/A2/">驾校一点通科目四</a><a
                    href="http://www.jsyks.com/w_0e2a6">驾校一点通科目一7月新增100题</a><a href="http://jiaxiao.jsyks.com/">驾校</a><a
                    href="http://ln.offcn.com/">辽宁人事考试网</a><a href="http://youer.jiameng.com/">幼儿教育加盟</a><a
                    href="http://www.91jm.com/">加盟网</a><a href="https://sh.tantuw.com/">上海坦途教育</a><a
                    href="https://jxgj.ybjk.com/">驾校管家</a><a href="http://www.jkbl.com/">驾考部落</a><a
                    href="http://www.jsyks.com/nctc.php">南京交通技师学院2020年招生简章</a></ul>
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
        <a
                href="https://jiaxiao.ybjk.com/">找驾校</a> - <a href="<%=path+"///"%>"><%=schoolName%></a>　 版权所有　 吓ICP备xxxxxxxx号
    </div>
    <div class="backTop" onclick='$("html,body").animate({scrollTop:0}, "100");'></div>
    <script src="driving-to-find_files/tj.js"></script>
    <div style="display:none;">
        <script src="driving-to-find_files/tongji.js"></script>
        <b style="display:none;">
            <script src="driving-to-find_files/stat.php" language="JavaScript"></script>
        </b>
    </div><!-- 2020-06-09 16:33:41 -->

</body>
</html>
