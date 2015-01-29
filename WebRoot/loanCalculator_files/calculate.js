
var $ = function(id){
   return document.getElementById(id);
}
var $na = function(fname) {
   var objs = document.getElementsByName(fname);
   if(objs) {
      return objs[0];
   } else {
      return false;
   }
}

function changeDIV(id){
	if(id == "1"){
		$('title01').className = "maintitletd1";
		$('title02').className = "maintitletda font01";
		$('title03').className = "maintitletdb font01";
		$('title04').className = "maintitletda font01";
		$('title05').className = "maintitletd font01";
	}else if(id == "2"){
		$('title01').className = "maintitletd font01";
		$('title02').className = "maintitletda1";
		$('title03').className = "maintitletdb font01";
		$('title04').className = "maintitletda font01";
		$('title05').className = "maintitletd font01";
	}else if(id == "3"){
		$('title01').className = "maintitletd font01";
		$('title02').className = "maintitletda font01";
		$('title03').className = "maintitletdb1";
		$('title04').className = "maintitletda font01";
		$('title05').className = "maintitletd font01";
	}else if(id == "4"){
		$('title01').className = "maintitletd font01";
		$('title02').className = "maintitletda font01";
		$('title03').className = "maintitletdb font01";
		$('title04').className = "maintitletda1";
		$('title05').className = "maintitletd font01";
	}else if(id == "5"){
		$('title01').className = "maintitletd font01";
		$('title02').className = "maintitletda font01";
		$('title03').className = "maintitletdb font01";
		$('title04').className = "maintitletda font01";
		$('title05').className = "maintitletd1";
	}
	for(var i = 1; i < 6; i++){
		if($('calculate0' + i) != null){
			$('calculate0' + i).style.display = "none";
		}
		if($('note0' + i) != null){
			$('note0' + i).style.display = "none";
		}
	}
	$('calculate0' + id).style.display = "block";
	$('note0' + id).style.display = "block";
}


function myround(v, e){
    var t = 1;
    e = Math.round(e);
    for(; e > 0; t *= 10, e--);
    for(; e < 0; t /= 10, e++);
    return Math.round(v * t) / t;
}

function ShowLilv(month, lt){
        var indexNumSd = getArrayIndexFromYear(month, 1); // �̴�
        var indexNumGj = getArrayIndexFromYear(month, 2); // ������
	$("sdlv").innerHTML = myround(lilv_array[lt][1][indexNumSd] * 100, 2) + "%";
	$("gjlv").innerHTML = myround(lilv_array[lt][2][indexNumGj] * 100, 2);
}
function ShowLilvNew(month, lt){
        var indexNumSd = getArrayIndexFromYear(month, 1); // �̴�
        var indexNumGj = getArrayIndexFromYear(month, 2); // ������
        if($('type').value == 1) {
            $("singlelv").value = myround(lilv_array[lt][1][indexNumSd] * 100, 2);
        } else if ($('type').value == 2) {
            $("singlelv").value = myround(lilv_array[lt][2][indexNumGj] * 100, 2);
        } else {
            $("singlelv").value = myround(lilv_array[lt][2][indexNumGj] * 100, 2);
        }
	$("sdlv").value = myround(lilv_array[lt][1][indexNumSd] * 100, 2);
	$("gjlv").value = myround(lilv_array[lt][2][indexNumGj] * 100, 2);
}
function getArrayIndexFromYear(year,dkType){
   var indexNum = 0;
   if(dkType == 1){
      if(year == 1) {
         indexNum = 1;
      } else if(year > 1 && year <= 3) {
         indexNum = 3;
      } else if(year > 3 && year <= 5) {
         indexNum = 5;
      } else {
         indexNum = 10;
      }
   } else if(dkType == 2) {
      if(year > 5) {
         indexNum = 10;
      } else {
         indexNum = 5;
      }
   }
   return indexNum;
}
function exc_zuhe(fmobj, v){
	//var fmobj = document.calc1;
	if (fmobj.name == "calc1"){
		if (v == 3){
			$('calc1_zuhe').style.display = 'block';
			$("calc1_ctype").style.display = 'none';
			fmobj.jisuan_radio[1].checked = true;
			exc_js(fmobj, 2);
		}else{
			$('calc1_zuhe').style.display = 'none';
			$("calc1_ctype").style.display = 'block';
		}
                fmobj.type.value = v;
                if(v == 1) {
                    $('singlelv_li').style.display = 'block';
                    $('sdlv_li').style.display = 'none';
                    $('gjlv_li').style.display = 'none';
                    $('singlelv').value = $('sdlv').value;
                } else if (v == 2) {
                    $('singlelv_li').style.display = 'block';
                    $('sdlv_li').style.display = 'none';
                    $('gjlv_li').style.display = 'none';
                    $('singlelv').value = $('gjlv').value;
                } else if (v == 3) {
                    $('singlelv_li').style.display = 'none';
                    $('sdlv_li').style.display = 'block';
                    $('gjlv_li').style.display = 'block';
                }
	}else{
		if(v == 3){
			$('calc2_zuhe').style.display = 'block';
			fmobj.jisuan_radio[1].checked = true;
			exc_js(fmobj, 2);
		}else{
			$('calc2_zuhe').style.display = 'none';
		}
	}
}

function exc_js(fmobj, v){
	//var fmobj=document.calc1;
	if (fmobj.name == "calc1"){
		if (v == 1){
			$('calc1_js_div1').style.display = 'block';
			$('calc1_js_div2').style.display = 'none';
			$('calc1_zuhe').style.display = 'none';
			fmobj.type.value = 1;
		}else{
			$('calc1_js_div1').style.display = 'none';
			$('calc1_js_div2').style.display = 'block';
		}
	}else{
		if (v == 1){
			$('calc2_js_div1').style.display = 'block';
			$('calc2_js_div2').style.display = 'none';
			$('calc2_zuhe').style.display = 'none';
			fmobj.type.value = 1;
		}else{
			$('calc2_js_div1').style.display = 'none';
			$('calc2_js_div2').style.display = 'block';
		}
	}
}

function formReset(fmobj){
	fmobj.reset();
	if (fmobj.name == "calc1"){
		$('calc1_js_div1').style.display = 'block';
		$('calc1_js_div2').style.display = 'none';
		$('calc1_zuhe').style.display = 'none';
		$('calc1_benjin').style.display = 'none';
	}else{
		$('calc2_js_div1').style.display = 'block';
		$('calc2_js_div2').style.display = 'none';
		$('calc2_zuhe').style.display = 'none';
		$('calc2_benxi').style.display = 'none';
	}
}

//��ʾ�ұߵıȽ�div
function showRightDiv(fmobj){
	if (ext_total(fmobj) == false){return;}
	//alert(document.calc1.month_money2.value);
	var a = window.open('', 'calc_win', 'status=yes,scrollbars=yes,resizable=yes,width=550,height=500,left=0,top=0')//790*520
	if (fmobj.name == "calc1"){
		document.calc1.target = "calc_win";
		document.calc1.submit();
	}else{
		document.calc2.target = "calc_win";
		document.calc2.submit();
	}
}

//��֤�Ƿ�Ϊ����
function reg_Num(str){
	if (str.length == 0){return false;}
	var Letters = "1234567890.";

	for(i = 0; i < str.length; i++){
		var CheckChar = str.charAt(i);
		if (Letters.indexOf(CheckChar) == -1){return false;}
	}
	return true;
}

//�õ�����
function getlilv(lilv_class, type, years){
   var indexNumSd = getArrayIndexFromYear(years, 1); // �̴�
   var indexNumGj = getArrayIndexFromYear(years, 2); // ������
    var lilv_class = parseInt(lilv_class);
    if(type == 1) {
        return lilv_array[lilv_class][type][indexNumSd];
    } else if(type == 2) {
        return lilv_array[lilv_class][type][indexNumGj];
    }
}

