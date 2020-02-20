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
			<% if (list.size() == 0) {%>
			<tr>
				<td colspan="5">관람한 전시가 없습니다.</td>
			</tr>
			<% } %>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><span><%=list.get(i).getTitle() %></span></td>
				<td><%=list.get(i).getBegindate().substring(0, 11)+" ~ "+ list.get(i).getEnddate().substring(0, 11) %></td>
				<td><%=list.get(i).getEx_time().substring(0,2)+":"+list.get(i).getEx_time().substring(2,4)+"~"+list.get(i).getEx_time().substring(4,6)+":"+list.get(i).getEx_time().substring(6)%></td>
				<td><%=list.get(i).getPlace() %></td>
				<td>
					<%-- <a href="/AgencyBgencyy/writereview?seq=<%=list.get(i).getSeq() %>" >리뷰작성</a> --%>
					<a class="btn" href="#rvwrite<%=i %>">리뷰작성</a>
					<!-- 리뷰쓰기 modal -->
					<div id="rvwrite<%=i %>" class="modal">
						<form class="frm1" action="<%=request.getContextPath()%>/writereviewAf">
						<input type="hidden" name="id" value="<%=sdto.getId() %>">
							<div class="modal-top">
								<ul>
									<li><span>전시명</span><%=list.get(i).getTitle() %><input type="hidden" name="title" value="<%=list.get(i).getTitle() %>"></li>
									<li>
										<span>평점</span>
										<%-- <div class='starrr' id='star1'></div>
										<input type="hidden" id="starrate" name="starrate" value="">
										<input type="hidden" class="starrate<%=i %>" name="starrate" value="">
										<script type="text/javascript">
											var star1 = $("#starrate").val();
											$(document).ready(function() {
												$(".starrate<%=i %>").val(star1);
											});
										</script> --%>
										<select name="starrate" id="starrate<%=i %>">
											<option value="1">1점
											<option value="2">2점
											<option value="3" selected>3점
											<option value="4">4점
											<option value="5">5점
										</select>
									</li>
								</ul>
							</div><!-- //modal-top -->
								
							<textarea name="review" id="review<%=i %>"></textarea>
							<div class="modal-btm">
							 <input type="submit" value="글쓰기" class="submitBtn">
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
/* var $starinput = $('#starrate');
$('.starrr').starrr({
	max: 5,
	rating: $starinput.val(),
	change: function(e, value){
	$starinput.val(value).trigger('input');
	}
}); */

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

<script>
function testBtn() {
	var starrate = document.getElementById("starrate").value;
	
	alert(starrate);
};


/* $(document).ready(function () {
	
	$(".submitBtn").click(function () {
		alert("submitBtn click");
		 
	//	$("#" + $(this).attr("textAid").val()).val("");		
	//	alert($(this).attr("textAid"));
			
			
		var review = $("#" + $(this).attr("textAid")).val();
		
		alert("review:" + review);
		
		
		$("#" + $(this).attr("textAid")).val("");
	});
});	 */
	<%-- var size = '<%=list.size() %>';
	alert(size);
	

		$("#submitBtn" + 0).on("click", function () {			
			
			alert("submitBtn click " + 0);
			var review = $("#review" + 0).val();			
			
			alert(review);
		});
		$("#submitBtn" + 1).on("click", function () {			
			
			alert("submitBtn click " + 1);
			var review = $("#review" + 1).val();			
			
			alert(review);
		}); --%>
	
	
	/* 
	$(".submitBtn").click(function () {
		alert("class submitBtn click");
		
		var review = $("#review").val();
		var star = $("#starrate").val();
		
		alert(review);
//		alert("star는 " + star);

		if(review == "") {
			alert("리뷰를 적어 주십시오.");
			$("#review").focus();
		}else if(star == "") {
			alert("별점을 설정해주십시오.");
		}else {
		//	$("#frm").attr({"action":"/AgencyBgencyy/updateWr", "target":"_self"}).submit(); 
		//	cyh.submit(); 
		//	alert("ㅋㅋ"); 
			$("#frm1").submit();
		}
	});
 */




</script>






<%@include file ="../include/footer.jsp" %>		