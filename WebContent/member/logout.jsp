<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
request.setCharacterEncoding("UTF-8");
%>

<h1>로그아웃</h1>
<%
session.invalidate();
%>
로그아웃되었습니다.	






<%@include file ="../include/footer.jsp" %>