//���𻹿���»����(����: ������ / �����ܶ� / �������·� / ���ǰ��0��length-1)
function getMonthMoney2(lilv, total, month, cur_month){
	var lilv_month = lilv / 12;//������
	//return total * lilv_month * Math.pow(1 + lilv_month, month) / ( Math.pow(1 + lilv_month, month) -1 );
	var benjin_money = total / month;
	return (total - benjin_money * cur_month) * lilv_month + benjin_money;
}

//��Ϣ������»����(����: ������/�����ܶ�/�������·�)
function getMonthMoney1(lilv, total, month){
	var lilv_month = lilv / 12;//������
	return total * lilv_month * Math.pow(1 + lilv_month, month) / ( Math.pow(1 + lilv_month, month) -1 );
}

function ext_total(fmobj){
	//var fmobj = document.calc1;
	//������»�����������
	while ((k = fmobj.month_money2.length - 1) >= 0){
		fmobj.month_money2.options.remove(k);
	}
	var years = fmobj.years.value;
	var month = fmobj.years.value * 12;

	fmobj.month1.value = month + "(��)";
	fmobj.month2.value = month + "(��)";
	if(fmobj.type.value == 3 ){
		//--  ����ʹ���(����ʹ���ļ��㣬ֻ����ҵ�����͹����������йأ��Ͱ������ܶ�����޹�)
		if(!reg_Num(fmobj.total_sy.value)){alert("����ʹ�������д�̴�����");fmobj.total_sy.focus();return false;}
		if(!reg_Num(fmobj.total_gjj.value)){alert("����ʹ�������д���������");fmobj.total_gjj.focus();return false;}
		if(fmobj.total_sy.value == null){fmobj.total_sy.value = 0;}
		if(fmobj.total_gjj.value == null){fmobj.total_gjj.value = 0;}
		var total_sy = fmobj.total_sy.value;
		var total_gjj = fmobj.total_gjj.value;
		fmobj.fangkuan_total1.value = "��";//�����ܶ�
		fmobj.fangkuan_total2.value = "��";//�����ܶ�
		fmobj.money_first1.value = 0;//���ڸ���
		fmobj.money_first2.value = 0;//���ڸ���

		//�����ܶ�
		var total_sy = parseInt(fmobj.total_sy.value);
		var total_gjj = parseInt(fmobj.total_gjj.value);
		var daikuan_total = total_sy + total_gjj;
		fmobj.daikuan_total1.value = daikuan_total;
		fmobj.daikuan_total2.value = daikuan_total;

		//�»���
		var lilv_sd = $('sdlv').value / 100;//�õ��̴�����
		var lilv_gjj = $('gjlv').value / 100;//�õ�����������

		//1.���𻹿�
			//�»���
			var all_total2 = 0;
			var month_money2 = "";
			for(j = 0; j < month; j++){
				//���ú�������: �����»����
				huankuan = getMonthMoney2(lilv_sd, total_sy, month, j) + getMonthMoney2(lilv_gjj, total_gjj, month, j);
				all_total2 += huankuan;
				huankuan = Math.round(huankuan * 100) / 100;
				//fmobj.month_money2.options[j] = new Option( (j + 1) +"��," + huankuan + "(Ԫ)", huankuan);
				month_money2 += (j + 1) + "��," + huankuan + "(Ԫ)\n";
			}
			fmobj.month_money2.value = month_money2;
			//�����ܶ�
			fmobj.all_total2.value = Math.round(all_total2 * 100) / 100;
			//֧����Ϣ��
			fmobj.accrual2.value = Math.round((all_total2 - daikuan_total) * 100) / 100;

		//2.��Ϣ����
			//�¾�����
			var month_money1 = getMonthMoney1(lilv_sd, total_sy, month) + getMonthMoney1(lilv_gjj, total_gjj, month);//���ú�������
			fmobj.month_money1.value = Math.round(month_money1 * 100) / 100 + "(Ԫ)";
			//�����ܶ�
			var all_total1 = month_money1 * month;
			fmobj.all_total1.value = Math.round(all_total1 * 100) / 100;
			//֧����Ϣ��
			fmobj.accrual1.value = Math.round((all_total1 - daikuan_total) * 100) / 100;
	}else{
		//--  ��ҵ������������
		var lilv = $('singlelv').value / 100;//�õ�����
		if(fmobj.jisuan_radio[0].checked == true){
			//------------ ���ݵ����������
			if(!reg_Num(fmobj.price.value)){alert("����д����");fmobj.price.focus();return;}
			if(!reg_Num(fmobj.sqm.value)){alert("����д���");fmobj.sqm.focus();return;}

			//�����ܶ�
			var fangkuan_total = fmobj.price.value * fmobj.sqm.value;
			fmobj.fangkuan_total1.value = fangkuan_total;
			fmobj.fangkuan_total2.value = fangkuan_total;
			//�����ܶ�
			var daikuan_total = (fmobj.price.value * fmobj.sqm.value) * (fmobj.anjie.value / 10);
			fmobj.daikuan_total1.value = daikuan_total;
			fmobj.daikuan_total2.value = daikuan_total;
			//���ڸ���
			var money_first = fangkuan_total - daikuan_total;
			fmobj.money_first1.value = money_first
			fmobj.money_first2.value = money_first;
		}else{
			//------------ ���ݴ����ܶ����
			if (fmobj.daikuan_total000.value.length == 0){alert("����д�����ܶ�");fmobj.daikuan_total000.focus();return false;}

			//�����ܶ�
			fmobj.fangkuan_total1.value = "��";
			fmobj.fangkuan_total2.value = "��";
			//�����ܶ�
			var daikuan_total = fmobj.daikuan_total000.value * 10000;
			fmobj.daikuan_total1.value = daikuan_total;
			fmobj.daikuan_total2.value = daikuan_total;
			//���ڸ���
			fmobj.money_first1.value = 0;
			fmobj.money_first2.value = 0;
		}
		//1.���𻹿�
			//�»���
			var all_total2 = 0;
			var month_money2 = "";
			for(j = 0; j < month; j++){
				//���ú�������: �����»����
				huankuan = getMonthMoney2(lilv, daikuan_total, month, j);
				all_total2 += huankuan;
				huankuan = Math.round(huankuan * 100) / 100;
				//fmobj.month_money2.options[j] = new Option( (j + 1) +"��," + huankuan + "(Ԫ)", huankuan);
				month_money2 += (j + 1) + "��," + huankuan + "(Ԫ)\n";
			}
			fmobj.month_money2.value = month_money2;
			//�����ܶ�
			fmobj.all_total2.value = Math.round(all_total2 * 100) / 100;
			//֧����Ϣ��
			fmobj.accrual2.value = Math.round( (all_total2 - daikuan_total) * 100) / 100;
		//2.��Ϣ����
			//�¾�����
			var month_money1 = getMonthMoney1(lilv, daikuan_total, month);//���ú�������
			fmobj.month_money1.value = Math.round(month_money1 * 100) / 100 + "(Ԫ)";
			//�����ܶ�
			var all_total1 = month_money1 * month;
			fmobj.all_total1.value = Math.round(all_total1 * 100) / 100;
			//֧����Ϣ��
			fmobj.accrual1.value = Math.round( (all_total1 - daikuan_total) * 100) / 100;
	}
	if($("dengeben2").checked){
		fmobj.fangkuan_total1.value = fmobj.fangkuan_total2.value;
		fmobj.daikuan_total1.value = fmobj.daikuan_total2.value;
		fmobj.all_total1.value = fmobj.all_total2.value;
		fmobj.accrual1.value = fmobj.accrual2.value;
		fmobj.money_first1.value = fmobj.money_first2.value;
		fmobj.month1.value = fmobj.month2.value;

		fmobj.month_money1.value = fmobj.month_money2.value;
	}
}

