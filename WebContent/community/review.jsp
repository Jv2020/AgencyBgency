<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
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
String spageNum = request.getParameter("pageNum");	// 
//System.out.println("pageNum은 " + spageNum);
int pageNum = Integer.parseInt(spageNum);


int allContents = (int)request.getAttribute("allContents");
//int allContents = Integer.parseInt();
System.out.println("allcontents는 " + allContents);

int pages = (int)Math.ceil(allContents / 5.0);	// 전체 페이지수를 pages에 담았어

%>

<%
List<ExhibitDto> list = (List<ExhibitDto>)request.getAttribute("list");

System.out.println("list.size()는 " + list.size());
	
for(int i = 0; i < list.size(); i++) {
	ExhibitDto dto = list.get(i);
	String begindate = dto.getBegindate().substring(0,11);
	String enddate = dto.getEnddate().substring(0,11);
%>

	<div class="re-layout clfix">	
		<div class="reviewImg"><a href="<%=request.getContextPath() %>/onereview?title=<%=dto.getTitle() %>&re_pageNum=0"><img src="https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586" alt=""></a></div>
		<div class="content">
			<p><span>제 목</span><a href="<%=request.getContextPath() %>/onereview?title=<%=dto.getTitle() %>&re_pageNum=0"><%=dto.getTitle() %></a></p>
			<p><span>장 소</span><%=dto.getPlace() %></p>
			<p><span>날 짜</span><%=dto.getBegindate().substring(0, 10)+" ~ "+ dto.getEnddate().substring(0, 10) %></p>
		</div>	
	</div>
<%
}
%>

<div style="text-align: center">
	<%
	for(int i = 0; i < pages; i++) {
		if(i == pageNum) {
			%>
			<span><b><%=i + 1 %></b></span>
			<%
		}
		else{
			%>
			<span><a href="/AgencyBgencyy/showReviewList?pageNum=<%=i %>">[<%=i + 1 %>]</a></span>
			<%
		}
		
	}
	 %>
</div>











































<%@include file ="../include/footer.jsp" %>