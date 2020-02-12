<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<%
MemberDto mem = (MemberDto)session.getAttribute("loginuser");
System.out.println("딜리트멤버: "+mem.getId());
%>


<p>회원탈퇴가 완료되었습니다.</p>




<%@include file ="../include/footer.jsp" %>		