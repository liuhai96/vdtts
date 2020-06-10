var refer = document.referrer, keyword = "", f = "", cururl = document.URL, regx_semcheck = /utm_source=/i,
    regx_bd = /^https?:\/\/m\.baidu\.com\/[\s\S]*/i, mh = refer.match(regx_bd);
null != mh && (keyword = "", f = "mbaidu");
regx_bd = /^https?:\/\/[^\/]+\.baidu\.com\/[\s\S]*word=([^&]+)/i;
mh = refer.match(regx_bd);
null != mh && (keyword = mh[1], f = "mbaidu");
regx_bd = /^https?:\/\/www\.baidu\.com\/[\s\S]*/i;
mh = refer.match(regx_bd);
null != mh && (keyword = "", f = "baidu");
regx_bd = /^https?:\/\/[^\/]+\.baidu\.com\/[\s\S]*wd=([^&]+)/i;
mh = refer.match(regx_bd);
null != mh && (keyword = mh[1], f = "baidu");
regx_bd = /^https?:\/\/[^\/]+\.so\.com\/[\s\S]*q=([^&]+)/i;
mh = refer.match(regx_bd);
null != mh && (keyword = mh[1], f = "360");
var regx_sm = /^https?:\/\/[^\/]+\.sm\.cn\/[\s\S]*q=([^&]+)/i, mh = refer.match(regx_sm);
null != mh && (keyword = mh[1], f = "sm");
var regx_sogou = /^https?:\/\/[^\/]+\.sogou\.com\/[\s\S]*query=([^&]+)/i, mh = refer.match(regx_sogou);
null != mh && (keyword = mh[1], f = "sogou");
regx_sogou = /^https?:\/\/[^\/]+\.sogou\.com\/[\s\S]*keyword=([^&]+)/i;
mh = refer.match(regx_sogou);
null != mh && (keyword = mh[1], f = "sogou");
var url = "https://2013.8684.com/data.php?f=" + encodeURIComponent(f) + "&q=" + encodeURIComponent(keyword) + "&u=" + encodeURIComponent(document.location.href) + "&r=" + encodeURIComponent(refer) + "&" + Math.random(),
    mh = cururl.match(regx_semcheck);
if (null == mh) {
    var t = new Image;
    t.src = url
}
;