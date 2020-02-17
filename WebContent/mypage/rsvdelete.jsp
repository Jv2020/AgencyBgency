<%@page import="KEC.reserv.dto.ReservDto"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<script>
	alert("예매 취소되었습니다.");
	location.href="<%=request.getContextPath()%>/reservelist"
</script>


<%@include file ="../include/footer.jsp" %>		