function chanage_type_mm(){
	if($("dengeben2").checked)
		$("type1_mm1").innerHTML = '&nbsp;&nbsp;�¾���<textarea name="month_money1" rows="5" ></textarea>';
	else
		$("type1_mm1").innerHTML = '&nbsp;&nbsp;�¾����<input name="month_money1" type="text" class="guestbook02" />Ԫ';
}

//��ǰ���L����
function play(){
	if (document.tqhdjsq.dkzws.value == ''){
		alert('����������ܶ�');
		return;
	}else dkzys = parseFloat(document.tqhdjsq.dkzws.value) * 10000;
	if(document.tqhdjsq.tqhkfs[1].checked && document.tqhdjsq.tqhkws.value == ''){
		alert('�����벿����ǰ������');
		return;
	}
	s_yhkqs=parseInt(document.tqhdjsq.yhkqs.value);

	//������
	if($("tqhklx").value == 1){
		if (s_yhkqs > 60){
			dklv = getlilv(document.tqhdjsq.dklv_class.value, 2, 10)/12; //�������������5������4.23%
		}else{
			dklv = getlilv(document.tqhdjsq.dklv_class.value, 2, 3)/12;  //�������������5��(��)����3.78%
		}
	}
	if($("tqhklx").value == 0){
		if(s_yhkqs > 60){
			dklv = getlilv(document.tqhdjsq.dklv_class.value, 1, 10)/12; //��ҵ�Դ�������5������5.31%
		}else{
			dklv = getlilv(document.tqhdjsq.dklv_class.value, 1, 3)/12; //��ҵ�Դ�������5��(��)����4.95%
		}
	}

	//�ѻ���������
	yhdkqs = (parseInt(document.tqhdjsq.tqhksjn.value) * 12 + parseInt(document.tqhdjsq.tqhksjy.value)) - (parseInt(document.tqhdjsq.yhksjn.value) * 12 + parseInt(document.tqhdjsq.yhksjy.value));

	if(yhdkqs < 0 || yhdkqs > s_yhkqs){
		alert('Ԥ����ǰ����ʱ�����һ�λ���ʱ����ì�ܣ����ʵ');
		return false;
	}

	yhk = dkzys * (dklv * Math.pow((1 + dklv), s_yhkqs)) / (Math.pow((1 + dklv), s_yhkqs) - 1);
	yhkjssj = Math.floor((parseInt(document.tqhdjsq.yhksjn.value) * 12 + parseInt(document.tqhdjsq.yhksjy.value) + s_yhkqs - 2) / 12) + '��' + ((parseInt(document.tqhdjsq.yhksjn.value) * 12 + parseInt(document.tqhdjsq.yhksjy.value) + s_yhkqs - 2) % 12 + 1) + '��';
	yhdkys = yhk * yhdkqs;

	yhlxs = 0;
	yhbjs = 0;
	for(i = 1; i <= yhdkqs; i++){
		yhlxs = yhlxs + (dkzys - yhbjs) * dklv;
		yhbjs = yhbjs + yhk - (dkzys - yhbjs) * dklv;
	}

	remark = '';
	if(document.tqhdjsq.tqhkfs[1].checked){
		tqhkys = parseInt(document.tqhdjsq.tqhkws.value) * 10000;
		if(tqhkys + yhk >= (dkzys - yhbjs) * (1 + dklv)){
			remark = '������ǰ��������㹻������Ƿ���';
		}else{
			yhbjs = yhbjs + yhk;
            byhk = yhk + tqhkys;
			if(document.tqhdjsq.clfs[0].checked){
				yhbjs_temp = yhbjs + tqhkys;
				for(xdkqs = 0; yhbjs_temp <= dkzys; xdkqs++) yhbjs_temp = yhbjs_temp + yhk - (dkzys - yhbjs_temp) * dklv;
				xdkqs = xdkqs - 1;
				xyhk = (dkzys - yhbjs - tqhkys) * (dklv * Math.pow((1 + dklv), xdkqs)) / (Math.pow((1 + dklv), xdkqs) - 1);
				jslx = yhk * s_yhkqs - yhdkys - byhk - xyhk * xdkqs;
				xdkjssj = Math.floor((parseInt(document.tqhdjsq.tqhksjn.value) * 12 + parseInt(document.tqhdjsq.tqhksjy.value) + xdkqs - 2) / 12) + '��' + ((parseInt(document.tqhdjsq.tqhksjn.value) * 12 + parseInt(document.tqhdjsq.tqhksjy.value) + xdkqs - 2) % 12 + 1) + '��'; 
			}else{
				xyhk = (dkzys - yhbjs - tqhkys) * (dklv * Math.pow((1 + dklv), (s_yhkqs - yhdkqs))) / (Math.pow((1 + dklv), (s_yhkqs - yhdkqs)) - 1);
				jslx = yhk * s_yhkqs - yhdkys - byhk - xyhk * (s_yhkqs - yhdkqs);
				xdkjssj = yhkjssj;
			}
		}
	}

	if(document.tqhdjsq.tqhkfs[0].checked || remark != ''){
		byhk = (dkzys - yhbjs) * (1 + dklv);
		xyhk = 0;
		jslx = yhk * s_yhkqs - yhdkys - byhk;
		xdkjssj = document.tqhdjsq.tqhksjn.value + '��' + document.tqhdjsq.tqhksjy.value + '��';
	}

	document.tqhdjsq.ykhke.value = Math.round(yhk * 100) / 100;
	document.tqhdjsq.yhkze.value = Math.round(yhdkys * 100) / 100;
	document.tqhdjsq.yhlxe.value = Math.round(yhlxs * 100) / 100;
	document.tqhdjsq.gyyihke.value = Math.round(byhk * 100) / 100;
	document.tqhdjsq.xyqyhke.value = Math.round(xyhk * 100) / 100;
	document.tqhdjsq.jslxzc.value = Math.round(jslx * 100) / 100;
	document.tqhdjsq.yzhhkq.value = yhkjssj;
	document.tqhdjsq.xdzhhkq.value = xdkjssj;
	document.tqhdjsq.jsjgts.value = remark;
}

function runjs3(obj){
	dj3 = parseFloat(obj.dj3.value);
	mj3 = parseFloat(obj.mj3.value);
	fkz3 = dj3 * mj3;
	yh = fkz3 * 0.0005;
	if(dj3 <= 9432) q = fkz3 * 0.015;
	else if(dj3 > 9432) q = fkz3 * 0.03;
	if(mj3 <= 120) fw = 500;
	else if(120 < mj3 <= 5000) fw = 1500;
	if(mj3 > 5000) fw = 5000;
	gzh = fkz3 * 0.003;
	obj.yh.value = Math.round(yh * 100,5) / 100;
	obj.fkz3.value = Math.round(fkz3 * 100,5) / 100;
	obj.q.value = Math.round(q * 100,5) / 100;
	obj.gzh.value = Math.round(gzh * 100,5) / 100;
	obj.wt.value = Math.round(gzh * 100,5) / 100;
	obj.fw.value = Math.round(fw * 100,5) / 100;
}

//���˹�����
var l1_5 = 0.0405;
var l6_30 = 0.0459;

