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
<%--<!doctype --%>
<html>
<head>
	<META charset="utf-8">
	<META name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<TITLE>驾培机构详情</TITLE>
	<LINK href="school_files/layui.css" rel="stylesheet" media="all">
	<LINK href="school_files/common.css" rel="stylesheet">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css" media="all">
	<script type="text/javascript" src="<%=path%>/static/layui/layui.js" ></script>
	</head>
<body>
<div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
	<button data-method="notice" class="layui-btn">学生报名</button>
</div>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	layui.use('layer', function(){ //独立版的layer无需执行这一句
		var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
		//触发事件
		var active = {
			notice: function(){
				//示范一个公告层
				layer.open({
					type: 1
					,title: false //不显示标题栏
					,closeBtn: false
					,area: '300px;'
					,shade: 0.8
					,id: 'LAY_layuipro' //设定一个id，防止重复弹出
					,btn: ['火速围观', '残忍拒绝']
					,btnAlign: 'c'
					,moveType: 1 //拖拽模式，0或者1
					,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
					,success: function(layero){
						var btn = layero.find('.layui-layer-btn');
						btn.find('.layui-layer-btn0').attr({
							href: 'http://www.layui.com/'
							,target: '_blank'
						});
					}
				});
			}
		};

		$('#layerDemo .layui-btn').on('click', function(){
			var othis = $(this), method = othis.data('method');
			active[method] ? active[method].call(this, othis) : '';
		});

	});
</script>

</body>
</html>




