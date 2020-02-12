<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String durl = request.getServletPath();  
// exhibit
if (durl.substring(8).contains("/exhibit")){
%>
<div class="depth02">
	<a href="/AgencyBgencyy/exhibitlist?choice=past" id="past">지난전시</a>
	<a href="/AgencyBgencyy/exhibitlist" id="now" class="active">현재전시</a>
	<a href="/AgencyBgencyy/exhibitlist?choice=fut" id="future">예정전시</a>
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
	href="/AgencyBgencyy/showReviewList?pageNum=0">리뷰보기</a>
</div>
<%
}	
%>	

<!-- community -->
<% 
if (durl.contains("mypage")){
	MemberDto mem = (MemberDto)session.getAttribute("loginuser");
%>
<div class="depth02 mypageDepth">
	<a class="${pageContext.request.requestURI eq '/AgencyBgencyy/mypage/mypage.jsp' ? ' active' : ''}"
	href="/AgencyBgencyy/mypage/mypage.jsp">회원정보
	</a>
	<a class="${pageContext.request.requestURI eq '/AgencyBgencyy/mypage/myexhibit.jsp' ? ' active' : ''}"
	href="/AgencyBgencyy/mypage/myexhibit.jsp">관람한 전시
	</a>
	<a class="${pageContext.request.requestURI eq '/AgencyBgencyy/mypage/myreview.jsp' ? ' active' : ''}"
	href="/AgencyBgencyy/mypage/myreview.jsp">나의 리뷰
	</a>
	<a class="${pageContext.request.requestURI eq '/AgencyBgencyy/mypage/myreserv.jsp' ? ' active' : ''}"
	href="/AgencyBgencyy/mypage/myreserv.jsp">나의 예매내역
	</a>
	<%
	if(mem.getAuth() != 0){
	%>
		<a class="${pageContext.request.requestURI eq '/AgencyBgencyy/mypage/curatordetail.jsp' ? ' active' : ''}"
		href="/AgencyBgencyy/mypage/curatordetail.jsp">나의 전시
		</a>
		<a class="${pageContext.request.requestURI eq '/AgencyBgencyy/mypage/curatorwrite.jsp' ? ' active' : ''}"
		href="/AgencyBgencyy/mypage/curatorwrite.jsp">전시 등록하기
		</a>
	<%	
	}
	%>
	
</div>

<script src=""></script>
<%
}	
%>	