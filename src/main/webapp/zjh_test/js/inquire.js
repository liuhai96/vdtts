var schurl=path+"/api/ggfwSchInfo/queryPageList";
var schtotalurl=path+"/api/ggfwSchInfo/queryByCount";
var coaInfoDetail = path + "/coaInfoDetail";
var schInfoDetail = path + "/schInfoDetail";
var schcount = 0;
var schparamData = {};
schparamData.rowsSize = 6;
schparamData.pageIndex = 1;
//初始化分页
$(function(){
    schcount = 0;
    schparamData = {};
    schparamData.rowsSize = 6;
    schparamData.pageIndex = 1;
    showBg();
//    initSchDistrict("province","city");
    var selectType = $("#selectType").val();
    if(selectType == 1){
        schcount = 0;
        schparamData = {};
        schparamData.rowsSize = 6;
        schparamData.pageIndex = 1;
        $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
        $("#busiscopeParent").children(".buttonbackground").removeClass('buttonbackground');
        $("#busiscopezero").addClass('buttonbackground');
        $("#levelParent").children(".buttonbackground").removeClass('buttonbackground');
        $("#levelzero").addClass('buttonbackground');
        $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
        initSchDistrict("province","city");
//        selectSchInfo(schparamData,schcount);
    }else if(selectType == 2){
        coacount = 0;
        coaparamData = {};
        coaparamData.rowsSize = 6;
        coaparamData.pageIndex = 1;
        $("#selectParent").children(".layui-this").removeClass('layui-this');
        $("#selectTwo").addClass('layui-this');
        $("#tab-item-parent").children(".layui-show").removeClass('layui-show');
        $("#tab-item-two").addClass('layui-show');
        $("#coaSexParent").children(".buttonbackground").removeClass('buttonbackground');
        $("#coaSexzero").addClass('buttonbackground');
        $("#dripermittedParent").children(".buttonbackground").removeClass('buttonbackground');
        $("#dripermittedzero").addClass('buttonbackground');
        $("#ageParent").children(".buttonbackground").removeClass('buttonbackground');
        $("#agezero").addClass('buttonbackground');
        $("#coaOrder").children(".buttonbackground").removeClass('buttonbackground');
        initSchDistrict("coaProvince","coaCity");
//        selectCoaInfo(coaparamData,coacount);
    }else if(selectType == 3){
        vehcount = 0;
        vehparamData = {};
        vehparamData.rowsSize = 6;
        vehparamData.pageIndex = 1;
        $("#selectParent").children(".layui-this").removeClass('layui-this');
        $("#selectThree").addClass('layui-this');
        $("#tab-item-parent").children(".layui-show").removeClass('layui-show');
        $("#tab-item-three").addClass('layui-show');
        $("#perdritypeParent").children(".buttonbackground").removeClass('buttonbackground');
        $("#perdritypezero").addClass('buttonbackground');
//        selectVueInfo(vehparamData,vehcount);
        initSchDistrict("vehProvince","vehCity");

    }else{
        selectSchInfo(schparamData,schcount);
    }
});
var districtUrl = path+"/api/ggfwdistrict/selectDistrictList";
//初始化省市
function initSchDistrict(province,city) {
    var disparamData = {};
    var p = $.post(districtUrl, disparamData, function (json) {
        if (json.errorcode == 0) {
            var html = "";
            var supId = "";
            var datas = json.data;
            for (var i in datas) {
                var d = datas[i];
                html += "<option value='"+d.id+"' >"+d.name+"</option>";
                supId = d.id;
            }
            $("#"+province).html(html);
            disparamData.supId = supId;
            $.post(districtUrl, disparamData, function (json) {
                if (json.errorcode == 0) {
                    var cityhtml = "<option value='' selected>地市级</option>";
                    var datas = json.data;
                    var d ='';
                    for (var i in datas) {
                         d = datas[i];
                        if(d.config == "1"){
                            cityhtml = "";
                            cityhtml += "<option value='"+d.id+"' selected >"+d.name+"</option>";
                            if(province == "province"){
                        	selectSchCity(d.id);
                            }else if(province == "coaProvince"){
                        	selectCoaCity(d.id);                      	
                            }else if(province == "vehProvince"){
                        	selectVehCity(d.id);
//                        	$("#vehSch").html("<option value='' selected>驾培机构</option>");
                            }
                            
                        }else{
                            cityhtml += "<option value='"+d.id+"' >"+d.name+"</option>";
                        }
                    }
                    $("#"+city).html(cityhtml);
                    if(d.config != "1"){
                        if(province == "province"){
                    	selectSchInfo(schparamData,schcount);
                        }else if(province == "coaProvince"){
                    	selectCoaInfo(coaparamData,coacount);
                        }else if(province == "vehProvince"){
                    	selectVueInfo(vehparamData,vehcount);
                        }
                    }
                }
            }, "json");
        }
    }, "json");
    p.success(function () {
    });
    p.error(function () {
    })
}
//选择地市
function selectSchCity(supId) {
    schparamData.pageIndex = 1;
    var disparamData = {};
    disparamData.supId = supId;
    $.post(districtUrl, disparamData, function (json) {
        if (json.errorcode == 0) {
            var countyhtml = "<option value='' selected>区县级</option>";
            var datas = json.data;
            for (var i in datas) {
                var d = datas[i];
                countyhtml += "<option value='"+d.id+"' >"+d.name+"</option>";
            }
            $("#county").html(countyhtml);
        }
    }, "json");
    schparamData.district = supId;
    selectSchInfo(schparamData,schcount);
}
//选择区县
function selectSchCounty(district) {
    if(district == ''){
	return;
    }
    schparamData.pageIndex = 1;
    schparamData.district = district;
    selectSchInfo(schparamData,schcount);
}
//查询培训机构
function selectSchInfo(schparamData,schcount) {
    var addHtml = function(json){
        var html = "";
        var datas = json.data.records;
        for (var i in datas) {
            var d = datas[i];
            if(d.level == 1){
                d.level = "一级";
            }else if(d.level == 2){
                d.level = "二级";
            }else if(d.level == 3){
                d.level = "三级";
            }
            var addressTitle = d.address;
            if(d.address.length > 16){
                d.address = d.address.substring(0,16)+"……";
            }
            var busiscopeTitle = d.busiscope;
            if(d.busiscope.length > 8){
                d.busiscope = d.busiscope.substring(0,8)+"……";
            }
            var shortnameTitle = d.shortname;
            if(d.shortname.length > 13){
                d.shortname = d.shortname.substring(0,13)+"……";
            }
            var www = d.star*2*15;
            var inscode = d.inscode.toString();
            html += "<li class='list-school'>"+
                "<a href='"+schInfoDetail+"?inscode="+inscode+"'><img src='"+path+"/static/img/sch6.jpg'/></a>"+
                "<div class='inf-school'>"+
                "<a href='"+schInfoDetail+"?inscode="+inscode+"'><p class='word-1' title='"+shortnameTitle+"'>"+d.shortname+"</p></a>"+
                "<p style='float: left;'>综合星级："+
                "<div class='atar_Show'  style='display:inline;'><p tip='"+d.star+"' style='width: "+www+"px;float: none;'></p></div>"+
                "<span>"+d.star+"分</span>";
            html += "</p>"+
                "<p><span>分类等级："+d.level+"</span><span style='margin-left: 45px;' title='"+busiscopeTitle+"'>经营范围："+d.busiscope+"</span></p>"+
                "<p><span>教练员数："+d.coacount+"人</span><span style='margin-left: 35px;'>教练车数："+d.vuecount+"台</span></p>"+
                "<p><span>年新增学员数："+d.yearaddstucount+"人</span><span style='margin-left: 5px;'>年结业学员数："+d.yearendstucount+"人</span></p>"+
                "<p title='"+addressTitle+"'>地址："+d.address+"</p>"+
                "</div></li>";
        }
        return html;
    }
    var selectName = $("#selectName").val();
    var selectType = $("#selectType").val();
    if(selectType == 1){
        schparamData.name = selectName;
    }
    $(document).PageBar('schoolList',schparamData,schurl,addHtml);
    queryPage();

    var p = $.post(schtotalurl, schparamData, function (json) {
        if (json.errorcode == 0) {
            schcount = json.data;
            $("#schNum").html(schcount);
            layui.use(['laypage', 'layer'], function(){
                var laypage = layui.laypage
                    ,layer = layui.layer;

                //总页数低于页码总数
                laypage.render({
                    elem: 'demo0'
                    ,count: schcount //数据总数
                    ,limit:schparamData.rowsSize //每页条数
                    ,jump: function(obj, first){
                        //首次不执行
                        if(!first){
                            schparamData.pageIndex = obj.curr;
                            $(document).PageBar('schoolList',schparamData,schurl,addHtml);
                            queryPage();
                        }
                    }
                });
            });
        }
    }, "json");
    p.success(function () {
    });
    p.error(function () {
        layer.alert('加载数据失败请重试!!');
    })
}
//页面点击驾培机构tab跳转
function selectSchInfoJump() {
    schparamData.pageIndex = 1;
    schcount = 0;
    schparamData = {};
    schparamData.rowsSize = 6;
    schparamData.pageIndex = 1;
    $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#busiscopeParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#busiscopezero").addClass('buttonbackground');
    $("#levelParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#levelzero").addClass('buttonbackground');
    $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
    let countyhtml = "<option value='' selected>区县级</option>";
    $("#county").html(countyhtml);
    initSchDistrict("province","city");
//    selectSchInfo(schparamData,schcount);
}
//点击分类等级查询培训机构
function level(level,id) {
    schparamData.pageIndex = 1;
    $("#levelParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#"+id).addClass('buttonbackground');
    schparamData.level=level;
    selectSchInfo(schparamData,schcount);
}
//点击经营范围查询培训机构
function busiscope(busiscope,id) {
    schparamData.pageIndex = 1;
    $("#busiscopeParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#"+id).addClass('buttonbackground');
    schparamData.busiscope=busiscope;
    selectSchInfo(schparamData,schcount);
}
//根据综合星级排序
var schStarOrder = null;
function schStarOrderClick() {
    schparamData.pageIndex = 1;
    schparamData.orderFeild = "starOrder";
    if(schStarOrder == null){
        schStarOrder = "asc";
        $("#schStarOrder").html("综合星级<img src='"+path+"/static/img/sort3.png' />");
    }else if(schStarOrder == "asc"){
        schStarOrder = "desc";
        $("#schStarOrder").html("综合星级<img src='"+path+"/static/img/sort2.png' />");
    }else if(schStarOrder == "desc"){
        schStarOrder = "asc";
        $("#schStarOrder").html("综合星级<img src='"+path+"/static/img/sort3.png' />");
    }
    $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#schStarOrder").addClass('buttonbackground');
    schparamData.starOrder = schStarOrder;
    selectSchInfo(schparamData,schcount);
}
//根据分类等级排序
var levelOrder = null;
function levelOrderClick() {
    schparamData.pageIndex = 1;
    schparamData.orderFeild = "levelOrder";
    if(levelOrder == null){
        levelOrder = "asc";
        $("#levelOrder").html("分类等级<img src='"+path+"/static/img/sort3.png' />");
    }else if(levelOrder == "asc"){
        levelOrder = "desc";
        $("#levelOrder").html("分类等级<img src='"+path+"/static/img/sort2.png' />");
    }else if(levelOrder == "desc"){
        levelOrder = "asc";
        $("#levelOrder").html("分类等级<img src='"+path+"/static/img/sort3.png' />");
    }
    $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#levelOrder").addClass('buttonbackground');
    schparamData.levelOrder = levelOrder;
    selectSchInfo(schparamData,schcount);
}
//根据教练员数排序
var coacountOrder = null;
function coacountOrderClick() {
    schparamData.pageIndex = 1;
    schparamData.orderFeild = "coacountOrder";
    if(coacountOrder == null){
        coacountOrder = "asc";
        $("#coacountOrder").html("教练员数<img src='"+path+"/static/img/sort3.png' />");
    }else if(coacountOrder == "asc"){
        coacountOrder = "desc";
        $("#coacountOrder").html("教练员数<img src='"+path+"/static/img/sort2.png' />");
    }else if(coacountOrder == "desc"){
        coacountOrder = "asc";
        $("#coacountOrder").html("教练员数<img src='"+path+"/static/img/sort3.png' />");
    }
    $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#coacountOrder").addClass('buttonbackground');
    schparamData.coacountOrder = coacountOrder;
    selectSchInfo(schparamData,schcount);
}
//根据教练车数排序
var vuecountOrder = null;
function vuecountOrderClick() {
    schparamData.pageIndex = 1;
    schparamData.orderFeild = "vuecountOrder";
    if(vuecountOrder == null){
        vuecountOrder = "asc";
        $("#vuecountOrder").html("教练车数<img src='"+path+"/static/img/sort3.png' />");
    }else if(vuecountOrder == "asc"){
        vuecountOrder = "desc";
        $("#vuecountOrder").html("教练车数<img src='"+path+"/static/img/sort2.png' />");
    }else if(vuecountOrder == "desc"){
        vuecountOrder = "asc";
        $("#vuecountOrder").html("教练车数<img src='"+path+"/static/img/sort3.png' />");
    }
    $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#vuecountOrder").addClass('buttonbackground');
    schparamData.vuecountOrder = vuecountOrder;
    selectSchInfo(schparamData,schcount);
}
//根据年新增学员数排序
var yearaddstucountOrder = null;
function yearaddstucountOrderClick() {
    schparamData.pageIndex = 1;
    schparamData.orderFeild = "yearaddstucountOrder";
    if(yearaddstucountOrder == null){
        yearaddstucountOrder = "asc";
        $("#yearaddstucountOrder").html("年新增学员数<img src='"+path+"/static/img/sort3.png' />");
    }else if(yearaddstucountOrder == "asc"){
        yearaddstucountOrder = "desc";
        $("#yearaddstucountOrder").html("年新增学员数<img src='"+path+"/static/img/sort2.png' />");
    }else if(yearaddstucountOrder == "desc"){
        yearaddstucountOrder = "asc";
        $("#yearaddstucountOrder").html("年新增学员数<img src='"+path+"/static/img/sort3.png' />");
    }
    $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#yearaddstucountOrder").addClass('buttonbackground');
    schparamData.yearaddstucountOrder = yearaddstucountOrder;
    selectSchInfo(schparamData,schcount);
}
//根据年结业学员数排序
var yearendstucountOrder = null;
function yearendstucountOrderClick() {
    schparamData.pageIndex = 1;
    schparamData.orderFeild = "yearendstucountOrder";
    if(yearendstucountOrder == null){
        yearendstucountOrder = "asc";
        $("#yearendstucountOrder").html("年结业学员数<img src='"+path+"/static/img/sort3.png' />");
    }else if(yearendstucountOrder == "asc"){
        yearendstucountOrder = "desc";
        $("#yearendstucountOrder").html("年结业学员数<img src='"+path+"/static/img/sort2.png' />");
    }else if(yearendstucountOrder == "desc"){
        yearendstucountOrder = "asc";
        $("#yearendstucountOrder").html("年结业学员数<img src='"+path+"/static/img/sort3.png' />");
    }
    $("#schOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#yearendstucountOrder").addClass('buttonbackground');
    schparamData.yearendstucountOrder = yearendstucountOrder;
    selectSchInfo(schparamData,schcount);
}

