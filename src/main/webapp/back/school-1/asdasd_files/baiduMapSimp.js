// JavaScript Document

function vBaiduMap(baidumapid,baidumap_lng,baidumap_lat,title,tel,city,addr,addr2latlng)
{
	var map = new BMap.Map(baidumapid);

	var Point = new BMap.Point(baidumap_lng, baidumap_lat);
	if(baidumap_lng==0&&baidumap_lat==0)
	{
		map.centerAndZoom(city);
		if(addr&&addr2latlng==''){vBdMap(city,addr);}
	}
	else
	{
		map.centerAndZoom(Point, 15);
		map.enableScrollWheelZoom();
		var mapMarker = new BMap.Marker(Point);
		var mapLable = new BMap.Label(title);
		var mapSize = new BMap.Size(20,-5);
		mapLable.setOffset(mapSize);
		mapMarker.setLabel(mapLable);
		mapMarker.setTitle(title);
		mapLable.setStyle({color:"#222222",fontSize:"12px",border:"1px solid #777",padding:"0 5px",textAlign:"center",lineHeight:"26px"});

		map.addOverlay(mapMarker);
		//http://www.cnblogs.com/milkmap/archive/2011/08/24/2151073.html

	}
}

		/*
		mapLable.setStyle({                                   //给label设置样式，任意的CSS都是可以的
    color:"red",                   //颜色
    fontSize:"14px",               //字号
    border:"0",                    //边
    height:"120px",                //高度
    width:"125px",                 //宽
    textAlign:"center",            //文字水平居中显示
    lineHeight:"120px",            //行高，文字垂直居中显示
    background:"url(http://cdn1.iconfinder.com/data/icons/CrystalClear/128x128/actions/gohome.png)",    //背景图片，这是房产标注的关键！
    cursor:"pointer"
});
		*/

function vBdMap(city,addr)
{
	var SAMPLE_ADVANCED_POST = 'https://api.map.baidu.com/geocoder/v2/?ak=您的密钥&callback=renderOption&output=json';
	var script = document.createElement('script');
    script.type = 'text/javascript';
    var newURL = SAMPLE_ADVANCED_POST.replace('您的密钥','v4zbcZcLMGyYSbgTGOIVfcHg');
	newURL+="&address="+addr;
	newURL+="&city="+city;
    script.src = newURL;
    document.body.appendChild(script);
}

function renderOption(response) {
    var html = '';

		if (response.status ) {
			var text = "无正确的返回结果:\n";
			return;
		}
		var location = response.result.location;
		var baidumap_lat=location.lat;
		var baidumap_lng=location.lng;
		if(baidumap_lat&&baidumap_lng)
		{
			vBaiduMap(baidumapid,baidumap_lng,baidumap_lat,title,tel,city,addr,'ok');	//addr为空 防止死循环
		}
}