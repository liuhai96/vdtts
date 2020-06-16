function PCAout(PCAids,PCACode,PCALayer,PCAVal)
{
/*
是基于jquery-1.3.2.min.js库
袁晓力www.yxl.cn编写;
PCAids参数说明：要操作的三个ID，注意先后顺序，不可颠倒，中间用@隔开。例如：'PCA_P@PCA_C@PCA_A'
PCACode	父PCA值 Code值 例如32
PCALayer 当前层级 1,2,3
PCAVal 当前PCA值 Code值 例如3203
使用：PCAout ('PCA_P@PCA_C@PCA_A',00,1,32);取省份列表 并且默认显示值为32的
使用：PCAout ('PCA_P@PCA_C@PCA_A',32,2,3203);取父Code=32的城市列表 并且默认显示值为3203的
使用：PCAout ('PCA_P@PCA_C@PCA_A',3203,3,320324);取父Code=3203的区县列表 并且默认显示值为320324的

html：

<select name="PCA_P" id="PCA_P" onchange="PCAout('PCA_P@PCA_C@PCA_A',this.value,2)"></select>
<select name="PCA_C" id="PCA_C"  onchange="PCAout('PCA_P@PCA_C@PCA_A',this.value,3)"></select>
<select name="PCA_A" id="PCA_A"></select>
*/

	$.post('/getDiqu.php?'+Math.floor(Math.random()*1000000+1000),{'Code':PCACode},
	function (data)
	{
		if(data==''){data='[]';}		
		var PCA_de=[];
		PCA_de[1]='省份';
		PCA_de[2]='城市';
		PCA_de[3]='区/县';
		var PCACodeT='';
		if(PCACode!=''&&PCACode>0){PCACodeT=PCACode.substr(0,2);}
		if(PCACodeT==11||PCACodeT==12||PCACodeT==31||PCACodeT==50){PCA_de[2]='区/县';PCA_de[3]='街道';}		
		var ajaxData = eval('('+ data +')');	//把传过来的字符串转化成一个JSON对象。
		var ajaxDataLen = ajaxData.length;
		PCAids=eval("(['','"+PCAids.replace(/@/g,"','")+"'])");		
		var n=PCALayer;
		n = (n > (PCAids.length-1) ) ?  (PCAids.length-1) : n;
		n = (n < 0 ) ?  0 : n;
		for (var j = n ; j < PCAids.length ; j++)
		{
			var t = document.getElementById(PCAids[j]);
			t.options.length = 1;
			t.options[0]=new Option(PCA_de[j],'');
			t.style.display='none';
		}
		var NextList = document.getElementById(PCAids[PCALayer]);
		if (ajaxDataLen>0)
		{
			NextList.style.display='inline';
			NextList.length = ajaxDataLen + 1;
			for (var i=0;i<ajaxData.length;i++ )
			{
				NextList.options[i+1]=new Option(ajaxData[i].Name,ajaxData[i].Code);
				if (ajaxData[i].Code == PCAVal ){NextList.options[i+1].selected = 'selected';}
			}
		}
	});
}

function PCA_out(pcaobjids,pca,pca_c,pca_a)
{
/*
pcaobjids	要操作的三个ID，注意先后顺序，不可颠倒，中间用@隔开。例如：'PCA_P@PCA_C@PCA_A'
pca			当前PCA值 Code值 例如320324
*/
	if(pca!=''&&pca>0&&pca_c==undefined&&pca_a==undefined)
	{	//alert('JS自己分解');
		var pca_p='',pca_c='',pca_a='';
		pca_p=pca.substr(0,2);
		pcaLen=pca.length;
		if(pcaLen==4)
		{
			pca_c=pca;
		}
		else if(pcaLen==6)
		{
			if(pca_p=='11'||pca_p=='12'||pca_p=='31'||pca_p=='50'||pca_p=='81'||pca_p=='82'||pca.substr(2,2)=='90')
			{//直辖市 省管县
				pca_c=pca;
			}
			else
			{
				pca_c=pca.substr(0,4);
				pca_a=pca;
			}
		}
		else if(pcaLen==9)
		{
			pca_c=pca.substr(0,6);
			pca_a=pca;
		}
	}
	else
	{	//alert('自带参数');
		if(!pca){pca='00';}
		var pca_p=pca;
	}
	//alert(pca_p+'\r'+pca_c+'\r'+pca_a);
	PCAout(pcaobjids,"00",1,pca_p);
	if(pca_p!=''&&pca_p>0){window.setTimeout(function(){PCAout(pcaobjids,pca_p,2,pca_c);},200);}
	if(pca_c!=''&&pca_c>0){window.setTimeout(function(){PCAout(pcaobjids,pca_c,3,pca_a);},500);}
	if(pca_c!=''&&pca_c>0){window.setTimeout(function(){PCAout(pcaobjids,pca_c,3,pca_a);},900);}
}