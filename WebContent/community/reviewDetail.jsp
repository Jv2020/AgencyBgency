<%@page import="CYH.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="CYH.ReviewDao"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/AgencyBgencyy/community/css/reviewDetail.css">

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
String title = request.getParameter("title");
String sre_pageNum = request.getParameter("re_pageNum");
int re_pageNum = Integer.parseInt(sre_pageNum);
//System.out.println("title은 " + title);
//System.out.println("re_pageNum은 " + re_pageNum);


int allRe_Contents = (int)request.getAttribute("allRe_Contents");
System.out.println("allRe_Contents는 " + allRe_Contents);

/* String sallRe_Contents = (String)request.getAttribute("allRe_Contents");
int allRe_Contents = Integer.parseInt(sallRe_Contents);
System.out.println("allRe_Contents는 " + allRe_Contents); */

int pages = (int)Math.ceil(allRe_Contents/ 5.0);
%>

<h1 style="text-align: center"><b><%=title %>에 대한 전체 리뷰</b></h1>

<%


List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("dtolist");

// 확인용
// System.out.println("list.size()는" + list.size());

for(int i = 0; i < list.size(); i++) {
	ReviewDto dto = list.get(i);
%>
<div class="reviewBox">
	<div class="reviewTit">
		<ul>
			<li>
				<%=dto.getTitle() %>
			</li>
			<li>
				<div class='starrr' id='star1'></div> <%=dto.getStar() %>
			</li>
		</ul>
	</div>
	<div class="reviewCont">
		<ul class="">
			<li>
				<%=dto.getReview() %>
			</li>
		</ul>
	</div>
	<div class="reviewBtm">
		<ul class="clfix">
			<li>
				<%=dto.getId() %>
			</li>
			<li>
				<%=dto.getRegdate() %>
			</li>
			<li>
				<a href="/AgencyBgencyy/likeadd"><img src="/AgencyBgencyy/community/LIKE.jpg?id=<%=loginuser %>" width="20" height="20"> 좋아요</a> :<%=dto.getLike_number() %>	/
				<a href="/AgencyBgencyy/dislikeadd"><img src="/AgencyBgencyy/community/DISLIKE.jpg?id=<%=loginuser %>" width="20" height="20"> 싫어요</a> :<%=dto.getDislike_number() %>
			</li>
		</ul>
	</div>
</div><!-- //reviewBox -->
<%
}
%>

<div style="text-align: center">
<%
for(int i = 0; i < pages; i++) {
	if(i == re_pageNum) {
		%>
		<span><b><%=i + 1 %></b></span>
		<%
	}else {
		%>
		<span><a href="/AgencyBgencyy/onereview?title=<%=title %>&re_pageNum=<%=i %>">[<%=i + 1 %>]</a></span>
		<%
	}
	 %>

<%
}
%>
</div>







<%@include file ="../include/footer.jsp" %>