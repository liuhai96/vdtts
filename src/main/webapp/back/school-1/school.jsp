<%--
  Created by IntelliJ IDEA.
  User: zhaohaiyang
  Date: 2020/5/8
  Time: 上午9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<HEAD><META content="IE=11.0000"
            http-equiv="X-UA-Compatible">

	<META charset="utf-8">
	<META name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<TITLE>驾培机构详情</TITLE>
	<LINK href="school_files/layui.css" rel="stylesheet" media="all">
	<LINK href="school_files/common.css" rel="stylesheet">
	<LINK href="http://47.96.140.98:20034/static/img/logo_favicon.ico"  rel="shortcut icon" type="image/x-icon">
	<SCRIPT type="text/javascript">
		var path = "http://47.96.140.98:20034";
	</SCRIPT>

	<SCRIPT>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?22f0ca35d25f96268f9512c85774f0dc";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</SCRIPT>
	<LINK href="school_files/inquire_tablelist.css" rel="stylesheet" type="text/css">
	<LINK href="school_files/starScore.css" rel="stylesheet" type="text/css">
	<LINK href="school_files/inquireSchDetails.css" rel="stylesheet" type="text/css">

	<SCRIPT src="school_files/maps.js" type="text/javascript"></SCRIPT>

	<SCRIPT>
		var sch ={"ability":"","address":"江西省南昌市新建区长堎工业园工业四路第八区块","branchnumber":0,"briefintroduct":"","business":"***","busiscope":"C1,C2","busistatus":"1","checktime":1563783658000,"checkuser":"ncygzj","classroom":28810.97,"coachnumber":32,"coacount":91,"contact":"***","createtime":1563777183000,"creditcode":"***","dayaddstucount":0,"dayendstucount":0,"dcode":"360122","describe":"","district":"360122","grasupvnum":1,"inscode":"3322210509142226","ischeck":0,"isvalid":1,"lat":0,"legal":"***","level":3,"licetime":1563206400000,"licnum":"***","lng":0,"name":"南昌南动驾驶员培训有限公司","notice":1,"ordnum":0,"organiz":"360109","organizName":"新建县公路运输管理所","organiztype":0,"phone":"18970044567","photo":0,"platnum":"A0032","position":"","postcode":"360109","pracoachnum":0,"praticefield":28810.97,"pubnumber":"","pubnumfile":"","safmngnum":1,"schphone":"","serprinum":"","service":"","shortname":"南动驾校","star":5.00,"stuCom":"","stuEva":"","taxregcer":"","thclassroom":80.0,"thcoachnum":0,"thumbnailid":0,"tracarnum":32,"updatetime":1563777183000,"vuecount":70,"yearaddstucount":1408,"yearendstucount":0};
		var fileList = [];
	</SCRIPT>

	<META name="GENERATOR" content="MSHTML 11.00.9600.19572"></HEAD>
<BODY style="background: rgb(250, 251, 253);">
<DIV class="top">
	<DIV class="top-box"><IMG class="top-logo" src="school_files/psp-logo.png">

		<DIV class="top-title">
			<P class="top-title-p1">机动车驾驶培训公共服务平台</P>
			<P class="top-title-p2">Timing training system for motor vehicle drivers</P></DIV>
		<DIV class="top-search">
		</DIV></DIV></DIV>
<DIV class="menu">
	<DIV class="menu-box">
		<UL class="menu-title" id="menu-title">
			<LI class="layui-this" id="menu-title-one"><IMG src="school_files/menu_home1.png">
				<A href="http://47.96.140.98:20034/">首页</A>             </LI>
			<LI id="menu-title-two"><IMG src="school_files/menu_publicity1.png">
				<A href="http://47.96.140.98:20034/publicity">公开公示</A>             </LI>
			<LI id="menu-title-three"><IMG src="school_files/menu_inquire1.png">
				<A href="http://47.96.140.98:20034/inquire">信息查询</A></LI>
			<LI id="menu-title-four"><IMG src="school_files/menu_list1.png">
				<A href="http://47.96.140.98:20034/industryList">行业榜单</A>             </LI>
			<LI id="menu-title-five"><IMG src="school_files/menu_service1.png">
				<A href="http://47.96.140.98:20034/service">服务导航</A>             </LI>
			<LI id="menu-title-six"><IMG src="school_files/menu_student1.png">
				<A href="http://47.96.140.98:20034/studentCoaInfo">学教专区</A>
			</LI>
			<LI id="menu-title-seven"><IMG src="school_files/menu_download1.png">
				<A href="http://47.96.140.98:20034/download">资料下载</A>
			</LI></UL></DIV></DIV>
