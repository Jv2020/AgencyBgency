<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
<%@page import="KEC.reserv.dao.ReservDao"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

// 로그인 세션
MemberDto sdto = (MemberDto)session.getAttribute("loginuser");
%>

<%
List<ExhibitDto>list = (List<ExhibitDto>)request.getAttribute("list");
int listPage = (int)request.getAttribute("listPage");
int pageNumber = (int)request.getAttribute("pageNumber");

System.out.println(pageNumber);
System.out.println(listPage);

%>

<div id="myReserve">	
	<table class="reservetbl">
		<colgroup>
			<col style="width:25%">
			<col style="width:22%">
			<col style="width:16%">
			<col style="width:17%">
			<col style="width:20%">
		</colgroup>
		<thead>
			<tr>
				<th>전시명</th>
				<th>기간</th>
				<th>시간</th>
				<th>장소</th>
				<th>리뷰작성</th>
			<tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><span><%=list.get(i).getTitle() %></span></td>
				<td><%=list.get(i).getBegindate().substring(0, 11)+" ~ "+ list.get(i).getEnddate().substring(0, 11) %></td>
				<td><%=list.get(i).getEx_time().substring(0,2)+":"+list.get(i).getEx_time().substring(2,4)+"~"+list.get(i).getEx_time().substring(4,6)+":"+list.get(i).getEx_time().substring(6)%></td>
				<td><%=list.get(i).getPlace() %></td>
				<td>
					<%if (list.get(i).getDel() == 1)  { %>
					<span style="color:red;">예매취소</span>
					<% } else { %>
					<a href="/AgencyBgencyy/writereview?seq=<%=list.get(i).getSeq() %>" >리뷰작성</a>
					<% } %>
				</td>
			</tr>
			<%
				}
			%>					
		</tbody>		
	</table>	
	
	<div class="pagingWrap">
	<%
	for(int i = 0; i < listPage; i++){		// [1] 2 [3]
		if(pageNumber == i){	// 현재 페이지
			%>
			<span class="on"><%=i + 1 %></span>
			<%
		}else{	// 그 외의 페이지
			%>
			<span onclick="goPage(<%=i %>)"><%=i + 1 %></span>
			<%		
		}
	}
	%>
	</div>
</div><!-- //myReserve -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">

function goPage(pageNumber) {
	// alert("pageNumber:" + pageNumber);
	location.href = "/AgencyBgencyy/myexhibitiist?pageNumber=" + pageNumber;
}

</script>




<%@include file ="../include/footer.jsp" %>		