function isIdCardNo(sNo){
	sNo = sNo.toString();
	if (sNo.length == 18){
		var a, b, c;
		if(!isInt(sNo.substr(0, 17))) {return false;}

		a = parseInt(sNo.substr(0, 1)) * 7 + parseInt(sNo.substr(1, 1)) * 9 + parseInt(sNo.substr(2, 1)) * 10;
		a = a + parseInt(sNo.substr(3, 1)) * 5 + parseInt(sNo.substr(4, 1)) * 8 + parseInt(sNo.substr(5, 1)) * 4;
		a = a + parseInt(sNo.substr(6, 1)) * 2 + parseInt(sNo.substr(7, 1)) * 1 + parseInt(sNo.substr(8, 1)) * 6;
		a = a + parseInt(sNo.substr(9, 1)) * 3 + parseInt(sNo.substr(10, 1)) * 7 + parseInt(sNo.substr(11, 1)) * 9;
		a = a + parseInt(sNo.substr(12, 1)) * 10 + parseInt(sNo.substr(13, 1)) * 5 + parseInt(sNo.substr(14, 1)) * 8;
		a = a + parseInt(sNo.substr(15, 1)) * 4 + parseInt(sNo.substr(16, 1)) * 2;
		b = a % 11;

		if(b == 2){
			c = sNo.substr(17, 1);
			//c = sNo.substr(17, 1).toUpperCase();
		}else{
			c = parseInt(sNo.substr(17, 1));
		}

		switch(b){
			case 0: if(c != 1) {return false;}break;
			case 1: if(c != 0) {return false;}break;
			case 2: if(c != "X") {return false;}break;
			case 3: if(c != 9) {return false;}break;
			case 4: if(c != 8) {return false;}break;
			case 5: if(c != 7) {return false;}break;
			case 6: if(c != 6) {return false;}break;
			case 7: if(c != 5) {return false;}break;
			case 8: if(c != 4) {return false;}break;
			case 9: if(c != 3) {return false;}break;
			case 10: if(c != 2){return false;}
		}
	}else{
		if(!isInt(sNo)) {return false;}
	}

	switch(sNo.length){
		case 15: if(isValidDate(sNo.substr(6, 2), sNo.substr(8, 2), sNo.substr(10, 2))) {return true;}
		case 18: if(isValidDate(sNo.substr(6, 4), sNo.substr(10, 2), sNo.substr(12, 2))) {return true;}
	}
	return false;
}

function isValidDate(iY, iM, iD){
	var undefined;
	if(iY != undefined && !isNaN(iY) && iY >= 0 && iY <= 9999 && iM != undefined && !isNaN(iM) && iM >= 1 && iM <= 12 && iD != undefined && !isNaN(iD) && iD >= 1 && iD <= 31){
		if(iY < 50) iY = 2000 + iY;
		else if (iY < 100) iY = 1900 + iY;
		if(iM == 2 && (isLeapYear(iY) && iD > 29 || !isLeapYear(iY) && iD > 28) || iD == 31 && (iM < 7 && iM % 2 == 0 || iM > 7 && iM % 2 == 1))
			return false;
		else return true;
	}else
		return false;
}

function isLeapYear(year){
	if((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)){
		return true;
	}
	return false;
}

function isEmpty(str){
	if((str == null) || (str.length == 0)) return true;
	else return(false);
}

function isInt(theStr){
	var flag = true;

	if(isEmpty(theStr)){flag = false;}
	else{
		for(var i = 0; i < theStr.length; i++){
			if(theStr.substring(i, i + 1) == "."){
				flag = false;
				break;
			}
		}
	}
	return(flag);
}

function isnumeric(p)
{
 if (p == "")
  return false;
 var l = p.length;
 var count=0;
 for(var i=0; i<l; i++)
 {
  var digit = p.charAt(i);
  if(digit == "." )
 {
    ++count;
    if(count>1) return false;
   }
  else if(digit < "0" || digit > "9")
  return false;
 }
 return true;
}
function Format(num,dotLen) {

    var dot=0
    var num1=0
//change by liyugen
    if (typeof dotLen=="undefined")
        dot=2
    else
        dot=dotLen
    if (isNaN(parseFloat(num)))
        return 0
    else
        num1=parseFloat(num)
    var n1=Math.pow(10,dot)
    if (n1==0)
        var iValue= Math.round(num1)
    else
        var iValue=    Math.round(num1*n1)/n1
  var sValue = iValue.toString();
  if (sValue.indexOf(".") == -1)
  {
      sValue = sValue + ".00";
  }
  else
  {
      if (sValue.indexOf(".") == sValue.length - 1)
      {
          sValue = sValue + "00";
      }
      else if (sValue.indexOf(".") == sValue.length - 2)
      {
          sValue = sValue + "0";
      }
  }
return sValue
}
function c_id_card(obj){
var id_card=obj.id_card.value;//����֤
var age=0;
age_qx.innerText='';
if(id_card.length>0)
{
if(!isInt(id_card)){alert('����֤�������������');return false;}
if(id_card.length!=15 && id_card.length!=18){alert('����֤���볤��Ϊ15��18λ');return false;}
if(!isIdCardNo(id_card)){alert('��������ȷ������֤����');return false;}
var  a=new  Date();
var  y=Number(a.getFullYear());
if(id_card.length==15){age=y-Number('19'+id_card.substr(6,2));}else{age=y-Number(id_card.substr(6,4));}
var max_qx=70-age;if(max_qx>30){max_qx=30;}
age_qx.innerText='�����'+max_qx+'��';
}
}
function gjjloan1(obj)
{
  var gryjce;//ס������������½ɴ��
  var poyjce;//��żס������������½ɴ��
  var grjcbl;//�ɴ����
  var pojcbl;//��ż�ɴ����
  var xy;//��������
  var fwzj;//�����ܼ�
  var fwxz;//��������
  var dknx;//������������
  var syhk;//���»����

  var dked;//��Ҫ������
  var hkfs;//���ʽ
  var bxhj;//��Ϣ�ϼ�
  var bxhj2;//��Ϣ�ϼƵȱ���

//�м����
 var gbl;
 var jtysr;//��ͥ������
 var r;//�»���
 var gjjdka;//ס�������������a
 var gjjdkb;//ס�������������b
 var gjjdkc;//ס�������������c

 gryjce=obj.mount2.value;
if(gryjce<=0){alert('ס������������½ɴ���Ϊ��,������');
                     obj.mount2.value='';obj.mount2.focus();return;}

 poyjce=obj.mount3.value;
 if(poyjce.length>0 && !isnumeric(poyjce))
{alert("��ż�½ɴ��¼�벻��ȷ");return;}

if (obj.jcbl.value=="" || !isInt(obj.jcbl.value) || Number(obj.jcbl.value)<=0 ||Number(obj.jcbl.value)>=100)
{
	alert("�ɴ��������ȷ");return;
}
if (poyjce.length>0 &&(obj.p_bl.value=="" || !isInt(obj.p_bl.value) || Number(obj.p_bl.value)<=0||Number(obj.p_bl.value)>=100) )
{
	alert("��ż�ɴ��������ȷ");return;
}
grjcbl=obj.jcbl.value/100;
pojcbl=obj.p_bl.value/100;
/*
if (obj.xz[0].checked==true){fwxz=0.9;}
else {fwxz=0.95;}
*/
if (obj.xz[0].checked==true){fwxz=0.9;}
else {fwxz=0.8;}

if (obj.xy[0].checked==true){xy=1.3;}
else if(obj.xy[1].checked==true){xy=1.15;}
else {xy=1;}

 fwzj=obj.mount.value;

if(fwzj<=0){alert('������������ֵ��ʵ�ʹ��������Ϊ��,������');
                     obj.mount.value='';return;}

 dknx=Math.round(obj.mount10.value);

if(dknx<=0){alert('�����������޲���Ϊ��,������');
                     obj.mount10.value='';return;}
if(dknx>30){alert('�����������޲��ܴ���30��,����������');
                     obj.mount10.value='';return;}
                     var bcv=0;
                     if (dknx>5)
                     {
                      bcv=Math.round( 1000000 * l6_30/12 ) / 1000000;
                    }else{
                    	 bcv=Math.round( 1000000 * l1_5/12 ) / 1000000;
                    	}
r=adv_format((10000*bcv*Math.pow(1+bcv,12*dknx))/(Math.pow(1+bcv,12*dknx)-1),2);


if(poyjce.length>0)
{
	jtysr=Math.ceil((gryjce/grjcbl+poyjce/pojcbl)*10)/10;
}
else
{
	jtysr=Math.ceil((gryjce/grjcbl)*10)/10;
}
if(jtysr<=400){alert('��ͥ���������400�������ϴ�������');
                     return;}

gjjdka=Math.min(Math.round((jtysr-400)/r*10000*10)/10,800000);
gjjdkb=Math.round(gjjdka*xy*10)/10;
gjjdkc=Math.round(fwzj*fwxz*10)/10;
//obj.ze2.value=gjjdka; //jtysr;
obj.ze2.value=Math.floor(Math.min(gjjdkb,gjjdkc)/10000*10)/10;
zgdk=obj.ze2.value; //��ߴ�����













//�����������ߴ�����

/*
˵��
��ͥ�����룽ס������������½ɴ��½ɴ����+��żס������������½ɴ��½ɴ����

ס�������������a������ͥ�����룭400���µȶ�����»����ÿ��Ԫ�»����Ҳ�����40��Ԫ

���ڸ������õȼ�ΪAAA�ģ�ס�������������b��ס�������������a��130��

���ڸ������õȼ�ΪAA�ģ�ס�������������b��ס�������������a��115��

���ڸ������õȼ������ģ�ס�������������b��ס�������������a

�Է�������Ϊ��Ʒ���ڷ��ģ�ס�������������c�������ܼۡ�90��

�Է�������Ϊ�����ģ�ס�������������c�������ܼۡ�95��

��ߴ�����d��min��b��c��

�ȶ�������ʽ��


�ȶ�𻹿ʽ

���»����=P/��n��12��+����ܶ��I

���У�PΪ�����IΪ�����ʣ�nΪ�������ޡ�


  */

}
function adv_format(value,num)   //��������
    {
    var a_str = formatnumber(value,num);
    var a_int = parseFloat(a_str);
    if (value.toString().length>a_str.length)
        {
        var b_str = value.toString().substring(a_str.length,a_str.length+1)
        var b_int = parseFloat(b_str);
        if (b_int<5)
            {
            return a_str
            }
        else
            {
            var bonus_str,bonus_int;
            if (num==0)
                {
                bonus_int = 1;
                }
            else
                {
                bonus_str = "0."
                for (var i=1; i<num; i++)
                    bonus_str+="0";
                bonus_str+="1";
                bonus_int = parseFloat(bonus_str);
                }
            a_str = formatnumber(a_int + bonus_int, num)
            }
        }
        return a_str
    }
