<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/AgencyBgencyy/community/css/review.css">

<%
// 로그인 세션
String loginuser = (String)session.getAttribute("loginuser");
boolean logincheck = false;

// 로그인 여부 확인하기
if(loginuser != null){
	logincheck= true;
}
System.out.println("id : "+ logincheck);
%>

<%

%>




<div class="re-layout clfix">	
	<div class="reviewImg"><img src="https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586" alt=""></div>
	<div class="content">
		<p><span>제 목</span><a href="reviewDetail.jsp?">asdfdsf</a></p>
		<p><span>장 소</span>afdsadfasfdafd</p>
		<p><span>날 짜</span>afsafdaf</p>
	</div>	
</div>















































<%@include file ="../include/footer.jsp" %>