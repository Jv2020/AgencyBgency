<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if(int i = 0 ; i < exhibitDtomap.get("title"))
Map<String, Object> exhibitDtomap = (Map<String, Object>)request.getAttribute("exhibitDtolist");
System.out.println(exhibitDtomap.get("title").toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>