function formatnumber(value,num)    //ֱ��ȥβ
    {
    var a,b,c,i
    a = value.toString();
    b = a.indexOf('.');
    c = a.length;
    if (num==0)
        {
        if (b!=-1)
            a = a.substring(0,b);
        }
    else
        {
        if (b==-1)
            {
            a = a + ".";
            for (i=1;i<=num;i++)
                a = a + "0";
            }
        else
            {
            a = a.substring(0,b+num+1);
            for (i=c;i<=b+num;i++)
                a = a + "0";
            }
        }
    return a
    }
function gjjloan2(obj)
{

  var gryjce;//ס������������½ɴ��
  var poyjce;//��żס������������½ɴ��
  var grjcbl;//�ɴ����
  var pojcbl;//��ż�ɴ����
  var xy; //��������
  var fwzj;//�����ܼ�
  var fwxz;//��������
  var dknx;//������������
  var syhk; //���»����

  var dked;//��Ҫ������
  var hkfs;//���ʽ
  var bxhj; //��Ϣ�ϼ�
  var bxhj2; //��Ϣ�ϼƵȱ���

//�м����
 var gbl;
 var jtysr; //��ͥ������
 var r;//�»���
 var rb;
 var gjjdka;//ס�������������a
 var gjjdkb;//ס�������������b
 var gjjdkc;//ס�������������c


 gryjce=obj.mount2.value;
if(gryjce<=0){
	alert('ס������������½ɴ���Ϊ��,������.');
         obj.mount2.value='';
         obj.mount.focus();
         return;
}

 poyjce=obj.mount3.value;
/*if (obj.jcbl[0].checked==true)
{grjcbl=0.08;}
else {grjcbl=0.1;}

if (obj.p_bl[0].checked==true){pojcbl=0.08;}
else {pojcbl=0.1;}
*/
grjcbl=obj.jcbl.value/100;
pojcbl=obj.p_bl.value/100;
if (obj.xz[0].checked==true){fwxz=0.9;}
else {fwxz=0.8;}

if (obj.xy[0].checked==true){xy=1.15;}
else if(obj.xy[1].checked==true){xy=1.3;}
else {xy=1;}



 fwzj=obj.mount.value;

if(fwzj<=0){alert('�����ܼ۲���Ϊ��,������');
                     obj.mount.value='';return;}

 dknx=Math.round(obj.mount10.value);
//alert(dknx);
if(dknx<=0){alert('�����������޲���Ϊ��,������');
                     obj.mount10.value='';return;}





var bcv=0;
                     if (dknx>5)
                     {
                      bcv=Math.round( 1000000 * l6_30/12 ) / 1000000;
                    }else{
                    	 bcv=Math.round( 1000000 * l1_5/12 ) / 1000000;
                    	}
r=adv_format((10000*bcv*Math.pow(1+bcv,12*dknx))/(Math.pow(1+bcv,12*dknx)-1),2);

jtysr=Math.ceil((gryjce/grjcbl+poyjce/pojcbl)*10)/10;
gjjdka=Math.min(Math.round((jtysr-400)/r*10000*10)/10,800000);
gjjdkb=Math.round(gjjdka*xy*10)/10;
gjjdkc=Math.round(fwzj*fwxz*10)/10;
//obj.ze2.value=gjjdka; //jtysr;
//obj.ze2.value=Math.floor(Math.min(gjjdkb,gjjdkc)/10000*10)/10;

//����2
zgdk=obj.ze2.value; //��ߴ�����

dked=Math.round(obj.need.value*10)/10;

obj.need.value=dked;

if(dked==0){alert('��Ҫ�Ĵ����Ȳ���Ϊ��,������');
                     obj.need.value='';return;}
if(dked<0){alert('����Ĵ����Ȳ�����Ҫ��,������');
                     obj.need.value='';return;}


if(dked>zgdk){alert('���ܸ�����ߴ�����,����������');
                     obj.need.value='';return;}


hkfs=obj.select.value;

if(hkfs==1){
//obj.ze22.value=Math.ceil(dked*r*100)/100;
//==============================modify by xujianfei
var ylv_new ;

if(dknx>=1&&dknx<=5)
ylv_new = l1_5/12;
else
ylv_new = l6_30/12;


var ncm  = parseFloat(ylv_new) + 1;//n����

var dknx_new = dknx*12;



total_ncm = Math.pow(ncm, dknx_new)

obj.ze22.value = Math.round(((dked*10000*ylv_new*total_ncm)/(total_ncm-1))*100)/100;
var pp = Math.round(((dked*10000*ylv_new*total_ncm)/(total_ncm-1))*100)/100;

//=========================================================
gbl=Math.round(Math.ceil(dked*r*100)/100/jtysr*1000)/10;
obj.yj2.value=gbl;
//bxhj=Math.round(r*dked*dknx*12*100)/100;
bxhj = Math.round(pp*dknx*12*100)/100;
obj.lx2.value=bxhj;
}
if (hkfs==2)
{
if (dknx>5)
{
	rb=l6_30*100;
	}else{
		rb=l1_5*100;
		}

syhk=Math.round((dked*10000/(dknx*12)+dked*10000*rb/(100*12))*100)/100;
obj.sfk2.value=syhk;
var yhke; //�»����
var bxhj; //��Ϣ�ϼ�
var dkys; //��������
var sydkze;//��ǰʣ������ܶ�
var yhkbj; //�»����
dkys=dknx*12;
yhkbj=dked*10000/dkys;

yhke=syhk;
sydkze=dked*10000-yhkbj;
bxhj=syhk;
for (var count=2;count<=dkys; ++count)
	{
       		//yhke=Math.round((dked*10000/(dknx*12)+sydkze*rb/(100*12))*100)/100;
		yhke=dked*10000/dkys+sydkze*rb/1200;
		sydkze-=yhkbj;
		bxhj+=yhke;
	}
obj.lx3.value= Math.round(bxhj*100)/100;
}

if (hkfs==3)
{

switch(dknx){//���ɻ���ʽ����ͻ������ձ�,�������ʲ��޸�
	case 1 :  rb=83.04/100; break;
	case 2 :  rb=81.08/100; break;
	case 3 :  rb=79.12/100; break;
	case 4 :  rb=77.16/100; break;
	case 5 :  rb=75.20/100; break;
	case 6 :  rb=73.24/100; break;
	case 7 :  rb=71.28/100; break;
	case 8 :  rb=69.32/100; break;
	case 9 :  rb=67.36/100; break;
	case 10 :  rb=65.40/100; break;
	case 11 :  rb=63.44/100; break;
	case 12 :  rb=61.48/100; break;
	case 13 :  rb=59.52/100; break;
	case 14 :  rb=57.56/100; break;
	case 15 :  rb=55.60/100; break;
	case 16 :  rb=53.64/100; break;
	case 17 :  rb=51.68/100; break;
	case 18 :  rb=49.72/100; break;
	case 19 :  rb=47.76/100; break;
	case 20 :  rb=45.80/100; break;
	case 21 :  rb=43.84/100; break;
	case 22 :  rb=41.88/100; break;
	case 23 :  rb=39.92/100; break;
	case 24 :  rb=37.96/100; break;
	case 25 :  rb=36.00/100; break;
	case 26 :  rb=34.04/100; break;
	case 27 :  rb=32.08/100; break;
	case 28 :  rb=30.12/100; break;
	case 29 :  rb=28.16/100; break;
	case 30 :  rb=26.20/100; break;
}
var yhke; //�»����
var ll;//����
var zhbj;//���һ�ڱ���
zhbj = Math.round(dked*10000*rb*100)/100;
if (dknx<=5)
{
	ll=l1_5/12;
	zdhkll=0.0378/12;
	var total_gjj = Math.pow(zdhkll + 1, dknx*12);
	syhk=Math.ceil(dked*10000*zdhkll*total_gjj/(total_gjj-1));
}
else
{
	ll=l6_30/12;
	zdhkll=0.0423/12;
	var total_gjj = Math.pow(zdhkll + 1, dknx*12-1);
	syhk=Math.ceil((dked*10000-zhbj)*zdhkll*total_gjj/(total_gjj-1)+zhbj*zdhkll);
}
	obj.sfk3.value=syhk;       //��ͻ����
	var zhyqbj=dked*10000;
	var zchlx=0;//�ܳ�����Ϣ
	for (i=1;i<dknx*12 ;i++ )
	{
		zchlx+=Math.round(zhyqbj*ll*100)/100;
		zhyqbj=Math.round((zhyqbj-(syhk-Math.round(zhyqbj*ll*100)/100))*100)/100;
	}
	var sydkze=dked*10000-syhk;
	obj.lx4.value=zhyqbj;    //����ڱ���
	obj.lx5.value=Math.round(zhyqbj*ll*100)/100;
	/*for (i=1;i<dknx*12 ;i++ )
	{
		zchlx+=Math.round((dked*10000-(syhk-Math.round(dked*10000*ll*100)/100))*ll*100)/100;
	}*/
	zchlx+=Math.round(zhyqbj*ll*100)/100;
	obj.lx6.value=Math.round(zchlx*100)/100;
}


//�����������ߴ�����
/*
˵��
��ͥ�����룽ס������������½ɴ��½ɴ����+��żס������������½ɴ��½ɴ����

ס�������������a������ͥ�����룭400���µȶ�����»����ÿ��Ԫ�»����Ҳ�����40��Ԫ

���ڸ������õȼ�ΪAAA�ģ�ס�������������b��ס�������������a��130��

���ڸ������õȼ�ΪAA�ģ�ס�������������b��ס�������������a��115��

���ڸ������õȼ������ģ�ס�������������b��ס�������������a

�Է�������Ϊ��Ʒ���ڷ��ģ�ס�������������c�������ܼۡ�90��

�Է�������Ϊ�����ģ�ס�������������c�������ܼۡ�95��

��ߴ�����d��min��b��c��

�ȶ�������ʽ��

�ȶ�𻹿ʽ

���»����=P/��n��12��+����ܶ��I

���У�PΪ�����IΪ�����ʣ�nΪ�������ޡ� */
}
function gjjloan3(obj)
{
var dkye=0;//����Ҫ���������
var dkzqs=0;//����������
var gdhke=0;//�̶������
var sxhke=0;//���軹���
var sxhky=0; //����Ҫ�Ļ�������
var zhhke=0;//��󻹿��
var zglx=0;//�ܹ���Ϣ
var dylx=0 ; //������Ϣ
var syqs=0;
syqs=Number(obj.lx8_sy.value);
dkye=Number(obj.lx7.value);
if(dkye<=0 || dkye >780000 || isNaN(dkye) )
{
	alert("����������벻��ȷ");
	return;
}
var ll;   //������
if(obj.lx8[1].checked)
{ll=Math.round( 1000000 * l6_30/12 ) / 1000000;}
else
{ll=Math.round( 1000000 * l1_5/12 ) / 1000000;}
/*if(dkzqs<=0 || dkzqs>360 || isNaN(dkzqs))
{
	alert("��������������ȷ!");
	return;
}*/

gdhke=Number(obj.lx9.value);
if( Number(syqs) <= 0  || isNaN(syqs))
{
	alert("��������ȷ��ʣ������!");
	return;
}
if( Number(gdhke) <= 0  || isNaN(gdhke))
{
	alert("��������ȷ�Ĺ̶������!");
	return;
}

var first_lx=Math.round( dkye * ll *100 ) /100 ;
if (first_lx > gdhke)
{alert('�̶������������������Ϣ '+first_lx);obj.lx9.focus();obj.lx9.select();return;}
var yjqs=0;//Math.ceil(dkye/gdhke);
var sxhky=0;
for(var i=1;i<syqs;i++){
     //��Ҫ������+1
     sxhky =sxhky + 1;
     //����һ���µ���Ϣ
     dylx = Math.round( dkye * ll *100 ) /100 ;
     //�ۼ���Ϣ
     zglx = zglx+dylx;
//Math.round ((zglx + dylx) *100) /100 ;

      if (dkye + dylx >= gdhke  )
       {
		  if(dkye + dylx == gdhke)zhhke= dkye +  dylx;
          dkye = Math.round((dkye-( gdhke - dylx ))*100)/100;
//Math.round(  (dkye - ( gdhke - dylx ))*100  ) /100;
       }
      else
       {
	   zhhke= dkye +  dylx;
	   dkye=-1;
        break;
       }

}
if(dkye>0){
	sxhky =sxhky + 1;
	dylx = Math.round( dkye * ll *100 ) /100 ;
	zglx = zglx+dylx;
	zhhke= dkye +  dylx
}


if (sxhky > syqs)
   {
      alert("���벻��ȷ,�����º˶Դ��������¹̶������!"+sxhky);
      return;
   }



    obj.lx10.value=sxhky ;
    obj.lx11.value=Format(zhhke,2);
    obj.lx12.value=Format(zglx,2) ;
      //���ʣ�౾��+��Ϣ< �̶�������   ==> �������  ->����ڻ����
}

