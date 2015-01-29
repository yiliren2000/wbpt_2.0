var sScreenWidth = screen.availWidth;//当前屏幕的有效宽度
var sScreenHeight = screen.availHeight;//当前屏幕的有效高度

/**产生一个不重复的数字，将此加入url连接后，为了防止页面缓存*/
randomNumber = function ()
{
	var today = new Date();//获取当前日期，如Tue Sep 29 16:08:05 UTC+0800 2009 
	var num = Math.abs(Math.sin(today.getTime()));//获取当前时间距离标准日期之间经过的毫秒数，并进行数学转换
	return num;  
}

appendLink = function (url,param){
	var link = url.index('?')>-1?url+"&"+param:url+"?"+param
	return link; 
}

doGet = function (url){
	window.location.href=encodeURI(url);
}

doPost = function(object) {
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", object.url);

	var params = object.params;
    for ( var i in params) {
        if (params.hasOwnProperty(i)) {
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = i;
            input.value = params[i];
            form.appendChild(input);
        }
    }

    document.body.appendChild(form);

    form.submit();
}

showTip = function (data, metadata, record, rowIndex, columnIndex, store) {  
	metadata.attr = 'ext:qtip='+data;  
	return data;  
};

autoLinefeed = function(value, meta, record) {    
     meta.attr = 'style="white-space:normal;"';     
     return value;     
} 

//添加cookie
setCookie = function(c_name,value,expiredays)
{
    var exdate=new Date()
    exdate.setDate(exdate.getDate()+expiredays)
    cookieVal=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
    document.cookie=cookieVal;
}
//获取cookie
getCookie = function(c_name)
{
    if (document.cookie.length>0)
      {
      c_start=document.cookie.indexOf(c_name + "=")
      if (c_start!=-1)
        { 
        c_start=c_start + c_name.length+1 
        c_end=document.cookie.indexOf(";",c_start)
        if (c_end==-1) c_end=document.cookie.length
//        document.write(document.cookie.substring(c_start,c_end)+"<br>");
        return unescape(document.cookie.substring(c_start,c_end))
        } 
      }
    return ""
}

cjkEncode = function (text) {        
    if (text == null) {        
        return "";        
    }        
    var newText = "";        
    for (var i = 0; i < text.length; i++) {        
        var code = text.charCodeAt (i);         
        if (code >= 128 || code == 91 || code == 93) {//91 is "[", 93 is "]".        
            newText += "[" + code.toString(16) + "]";        
        } else {        
            newText += text.charAt(i);        
        }        
    }        
    return newText;        
}   
