<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String durl = request.getServletPath();  
// System.out.println(durl);
// exhibit
if (durl.contains("exhibit.jsp")){
%>
<div class="depth02">
	<a href="#">지난전시</a>
	<a href="#" class="active">현재전시</a>
	<a href="#">예정전시</a>
</div>
<%
}	
%>

<!-- community -->
<% 
if (durl.contains("community")){
%>
<div class="depth02">
	<a class="${pageContext.request.requestURI eq '/AgencyBgencyy/community/notice.jsp' ? ' active' : ''}"
	href="/AgencyBgencyy/community/notice.jsp">공지사항
	</a>
	<a class="${pageContext.request.requestURI eq '/AgencyBgencyy/community/faq.jsp' ? ' active' : ''}"
	href="/AgencyBgencyy/community/faq.jsp">FAQ</a>
	<a class="${pageContext.request.requestURI eq '/AgencyBgencyy/community/review.jsp' ? ' active' : ''}"
	href="/AgencyBgencyy/community/review.jsp">리뷰보기</a>
</div>
<%
}	
%>	