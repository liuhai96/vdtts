<%--
  Created by IntelliJ IDEA.
  User: zhaohaiyang
  Date: 2020/5/8
  Time: 上午9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.lsjbc.vdtts.utils.Tool" %>
<%
	String path = request.getContextPath();
	String today = new Tool().getDate("yyyy年MM月dd日");
%>
<!doctype html>
<input hidden="hidden" value="<%=path%>" id="path">
<HEAD>
<%--	<META content="IE=11.0000" http-equiv="X-UA-Compatible">--%>
	<META charset="utf-8">
	<META name="viewport"  content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<TITLE>驾培机构详情</TITLE>
	<LINK href="<%=path%>/back/school-1/school_files/layui.css" rel="stylesheet" media="all">
	<LINK href="<%=path%>/back/school-1/school_files/common.css" rel="stylesheet">
	<LINK href="http://47.96.140.98:20034/static/img/logo_favicon.ico" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css" media="all">
	<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
	<SCRIPT>
		var _hmt = _hmt || [];
		(function () {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?22f0ca35d25f96268f9512c85774f0dc";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</SCRIPT>
	<LINK href="<%=path%>/back/school-1/school_files/inquire_tablelist.css" rel="stylesheet" type="text/css">
	<LINK href="<%=path%>/back/school-1/school_files/starScore.css" rel="stylesheet" type="text/css">
	<LINK href="<%=path%>/back/school-1/school_files/inquireSchDetails.css" rel="stylesheet" type="text/css">

	<SCRIPT src="<%=path%>/back/school-1/school_files/maps.js" type="text/javascript"></SCRIPT>
	<META name="GENERATOR" content="MSHTML 11.00.9600.19572">
</HEAD>
<BODY style="background: rgb(250, 251, 253);">

<input type="hidden" id="schoolId" value="">
<DIV class="top">
	<DIV class="top-box"><IMG class="top-logo" src="<%=path%>/back/school-1/school_files/psp-logo.png">

		<DIV class="top-title">
			<P class="top-title-p1">机动车驾驶培训公共服务平台</P>
			<P class="top-title-p2">Timing training system for motor vehicle drivers</P></DIV>
		<DIV class="top-search">
		</DIV>
	</DIV>
</DIV>
<div class="menu">
	<div class="menu-box">
		<ul id="menu-title" class="menu-title">
			<li id="menu-title-one">
				<img src="<%=path+"/image/pages/index/menu_home1.png"%>">
				<a href="<%=path+"/index"%>">首页</a>
			</li>
			<li id="menu-title-two">
				<img src="<%=path+"/image/pages/index/menu_publicity1.png"%>">
				<a href="<%=path+"/publicity/notice/1/-1"%>">公开公示</a>
			</li>
			<li id="menu-title-three" class="layui-this menu-title-bg">
				<img src="<%=path+"/image/pages/index/menu_inquire1.png"%>">
				<a href="<%=path+"/inquire"%>">信息查询</a></li>
			</li>
			<li id="menu-title-six">
				<img src="<%=path+"/image/pages/index/menu_student1.png"%>">
				<a href="<%=path+"/student"%>">学教专区</a>
			</li>
		</ul>
	</div>
</div>
<div id="share">
	<a id="totop" title="返回顶部" style="display: none;">返回顶部</a>
	<a href="javascript:void(0)" title="返回上一页" class="sina" onclick="history.go(-1);"></a>
	<a href="javascript:void(0)" title="刷新" class="tencent" onclick="history.go(0);"></a>
</div>
	<DIV class="del-1">
		<DIV class="del-lun">
		</DIV>
		<DIV style="float: left">
			<IMG style="height: 260px; width: 900px;" src="<%=path%>/static/layui/images/photo/06.png">
		</DIV>
				<DIV class="del-schinf">
				<P class="del-p"><span>${name}</span><IMG src="<%=path+"/back/school-1/school_files/tower.png"%>"></P>
				<DIV class="del-inf">
			<p>
				<b>全国统一信用代码：</b>
				<span id="sbusines">${sbusines}</span>
				<b style="margin-left: 40px;">经营许可日期：</b>
				<span>${sRegTime}</span>
			</p>

			<p><b>教练员人数：</b>
			<span>${teacherCount}</span>人
			</p>
			<p><b>教练车台数：</b>
			<span>${carCount}</span>台
			</p>

			<p><b>地址：</b>
				<span id="address">${address}</span>
				<b style="margin-left: 182px;">学员总人数：</b>
				<span>${studentCount}</span>人
			</p>
			<hr>
			<p>
				<b style="float: left;">综合星级：</b>
			</p>
			<div style="margin-top: 7px;">
				<div class="atar_Show">
					<p class="atar_Show scoreStar" tip="${score}"></p>
				</div>
				<span style="font-size: 17px;color: #65B0F1;">${score}</span>
			</div>
				<div class="site-demo-button" id="layerDemo" style="margin-bottom: 0; text-align: center">
					<button data-method="notice" class="layui-btn">学生报名</button>
				</div>
			</DIV>
			<p></p>
		</div>
<%--		<DIV class="del-schinf">--%>
<%--			<P class="del-p"><SPAN id="shortname">宏鑫驾校</SPAN><IMG src="../school-1/school_files/tower.png"></P>--%>
<%--			<DIV class="del-inf">--%>
<%--				<P><B>全国统一编号：</B><SPAN id="creditcode">1111111111111111111111111 </SPAN></P>--%>
<%--				<P><B>经营许可日期：</B><SPAN id="licetime">2020年6月1号</SPAN></P>--%>
<%--				<P><SPAN><B>教练员：</B><SPAN id="coacount">8</SPAN>人</SPAN>--%>
<%--					<SPAN style="margin-left: 75px;"><B>教练车：</B><SPAN id="vuecount">16</SPAN>辆</SPAN></P>--%>
<%--				<P><SPAN><B>年新增学员数：</B><SPAN id="yearaddstucount">55</SPAN>人</SPAN></P>--%>
<%--				<P><IMG class="inf-p-loc" src="../school-1/school_files/location2.png"><B>地址：</B><SPAN id="address">厦门市湖里区湖里大道121号</SPAN>--%>
<%--				</P>--%>
<%--				<HR>--%>

<%--				<P><B style="float: left;">综合星级：</B><SPAN id="starImg">5分</SPAN>--%>
<%--					<SPAN class="del-inf-num"><SPAN id="star"></SPAN></SPAN></P>--%>
<%--				<DIV class="del-inf-but" style="width: 100%; float: left;">--%>
<%--					<DIV class="inf-but-box" id="evaDisplayList">--%>
<%--					</DIV>--%>
<%--				</DIV>--%>
<%--				<div class="site-demo-button" id="layerDemo" style="margin-bottom: 0; text-align: center">--%>
<%--					<button data-method="notice" class="layui-btn">学生报名</button>--%>
<%--				</div>--%>
<%--			</DIV>--%>
<%--		</DIV>--%>
	</DIV>
	<script>
		layui.use('layer', function () { //独立版的layer无需执行这一句
			var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

			$('.layui-btn').on('click', function () {
				var othis = $(this), method = othis.data('method');
				active[method] ? active[method].call(this, othis) : '';
			});

			//触发事件
			var active = {
				notice: function () {
					//示范一个公告层
					layer.open({
						type: 1
						, title: false //不显示标题栏
						, closeBtn: false
						, area: '300px;'
						, shade: 0.8
						, id: 'LAY_layuipro' //设定一个id，防止重复弹出
						, btn: ['立即报名', '残忍拒绝']
						, btnAlign: 'c'
						, moveType: 1 //拖拽模式，0或者1
						, content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">欢迎报名宏鑫驾校！<br>姓名<br><input type="text" name="sName" id="sName" placeholder="请输入姓名" class="layui-input" ><br>身份证<br><input type="text" name="sSfz" id="sSfz" placeholder="请输入身份证" class="layui-input" > </div>'
						, yes: function (index, layero) {
							let sName = $("#sName").val();
							let schoolId = $("#schoolId").val();
							let sSfz = $("#sSfz").val();
							let sSfz2 = $("#path").val() + '/SchoolControl/insSfz';
							$.ajax({
								type: 'get',
								url: '/SchoolControl/insSfz',
								dataType: 'JSON',
								data: {
									sName: sName
									, sSfz: sSfz
								},
								success: function (remsg) {
									if (remsg.code==1){
										layer.msg(remsg.msg);
										layer.close(index);
									}else if(remsg.code==2){
										layer.msg(remsg.msg);
										layer.close(index);
									}else {
										layer.msg(remsg.msg);
										layer.close(index);
									}

								}
							})
						}
					})
				}
			}
		})
	</script>
	<DIV class="table-list">
		<UL class="blist clearfix">
			<LI class="active">驾培机构简介</LI>
			<LI>驾培机构风采</LI>
			<LI>学员评价</LI>
			<LI>联系方式</LI>
		</UL>
		<UL class="blsit-list blsit-list1">
			<LI class="del-lis1">
				<P class="p-title">驾培机构简介</P>
				<HR>

				<P class="p-cont">暂无简介!</P></LI>
			<LI class="del-lis2">
				<P class="p-title">驾培机构风采</P>
				<HR>

				<DIV class="del-sch-view"><IMG id="trainingImgFile" style="width: 450px; height: 253px;"
				                               src="<%=path%>/back/school-1/school_files/view.jpg">
					<P class="img-title">训练场地相册</P>
					<P style="line-height: 40px; margin-left: 15px;"><IMG src="<%=path%>/back/school-1/school_files/photos.png"><SPAN
							id="trainingCount" style="margin: 0px 15px;">共0张</SPAN>
						<IMG style="width: 14px;" src="<%=path%>/back/school-1/school_files/inq.png">
						<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;"
						      onclick="showPhotos(4);">查看相册 </SPAN>
						<IMG src="<%=path%>/back/school-1/school_files/arrows1.png"></P></DIV>

				<DIV class="del-sch-view">
					<IMG id="teachToolImgFile" style="width: 450px; height: 253px;"  src="<%=path%>/back/school-1/school_files/view.jpg">
					<P class="img-title">教具设施相册</P>
					<P style="line-height: 40px; margin-left: 15px;"><IMG src="<%=path%>/back/school-1/school_files/photos.png"><SPAN
							id="teachToolCount" style="margin: 0px 15px;">共0张</SPAN>
						<IMG style="width: 14px;" src="<%=path%>/back/school-1/school_files/inq.png">
						<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;"
						      onclick="showPhotos(5);">查看相册 </SPAN>
						<IMG src="<%=path%>/back/school-1/school_files/arrows1.png"></P></DIV>


				<DIV class="del-sch-view"><IMG id="trainSceneryImgFile" style="width: 450px; height: 253px;"
				                               src="<%=path%>/back/school-1/school_files/view.jpg">
					<P class="img-title">培训实景相册</P>
					<P style="line-height: 40px; margin-left: 15px;"><IMG src="<%=path%>/back/school-1/school_files/photos.png"><SPAN
							id="trainSceneryCount" style="margin: 0px 15px;">共0张</SPAN>
						<IMG style="width: 14px;" src="<%=path%>/back/school-1/school_files/inq.png">
						<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;"
						      onclick="showPhotos(6);">查看相册 </SPAN>
						<IMG src="<%=path%>/back/school-1/school_files/arrows1.png"></P></DIV>


				<DIV class="del-sch-view">
					<IMG id="schStyleImgFile" style="width: 450px; height: 253px;" src="<%=path%>/back/school-1/school_files/view.jpg">
					<P class="img-title">校园风貌相册</P>
					<P style="line-height: 40px; margin-left: 15px;"><IMG src="<%=path%>/back/school-1/school_files/photos.png">
						<SPAN id="schStyleCount" style="margin: 0px 15px;">共0张</SPAN>
						<IMG style="width: 14px;"src="<%=path%>/back/school-1/school_files/inq.png">
						<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;"onclick="showPhotos(7);">查看相册 </SPAN>
						<IMG src="<%=path%>/back/school-1/school_files/arrows1.png"></P></DIV>
			</LI>

		<LI class="del-lis5">
		<div class="coach-stu-evaluate">
        <textarea class="p-title" title="评价模板" id="evaluate_tpl" style="display:none;">
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
			</LI>
			<LI class="del-lis6">
				<DIV style="margin: 10px 0px 0px 10px; float: left;">
					<P style="color: rgb(90, 134, 205); padding-left: 10px; font-size: 18px;"><IMG
							style="width: 20px; margin-right: 10px;" src="<%=path%>/back/school-1/school_files/phone.png">联系方式</P>
					<P style="line-height: 40px; margin-left: 10px;">报名咨询电话：<SPAN id="schphone"  style="color: rgb(90, 134, 205);">12580</SPAN></P>
					<P style="line-height: 40px; margin-left: 10px;">投诉举报电话：<SPAN id="schcomphone"  style="color: rgb(90, 134, 205);">12580</SPAN></P>
					<P style="line-height: 40px; margin-left: 10px;">微信公众号： <SPAN id="pubnumber"></SPAN></P></DIV>
				<DIV style="margin-left: 400px; float: left;">
					<IMG id="pubnumfile"><IMG src="<%=path%>/back/school-1/school_files/code2.jpg">
				</DIV>
			</LI>
		</UL>
	</DIV>
</DIV>
<DIV class="footer-inf">
		<ul style="text-align: center;display: table;">
			<li style="margin: 0 60px 0 0px;">
				<a href="javascript:void(0);">版权所有：传一科技</a>
			</li>
			<li style="margin: 0 60px 0 0px;">
				<a href="javascript:void(0);">技术支持：传一科技</a>
			</li>
		</ul>
</DIV>
<SCRIPT src="<%=path%>/js/pages/index/jquery.min.js"></SCRIPT>
<SCRIPT src=<%=path%>/js/pages/index/inquireSchDetails.js" type="text/javascript" charset="utf-8"></SCRIPT>
<script src="<%=path+"/js/pages/index/City_data.js"%>"></script>
<script src="<%=path+"/js/pages/index/areadata.js"%>"></script>
<script src="<%=path+"/js/pages/index/auto_area.js"%>"></script>
<script src="<%=path+"/js/pages/index/common.js"%>"></script>
<script src="<%=path+"/js/pages/index/commonpage.js"%>"></script>

</BODY>
</HTML>




