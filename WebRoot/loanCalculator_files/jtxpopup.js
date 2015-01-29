//version 2011-10-25 01
var jiatxShopCurrentDomain = document.domain;
var jiatxShopCurrentURL = window.location.host+window.location.pathname;
//eg: jiatxShopForbiddenDomainArray.push("jiatx.com") ; jiatxShopForbiddenDomainArray.push("sh.soufun.com")
var jiatxShopForbiddenDomainArray = new Array();
//eg: jiatxShopForbiddenURLArray.push("home.soufun.com/") ; jiatxShopForbiddenURLArray.push("home.sh.soufun.com/default.htm");
var jiatxShopForbiddenURLArray = new Array();
jiatxShopForbiddenURLArray.push("home.soufun.com/");
jiatxShopForbiddenURLArray.push("home.sh.soufun.com/");
jiatxShopForbiddenURLArray.push("www.soufun.com/news/");
jiatxShopForbiddenURLArray.push("www.soufun.com/house/");
jiatxShopForbiddenURLArray.push("newhouse.tj.soufun.com/");


function jiatxShopArrayExist(ArraySoruce,ValueExist){
    if(typeof(ArraySoruce.length)!="undefined"){
        for(var i=0;i<ArraySoruce.length;i++){
            if(ArraySoruce[i].toLowerCase()==ValueExist.toLowerCase()){
                return true;
            }
        }
    }
    return false;
}

if(!jiatxShopArrayExist(jiatxShopForbiddenDomainArray,jiatxShopCurrentDomain) && !jiatxShopArrayExist(jiatxShopForbiddenURLArray,jiatxShopCurrentURL)){
    var jiatxShopDomainReg = /^[\.a-zA-Z0-9]*?\.?([a-zA-Z0-9]+)\.+com$/;     
    var jiatxShopCurrentDomainMain = jiatxShopCurrentDomain.replace(jiatxShopDomainReg, "$1.com"); 
    
    function jiatxShopReadCookie(name){
        var cookieValue = "";
        var search = name + "=";
        if(document.cookie.length > 0)
        { 
            offset = document.cookie.indexOf(search);
            if (offset != -1)
            { 
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                if (end == -1) end = document.cookie.length;
                cookieValue = unescape(document.cookie.substring(offset, end))
            }
        }
        return cookieValue;
    }
    function jiatxShopWriteCookie(name, value,mydomain)
    {   
        var exp = new Date();
        exp.setTime(exp.getTime() +1000*3600*12);
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString()+";domain="+mydomain+";path=/";
    }
function jiatxShopLoadScript(B,D){var A=document.createElement("script"),C=document.documentElement.firstChild;A.type="text/javascript";if(A.readyState){A.onreadystatechange=function(){if(A.readyState=="loaded"||A.readyState=="complete"){A.onreadystatechange=null;D()}}}else{A.onload=function(){D()}}A.src=B;C.insertBefore(A,C.firstChild)};
	jiatxShopLoadScript("http://tongji.home.soufun.com/webstatics/hits.aspx",function(){});
    if(jiatxShopReadCookie("jiatxShopWindow")==""){
        jiatxShopLoadScript("http://imgn.jiatx.com/jiatx/mall/outer/shopwindowmain1025.js",function(){
            jiatxShopWriteCookie("jiatxShopWindow","1",jiatxShopCurrentDomainMain);
        });
    }
}