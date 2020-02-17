<%@page import="KEC.reserv.dto.ReservDto"%>
<%@page import="java.util.List"%>
<%@page import="KEC.reserv.dao.ReservDao"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%

List<ReservDto>list = (List<ReservDto>)request.getAttribute("list");
int listPage = (int)request.getAttribute("listPage");
int pageNumber = (int)request.getAttribute("pageNumber");

System.out.println(pageNumber);
System.out.println(listPage); 

%>
<div id="myReserve">	
	<table class="reservetbl">
		<colgroup>
			<col style="width:15%">
			<col style="width:30%">
			<col style="width:23%">
			<col style="width:12%">
			<col style="width:20%">
		</colgroup>
		<thead>
			<tr>
				<th>예매일</th>
				<th>전시명</th>
				<th>이용기간</th>
				<th>매수</th>
				<th>상세보기</th>
			<tr>
		</thead>
		<tbody>
			<%				
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getRdate().substring(0, 11) %></td>
				<td><span><%=list.get(i).getTitle() %></span></td>
				<td><%=list.get(i).getDuring() %></td>
				<td><%=list.get(i).getQty() %>매</td>
				<td>
					<%if (list.get(i).getDel() == 1)  { %>
					<span style="color:red;">예매취소</span>
					<% } else { %>
					<a href="/AgencyBgencyy/reservget?seq=<%=list.get(i).getSeq() %>&page=detail">더보기 +</a>
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
	for(int i = 0;i < listPage; i++){		// [1] 2 [3]
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
	location.href = "/AgencyBgencyy/reservelist?pageNumber=" + pageNumber;
}

</script>




<%@include file ="../include/footer.jsp" %>		