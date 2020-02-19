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
					<%-- <a href="/AgencyBgencyy/writereview?seq=<%=list.get(i).getSeq() %>" >리뷰작성</a> --%>
					<a class="btn" href="#rvwrite<%=i %>">리뷰작성</a>
					<% } %>
					<!-- 리뷰쓰기 modal -->
					<div id="rvwrite<%=i %>" class="modal">
					 	<form action="/AgencyBgencyy/writereviewAf" method="get">
						 <input type="hidden" name="id" value="<%=sdto.getId() %>">
						 	<div class="modal-top">
						 		<ul>
						 			<li><span>전시명</span><%=list.get(i).getTitle() %><input type="hidden" name="title" value="<%=list.get(i).getTitle() %>"></li>
						 			<li>
						 				<span>평점</span>
						 				<div class='starrr' id='star1'></div>
									    <input type="hidden" id="starrate" name="starrate" value="">
						 			</li>
						 		</ul>							  
							</div><!-- //modal-top -->
								
							<textarea name="review"></textarea>
							<div class="modal-btm">
								<input type="submit" value="글쓰기">									
								<input class="closeBtn" type="button" value="취소">
							</div>
						</form>						
					</div><!-- //rvwrite -->
								
				</td>
			</tr>
			<script>
			// popup
			$('a[href="#rvwrite<%=i %>"]').click(function(event) {
				  event.preventDefault();	
				  $(this).modal({
				    fadeDuration: 150
				  });  
			});
			</script>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
<script src="/AgencyBgencyy/community/starrr-gh-pages/dist/starrr.js"></script>
<link rel="stylesheet" href="/AgencyBgencyy/community/starrr-gh-pages/dist/starrr.css">

<script>
// star
var $starinput = $('#starrate');
$('.starrr').starrr({
	max: 5,
	rating: $starinput.val(),
	change: function(e, value){
	$starinput.val(value).trigger('input');
	}
});

$('.modal-btm .closeBtn').click(function(event) {
	 $('textarea').val("");
	 $('.jquery-modal').fadeOut('fast');
});
</script>

<script type="text/javascript">

function goPage(pageNumber) {
	// alert("pageNumber:" + pageNumber);
	location.href = "/AgencyBgencyy/myexhibitiist?pageNumber=" + pageNumber;
}

</script>


<%@include file ="../include/footer.jsp" %>		