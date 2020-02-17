<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="KEC.reserv.dto.ReservDto"%>
<%@page import="java.util.List"%>
<%@page import="KEC.reserv.dao.ReservDao"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
<%

List<ExhibitDto>list = (List<ExhibitDto>)request.getAttribute("list");

int pageNumber = (int)request.getAttribute("page");
int contentsNum = (int)request.getAttribute("contentsNum");

// 총 리스트 개수 / 10 (페이징)

int allPageNum = (int)Math.ceil(contentsNum/10.0);

System.out.println(pageNumber);
System.out.println("numOfContents:"+contentsNum);
System.out.println("allPageNum:"+allPageNum);

%>
<%!
public String makeDate(String date){
	String result = "";
	String yy = date.split("-")[0];
	String mm = date.split("-")[1];
	String dd = date.split("-")[2].split(" ")[0];

	return yy+"-"+mm+"-"+dd;
}
%>
<div id="myReserve">	
	<table class="reservetbl">
		<colgroup>
			<col style="width:20%">
			<col style="width:35%">
			<col style="width:15%">
			<col style="width:10%">
			<col style="width:20%">
		</colgroup>
		<thead>
			<tr>
				<th>기간</th>
				<th>전시명</th>
				<th>시간</th>
				<th>위치</th>
				<th>상세보기</th>
			<tr>
		</thead>
		<tbody>
			<%				
				for (int i = 0; i < list.size(); i++) {
					ExhibitDto edto = list.get(i);
			%>
				<tr>
					<td><span><%=makeDate(edto.getBegindate()) +" ~ " + makeDate(edto.getEnddate())%></span></td>
					<td><%=edto.getTitle() %></td>
					<td><%=edto.getEx_time().substring(0,2)+":"+edto.getEx_time().substring(2,4)+"~"+edto.getEx_time().substring(4,6)+":"+list.get(i).getEx_time().substring(6)%></td>
					<td><%=edto.getLoc_info() %></td>
					<td>
						<% if (edto.getDel() == 1)  { %>
						<span style="color:red;">등록취소</span>
						<% } else { %>
						<!-- detailServlet으로 이동하기  -->
						<a href="${pageContext.request.contextPath}/exhibitcuratordetail?seq=<%=edto.getSeq()%>">더보기 +</a>
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
	for(int i = 0;i < allPageNum; i++){		// [1] 2 [3]
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


<script type="text/javascript">

function goPage(pageNumber) {
	// alert("pageNumber:" + pageNumber);
	location.href="${pageContext.request.contextPath}/curatorexhibitlist?page="+pageNumber; 
}

</script>




<%@include file ="../include/footer.jsp" %>		