var coaurl=path+"/api/ggfwCoaInfo/queryPageList";
var coatotalurl=path+"/api/ggfwCoaInfo/queryByCount";
var coacount = 0;
var coaparamData = {};
coaparamData.rowsSize = 6;
coaparamData.pageIndex = 1;
//页面点击教练员tab跳转
function selectCoaInfoJump() {
    coaparamData.pageIndex = 1;
    coacount = 0;
    coaparamData = {};
    coaparamData.rowsSize = 6;
    coaparamData.pageIndex = 1;
    $("#coaSexParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#coaSexzero").addClass('buttonbackground');
    $("#dripermittedParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#dripermittedzero").addClass('buttonbackground');
    $("#ageParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#agezero").addClass('buttonbackground');
    $("#coaOrder").children(".buttonbackground").removeClass('buttonbackground');
    let countyhtml = "<option value='' selected>区县级</option>";
    $("#coaCounty").html(countyhtml);
    let coaSch = "<option value='' selected>驾培机构</option>";
    $("#coaSch").html(coaSch);
    initSchDistrict("coaProvince","coaCity");
//    selectCoaInfo(coaparamData,coacount);
}
//查询教练员
function selectCoaInfo(coaparamData,coacount) {
    var addHtml = function(json){
        var html = "";
        var datas = json.data.records;
        for (var i in datas) {
            var d = datas[i];
            if(d.sex == 1){
                d.sex = "男";
            }else if(d.sex == 2){
                d.sex = "女";
            }
            var inscodeNameTitle = d.inscodeName;
            if(d.inscodeName.length > 12){
                d.inscodeName = d.inscodeName.substring(0,12)+"……";
            }

            if(d.star == ''||d.star == undefined){
                d.star = 0;
            }
            if(d.yearteachcount == '' || d.yearteachcount == undefined){
                d.yearteachcount = 0;
            }

            var www = d.star*2*15;
            var coachnum ="'" +(d.coachnum).toString()+"'";
            html += "<li class='list-student'>"+
                "<a href = '"+coaInfoDetail+"?coachnum="+d.coachnum+"'><img width='142px;' height='191px;' src='"+d.photourl+"'/></a>"+
                "<div class='inf-student'>"+
                "<a href = '"+coaInfoDetail+"?coachnum="+d.coachnum+"'><p class='word-1'>"+d.name+"</p> </a>"+
                "<p style='float: left;'>综合星级："+
                "<div class='atar_Show'  style='display:inline;'><p tip='"+d.star+"' style='width: "+www+"px;float: none;'></p></div>"+
                "<span>"+d.star+"分</span>";
            html += "</p>"+
                "<p><span>性别："+d.sex+"</span><span style='margin-left: 45px;'>年龄："+d.age+"岁</span></p>"+
                "<p><span>准教车型："+d.teachpermitted+"</span><span style='margin-left: 35px;'>年带教学员数："+d.yearteachcount+"人</span></p>"+
                "<p title='"+inscodeNameTitle+"'>所属驾培机构："+d.inscodeName+"</p>"+
                "</div></li>";
        }
        return html;
    }
    var selectName = $("#selectName").val();
    var selectType = $("#selectType").val();
    isChangeCity(coaparamData);
    if(selectType == 2){
        coaparamData.name = selectName;
    }

    $(document).PageBar('studentList',coaparamData,coaurl,addHtml);
    queryPage();

    var p = $.post(coatotalurl, coaparamData, function (json) {
        if (json.errorcode == 0) {
            coacount = json.data;
            $("#coaNum").html(coacount);
            layui.use(['laypage', 'layer'], function(){
                var laypage = layui.laypage
                    ,layer = layui.layer;
                laypage.render({
                    elem: 'demo123'
                    ,count: coacount //数据总数
                    ,limit:coaparamData.rowsSize //每页条数
                    ,jump: function(obj, first){
                        //首次不执行
                        if(!first){
                            coaparamData.pageIndex = obj.curr;
                            $(document).PageBar('studentList',coaparamData,coaurl,addHtml);
                            queryPage();
                        }
                    }
                });
            });
        }
    }, "json");
    p.success(function () {
    });
    p.error(function () {
        layer.alert('加载数据失败请重试!!');
    })
}

