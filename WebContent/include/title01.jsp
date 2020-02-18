<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ifurl = request.getServletPath();  //프로젝트의 경로값만 가져옴
 System.out.println(ifurl);

if (ifurl.contains("aboutus.jsp")){
%>
<h2>ABOUT US</h2>
<%
}	
%>

<!-- exhibit -->
<% 
if (ifurl.substring(8).contains("/exhibit")){
%>
<h2 id="ex-title" >현재전시</h2>
<%
}else{%>
	<h2 id="ex-title"></h2>
<%
}
%>		

<!-- schedule -->
<% 
if (ifurl.contains("schedule.jsp")){
%>
<h2>SCHEDULE</h2>
<%
}	
%>	

<!-- community -->
<% 
if (ifurl.contains("faq.jsp")){
%>
<h2>FAQ</h2>
<%
}	
%>	

<% 
if (ifurl.contains("notice.jsp")){
%>
<h2>NOTICE</h2>
<%
}	
%>	

<% 
if (ifurl.contains("/review.jsp")){
%>
<h2>리뷰보기</h2>
<%
}	
%>	

<!-- member -->
<% 
if (ifurl.contains("login.jsp")){
%>
<h2>LOGIN</h2>
<%
}	
%>

<% 
if (ifurl.contains("join.jsp")){
%>
<h2>JOIN</h2>
<%
}	
%>

<% 
if (ifurl.contains("findid.jsp")){
%>
<h2>아이디 찾기</h2>
<%
}	
%>

<% 
if (ifurl.contains("findpassword.jsp")){
%>
<h2>비밀번호 찾기</h2>
<%
}	
%>

<!-- Reservation -->
<% 
if (ifurl.contains("/reserv.jsp")){
%>
<h2>예매하기</h2>
<%
}   
%>

<% 
if (ifurl.contains("/reservConfirm.jsp")){
%>
<h2>결제 완료</h2>
<%
} 
%>
<!-- Mypage -->
<% 
if (ifurl.contains("/myexhibit.jsp")){
%>
<h2>관람한 전시</h2>
<%
}   
%>

<% 
if (ifurl.contains("/myreview.jsp")){
%>
<h2>나의 리뷰</h2>
<%
}   
%>

<% 
if (ifurl.contains("/rsvConfirm.jsp")){
%>
<h2>예매내역</h2>
<%
}   
%>

<% 
if (ifurl.contains("myreserv.jsp")){
%>
<h2>나의 예매내역</h2>
<%
}   
%>

<% 
if (ifurl.contains("rsvwrite.jsp")){
%>
<h2>예매정보 수정</h2>
<%
}   
%>

<% 
if (ifurl.contains("mypage.jsp")){
%>
<h2>회원정보</h2>
<%
}   
%>

<% 
if (ifurl.contains("memupdate.jsp")){
%>
<h2>회원정보 수정</h2>
<%
}   
%>

<% 
if (ifurl.contains("memdelete.jsp")){
%>
<h2>회원 탈퇴</h2>
<%
}   
%>

<!-- Mypage 큐레이터 -->
<% 
if (ifurl.contains("curatorexhibitlist.jsp")){
%>
<h2>나의 전시</h2>
<%
}   
%>

<% 
if (ifurl.contains("curatorwrite.jsp")){
%>
<h2>전시등록하기</h2>
<%
}   
%>
<% 
if (ifurl.contains("curatorwriteDetail.jsp")){
%>
<h2>상세보기</h2>
<%
}   
%>
	
<!-- 메뉴 검색 -->
<% 
if (ifurl.contains("mainSearch.jsp")){
%>
<h2>검색 결과</h2>
<%
}   
%>


