<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
request.setCharacterEncoding("UTF-8");
%>


<%
session.invalidate();
%>
<script>
	alert("정상적으로 로그아웃되었습니다.");
	location.href="<%=request.getContextPath()%>/mainEntrance";
</script>
	






<%@include file ="../include/footer.jsp" %>