//判断是否选中地市，区县，驾培机构
function isChangeCity(coaparamData){
    let coaCity = $("#coaCity").val();
    let coaCounty = $("#coaCounty").val();
    let coaSch = $("#coaSch").val();
    if(coaCity !=null&&coaCity.length > 0){
        coaparamData.district = coaCity;
    }else{
        delete coaparamData.district;
    }
    if(coaCounty != null&&coaCounty.length > 0){
        coaparamData.childDistrict = coaCounty;
    }else{
        delete coaparamData.childDistrict;
    }

    if(coaSch != null&&coaSch.length > 0){
        coaparamData.inscode = coaSch;
    }else{
        delete coaparamData.inscode;
    }
    return coaparamData;
}
// 对象复制
function cloneObjectFn (obj){
    return JSON.parse(JSON.stringify(obj))
}

//选择地市
function selectCoaCity(supId) {

    var disparamData = cloneObjectFn(coaparamData);
    disparamData.supId = supId;
    var countyhtml = "<option value='' selected>区县级</option>";
    $("#coaCounty").html(countyhtml);
    $("#coaSch").html("<option value='' selected>驾培机构</option>");
    $.post(districtUrl, disparamData, function (json) {
        if (json.errorcode == 0) {
            var countyhtml = "<option value='' selected>区县级</option>";
            var datas = json.data;
            for (var i in datas) {
                var d = datas[i];
                countyhtml += "<option value='"+d.id+"' >"+d.name+"</option>";
            }
            $("#coaSch").html("<option value='' selected>驾培机构</option>");
            $("#coaCounty").html(countyhtml);
        }
    }, "json");
    disparamData.pageIndex = 1;
    disparamData.rowsSize = 6;
    disparamData.district = supId;
    selectCoaInfo(disparamData,coacount);
}
//选择区县
function selectCoaCounty(district) {
    var sccparamData = {};
    $("#coaSch").html("<option value='' selected>驾培机构</option>");
    if(district == ""){
	    return;
    }
    sccparamData.district = district;
    $.post(schurl, sccparamData, function (json) {
        if (json.errorcode == 0) {
            var schhtml = "<option value='' selected>驾培机构</option>";
            var datas = json.data.records;
            for (var i in datas) {
                var d = datas[i];
                schhtml += "<option value='"+d.inscode+"' >"+d.name+"</option>";
            }
            $("#coaSch").html(schhtml);
        }
    }, "json");
    let disparamData = cloneObjectFn(coaparamData);
    disparamData.pageIndex = 1;
    disparamData.rowsSize = 6;
    disparamData.childDistrict = district;
    selectCoaInfo(disparamData,coacount);
    
}
//选择驾培机构
function selectCoaSch(inscode) {
    if(inscode == ""){
    	return;
    }
    let schInscodeData = cloneObjectFn(coaparamData);
    schInscodeData.pageIndex = 1;
    schInscodeData.inscode = inscode;
    selectCoaInfo(schInscodeData,coacount);
}
//点击性别查询教练员
function coaSexClick(sex,id) {
    coaparamData.pageIndex = 1;
    $("#coaSexParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#"+id).addClass('buttonbackground');
    coaparamData.sex=sex;
    selectCoaInfo(coaparamData,coacount);
}
//点击准教车型查询教练员
function teachpermitted(teachpermitted,id) {
    coaparamData.pageIndex = 1;
    $("#dripermittedParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#"+id).addClass('buttonbackground');
    coaparamData.teachpermitted=teachpermitted;
    selectCoaInfo(coaparamData,coacount);
}
//点击年龄范围查询教练员
function ageClick(ageScope,id) {
    coaparamData.pageIndex = 1;
    $("#ageParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#"+id).addClass('buttonbackground');
    coaparamData.ageScope=ageScope;
    selectCoaInfo(coaparamData,coacount);
}
//根据综合星级排序
var coaStarOrder = null;
function coaStarOrderClick() {
    coaparamData.pageIndex = 1;
    coaparamData.orderFeild = "starOrder";
    if(coaStarOrder == null){
        coaStarOrder = "asc";
        $("#coaStarOrder").html("综合星级<img src='"+path+"/static/img/sort3.png' />");
    }else if(coaStarOrder == "asc"){
        coaStarOrder = "desc";
        $("#coaStarOrder").html("综合星级<img src='"+path+"/static/img/sort2.png' />");
    }else if(coaStarOrder == "desc"){
        coaStarOrder = "asc";
        $("#coaStarOrder").html("综合星级<img src='"+path+"/static/img/sort3.png' />");
    }
    $("#coaOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#coaStarOrder").addClass('buttonbackground');
    coaparamData.starOrder = coaStarOrder;
    selectCoaInfo(coaparamData,coacount);
}
//根据年龄排序
var ageOrder = null;
function ageOrderClick() {
    coaparamData.pageIndex = 1;
    coaparamData.orderFeild = "ageOrder";
    if(ageOrder == null){
        ageOrder = "asc";
        $("#ageOrder").html("年龄<img src='"+path+"/static/img/sort3.png' />");
    }else if(ageOrder == "asc"){
        ageOrder = "desc";
        $("#ageOrder").html("年龄<img src='"+path+"/static/img/sort2.png' />");
    }else if(ageOrder == "desc"){
        ageOrder = "asc";
        $("#ageOrder").html("年龄<img src='"+path+"/static/img/sort3.png' />");
    }
    $("#coaOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#ageOrder").addClass('buttonbackground');
    coaparamData.ageOrder = ageOrder;
    selectCoaInfo(coaparamData,coacount);
}
//根据年带教学员数排序
var yearteachcountOrder = null;
function yearteachcountOrderClick() {
    coaparamData.pageIndex = 1;
    coaparamData.orderFeild = "yearteachcountOrder";
    if(yearteachcountOrder == null){
        yearteachcountOrder = "asc";
        $("#yearteachcountOrder").html("年带教学员数<img src='"+path+"/static/img/sort3.png' />");
    }else if(yearteachcountOrder == "asc"){
        yearteachcountOrder = "desc";
        $("#yearteachcountOrder").html("年带教学员数<img src='"+path+"/static/img/sort2.png' />");
    }else if(yearteachcountOrder == "desc"){
        yearteachcountOrder = "asc";
        $("#yearteachcountOrder").html("年带教学员数<img src='"+path+"/static/img/sort3.png' />");
    }
    $("#coaOrder").children(".buttonbackground").removeClass('buttonbackground');
    $("#yearteachcountOrder").addClass('buttonbackground');
    coaparamData.yearteachcountOrder = yearteachcountOrder;
    selectCoaInfo(coaparamData,coacount);
}