<DIV id="share"><A title="返回顶部" id="totop">返回顶部</A>
	<A title="返回上一页" class="sina"onclick="history.go(-1);" href="javascript:viod(0)"></A>
	<A title="刷新" class="tencent" onclick="history.go(0);" href="javascript:viod(0)"></A></DIV>
<DIV class="main">
	<DIV class="del-1">
		<DIV class="del-lun">
			<DIV class="layui-carousel" id="schphotoBox">
				<DIV carousel-item="">
					<DIV id="schphoto">
					</DIV>
				</DIV>
			</DIV>
		</DIV>
		<DIV style="float: left">
			<IMG style="height: 300px; width: 700px;" src="../../static/layui/images/photo/06.png" >
		</DIV>
		<DIV class="del-schinf">
			<P class="del-p"><SPAN id="shortname"></SPAN><IMG src="../school-1/school_files/tower.png"></P>
			<DIV class="del-inf">
				<c:forEach items="${noticeList}" var="nc">
					<tr>
						<td title="${nc.NName}"><a
								onclick="publicNotice('notice',1,${nc.NId});"
								style="cursor: pointer;color: #8ea8d8;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 450px;display: block;text-align: left;">${nc.NName}</a>
						</td>
						<td>${nc.NTime}</td>
						<td></td>
					</tr>
				</c:forEach>
				<P><B>全国统一编号：</B><SPAN id="creditcode"></SPAN></P>
				<P><B>经营许可日期：</B><SPAN id="licetime"></SPAN>         </P>
				<P><SPAN><B>教练员：</B><SPAN id="coacount"></SPAN>人</SPAN>
					<SPAN style="margin-left: 75px;"><B>教练车：</B><SPAN id="vuecount"> </SPAN>辆</SPAN></P>
				<P><SPAN><B>年新增学员数：</B><SPAN id="yearaddstucount"></SPAN>人</SPAN></P>
				<P><IMG class="inf-p-loc" src="../school-1/school_files/location2.png"><B>地址：</B><SPAN id="address"></SPAN></P>
				<HR>

				<P><B style="float: left;">综合星级：</B><SPAN id="starImg"></SPAN>
					<SPAN class="del-inf-num"><SPAN id="star"></SPAN></SPAN></P>
				<DIV class="del-inf-but" style="width: 100%; float: left;">
					<DIV class="inf-but-box" id="evaDisplayList">
					</DIV></DIV>
				<P><B>评价总次数：</B><SPAN class="del-span-color" id="allEvaTol"></SPAN>次</P>
				<P><B>评价总人数：</B><SPAN class="del-span-color" id="evaStuNum"></SPAN>人</P>
			</DIV>
		</DIV>
	</DIV>
	<DIV class="table-list">
		<UL class="blist clearfix">
			<LI class="active">驾培机构简介</LI>
			<LI>驾培机构风采</LI>
			<LI>学员评价</LI>
			<LI>联系方式</LI></UL>
		<UL class="blsit-list blsit-list1">
			<LI class="del-lis1">
				<P class="p-title">驾培机构简介</P>
				<HR>

				<P class="p-cont">暂无简介!</P></LI>
			<LI class="del-lis2">
				<P class="p-title">驾培机构风采</P>
				<HR>

				<DIV class="del-sch-view"><IMG id="trainingImgFile" style="width: 450px; height: 253px;"
				                               src="school_files/view.jpg">
					<P class="img-title">训练场地相册</P>
					<P style="line-height: 40px; margin-left: 15px;"><IMG src="school_files/photos.png"><SPAN
							id="trainingCount" style="margin: 0px 15px;">共0张</SPAN>
						<IMG style="width: 14px;" src="school_files/inq.png">
						<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;" onclick="showPhotos(4);">查看相册 </SPAN>
						<IMG src="school_files/arrows1.png"> </P></DIV>

				<DIV class="del-sch-view"><IMG id="teachToolImgFile" style="width: 450px; height: 253px;"
				                               src="school_files/view.jpg">
					<P class="img-title">教具设施相册</P>
					<P style="line-height: 40px; margin-left: 15px;"><IMG src="school_files/photos.png"><SPAN
							id="teachToolCount" style="margin: 0px 15px;">共0张</SPAN>
						<IMG style="width: 14px;" src="school_files/inq.png">
						<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;" onclick="showPhotos(5);">查看相册 </SPAN>
						<IMG src="school_files/arrows1.png"> </P></DIV>


				<DIV class="del-sch-view"><IMG id="trainSceneryImgFile" style="width: 450px; height: 253px;"
				                               src="school_files/view.jpg">
					<P class="img-title">培训实景相册</P>
					<P style="line-height: 40px; margin-left: 15px;"><IMG src="school_files/photos.png"><SPAN
							id="trainSceneryCount" style="margin: 0px 15px;">共0张</SPAN>
						<IMG style="width: 14px;" src="school_files/inq.png">
						<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;"  onclick="showPhotos(6);">查看相册 </SPAN>
						<IMG src="school_files/arrows1.png"> </P></DIV>


				<DIV class="del-sch-view"><IMG id="schStyleImgFile" style="width: 450px; height: 253px;"  src="school_files/view.jpg">
					<P class="img-title">校园风貌相册</P>
					<P style="line-height: 40px; margin-left: 15px;"><IMG src="school_files/photos.png">
						<SPAN id="schStyleCount" style="margin: 0px 15px;">共0张</SPAN> <IMG style="width: 14px;" src="school_files/inq.png">
						<SPAN style="margin: 0px 10px; color: rgb(39, 68, 114); cursor: pointer;" onclick="showPhotos(7);">查看相册 </SPAN> <IMG src="school_files/arrows1.png"> </P></DIV></LI>

			<LI class="del-lis5">
				<P class="p-title">学员评价</P>
				<HR>

				<DIV style="background: rgb(249, 249, 249); margin: 0px 10px 10px; line-height: 35px;"><SPAN
						style="padding: 0px 10px; border-left-color: rgb(238, 238, 238); border-left-width: 1px; border-left-style: solid; cursor: pointer;"
						onclick="evaClick(1)">全部评价<SPAN id="allEva" style="color: red;"></SPAN></SPAN>
					<SPAN style="padding: 0px 10px; border-left-color: rgb(238, 238, 238); border-left-width: 1px; border-left-style: solid; cursor: pointer;"
					      onclick="evaClick(2)">好评<SPAN id="goodEva" style="color: red;"></SPAN></SPAN>
					<SPAN style="padding: 0px 10px; border-left-color: rgb(238, 238, 238); border-left-width: 1px; border-left-style: solid; cursor: pointer;"
					      onclick="evaClick(3)">中评<SPAN id="midEva" style="color: red;"></SPAN></SPAN>
					<SPAN style="padding: 0px 10px; border-right-color: rgb(238, 238, 238); border-left-color: rgb(238, 238, 238); border-right-width: 1px; border-left-width: 1px; border-right-style: solid; border-left-style: solid; cursor: pointer;"
					      onclick="evaClick(4)">差评<SPAN id="badEva" style="color: red;"></SPAN></SPAN>
					<SELECT id="evaSort" style="margin: 7px 10px 0px 0px; float: right;"
					        onclick="initEvaList(sch.inscode,1)"><OPTION value="1" selected="">日期排序</OPTION>								 <OPTION value="2">星级评价</OPTION>
					</SELECT>
				</DIV>
				<DIV id="evalMsg" style="overflow: hidden; margin-left: 10px;"><div class="" style="float: left;">
					<p style="line-height: 30px;">李四<span style="margin-left: 15px;">C1</span></p> </div>
					<div class="" style="float: left;margin-left: 20px;">
						<p> <span> </span><span id="evaTime" style="margin-left: 10px;">2017-09-28 17:34:44</span></p>
						<p id="evaContent" style="line-height: 40px;">感觉不错，报名了没过几天就上车实际操练了，具体教的怎么样，下次继续评价。</p>
						<p> <button style="padding: 5px;margin:10px 10px 10px 0;background: #e2eaf2;border-style:none;color: #274472;">校园坏境不错</button>
							<button style="padding: 5px;margin:10px 10px 10px 0;background: #e2eaf2;border-style:none;color: #274472;">校园坏境不错</button> </p></div>

					<hr />

					<div class="" style="float: left;">  <p style="line-height: 30px;">李四<span style="margin-left: 15px;">C1</span></p></div>
					<div class="" style="float: left;margin-left: 20px;">
						<p> <span style="margin-left: 10px;">2017-09-28 17:34:44</span> </p>
						<p style="line-height: 40px;">感觉不错，报名了没过 几天就上车实际操练了，具体教的怎么样，下次继续评价。</p>
						<p> <button style="padding: 5px;margin:10px 10px 10px 0;background: #e2eaf2;border-style:none;color: #274472;">校园坏境不错</button>
							<button style="padding: 5px;margin:10px 10px 10px 0;background: #e2eaf2;border-style:none;color: #274472;">校园坏境不错</button></p></div>

					<HR>
				</DIV>
				<!--  <DIV id="evalutionPage" style="float: right;"></DIV>-->
			</LI>
			<LI class="del-lis6">
				<DIV style="margin: 10px 0px 0px 10px; float: left;">
					<P style="color: rgb(90, 134, 205); padding-left: 10px; font-size: 18px;"><IMG
							style="width: 20px; margin-right: 10px;" src="school_files/phone.png">联系方式</P>
					<P style="line-height: 40px; margin-left: 10px;">报名咨询电话：<SPAN id="schphone"
					                                                              style="color: rgb(90, 134, 205);"></SPAN></P>
					<P style="line-height: 40px; margin-left: 10px;">投诉举报电话：<SPAN id="schcomphone"
					                                                              style="color: rgb(90, 134, 205);"></SPAN></P>
					<P style="line-height: 40px; margin-left: 10px;">微信公众号：  <SPAN
							id="pubnumber"></SPAN></P></DIV>
				<DIV style="margin-left: 400px; float: left;">
					<IMG id="pubnumfile" ><IMG src="school_files/code2.jpg">
				</DIV>
			</LI>
		</UL>
	</DIV>
</DIV>
<DIV class="footer-inf">
	<UL style="text-align: center; display: table;">
		<LI style="margin: 0px 60px 0px 0px;"><A href="javascript:void(0);">版权所有：江西省道路运输管理局</A>         </LI>
		<LI style="margin: 0px 60px 0px 0px;"><A href="javascript:void(0);">技术支持：国交信息股份有限公司</A>         </LI>
		<LI><A href="https://tongji.baidu.com/web/welcome/ico?s=22f0ca35d25f96268f9512c85774f0dc" target="_blank">网站统计</A></LI>
	</UL>
</DIV>
<SCRIPT src="school_files/jquery.min.js"></SCRIPT>

<SCRIPT src="school_files/City_data.js"></SCRIPT>

<SCRIPT src="school_files/areadata.js"></SCRIPT>

<SCRIPT src="school_files/auto_area.js"></SCRIPT>

<SCRIPT src="school_files/layui.js"></SCRIPT>

<SCRIPT src="school_files/common.js"></SCRIPT>

<SCRIPT src="school_files/commonpage.js"></SCRIPT>

<SCRIPT src="school_files/inquireSchDetails.js" type="text/javascript" charset="utf-8"></SCRIPT>
</BODY>
</HTML>



