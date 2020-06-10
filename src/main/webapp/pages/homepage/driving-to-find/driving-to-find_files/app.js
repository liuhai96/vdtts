$(function () {

});

function openLogin(a) {//转登录方法
    skipPage("/pages/homepage/login.jsp");
    // yxl_mask("\u767b\u5f55", "url="+$("#path").val()+"/pages/homepage/login.jsp", "400", "500")
}

function openReg(a) {//注册方法
    skipPage("/pages/homepage/register.jsp");
    // yxl_mask("\u6ce8\u518c", "url=/login.php?reg=y&style=minWin", "400", "500")
}

function ExpStr(a) {
    var b = new Date;
    return b.setTime(b.getTime() + 1e3 * a), b.toGMTString()
}

function getCookieVal(a) {
    var b = document.cookie.indexOf(";", a);
    return -1 == b && (b = document.cookie.length), unescape(document.cookie.substring(a, b))
}

function getCookie(a) {
    for (var b = a + "=", c = b.length, d = document.cookie.length, e = 0; d > e;) {
        var f = e + c;
        if (document.cookie.substring(e, f) == b) return getCookieVal(f);
        if (e = document.cookie.indexOf(" ", e) + 1, 0 == e) break
    }
    return ""
}

function setCookie(a, b, c, d, e, f) {
    document.cookie = a + "=" + escape(b) + (c ? "; expires=" + ExpStr(c) : "") + (d ? "; path=" + d : "") + (e ? "; domain=" + e : "") + (f ? "; secure" : "")
}

function deleteCookie(a, b, c) {
    getCookie(a) && (document.cookie = a + "=" + (b ? "; path=" + b : "") + (c ? "; domain=" + c : "") + "; expires=Thu, 01-Jan-70 00:00:01 GMT")
}

function getLocalVal(a) {
    return window.localStorage.getItem(a)
}

function setLocal(a, b) {
    window.localStorage.setItem(a, b)
}

function delLocal(a) {
    window.localStorage.removeItem(a)
}

function getLocalData(a) {
    return window.localStorage ? window.localStorage.getItem(a) : getCookie(a)
}

function setLocalData(a, b, c, d, e, f) {
    window.localStorage ? window.localStorage.setItem(a, b) : setCookie(a, b, c, d, e, f)
}

function delLocalData(a, b, c) {
    window.localStorage ? window.localStorage.removeItem(a) : deleteCookie(a, b, c)
}

function $_() {
    for (var a = new Array, b = 0; b < arguments.length; b++) {
        var c = arguments[b];
        if ("string" == typeof c && (c = document.getElementById(c)), 1 == arguments.length) return c;
        a.push(c)
    }
    return a
}

function $__() {
    return document.getElementsByName(arguments[0])
}

function getURLHash() {
    var a = "", b = window.location.href.split("#");
    if (2 == b.length && (a = b[1], 0 == a.indexOf("url="))) {
        var c = a.indexOf("hash=");
        a = a.substr(c + 5)
    }
    return a
}

function RndNum() {
    var a = arguments.length, b = a > 0 ? arguments[0] : 1e3, c = a > 1 ? arguments[1] : 1e4;
    return 1 == a && (c = b, b = 0), b > c && (b = 1e3, c = 1e4), Math.round(Math.random() * (c - b) + b)
}

function str_format(a) {
    if (!a) return "";
    for (a = str_qcf(a), a = a.replace(/\,\,/g, ","); a.indexOf(",,") >= 0;) a = a.replace(/\,\,/g, ",");
    return a = a.replace(/\,\,/g, ","), "," == a.substr(0, 1) && (a = a.substring(1)), "," == a.substr(-1, 1) && (a = a.substring(0, a.length - 1)), a += "YXL.CN.YXL", a = a.replace(",,YXL.CN.YXL", ""), a = a.replace(",YXL.CN.YXL", ""), a = a.replace("YXL.CN.YXL", "")
}

function str_qcf(a) {
    if (!a) return "";
    for (var a = a.toLowerCase(), b = a.split(","), c = "YXL.CN", d = 0; d < b.length; d++) c.indexOf(b[d]) > 0 || (c = c + "," + b[d]);
    return c = c.replace("YXL.CN,", "") + ""
}

function Wink(a, b, c) {
    WinkI += 1, document.getElementById("" + a).innerHTML = 0 == WinkI % 2 ? b : "&nbsp;", setTimeout(function () {
        Wink(a, b, c)
    }, c)
}

