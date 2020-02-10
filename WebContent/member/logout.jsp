<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
request.setCharacterEncoding("UTF-8");
%>

<h1>로그아웃</h1>
<%
session.invalidate();
%>
<script>
	alert("정상적으로 로그아웃되었습니다.");
	location.href="<%=request.getContextPath()%>/main/main.jsp"
</script>
	






<%@include file ="../include/footer.jsp" %>