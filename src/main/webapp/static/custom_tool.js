let number = /^[0-9]*$/;   //判断字符串是否为数字
let capital = /^[A-Z]+$/;  //判断是字符串大写字母
let lowercase = /^[a-z]+$/;  //判断是字符串小写字母

function AjaxTransfer(url,sendData,funY,fnuN,type,dataType) { //ajax封装方法
  if (funY == undefined) funY = function(msg){alert("返回数据为："+msg);}
  if (fnuN == undefined) fnuN = function(){alert("你的操作非法！\n或服务器正忙，请重试！");}
  if (type == undefined)type = "POST";
  if (dataType == undefined)dataType = "JSON";
  $.ajax( {
    type: type, url: url, data: sendData,
    dataType: dataType, success:funY, error:fnuN
  })
}
function HideOrShow(aLabel,isHide) {//隐藏与显示标签
    if (isHide) aLabel.attr("hidden","hidden");
    else aLabel.removeAttr("hidden");
}
function Skip(c) {//表单换页
    let page = $("#page");
    let count = page.val();
    if (c > 0) count++; else count--;
    page.attr("value",count);
    $("#skip").submit();
}
function skipPage(box) {
    location.href = $("#path").val()+box;
}
function isContain(beingMeasured,con) {
    if (con == undefined)con = "~`!@#$%^&*()_+-=/\\?><., :;\"'~！@#￥%……&*（）——+·-=：“；”？》《。，、";
    for (let i = 0;i < con.length;i++){
        for (let j = 0;j < beingMeasured.length;j++)
            if (beingMeasured.charAt(i) == con.charAt(j))return true;
    }
    return false;
}

function done(input, LengthBegin, LengthEnd) {//测试账号密码中仅为数字，字母组成
    var pattern = '^[0-9a-zA-Z]{' + LengthBegin+ ',' + LengthEnd+ '}$';
    var regex = new RegExp(pattern);
    if (input.match(regex)) {
        return true;
    } else {
        return false;
    }
}
// var one = "antzone@";//done方法样例
// var two = "softwhy.com888";
// var three = "蚂蚁部落softwhy";
// console.log(done(one, 0,20));
// console.log(done(two, 0, 10));
// console.log(done(three,0, 30));

function cutOut(str,begin,end) {//截取字符
    if (begin == undefined)begin = 0;
    if (end == undefined)str = str.length;
    let strs = "";
    for (let i = begin;i <end;i++) strs += str.charAt(i);
    return strs;
}

// function isCardNo(Idcardnumber) {
// // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
//     var id=$("#Idcardnumber").val();//var id=$("#Idcardnumber")是获取Input文本框对象， .val（）;是获取文本框里面的值
//     var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
//     if(reg.test(id) === false)
//     {
//         alert("身份证输入不合法");
//         return false;
//     }
// }