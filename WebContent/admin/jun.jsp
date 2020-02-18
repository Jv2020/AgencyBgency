<%@page import="KSJ.files.dto.FilesDto"%>
<%@page import="java.util.List"%>
<%@page import="BJH.notice.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	request.setCharacterEncoding("utf-8");
	String name = (String)request.getAttribute("id");
	String title = (String)request.getAttribute("title");
	String content = (String)request.getAttribute("content");
	int schoice = (Integer)request.getAttribute("choice");
	String fileName = (String)request.getAttribute("fileName");
	String originName = (String)request.getAttribute("originName");
%>
<ul>
	<li><%=name %></li>
	<li><%=title %></li>
	<li><%=content %></li>
	<li><%=schoice %></li>
	<li><%=fileName %></li>
	<li><%=originName %></li>
	
	<%
	
	%>
	
	<li><a href="<%=request.getContextPath() %>/file/chrome8.exe">크롬파일</a></li>
</ul>


System