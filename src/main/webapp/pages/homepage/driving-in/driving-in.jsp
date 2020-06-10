<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/10
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,user-scalable=no">
    <title>老司机驾考·企业版 入驻</title>
    <link href="driving-in_files/main.css" rel="stylesheet" type="text/css">
</head>
    <body>
    <input hidden="hidden" value="<%=path%>" id="path">
        <div class="jxb-cooperate-container" data-sp="1">
            <div class="jxb-cooperate">
                <div class="head" skip="true">
                    <div class="jxb-logo"></div>
                    <div class="nav">
                        <div class="tip">联系电话：xxxxx-xxxxxx QQ：xxxxxxxxx</div>
                        <span ref="nav" data-url="jkbd"><%=schoolName%></span>
                        <span ref="nav" data-url="jxdl">驾校登录</span>
                    </div>
                </div>
                <div class="cooperate-container"><h2 skip="true">欢迎入驻<%=schoolName%>-企业版</h2>
                    <div class="cooperate-form">
                        <div class="form">
                            <div class="err-tip"></div>
                            <div class="form-group radio-form">
                                <label skip="true">驾校图片<i>*</i></label>
                                <div class="user-type-conatiner">
                                    <div class="user-type active" ref="radioWrap" data-index="0" style="width: 60%">
                                        <i class="avatar" skip="true"></i>
                                        <b skip="true">宣传图片</b>
                                        <p skip="true">会展示到<%=schoolName%>中，入驻需认证，用于营销、招生、管理</p>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>驾校名称<i skip="true">*</i></label>
                                <input class="" type="text" name="" placeholder="请输入驾校所在的城市">
                            </div>
                            <div class="err-tip"></div>
                            <div class="form-group">
                                <label skip="true">所在城市<i>*</i></label>
                                <input class="" type="text" name="city" placeholder="请输入驾校所在的城市">
                            </div>
                            <div class="err-tip"></div>
                            <div class="form-group ">
                                <label skip="true">法人证号<i>*</i></label>
                                <input class="" type="text" name="jiaxiaoFullName" ref="input"
                                       placeholder="请填写法人身份证号" maxlength="40">
                            </div>
                            <div class="err-tip "></div>
                            <div class="form-group">
                                <label skip="true">法人姓名<i>*</i></label>
                                <input class="" type="text" name="userName" ref="input" placeholder="请输入管理员姓名" maxlength="20">
                            </div>
                            <div class="err-tip"></div>
                            <div class="form-group">
                                <label skip="true">招生电话<i>*</i>
                                </label><input class="" type="text" name="phone" ref="input" placeholder="招生电话" maxlength="11">
                            </div>
                            <div class="err-tip"></div>
                            <div class="form-group">
                                <label skip="true">验证码<i>*</i></label>
                                <input type="text" value="" placeholder="请输入验证码" class="input-val" style="height: 35px;width: 30%;">
                                <canvas id="canvas" class="layui-col-md4" style="height: 35px;background-color: #000000; margin: 0 0 0 10%;"></canvas>
<%--                                <input class=" sms-code" type="text" name="smsCode" ref="input" placeholder="请输入验证码">--%>
<%--                                <div class="form-btn " ref="send-smscode">获取验证码</div>--%>
                            </div>
                            <div class="err-tip"></div>
                            <div class="submit" skip="true"><span class="form-btn">提交</span></div>
                            <div class="protocol">
                                <div class="protocol-checkbox checked" ref="protocol-checkbox"></div>
                                <div skip="true">我已阅读并接受
                                    <a href="" target="_blank">《驾校用户使用协议》</a><%-- https://qiye.jiakaobaodian.com/xieyi1.html--%>
                                    和<a href="" target="_blank">《企业版隐私政策》</a><%--https://qiye.jiakaobaodian.com/xieyi2.html--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="copyright" skip="true"><span>Copyright ©xxxxxx信息技术有限公司 |<span class="beian"></span><a
                            style="color: #333" target="_blank"
                            href="">吓公安网备 xxxxxxxxx号</a>&nbsp;&nbsp;<a
                            style="color: #333" target="_blank"
                            href="">吓ICP备xxxxxxxxx号xxx</a></span>
                    </div>
                </div>
            </div>
        </div>
    <script>
        let genders = true;
        $(function(){
            let show_num = [];
            draw(show_num);
            $("#canvas").on('click',function(){
                draw(show_num);
            })
            $(".btn").on('click',function(){
                var val = $(".input-val").val().toLowerCase();
                var num = show_num.join("");
                if(val=='')alert('请输入验证码！');
                else {
                    if(val == num){
                        toRegister();
                    } else alert('验证码错误！请重新输入！');
                    $(".input-val").val('');
                    draw(show_num);
                }
            })
        })
        function draw(show_num) {
            var canvas_width=$('#canvas').width();
            var canvas_height=$('#canvas').height();
            var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
            var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
            canvas.width = canvas_width;
            canvas.height = canvas_height;
            var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
            var aCode = sCode.split(",");
            var aLength = aCode.length;//获取到数组的长度

            for (var i = 0; i <= 3; i++) {
                var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
                var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
                var txt = aCode[j];//得到随机的一个内容
                show_num[i] = txt.toLowerCase();
                var x = 10 + i * 35;//文字在canvas上的x坐标
                var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
                context.font = "bold 23px 微软雅黑";

                context.translate(x, y);
                context.rotate(deg);

                context.fillStyle = randomColor();
                context.fillText(txt, 0, 0);

                context.rotate(-deg);
                context.translate(-x, -y);
            }
            for (var i = 0; i <= 10; i++) { //验证码上显示线条
                context.strokeStyle = randomColor();
                context.beginPath();
                context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
                context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
                context.stroke();
            }
            for (var i = 0; i <= 50; i++) { //验证码上显示小点
                context.strokeStyle = randomColor();
                context.beginPath();
                var x = Math.random() * canvas_width;
                var y = Math.random() * canvas_height;
                context.moveTo(x, y);
                context.lineTo(x + 1, y + 1);
                context.stroke();
            }
        }
        function randomColor() {//得到随机的颜色值
            var r = Math.floor(Math.random() * 256);
            var g = Math.floor(Math.random() * 256);
            var b = Math.floor(Math.random() * 256);
            return "rgb(" + r + "," + g + "," + b + ")";
        }
        </script>
    </body>
</html>