var vehurl=path+"/api/ggfwVehInfo/queryPageList";
var vehtotalurl=path+"/api/ggfwVehInfo/queryByCount";
var vehcount = 0;
var vehparamData = {};
vehparamData.rowsSize = 6;
vehparamData.pageIndex = 1;
//页面点击教练员tab跳转
function selectVueInfoJump() {
    vehparamData.pageIndex = 1;
    vehcount = 0;
    vehparamData = {};
    vehparamData.rowsSize = 6;
    vehparamData.pageIndex = 1;
    $("#perdritypeParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#perdritypezero").addClass('buttonbackground');
    let countyhtml = "<option value='' selected>区县级</option>";
    $("#vehCounty").html(countyhtml);
    let coaSch = "<option value='' selected>驾培机构</option>";
    $("#vehSch").html(coaSch);
    initSchDistrict("vehProvince","vehCity");
}

function isChangeVehData(vehparamData){
    let vehCity = $("#vehCity").val();
    let vehCounty = $("#vehCounty").val();
    let vehSch = $("#vehSch").val();
    if(vehCity !=null&&vehCity.length > 0){
        vehparamData.district = vehCity;
    }else{
        delete vehparamData.district;
    }
    if(vehCounty != null&&vehCounty.length > 0){
        vehparamData.childDistrict = vehCounty;
    }else{
        delete vehparamData.childDistrict;
    }

    if(vehSch != null&&vehSch.length > 0){
        vehparamData.inscode = vehSch;
    }else{
        delete vehparamData.inscode;
    }
    return vehparamData;
}

