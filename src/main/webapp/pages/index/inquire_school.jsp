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
	<META name="viewport"
		  content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<TITLE>驾培机构详情</TITLE>

	<link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" media="all">
	<link rel="stylesheet" href="<%=path+"/css/pages/index/common.css"%>">
	<link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css" media="all">


	<link rel="stylesheet" href="<%=path+"/css/pages/index/inquire_tablelist.css"%>">
	<link rel="stylesheet" href="<%=path+"/css/pages/index/starScore.css"%>">
	<link rel="stylesheet" href="<%=path+"/css/pages/index/inquireSchDetails.css"%>">
</HEAD>
<BODY style="background: rgb(250, 251, 253);">

<input type="hidden" id="schoolId" value="${sid}">

<div class="login-inf">
	<div class="inf-box">
		<div class="inf-time">
			今天是<%=today%>
		</div>
		<div class="inf-login">
			<c:if test="${sessionScope.student == null }">
                <a target="_blank" href="<%=path+"/back/adminlogin.jsp"%>">管理登录</a> |
                <a target="_blank" href="<%=path+"/pages/homepage/login.jsp"%>">机构登录</a> |
                <a href="<%=path+"/student"%>">学员登录</a>
                <a target="_blank" href="<%=path+"/pages/homepage/driving-in/driving-in.jsp"%>">驾校入驻</a>
			</c:if>
			<c:if test="${sessionScope.student != null }">
				<a href="<%=path+"/student"%>" id="studentName">欢迎您！ 学员: ${sessionScope.student.SName}</a>
				&nbsp;&nbsp;&nbsp;
				<a href="<%=path+"/logout/student"%>">退出</a>
			</c:if>
		</div>
	</div>
</div>
<div class="top">
	<div class="top-box">
		<img class="top-logo" src="<%=path+"/image/pages/index/psp-logo.png"%>">
		<div class="top-title">
			<p class="top-title-p1">机动车驾驶员计时培训系统</p>
			<p class="top-title-p2">Timing training system for motor vehicle drivers</p>
		</div>
		<form id="searchSchoolOrTeacher" action="<%=path+"inquire"%>" class="top-search">
			<select name="type">
				<option value="school">驾培机构</option>
				<option value="teacher">教练员</option>
			</select>
			<input type="text" name="name">
			<label>
				<a style="cursor: pointer;" onclick="document:searchSchoolOrTeacher.submit()">
					<img src="<%=path + "/image/pages/index/search.png"%>">搜索
				</a>
			</label>
		</form>
	</div>
</div>
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
<DIV class="main">
<DIV class="del-1">
	<DIV class="del-lun">
	</DIV>
	<DIV style="float: left">
		<IMG style="height: 260px; width: 700px;" src="<%=path%>/static/layui/images/photo/06.png">
	</DIV>
	<DIV class="del-schinf">
		<P class="del-p"><span>${name}</span><IMG src="<%=path%>/image/pages/index/tower.png"></P>
		<DIV class="del-inf">
			<p>
				<b>全国统一信用代码：</b>
				<span>${sbusinessId}</span>
				<b style="margin-left: 40px;">经营许可日期：</b>
				<span>${time}</span>
			</p>

			<p><b>教练员人数：</b>
				<span>${teachercount}</span>人
			</p>
			<p><b>教练车台数：</b>
				<span>${carcount}</span>台
			</p>

			<p><b>地址：</b>
				<span id="address">${address}</span></p>
			<p>
				<b>学员总人数：</b>
				<span>${studencount}</span>人</p>
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
</DIV>
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
										   src="<%=path%>/image/pages/index/school1.jpg">
				<P class="img-title">训练场地相册</P>
				<P style="line-height: 40px; margin-left: 15px;"><IMG
						src="<%=path%>/image/pages/index/photos.png"><SPAN
						id="trainingCount" style="margin: 0px 15px;">共0张</SPAN>
					<IMG style="width: 14px;" src="<%=path%>/image/pages/index/inq.png">
					<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;"
						  onclick="showPhotos(4);">查看相册 </SPAN>
					<IMG src="<%=path%>/image/pages/index/arrows1.png"></P></DIV>

			<DIV class="del-sch-view">
				<IMG id="teachToolImgFile" style="width: 450px; height: 253px;"
					 src="<%=path%>/image/pages/index/school1.jpg">
				<P class="img-title">教具设施相册</P>
				<P style="line-height: 40px; margin-left: 15px;"><IMG
						src="<%=path%>/image/pages/index/photos.png"><SPAN
						id="teachToolCount" style="margin: 0px 15px;">共0张</SPAN>
					<IMG style="width: 14px;" src="<%=path%>/image/pages/index/inq.png">
					<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;"
						  onclick="showPhotos(5);">查看相册 </SPAN>
					<IMG src="<%=path%>/image/pages/index/arrows1.png"></P></DIV>


			<DIV class="del-sch-view"><IMG id="trainSceneryImgFile" style="width: 450px; height: 253px;"
										   src="<%=path%>/image/pages/index/school1.jpg">
				<P class="img-title">培训实景相册</P>
				<P style="line-height: 40px; margin-left: 15px;"><IMG
						src="<%=path%>/image/pages/index/photos.png"><SPAN
						id="trainSceneryCount" style="margin: 0px 15px;">共0张</SPAN>
					<IMG style="width: 14px;" src="<%=path%>/image/pages/index/inq.png">
					<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;"
						  onclick="showPhotos(6);">查看相册 </SPAN>
					<IMG src="<%=path%>/image/pages/index/arrows1.png"></P></DIV>


			<DIV class="del-sch-view">
				<IMG id="schStyleImgFile" style="width: 450px; height: 253px;"
					 src="<%=path%>/image/pages/index/school1.jpg">
				<P class="img-title">校园风貌相册</P>
				<P style="line-height: 40px; margin-left: 15px;"><IMG
						src="<%=path%>/image/pages/index/photos.png">
					<SPAN id="schStyleCount" style="margin: 0px 15px;">共0张</SPAN>
					<IMG style="width: 14px;" src="<%=path%>/image/pages/index/inq.png">
					<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;" onclick="showPhotos(7);">查看相册 </SPAN>
					<IMG src="<%=path%>/image/pages/index/arrows1.png"></P></DIV>
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
						style="width: 20px; margin-right: 10px;" src="<%=path%>/image/pages/index/phone.png">联系方式
				</P>
				<P style="line-height: 40px; margin-left: 10px;">报名咨询电话：<SPAN id="schphone"
																			  style="color: rgb(90, 134, 205);">12580</SPAN>
				</P>
				<P style="line-height: 40px; margin-left: 10px;">投诉举报电话：<SPAN id="schcomphone"
																			  style="color: rgb(90, 134, 205);">12580</SPAN>
				</P>
				<P style="line-height: 40px; margin-left: 10px;">微信公众号： <SPAN id="pubnumber"></SPAN></P></DIV>
			<DIV style="margin-left: 400px; float: left;">
				<IMG id="pubnumfile"><IMG src="<%=path%>/image/pages/index/code2.jpg">
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
<script src="https://www.layuicdn.com/layui/layui.js"></script>
<script src="<%=path+"/js/pages/index/jquery.min.js"%>"></script>
<SCRIPT src="<%=path+"/js/pages/index/inquireSchDetails.js"%>"></SCRIPT>
<script src="<%=path+"/js/pages/index/City_data.js"%>"></script>
<script src="<%=path+"/js/pages/index/areadata.js"%>"></script>
<script src="<%=path+"/js/pages/index/auto_area.js"%>"></script>
<script src="<%=path+"/js/pages/index/common.js"%>"></script>
<script src="<%=path+"/js/pages/index/commonpage.js"%>"></script>

