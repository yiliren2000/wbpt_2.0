<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String menuType = request.getParameter("menuType");

	String jsonString = null; 
	
	if(menuType.equals("test")){
		jsonString = 
			"["+
				"{id:1,text:'南坪分店',url:'/userManage/department.jsp',jsonObject:\"{level:1}\",leaf:false,children:[]},"+
			    "{id:2,text:'北碚分店',url:'/userManage/department.jsp',jsonObject:\"{level:1}\",leaf:true}"+
			"]";
	} 	

	out.print(jsonString != null?jsonString:"");
%>