function getWW() {
    WindowWidth = document.documentElement.clientWidth || ""
}

function DT() {
    var a = new Date, b = a.getFullYear(), c = a.getMonth() + 1;
    10 > c && (c = "0" + c);
    var d = a.getDate();
    10 > d && (d = "0" + d);
    var e = a.getHours();
    10 > e && (e = "0" + e);
    var f = a.getMinutes();
    10 > f && (f = "0" + f);
    var g = a.getSeconds();
    10 > g && (g = "0" + g);
    var h = b + "-" + c + "-" + d + " " + e + ":" + f + ":" + g;
    return h
}

function sortNumber(a, b) {
    return a - b
}

function openurl(a) {
    window.open(a)
}

function openwin(a, b, c, d) {
    try {
        b || (b = "winname" + RndNum() + "Y" + RndNum()), isNaN(c) && (c = ""), isNaN(d) && (d = "");
        var e = "", f = "", g = screen.availWidth, h = screen.availHeight;
        c || (c = Math.round(g - 100), e = 50), d || (d = Math.round(h - 100 - 60), f = 80), e || (e = Math.round(Math.round(g - c) / 2)), f || (f = Math.round(Math.round(h - d) / 2)), f = Math.round(f - 30);
        var i = "width=" + c + ",", j = "height=" + d + ",", k = "left=" + e + ",", l = "top=" + f + ",";
        window.open(a, b, i + j + k + l + "toolbar=no, menubar=no, scrollbars=auto,resizable=yes,location=no, status=no")
    } catch (m) {
    }
    return !1
}

function qujx(a) {
    try {
        "string" == typeof a && (a = "#" + a, a = a.replace("##", "#"), a = a.replace("#.", "."), a = $(a));
        var b = a.html();
        b = b.replace(/\u9a7e\u6821/g, ""), a.html(b)
    } catch (c) {
    }
}

function qujxlist() {
    var a = $(".listmain ul").children("li").length;
    for (l = 0; a >= l; l++) qujx($(".listmain ul li:nth-child(" + l + ") dl dd div"))
}

function floatJXNav() {
    var a = $(".CntNav").offset().top, b = b || 0;
    a = parseFloat(Math.abs(a + b));
    var c = parseFloat($(window).scrollTop());
    c > a ? $("#JiaXiaoNav").addClass("JiaXiaoNavFloat") : $("#JiaXiaoNav").removeClass("JiaXiaoNavFloat")
}

function rimgmiddle(a) {
    timgh = a.height(), a.css("margin-top", Math.round(Math.round(580 - timgh) / 2) + "px")
}

function imgMiddle(a) {
    var b = $(a);
    b.width();
    var d = b.height();
    b.attr("src");
    var f = 180, g = Math.round((f - d) / 2);
    b.css("margin-top", g + "px")
}

function vJXFC(a) {
    return a ? ($(".vJXFC").show(), void 0) : ($(".vJXFC").hide(), !1)
}

function vBMB(a, b, c, d, e, f) {
    return a ? ($(".vBMB").show(), c && $("#bmb_xCode").val(c), d && ($("#bmbJXN").html(d), b && $("#bmbJXN").html("<a href='" + b + "' target='_blank'>" + d + "</a>")), e && $("#bmb_kCode").val(e), f && $("#bmbKCN").html("<a href='/kc_" + e + "' target='_blank'>" + f + "</a>"), $("#bmbJXN").html() ? $("#bmb_jx").show() : $("#bmb_jx").hide(), $("#bmbKCN").html() ? $("#bmb_kc").show() : $("#bmb_kc").hide(), $("#bmb_nn").val() ? $("#bmb_cc").val() ? $("#bmb_ii").val() || $("#bmb_ii").focus() : $("#bmb_cc").focus() : $("#bmb_nn").focus(), void 0) : ($(".vBMB").hide(), !1)
}