<script>
	layui.use(['laytpl', 'layer', 'flow'], function () {
		var laytpl = layui.laytpl
				, $ = layui.$
				, flow = layui.flow
			    , layer = layui.layer;


		function showStar() {
			let stars = $("p[class*='scoreStar']");

			for (let i = 0; i < stars.length; i++) {
				let score = $(stars[i]).attr("tip");
				let starWidth = score / 5 * 150;
				$(stars[i]).attr("style", "width:" + starWidth + "px;float:none;");
			}
		}

		showStar();

		let path = window.document.location.href.substring(0, (window.document.location.href).indexOf(window.document.location.pathname));


		function showStar() {
			let stars = $("p[class*='scoreStar']");

			for (let i = 0; i < stars.length; i++) {
				let score = $(stars[i]).attr("tip");
				let starWidth = score / 5 * 150;
				$(stars[i]).attr("style", "width:" + starWidth + "px;float:none;");
			}
		}

		showStar();

		//请求消息
		let renderMsg = function (page, callback) {
			$.get(path + "/api/evaluate/school/" + $("#schoolId").val(), {
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


		$('.layui-btn').on('click', function () {
			var othis = $(this), method = othis.data('method');
			active[method] ? active[method].call(this, othis) : '';
		});

		var active = {
			notice: function () {
				layer.open({
					type: 1
					,
					title: false
					,
					closeBtn: false
					,
					area: '300px;'
					,
					shade: 0.8
					,
					id: 'LAY_layuipro'
					,
					btn: ['立即报名', '残忍拒绝']
					,
					btnAlign: 'c'
					,
					moveType: 1
					,
					content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">欢迎报名宏鑫驾校！<br>姓名<br><input type="text" name="sName" id="sName" placeholder="请输入姓名" class="layui-input" ><br>身份证<br><input type="text" name="sSfz" id="sSfz" placeholder="请输入身份证" class="layui-input" > </div>'
					,
					yes: function (index, layero) {
						let sName = $("#sName").val();
						let schoolId = $("#schoolId").val();
						let sSfz = $("#sSfz").val();
						$.ajax({
							type: 'get',
							url: '/SchoolControl/insSfz',
							dataType: 'JSON',
							data: {
								sName: sName
								, sSfz: sSfz
								,schoolId:schoolId
							},
							success: function (remsg) {
								if (remsg.code == 1) {
									layer.msg(remsg.msg);
									layer.close(index);
								} else if (remsg.code == 2) {
									layer.msg(remsg.msg);
									layer.close(index);
								} else {
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


</BODY>
</HTML>




