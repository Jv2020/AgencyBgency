<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<%
session.invalidate();
%>





<script>
	alert("그동안 이용해 주셔서 감사합니다.");
	location.href="<%=request.getContextPath()%>/main/main.jsp"
</script>





<%@include file ="../include/footer.jsp" %>		