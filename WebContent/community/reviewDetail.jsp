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
MemberDto sdto = (MemberDto)session.getAttribute("loginuser");
boolean logincheck= true;
if(sdto == null ){
	logincheck = false;
}
///String loginuser = mdto.getId();
//System.out.println("id : "+ loginuser);
%>

<%
String title = request.getParameter("title");
String sre_pageNum = request.getParameter("re_pageNum");
System.out.println("sre_pageNum은 " + sre_pageNum);
int re_pageNum = Integer.parseInt(sre_pageNum);
//System.out.println("title은 " + title);
//System.out.println("re_pageNum은 " + re_pageNum);


int allRe_Contents = (int)request.getAttribute("allRe_Contents");
System.out.println("allRe_Contents는 " + allRe_Contents);

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
				<%=dto.getStar() %>/5
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
			<% if(logincheck){ %>
				<a href="/AgencyBgencyy/likeadd?title=<%=title %>&writerid=<%=dto.getId() %>&sessionid=<%=sdto.getId() %>&re_pageNum=<%=i %>" onclick="reload()"><img src="/AgencyBgencyy/community/LIKE.jpg" width="20" height="20"> 좋아요</a> :<%=dto.getLike_number() %>	/
				<a href="/AgencyBgencyy/dislikeadd?title=<%=title %>&writerid=<%=dto.getId() %>&sessionid=<%=sdto.getId() %>&re_pageNum=<%=i %>" onclick="reload()"><img src="/AgencyBgencyy/community/DISLIKE.jpg" width="20" height="20"> 싫어요</a> :<%=dto.getDislike_number() %>
				<%
			} else{
				%>
				 <img src="/AgencyBgencyy/community/LIKE.jpg" width="20" height="20"> 좋아요 :<%=dto.getLike_number() %>	/
				<img src="/AgencyBgencyy/community/DISLIKE.jpg" width="20" height="20"> 싫어요 :<%=dto.getDislike_number() %>
				 
				 <%
			}
			%>
			
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

<script>
function reload() {
	location.reload();
}
</script>




<%@include file ="../include/footer.jsp" %>