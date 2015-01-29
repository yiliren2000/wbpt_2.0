function Get_Cookie( name ) {
	var start = document.cookie.indexOf( name + "=" );
	var len = start + name.length + 1;
	if ( ( !start ) && ( name != document.cookie.substring( 0, name.length ) ) )
	{
		return null;
	}
	if ( start == -1 ) return null;
	var end = document.cookie.indexOf( ";", len );
	if ( end == -1 ) end = document.cookie.length;
	return unescape( document.cookie.substring( len, end ) );
}

function Set_Cookie( name, value, expires, path, domain, secure ) {
	// set time, it's in milliseconds
	var today = new Date();
	today.setTime( today.getTime() );
	document.cookie = name + "=" +escape( value ) +
	( ( expires ) ? ";expires=" + expires.toGMTString() : "" ) + //expires.toGMTString()
	( ( path ) ? ";path=" + path : "" ) +
	( ( domain ) ? ";domain=" + domain : "" ) +
	( ( secure ) ? ";secure" : "" );
}

// this deletes the cookie when called
function Delete_Cookie( name, path, domain ) {
	if ( Get_Cookie( name ) ) document.cookie = name + "=" +
	( ( path ) ? ";path=" + path : "") +
	( ( domain ) ? ";domain=" + domain : "" ) +
	";expires=Thu, 01-Jan-1970 00:00:01 GMT";
}
function changeAd(divname,cookiename,adname,adnum,adheight,adwidth)
{
	//debugger;
	var tdate = new Date(); // ��ʼ�����ڶ���
	tdate.setHours(tdate.getHours()+ 1);

	var ad_id = Get_Cookie(cookiename);
	
	if (ad_id==null)
	{
		Set_Cookie(cookiename,"1",tdate,"/","soufun.com","");
	}
	else
	{
		ad_id=Number(ad_id)+1;
		if(ad_id>adnum)
		{
			Set_Cookie(cookiename,"1",tdate,"/","soufun.com","");
		}
		else
		{
			Set_Cookie(cookiename,ad_id,tdate,"/","soufun.com","");
		}
	}

	ad_id = Get_Cookie(cookiename);
	var cid=Number(ad_id);
	for (var i=1;i<=adnum;i++)
	{
		var tlad=document.getElementById(divname+i);
		tlad.src=adname[(cid+i-1)%adnum];		
		tlad.height=adheight;
		tlad.width=adwidth;
		//alert((cid+i-1)%adnum);
		//alert(tlad.HEIGHT);
		//alert(tlad.WIDTH);
	}
}

function change_lb_ad(divname,cookiename,adname,adnum,adheight,adwidth)
{
	//debugger;
	var tdate = new Date(); // ��ʼ�����ڶ���
	tdate.setHours(tdate.getHours()+ 1);

	//////

	

	//alert(t);
	//////
	var ad_id = Get_Cookie(cookiename);
	if (ad_id==null)
	{
		var t;
		t=Math.random();
	
		if(t>0.5)
		{
			t=1;
		}
		else
		{
			t=0;
		}
		Set_Cookie(cookiename,t,tdate,"/","soufun.com","");
	}
	else
	{
		
		ad_id=Number(ad_id)+1;
		if(ad_id>adnum)
		{
			ad_id = 0;
			Set_Cookie(cookiename,ad_id,tdate,"/","soufun.com","");
		}
		else
		{
			Set_Cookie(cookiename,ad_id,tdate,"/","soufun.com","");
		}
	}

	ad_id = Get_Cookie(cookiename);
	var cid=Number(ad_id);
	var tlad=document.getElementById(divname);	
	tlad.src=adname[cid];		
	tlad.height=adheight;
	tlad.width=adwidth;
	//alert(cid);
	//alert(tlad.HEIGHT);
	//alert(tlad.WIDTH);
}
