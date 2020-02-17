<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

Map<String, List<ExhibitDto>> exhibitDtomap = (Map<String, List<ExhibitDto>>)request.getAttribute("exhibitDtolist");
System.out.println("제목"+exhibitDtomap.get("title").get(0).getTitle());
System.out.println("내용"+exhibitDtomap.get("content").get(0).getTitle());


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