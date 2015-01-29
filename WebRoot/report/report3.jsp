<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<html>
    <body>
        <Script Language="JavaScript">
           document.getElementById('reportFrame').src="${path}/ReportServer?reportlet=report3.cpt&deptUid=${curDept.uid}&userName="+cjkEncode('${curUser.userName}');
        </Script>
        <iframe id="reportFrame" width="100%" height="100%"></iframe>  
    </body>
</html>