function chkFormBMB() {
    var a = $("#bmb_nn").val();
    if (!a) return $("#bmb_tj span em").html("\u59d3\u540d\u4e0d\u80fd\u4e3a\u7a7a\u3002"), $("#bmb_nn").focus(), !1;
    var b = $("#bmb_cc").val();
    return b = b.replace(/ /g, ""), b = b.replace(/\u3000/g, ""), $("#bmb_cc").val(b), b ? b.substr(0, 2) < 13 || b.substr(0, 2) > 19 || 11 != b.length ? ($("#bmb_tj span em").html("\u8bf7\u7559\u4e0b\u60a8\u7684\u771f\u5b9e\u624b\u673a\u53f7\u3002"), $("#bmb_cc").focus(), !1) : ($("#bmb_tj span em").html(""), $("#bmb_Form").attr("action", "/add.php?m=bm"), !0) : ($("#bmb_tj span em").html("\u624b\u673a\u53f7\u4e0d\u80fd\u4e3a\u7a7a\u3002"), $("#bmb_cc").focus(), !1)
}

function vBMBkc(a, b) {
    vBMB("Y", "", "", "", a, b)
}

function JDKTop() {
    if (!($("#JDKck").length > 0)) return !1;
    var a = $("#JDKck").offset().top;
    xzval = 0, $("#JDKck").css("height", xzval + "px"), a = parseFloat(Math.abs(a + xzval));
    var b = parseFloat($(window).scrollTop());
    b > a ? $("#JDK").css("top", xzval + "px") : $("#JDK").css("top", parseFloat(a - b) + "px")
}

function backTopFun() {
    try {
        parseFloat($(window).scrollTop()) < 200 ? $(".backTop").fadeOut() : $(".backTop").fadeIn()
    } catch (a) {
    }
}

function scrollfun() {
    backTopFun(), JDKTop()
}

function resizefun() {
}

function yxl_mask_tip(a, b, c, d, e) {
    var a = a || "", b = b || 1e3;
    if (a) {
        $(".YXL_Mask_Tip").html("<p>" + a + "</p>");
        var c = c || "", d = d || "", e = e || "";
        e && ("{" == e.substring(0, 1) ? (e = jQuery.parseJSON(e), $(".YXL_Mask_Tip p").css(e)) : $(".YXL_Mask_Tip p").addClass(e)), c && !isNaN(c) && (twt = Math.round(0 - Math.round(c / 2)), $(".YXL_Mask_Tip p").css({
            width: c + "px",
            "margin-left": twt + "px"
        })), d && !isNaN(d) && (tht = Math.round(0 - Math.round(d / 2) - .07 * $(window).height()), Math.abs(tht) > Math.round($(window).height() / 2) && (tht = Math.round(0 - $(window).height() / 2)), $(".YXL_Mask_Tip p").css({
            height: d + "px",
            "margin-top": tht + "px"
        })), $(".YXL_Mask_Tip").fadeIn(200), setTimeout("yxl_mask_tip('');", b)
    } else setTimeout("$('.YXL_Mask_Tip').html('');", 300), $(".YXL_Mask_Tip").fadeOut(300)
}

function yxl_mask_tip_ok(a, b, c, d, e) {
    var a = a || "\u4fdd\u5b58\u6210\u529f\uff01";
    a = '<i class="fa fa-check-square-o" style="font-size:36px;display:block;font-weight:100;margin-bottom:7px;"></i>' + a;
    var e = e || '{"font-size":"19px","color":"#FFF","height":"66px"}';
    yxl_mask_tip(a, b, c, d, e)
}

function yxl_mask_tip_alert(a, b, c, d, e) {
    var a = a || "\u64cd\u4f5c\u5931\u8d25\uff01";
    a = '<i class="fa fa-warning" style="font-size:36px;display:block;font-weight:100;margin-bottom:7px;color:#FFCC00;"></i>' + a;
    var e = e || '{"font-size":"19px","color":"#FFCC00","height":"66px","background":"rgba(0, 0, 0, 0.7)"}';
    yxl_mask_tip(a, b, c, d, e)
}

