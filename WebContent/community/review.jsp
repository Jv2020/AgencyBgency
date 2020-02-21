<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<%
String spageNum = request.getParameter("pageNum");
//System.out.println("pageNum은 " + spageNum);
int pageNum = Integer.parseInt(spageNum);


int allContents = (int)request.getAttribute("allContents");

System.out.println("allcontents는 " + allContents);

/* int pages = (int)Math.ceil(allContents / 5.0); */ // 전체 페이지수를 pages에 담았어
int pages = allContents / 5;
if(allContents % 5 > 0) {
	pages = pages + 1;
}
System.out.println("전체 페이지수는 " + pages);

%>

<div id="re-layoutWrap">
<%
List<ExhibitDto> list = (List<ExhibitDto>)request.getAttribute("list");

System.out.println("list.size()는 " + list.size());
	
for(int i = 0; i < list.size(); i++) {
	ExhibitDto dto = list.get(i);
	String begindate = dto.getBegindate().substring(0,11);
	String enddate = dto.getEnddate().substring(0,11);
%>

	<div class="re-layout clfix">
		<a href="<%=request.getContextPath() %>/onereview?title=<%=dto.getTitle() %>&re_pageNum=0">
			<div class="reviewImg">
			<%	
			// 표지 있을 때 
			if(dto.getFilename() == null ){
				%>
					<img alt="이미지 없음" id="title" src="${pageContext.request.contextPath}/images/sub/noimg.gif"/>
				<%
			}
			else {	// 표지 없을 때 
				%>
					 <img alt="이미지 없음" src="${pageContext.request.contextPath}/filedownload?filepath=/upload/title/&filename=<%=dto.getFilename()%>"/> 
				<%
					}
			%>
			</div>
			<div class="reviewTxt">
				<div class="t-cell">
					<p><span>제 목</span><%=dto.getTitle() %></p>
					<p><span>장 소</span><%=dto.getPlace() %></p>
					<p><span>날 짜</span><%=dto.getBegindate().substring(0, 10)+" ~ "+ dto.getEnddate().substring(0, 10) %></p>
				</div>
			</div>
		</a>
	</div>
<%
}
%>
</div>

<div class="pagingWrap">
	<%
	for(int i = 0; i < pages; i++) {
		if(i == pageNum) {
			%>
			<span class="on"><%=i + 1 %></span>
			<%
		}
		else{
			%>
			<span onclick="location.href='/AgencyBgencyy/showReviewList?pageNum=<%=i %>'"><%=i + 1 %></span>
			<%
		}		
	}
	%>
</div>











































<%@include file ="../include/footer.jsp" %>