//������������
rhb=new Array(440.104,301.103,231.7,190.136,163.753,144.08,129.379,117.991,108.923,101.542,95.425,90.282,85.902,82.133,78.861,75.997,73.473,71.236,69.241,67.455,65.848,64.397,63.082,61.887,60.798,59.802,58.890,58.052,57.282)
yhz=new Array(1.978,2.9344,3.8699,4.7847,5.6794,6.5544,7.4102,8.2472,9.0657,9.8662,10.6491,11.4148,12.1636,12.8959,13.6121,14.3126,14.9977,15.6677,16.3229,16.9637,17.5904,18.2034,18.8028,19.389,19.9624,20.5231,21.0715,21.6078,22.1323)
function chk01()
{
if (parseFloat(document.myform.rg01.value)<4.7)
	alert("--��ȷ����"+parseFloat(document.myform.rg01.value)+"��Ԫ?--"+"\n\n"+"��ô��Ŀǰ�в��߱�����������"+"\n\n"+"������ܻ�����ܳＯ������ʽ�")
if (parseFloat(document.myform.rg01.value)>10000)
	alert("��ȷ��ӵ�г���һ��Ԫ�Ĺ����ʽ�");

}
function chk02()
{
if (parseFloat(document.myform.rg03.value)>parseFloat(document.myform.rg02.value)*0.7)
	{
	alert("��Ԥ�Ƽ�ͥÿ�¿����ڹ���֧���ѳ�����ͥ�������70%��"+"\n\n"+"�Ƿ�ȷ������Ӱ�����������������ѣ�"+"\n\n"+"������40%��"+parseFloat(document.myform.rg02.value)*0.4+"Ԫ������")
	}
}
function chk03()
{
if (document.myform.rg01.value=="")
	alert("����д�ֿ����ڹ������ʽ�")
else
	if (document.myform.rg02.value=="")
			alert("����д�ּ�ͥ������")
	else	
		if (document.myform.rg03.value=="")
			alert("����дԤ�Ƽ�ͥÿ�¿����ڹ���֧��")
	else	
		if (document.myform.rg06.value=="")
			alert("����д���ƻ������ݵ����")
	else
		chk04()

}
function chk03_coop()
{
if (document.myform.rg01.value=="")
	alert("����д�ֿ����ڹ������ʽ�")
else
	if (document.myform.rg02.value=="")
			alert("����д�ּ�ͥ������")
	else	
		if (document.myform.rg03.value=="")
			alert("����дԤ�Ƽ�ͥÿ�¿����ڹ���֧��")
	else	
		if (document.myform.rg06.value=="")
			alert("����д���ƻ������ݵ����")
	else
		chk04_coop()

}
function chk04_coop()
{
    //���ɹ���ķ����ܼ�=����ͥ������-��ͥ�¹̶�֧������( (��1�������ʣ��޻�������)��1  )�£������ʡ���1�������ʣ��޻���������+�����ʽ� 
    var month = parseInt(document.myform.rg04.options[document.myform.rg04.selectedIndex].value);
    var year = parseInt(month/12);
    var lilu=0.00576;
    if(year>5)
    	lilu=0.00594;
    js00=parseFloat(document.myform.rg01.value);//�ֳ���
    js01=parseFloat(document.myform.rg02.value);//������
    js02=parseFloat(document.myform.rg03.value);//��֧��
    js03=parseFloat(document.myform.rg06.value);//���
    
    var d1 = js01-js02;
    var d2 = Math.pow(1 + lilu , month) - 1;
    var d3= lilu * Math.pow(1+lilu,month)
    
    document.myform.rg07.value = Math.round( ((d1 * d2)/d3)+js00 );
    document.myform.rg08.value = parseFloat(document.myform.rg07.value)/js03;
    pl_coop();
}
function chk04()
{
    //���ɹ���ķ����ܼ�=����ͥ������-��ͥ�¹̶�֧������( (��1�������ʣ��޻�������)��1  )�£������ʡ���1�������ʣ��޻���������+�����ʽ� 
    var month = parseInt(document.myform.rg04.options[document.myform.rg04.selectedIndex].value);
    var year = parseInt(month/12);
    var lilu=0.00576;
    if(year>5)
    	lilu=0.00594;
    js00=parseFloat(document.myform.rg01.value);//�ֳ���
    js01=parseFloat(document.myform.rg02.value);//������
    js02=parseFloat(document.myform.rg03.value);//��֧��
    js03=parseFloat(document.myform.rg06.value);//���
    
    var d1 = js01-js02;
    var d2 = Math.pow(1 + lilu , month) - 1;
    var d3= lilu * Math.pow(1+lilu,month)
    
    document.myform.rg07.value = Math.round( ((d1 * d2)/d3)+js00 );
    document.myform.rg08.value = parseFloat(document.myform.rg07.value)/js03;
    pl();
}
function pl_coop() {
    var XmlHttp;
	if(document.all){
	    XmlHttp = new ActiveXObject("Msxml2.XMLHTTP.3.0");
    }else {
        XmlHttp = new XMLHttpRequest();
    }
	XmlHttp.open("get", "/house/web/newhouse_calculateTool_projList.php?s="+Math.random()+"&type=coop&city="+encodeURIComponent($('abcity').value)+"&price=" + Math.round(document.myform.rg08.value), false);
	XmlHttp.send(null);
	if(XmlHttp.status == 200){
		$('projList').innerHTML = XmlHttp.responseText;
	}
}
function pl(){
	var XmlHttp;
	if(document.all){
	    XmlHttp = new ActiveXObject("Msxml2.XMLHTTP.3.0");
    }else {
        XmlHttp = new XMLHttpRequest();
    }
	XmlHttp.open("get", "/house/web/newhouse_calculateTool_projList.php?s="+Math.random()+"&city="+encodeURIComponent($('abcity').value)+"&price=" + Math.round(document.myform.rg08.value), false);
	XmlHttp.send(null);
	if(XmlHttp.status == 200){
		$('projList').innerHTML = XmlHttp.responseText;
	}
}
function closeCityList() {
	if($('searchExpert2').style.display!="none") $('searchExpert2').style.display='none';
}
function ChangeCity(city) {$('abcity').value=city;$('showcity').innerHTML=city;closeCityList()}