function yxl_mask(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o) {
    yxl_mask_htmlcode && ($("body").append(yxl_mask_htmlcode), yxl_mask_htmlcode = ""), $(".YXL_Mask").attr("class", "YXL_Mask"), $(".YXL_MaskCnt").attr("class", "YXL_MaskCnt"), $(".YXL_MaskCnt").attr("style", ""), $(".YXL_MaskCnt dl").attr("class", "");
    var c = c || "500", d = d || "500", e = e || "";
    c && !isNaN(c) && (twt = Math.round(0 - Math.round(c / 2)), $(".YXL_MaskCnt").css({
        width: c + "px",
        "margin-left": twt + "px"
    })), d && !isNaN(d) && (tht = Math.round(0 - Math.round(d / 2) - .07 * $(window).height()), Math.abs(tht) > Math.round($(window).height() / 2) && (tht = Math.round(0 - $(window).height() / 2)), $(".YXL_MaskCnt").css({
        height: d + "px",
        "margin-top": tht + "px"
    })), e && ("{" == e.substring(0, 1) ? (e = jQuery.parseJSON(e), $(".YXL_MaskCnt").css(e)) : $(".YXL_MaskCnt").addClass(e));
    var a = a || "", b = b || "", f = f || "", g = g || "X";
    $(".YXL_MaskCnt p").html(a + "<i>" + g + "</i>"), b && (urlt = b.substring(0, 7), urlt = urlt.toLowerCase(), urltt = b.substring(0, 4), urltt = urltt.toLowerCase(), "url=" == urltt && (b = b.substring(4)), ("http://" == urlt || "https:/" == urlt || "url=" == urltt) && (b = '<iframe src="' + b + '" width="100%" height="100%" frameborder="0" scrolling="no"></iframe>'), $(".YXL_MaskCnt dl dd").html(b)), $(".YXL_MaskCnt p i").click(function () {
        yxl_mask_hide()
    }), $(".YXL_Mask").unbind(), f && $(".YXL_Mask").click(function () {
        yxl_mask_hide()
    }), $(".YXL_MaskCnt p").show(), $(".YXL_MaskCnt p i").show(), $(".YXL_MaskCnt dl").removeClass("ch"), "Y" == g && ($(".YXL_MaskCnt p i").hide(), a || ($(".YXL_MaskCnt p.tit").hide(), $(".YXL_MaskCnt dl").addClass("ch")));
    var p = "", h = h || "";
    h && (p = p + "<a class='mtA'>" + h + "</a>");
    var j = j || "";
    j && (p = p + "<a class='mtB'>" + j + "</a>");
    var l = l || "";
    l && (p = p + "<a class='mtC'>" + l + "</a>");
    var n = n || "";
    n && (p = p + "<a class='mtD'>" + n + "</a>");
    var q = q || "";
    q && (p = p + "<a class='mtE'>" + q + "</a>"), p ? ($(".YXL_MaskCnt dl dt").html(p), p = "", $(".YXL_MaskCnt dl").removeClass("h")) : ($(".YXL_MaskCnt dl dt").html(""), $(".YXL_MaskCnt dl").addClass("h")), $(".YXL_Mask").show(), $(".YXL_MaskCnt").show(), h && "function" == typeof i && ($(".YXL_MaskCnt dl dt a.mtA").unbind(), $(".YXL_MaskCnt dl dt a.mtA").click(i)), j && "function" == typeof k && ($(".YXL_MaskCnt dl dt a.mtB").unbind(), $(".YXL_MaskCnt dl dt a.mtB").click(k)), l && "function" == typeof m && ($(".YXL_MaskCnt dl dt a.mtC").unbind(), $(".YXL_MaskCnt dl dt a.mtC").click(m)), n && "function" == typeof o && ($(".YXL_MaskCnt dl dt a.mtD").unbind(), $(".YXL_MaskCnt dl dt a.mtD").click(o)), q && "function" == typeof btnEfun && ($(".YXL_MaskCnt dl dt a.mtE").unbind(), $(".YXL_MaskCnt dl dt a.mtE").click(btnEfun))
}

function yxl_mask_show() {
    $(".YXL_Mask").show(), $(".YXL_MaskCnt").show()
}

function yxl_mask_hide() {
    $(".YXL_Mask").hide(), $(".YXL_MaskCnt").hide()
}

function yxl_mask_gray(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o) {
    var e = e || "";
    yxl_mask(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o), $(".YXL_Mask").addClass("YXL_Mask_gray"), $(".YXL_MaskCnt").addClass("YXL_MaskCnt_gray"), a ? ($(".YXL_MaskCnt dl").removeClass("ch"), $(".YXL_MaskCnt p.tit").removeClass("titTop")) : ($(".YXL_MaskCnt dl").addClass("ch"), $(".YXL_MaskCnt p.tit").addClass("titTop"))
}

var WinkI = 0, WindowWidth = document.documentElement.clientWidth || "", itl = setInterval("getWW()", 500),
    yxl_mask_htmlcode = '<div class="YXL_Mask"></div><div class="YXL_MaskCnt"><p class="tit"></p><dl><dd></dd><dt></dt></dl></div>';


