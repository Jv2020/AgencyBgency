<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="KEC.reserv.dto.ReservDto"%>
<%@page import="java.util.List"%>
<%@page import="KEC.reserv.dao.ReservDao"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
<%

List<ExhibitDto>list = (List<ExhibitDto>)request.getAttribute("list");
int numOfContents = list.size();
int pageNumber = (int)request.getAttribute("page");

// 총 리스트 개수 / 10 (페이징)

int allPageNum = (int)Math.ceil(numOfContents/10.0);


System.out.println(pageNumber);
System.out.println("allPageNum:"+allPageNum);

%>

<style>
/* mypage - 나의 예매내역 */
#myReserve {width:100%;}
table.reservetbl {width:100%; text-align:center;}
table.reservetbl th {position:relative; height:50px; line-height:50px; background:#f7f7f7; border-top:1px solid #ddd; border-bottom:1px solid #ddd; font-weight:normal;}
table.reservetbl th:before {position:absolute; top:50%; left:0; margin-top:-10px; content:''; width:1px; height:20px; background:#ddd;}
table.reservetbl th:first-child:before {display:none;}
table.reservetbl td {position:relative; padding:0 20px; height:80px; border-bottom:1px solid #ddd;}
table.reservetbl td > span {
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    line-height:25px;
    max-height:50px;
}
table.reservetbl td a, table.reservetbl td button {position:relative; z-index:1; display:inline-block; border:1px solid #5f0080; transition:all 0.3s ease-in-out; line-height:35px; padding:0 20px; color:#5f0080; overflow:hidden; outline:none;}
table.reservetbl td a:before, table.reservetbl td button:before {position:absolute; top:0; left:0; transform: translate(-100%, 0); display:inline-block; transition:all 0.3s ease-in-out; width:100%; height:100%; content:''; background:#5f0080; z-index:-1;}
table.reservetbl td a:hover, table.reservetbl td button:hover {color:#fff;}
table.reservetbl td a:hover:before, table.reservetbl td button:hover:before {transform: translate(0);}

.pagingWrap {width:100%; text-align:center; font-size:0;}
.pagingWrap span {position:relative; display:inline-block; width:35px; height:35px; line-height:35px; color:#333; font-size:18px; margin:50px 10px 0; cursor:pointer;}
.pagingWrap span.on {color:#5f0080;}
.pagingWrap span.on:before {position:absolute; bottom:0; left:50%; margin-left:-10px; content:''; width:20px; height:2px; background:#5f0080;}
.pagingWrap span:hover {color:#5f0080;}
</style>
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
				<th>전시명</th>
				<th>기간</th>
				<th>시간</th>
				<th>위치</th>
				<th>상세보기</th>
			<tr>
		</thead>
		<tbody>
			<%				
				for (int i = 0; i < list.size(); i++) {
			%>
				<tr>
					<td><%=list.get(i).getTitle() %></td>
					<td><span><%=list.get(i).getBegindate()+"~"+list.get(i).getEnddate()%></span></td>
					<td><%=list.get(i).getEx_time().substring(0,4)+"~"+list.get(i).getEx_time().substring(4)%></td>
					<td><%=list.get(i).getLoc_info() %></td>
					<td>
						<% if (list.get(i).getDel() == 1)  { %>
						<span style="color:red;">등록취소</span>
						<% } else { %>
						<a href="#">더보기 +</a>
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
	location.href = "/AgencyBgencyy/reservelist?pageNumber=" + pageNumber;
}

</script>




<%@include file ="../include/footer.jsp" %>		