/*
*
*/
function gjjloan_write(obj)
{
    var gryjce;//ס������������½ɴ��
    var poyjce;//��żס������������½ɴ��
    var grjcbl;//�ɴ����
    var pojcbl;//��ż�ɴ����
    var xy; //��������
    var fwzj;//�����ܼ�
    var fwxz;//��������
    var dknx;//������������
    var syhk; //���»����
    
    var dked;//��Ҫ������
    var hkfs;//���ʽ
    var bxhj; //��Ϣ�ϼ�
    var bxhj2; //��Ϣ�ϼƵȱ���

    //�м����
     var gbl;
     var jtysr; //��ͥ������
     var r;//�»���
     var rb;
     var gjjdka;//ס�������������a
     var gjjdkb;//ס�������������b
     var gjjdkc;//ס�������������c


    gryjce=obj.mount2.value;
    if(gryjce<=0){
        alert('ס������������½ɴ���Ϊ��,������.');
        obj.mount2.value='';
        obj.mount.focus();
        return;
    }

    poyjce=obj.mount3.value;
    grjcbl=obj.jcbl.value/100;
    pojcbl=obj.p_bl.value/100;
    if (obj.xz[0].checked==true){fwxz=0.9;}
    else {fwxz=0.8;}
    
    if (obj.xy[0].checked==true){xy=1.15;}
    else if(obj.xy[1].checked==true){xy=1.3;}
    else {xy=1;}

    fwzj=obj.mount.value;

    if(fwzj<=0){
        alert('�����ܼ۲���Ϊ��,������');
        obj.mount.value='';return;
    }

    dknx=Math.round(obj.mount10.value);
    if(dknx<=0){
        alert('�����������޲���Ϊ��,������');
        obj.mount10.value='';return;
    }

    var bcv=0;
    if (dknx>5)
    {
        bcv=Math.round( 1000000 * l6_30/12 ) / 1000000;
    }else{
        bcv=Math.round( 1000000 * l1_5/12 ) / 1000000;
    }
    r=adv_format((10000*bcv*Math.pow(1+bcv,12*dknx))/(Math.pow(1+bcv,12*dknx)-1),2);
    
    jtysr=Math.ceil((gryjce/grjcbl+poyjce/pojcbl)*10)/10;
    gjjdka=Math.min(Math.round((jtysr-400)/r*10000*10)/10,800000);
    gjjdkb=Math.round(gjjdka*xy*10)/10;
    gjjdkc=Math.round(fwzj*fwxz*10)/10;

    zgdk=obj.ze2.value; //��ߴ�����

    dked=Math.round(obj.need.value*10)/10;

    obj.need.value=dked;

    if(dked==0){alert('��Ҫ�Ĵ����Ȳ���Ϊ��,������');
                     obj.need.value='';return;}
    if(dked<0){alert('����Ĵ����Ȳ�����Ҫ��,������');
                     obj.need.value='';return;}


    if(dked>zgdk){alert('���ܸ�����ߴ�����,����������');
                     obj.need.value='';return;}


    hkfs=obj.select.value;//���ʽ
    
    if(hkfs==1)
    {
        var ylv_new ;
        if(dknx>=1&&dknx<=5)
            ylv_new = l1_5/12;
        else
            ylv_new = l6_30/12;
        
        var ncm  = parseFloat(ylv_new) + 1;//n����
        var dknx_new = dknx*12;
        
        total_ncm = Math.pow(ncm, dknx_new)
        
        obj.ze22.value = Math.round(((dked*10000*ylv_new*total_ncm)/(total_ncm-1))*100)/100;
        var pp = Math.round(((dked*10000*ylv_new*total_ncm)/(total_ncm-1))*100)/100;
        
        gbl=Math.round(Math.ceil(dked*r*100)/100/jtysr*1000)/10;
        obj.yj2.value=gbl;
        bxhj = Math.round(pp*dknx*12*100)/100;
        obj.lx2.value=bxhj;
        show(1);
    }
    if (hkfs==2)
    {
        if (dknx>5)
        {
    	    rb=l6_30*100;
    	}else{
    		rb=l1_5*100;
        }
    
        syhk=Math.round((dked*10000/(dknx*12)+dked*10000*rb/(100*12))*100)/100;
        obj.sfk2.value=syhk;
        var yhke; //�»����
        var bxhj; //��Ϣ�ϼ�
        var dkys; //��������
        var sydkze;//��ǰʣ������ܶ�
        var yhkbj; //�»����
        dkys=dknx*12;
        yhkbj=dked*10000/dkys;
    
        yhke=syhk;
        sydkze=dked*10000-yhkbj;
        bxhj=syhk;
        for (var count=2;count<=dkys; ++count)
    	{
    		yhke=dked*10000/dkys+sydkze*rb/1200;
    		sydkze-=yhkbj;
    		bxhj+=yhke;
    	}
        obj.lx3.value= Math.round(bxhj*100)/100;
        show(2);
    }
    if (hkfs==3)
    {
    
        switch(dknx){//���ɻ���ʽ����ͻ������ձ�,�������ʲ��޸�
        	case 1 :  rb=83.04/100; break;
        	case 2 :  rb=81.08/100; break;
        	case 3 :  rb=79.12/100; break;
        	case 4 :  rb=77.16/100; break;
        	case 5 :  rb=75.20/100; break;
        	case 6 :  rb=73.24/100; break;
        	case 7 :  rb=71.28/100; break;
        	case 8 :  rb=69.32/100; break;
        	case 9 :  rb=67.36/100; break;
        	case 10 :  rb=65.40/100; break;
        	case 11 :  rb=63.44/100; break;
        	case 12 :  rb=61.48/100; break;
        	case 13 :  rb=59.52/100; break;
        	case 14 :  rb=57.56/100; break;
        	case 15 :  rb=55.60/100; break;
        	case 16 :  rb=53.64/100; break;
        	case 17 :  rb=51.68/100; break;
        	case 18 :  rb=49.72/100; break;
        	case 19 :  rb=47.76/100; break;
        	case 20 :  rb=45.80/100; break;
        	case 21 :  rb=43.84/100; break;
        	case 22 :  rb=41.88/100; break;
        	case 23 :  rb=39.92/100; break;
        	case 24 :  rb=37.96/100; break;
        	case 25 :  rb=36.00/100; break;
        	case 26 :  rb=34.04/100; break;
        	case 27 :  rb=32.08/100; break;
        	case 28 :  rb=30.12/100; break;
        	case 29 :  rb=28.16/100; break;
        	case 30 :  rb=26.20/100; break;
        }
        var yhke; //�»����
        var ll;//����
        var zhbj;//���һ�ڱ���
        zhbj = Math.round(dked*10000*rb*100)/100;
        if (dknx<=5)
        {
        	ll=l1_5/12;
        	zdhkll=0.0378/12;
        	var total_gjj = Math.pow(zdhkll + 1, dknx*12);
        	syhk=Math.ceil(dked*10000*zdhkll*total_gjj/(total_gjj-1));
        }
        else
        {
        	ll=l6_30/12;
        	zdhkll=0.0423/12;
        	var total_gjj = Math.pow(zdhkll + 1, dknx*12-1);
        	syhk=Math.ceil((dked*10000-zhbj)*zdhkll*total_gjj/(total_gjj-1)+zhbj*zdhkll);
        }
    	obj.sfk3.value=syhk;       //��ͻ����
    	var zhyqbj=dked*10000;
    	var zchlx=0;//�ܳ�����Ϣ
    	for (i=1;i<dknx*12 ;i++ )
    	{
    		zchlx+=Math.round(zhyqbj*ll*100)/100;
    		zhyqbj=Math.round((zhyqbj-(syhk-Math.round(zhyqbj*ll*100)/100))*100)/100;
    	}
    	var sydkze=dked*10000-syhk;
    	obj.lx4.value=zhyqbj;    //����ڱ���
    	obj.lx5.value=Math.round(zhyqbj*ll*100)/100;
    	
    	zchlx+=Math.round(zhyqbj*ll*100)/100;
    	obj.lx6.value=Math.round(zchlx*100)/100;
    	show(3);
    }
}
function show(nid) {
    for(i=1;i<4;i++) {
        var oid="re_inner_" + i;
        if(i==nid)
            document.getElementById(oid).style.display="";
        else
            document.getElementById(oid).style.display="none";
    }    
}