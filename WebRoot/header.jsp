<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="com.lxq.platform.util.DateUtil"%>

<%
	pageContext.setAttribute("pageId",DateUtil.getNowTime("yyyy_MM_dd_HH_mm_ss_SSS"));
%>	