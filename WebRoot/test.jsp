<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data = "<?xml version='1.0' encoding='UTF-8'?><Packet type='RESPONSE' version='1.0'><Head><RequestType>B04S010002</RequestType><ResponseCode>1</ResponseCode><ErrorCode>0000000000</ErrorCode><ErrorMessage>成功</ErrorMessage><BusinessNo>2</BusinessNo><TransDate>2014-09-24</TransDate><TransTime>08:30:26</TransTime></Head><Body></Body></Packet>";
	out.print(data);
%>