//查询教练车
function selectVueInfo(vehparamData,vehcount) {
    var addHtml = function(json){
        var html = "";
        var datas = json.data.records;
        for (var i in datas) {
            var d = datas[i];
            var inscodeNameTitle = d.inscodeName;
            if(d.inscodeName.length > 12){
                d.inscodeName = d.inscodeName.substring(0,12)+"……";
            }
            html += "<li class='list-school'>"+
                "<img src='"+d.photourl+"' style='width:295px;'/>"+
                "<div class='inf-school'>"+
                "<p class='word-1'>"+d.licnum+"</p>"+
                "<p>培训车型："+d.perdritype+"</p>"+
                "<p title='"+inscodeNameTitle+"'>所属驾培机构："+d.inscodeName+"</p>"+
                "</div></li>";
        }
        return html;
    }
    var selectName = $("#selectName").val();
    var selectType = $("#selectType").val();
    isChangeVehData(vehparamData);
    if(selectType == 3){
        vehparamData.licnum = selectName;
    }
    $(document).PageBar('vehList',vehparamData,vehurl,addHtml);
    queryPage();

    var p = $.post(vehtotalurl, vehparamData, function (json) {
        if (json.errorcode == 0) {
            vehcount = json.data;
            $("#vehNum").html(vehcount);
            layui.use(['laypage', 'layer'], function(){
                var laypage = layui.laypage
                    ,layer = layui.layer;
                laypage.render({
                    elem: 'demo456'
                    ,count: vehcount //数据总数
                    ,limit:vehparamData.rowsSize //每页条数
                    ,jump: function(obj, first){
                        //首次不执行
                        if(!first){
                            vehparamData.pageIndex = obj.curr;
                            $(document).PageBar('vehList',vehparamData,vehurl,addHtml);
                            queryPage();
                        }
                    }
                });
            });
        }
    }, "json");
    p.success(function () {
    });
    p.error(function () {
        layer.alert('加载数据失败请重试!!');
    })
}
//选择地市
function selectVehCity(supId) {
    var disparamData = cloneObjectFn(vehparamData);
    disparamData.supId = supId;
    $("#vehCounty").html("<option value='' selected>区县级</option>");
    $("#vehSch").html("<option value='' selected>驾培机构</option>");
    $.post(districtUrl, disparamData, function (json) {
        if (json.errorcode == 0) {
            var countyhtml = "<option value='' selected>区县级</option>";
            var datas = json.data;
            for (var i in datas) {
                var d = datas[i];
                countyhtml += "<option value='"+d.id+"' >"+d.name+"</option>";
            }
            $("#vehSch").html("<option value='' selected>驾培机构</option>");
            $("#vehCounty").html(countyhtml);
        }
    }, "json");
    disparamData.pageIndex = 1;
    disparamData.rowsSize = 6;
    disparamData.district = supId;
    selectVueInfo(disparamData,coacount);
}
//选择区县
function selectVehCounty(district) {
    var sccparamData = {};
    $("#vehSch").html("<option value='' selected>驾培机构</option>");
    if(district == ""){
	    return;
    }
    sccparamData.district = district;
    $.post(schurl, sccparamData, function (json) {
        if (json.errorcode == 0) {
            var schhtml = "<option value='' selected>驾培机构</option>";
            var datas = json.data.records;
            for (var i in datas) {
                var d = datas[i];
                schhtml += "<option value='"+d.inscode+"' >"+d.name+"</option>";
            }
            $("#vehSch").html(schhtml);
        }
    }, "json");
    var disparamData = cloneObjectFn(vehparamData);
    disparamData.pageIndex = 1;
    disparamData.rowsSize = 6;
    disparamData.childDistrict = district;
    selectVueInfo(disparamData,coacount);
}
//选择驾培机构
function selectVehSch(inscode) {
    if(inscode == ""){
	    return;
    }
    var vehInscode = cloneObjectFn(vehparamData);
    vehInscode.pageIndex = 1;
    vehInscode.inscode = inscode;
    selectVueInfo(vehInscode,vehcount);
}
//点击培训车型查询教练车
function perdritype(perdritype,id) {
    vehparamData.pageIndex = 1;
    $("#perdritypeParent").children(".buttonbackground").removeClass('buttonbackground');
    $("#"+id).addClass('buttonbackground');
    vehparamData.perdritype=perdritype;
    selectVueInfo(vehparamData,vehcount);
}
//页面头部标签背景变色
function showBg() {
    $("#menu-title").children(".menu-title-bg").removeClass('menu-title-bg');
    $("#menu-title-three").addClass('menu-title-bg');
}
