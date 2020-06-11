var iframeN=iframeN||'ifrm';
var iframeS=iframeS||'about:blank';
var iframeW=iframeW||'0';
var iframeH=iframeH||'0';
var iframeL=iframeL||'no';
var iframeB=iframeB||'1';
var blocknonestatus='';
if(iframeW==0||iframeH==0){blocknonestatus='style="display:none;"';}
//alert(iframeN+'\r'+iframeW+'\r'+iframeH+'\r'+blocknonestatus);
document.writeln('<iframe width="'+iframeW+'" height="'+iframeH+'" name="'+iframeN+'" id="'+iframeN+'" '+blocknonestatus+' frameborder="'+iframeB+'" src="'+iframeS+'" scrolling="'+iframeL+'"></iframe>');