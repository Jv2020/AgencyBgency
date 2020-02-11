<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String lourl = request.getServletPath();  //프로젝트의 경로값만 가져옴
// System.out.println(ifurl);

if (lourl.contains("aboutus.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>ABOUT US</span>
</div>
<%
}	
%>

<!-- exhibit -->
<% 
if (lourl.contains("/exhibit")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>EXHIBIT</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span id="loc_depth02">현재전시</span>
</div>
<%
}	
%>


<!-- schedule -->
<% 
if (lourl.contains("/schedule.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>SCHEDULE</span>
</div>
<%
}	
%>	

<!-- community -->
<% 
if (lourl.contains("/notice.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>COMMUNITY</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>공지사항</span>
</div>
<%
}	
%>

<% 
if (lourl.contains("/faq.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>COMMUNITY</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>자주하는 질문</span>
</div>
<%
}	
%>	

<% 
if (lourl.contains("/review.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>COMMUNITY</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>리뷰보기</span>
</div>
<%
}	
%>	


<!-- member -->
<% 
if (lourl.contains("/login.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MEMBER</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>LOGIN</span>
</div>
<%
}	
%>	

<% 
if (lourl.contains("/join.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MEMBER</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>회원가입</span>
</div>
<%
}	
%>	

<!-- Reservation -->
<% 
if (lourl.contains("/reserv.jsp")){
%>
<div class="location">
   <span>HOME</span>
   <img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
   <span>RESERVATION</span>
   <img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
   <span>예매하기</span>
</div>
<%
}   
%>

<!-- mypage -->
<% 
if (lourl.contains("/mypage.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MYPAGE</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>회원정보</span>
</div>
<%
}	
%>

<% 
if (lourl.contains("/myexhibit.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MYPAGE</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>관람한 전시</span>
</div>
<%
}	
%>

<% 
if (lourl.contains("/myreview.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MYPAGE</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>나의리뷰</span>
</div>
<%
}	
%>

<% 
if (lourl.contains("/myreserv.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MYPAGE</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>나의 예매내역</span>
</div>
<%
}	
%>

<% 
if (lourl.contains("/memupdate.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MYPAGE</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>회원정보수정</span>
</div>
<%
}	
%>

<% 
if (lourl.contains("/memdelete.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MYPAGE</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>회원탈퇴</span>
</div>
<%
}	
%>




<!-- mypage 큐레이터 -->
<% 
if (lourl.contains("/curatordetail.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MYPAGE</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>나의전시</span>
</div>
<%
}	
%>

<% 
if (lourl.contains("/curatorwrite.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>MYPAGE</span>
	<img src="${pageContext.request.contextPath}/images/sub/lo_arrow.jpg" alt=">">
	<span>전시등록하기</span>
</div>
<%
}	
%>