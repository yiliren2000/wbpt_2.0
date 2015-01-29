var allselects = document.getElementsByTagName('select');
var selects = new Array();
var j = 0;
for (i = 0; i < allselects.length; i++) {
    if (allselects[i].id.substring(0, 3) == 'bs_') {
        selects[j] = allselects[i];
        j++;
    }
}
var isIE = (document.all && window.ActiveXObject && !window.opera) ? true : false;
function $bs(id) {
    return document.getElementById(id);
}
function stopBubbling(ev) {
    ev.stopPropagation();
}
function rSelects() {
    for (i = 0; i < selects.length; i++) {
        var objExists = $bs('select_' + selects[i].name);
        if (objExists != null) {
            objExists.parentNode.removeChild(objExists);
        }
        selects[i].style.display = 'none';
        select_tag = document.createElement('div');
        select_tag.id = 'select_' + selects[i].name;
        select_tag.className = 'select_box';
        selects[i].parentNode.insertBefore(select_tag, selects[i]);

        select_info = document.createElement('div');
        select_info.id = 'select_info_' + selects[i].name;
        select_info.className = 'tag_select';
        select_info.style.cursor = 'pointer';
        select_tag.appendChild(select_info);
        select_ul = document.createElement('ul');
        select_ul.id = 'options_' + selects[i].name;
        select_ul.className = 'tag_options';
        select_ul.style.position = 'absolute';
        select_ul.style.display = 'none';
        select_ul.style.zIndex = '999';
        select_tag.appendChild(select_ul);
        rOptions(i, selects[i].name);
        mouseSelects(selects[i].name);
        if (isIE) {
            selects[i].onclick = new Function("clickLabels3('" + selects[i].name + "');window.event.cancelBubble = true;");
        }
        else if (!isIE) {
            selects[i].onclick = new Function("clickLabels3('" + selects[i].name + "')");
            selects[i].addEventListener("click", stopBubbling, false);
        }
    }
}
function rOptions(i, name) {
    var options = selects[i].getElementsByTagName('option');
    var options_ul = 'options_' + name;
    for (n = 0; n < selects[i].options.length; n++) {
        option_li = document.createElement('li');
        option_li.style.cursor = 'pointer';
        option_li.className = 'open';
        $bs(options_ul).appendChild(option_li);

        option_text = document.createTextNode(selects[i].options[n].text);
        option_li.appendChild(option_text);
        option_selected = selects[i].options[n].selected;
        if (option_selected) {
            option_li.className = 'open_selected';
            option_li.id = 'selected_' + name;
            $bs('select_info_' + name).appendChild(document.createTextNode(tranfer(option_li.innerHTML)));
        }
        option_li.onmouseover = function () { this.className = 'open_hover'; }
        option_li.onmouseout = function () {
            if (this.id == 'selected_' + name) {
                this.className = 'open_selected';
            }
            else {
                this.className = 'open';
            }
        }

        option_li.onclick = new Function("clickOptions(" + i + "," + n + ",'" + selects[i].name + "','" + selects[i].value + "')");
    }
}
function mouseSelects(name) {
    var sincn = 'select_info_' + name;

    $bs(sincn).onmouseover = function () { if (this.className == 'tag_select') this.className = 'tag_select_hover'; }
    $bs(sincn).onmouseout = function () { if (this.className == 'tag_select_hover') this.className = 'tag_select'; }

    if (isIE) {
        $bs(sincn).onclick = new Function("clickSelects('" + name + "');window.event.cancelBubble = true;");
    }
    else if (!isIE) {
        $bs(sincn).onclick = new Function("clickSelects('" + name + "');");
        $bs('select_info_' + name).addEventListener("click", stopBubbling, false);
    }

}
function clickSelects(name) {
    var sincn = 'select_info_' + name;
    var sinul = 'options_' + name;

    for (i = 0; i < selects.length; i++) {
        if (selects[i].name == name) {
            if ($bs(sincn).className == 'tag_select_hover') {
                $bs(sincn).className = 'tag_select_open';
                $bs(sinul).style.display = '';
            }
            else if ($bs(sincn).className == 'tag_select_open') {
                $bs(sincn).className = 'tag_select_hover';
                $bs(sinul).style.display = 'none';
            }
        }
        else {
            $bs('select_info_' + selects[i].name).className = 'tag_select';
            $bs('options_' + selects[i].name).style.display = 'none';
        }
    }

}
function clickOptions(i, n, name,val) {
    var li = $bs('options_' + name).getElementsByTagName('li');

    $bs('selected_' + name).className = 'open';
    $bs('selected_' + name).id = '';
    li[n].id = 'selected_' + name;
    li[n].className = 'open_hover';
    $bs('select_' + name).removeChild($bs('select_info_' + name));
    select_info = document.createElement('div');
    select_info.id = 'select_info_' + name;
    select_info.className = 'tag_select';
    select_info.style.cursor = 'pointer';
    $bs('options_' + name).parentNode.insertBefore(select_info, $bs('options_' + name));

    mouseSelects(name);

    $bs('select_info_' + name).appendChild(document.createTextNode(tranfer(li[n].innerHTML)));
    $bs('options_' + name).style.display = 'none';
    $bs('select_info_' + name).className = 'tag_select';
    selects[i].options[n].selected = 'selected';

    // 回调，函数存在则回调
    var funName = "doSelectChange_" + name;
    var evalStr = "window." + funName;
    if (eval(evalStr)) {
        evalStr = funName + "();";
        eval(evalStr);
    }

    //加载onchange事件
    if (val != null & val != undefined & (val == "xiaofei" || val == "goufang" || val == "gouche" || val == "jingying")) {
        changeType();
    }
}
window.onload = function (e) {
    bodyclick = document.getElementsByTagName('body').item(0);
    rSelects();
    changeType();
    bodyclick.onclick = function () {
        for (i = 0; i < selects.length; i++) {
            $bs('select_info_' + selects[i].name).className = 'tag_select';
            $bs('options_' + selects[i].name).style.display = 'none';
        }
    }
}


function tranfer(val)
{
    if (val.indexOf('&gt;') > 0)
    {
        return val.replace("&gt;",'>');
    }
    else return val;
}