<%@page import="CYH.ReviewDto"%>
<%@page import="java.util.List"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
MemberDto sdto = (MemberDto)session.getAttribute("loginuser");
String id = sdto.getId();
System.out.println("로그인된 세션id는 " + id);
%>
<%
//String spageNum = (String)request.getAttribute("pageNumber");
//System.out.println("spageNum은 " + spageNum);
//int pageNum = Integer.parseInt(spageNum);
int pageNum = (int)request.getAttribute("pageNumber");
System.out.println("넘어온 페이지넘버는 " + pageNum);

int allMyReview = (int)request.getAttribute("allMyReviewCount");
System.out.println("넘어온 내가쓴 리뷰 갯수는 " + allMyReview);

int pages = (int)Math.ceil(allMyReview / 10.0);
%>


<div id="myReserve">	
	<table class="reservetbl">
		<colgroup>
			<col style="width:34%">
			<col style="width:34%">
			<col style="width:12%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>전시명</th>
				<th>리뷰내용</th>
				<th>상세보기</th>
				<th>수정</th>
				<th>삭제</th>
			<tr>
		</thead>
		<%
		List<ReviewDto> myReviews = (List<ReviewDto>)request.getAttribute("myReviews");
		
		System.out.println("넘어온 list의 size는 " + myReviews.size());
		
		for(int i = 0; i < myReviews.size(); i++) {
			ReviewDto dto = myReviews.get(i);
			%>
			<tbody>
				<tr>
				<%
				if(dto.getDel() == 1) {
					%>
					<td colspan="5"><b>이 글은 작성자에 의해 삭제되었습니다.</b></td>
					<%
				}else {
					%>
					<td><span><%=dto.getTitle() %></span></td>
					<td><span><%=dto.getReview() %></span></td>
					<td>
						<a href="" onclick="window.open('/AgencyBgencyy/reviewdetail?seq=<%=dto.getSeq() %>', 'reviewDetail', 'width=800, height=600')">상세보기</a>
					</td>
					<td>
						<a href="/AgencyBgencyy/updateReview?seq=<%=dto.getSeq() %>">수정</a>
					</td>
					<td>
						<a href="/AgencyBgencyy/deletereview?seq=<%=dto.getSeq() %>">삭제</a>
					</td>
					<%
				}
				%>
					
				</tr>
			</tbody>
			<%
		}
		%>
				
	</table>	
	
	<div class="pagingWrap">
		<%
		for(int i = 0; i < pages; i++) {
			if(i == pageNum) {
				%>
				<span class="on"><%=i + 1 %></span>
				<%
			}else{
				%>
				<span onclick="goPage(<%=i %>)"><%=i + 1 %></span>
				<%
			}		
		}
		%>
	</div>
</div><!-- //myReserve -->

<script type="text/javascript">

function goPage(pageNumber) {
	// alert("pageNumber:" + pageNumber);
	location.href = "/AgencyBgencyy/myReviews?pageNumber=" + pageNumber + "&id=<%=id %>";
}
</script>


<%@include file ="../include/footer.jsp" %>		