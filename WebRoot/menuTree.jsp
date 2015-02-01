<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lxq.platform.util.ServletUtil"%>    
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String menuType = request.getParameter("menuType");

	String jsonString = null; 
	
	if(menuType.equals("report")){
		
		if (ServletUtil.getCurDept().getLevel().getValue().equals("1") || ServletUtil.getCurUser().hasRole("102")){
			jsonString = 
				"["+
					"{id:'report1',text:'部门汇总表',url:'/report/report1.jsp',jsonObject:'',leaf:true,cls:'file',children:[]},"+
				    "{id:'report2',text:'全局明细表',url:'/report/report2.jsp',jsonObject:'',leaf:true,cls:'file',children:[]},"+
				    "{id:'report3',text:'部门明细表',url:'/report/report3.jsp',jsonObject:'',leaf:true,cls:'file',children:[]}"+
				"]";
		}else{
			jsonString = 
				"["+
				    "{id:'report3',text:'部门明细表',url:'/report/report3.jsp',jsonObject:'',leaf:true,cls:'file',children:[]}"+
				"]";
		}
	} 	
	
	out.print(jsonString != null?jsonString:"");
%>

