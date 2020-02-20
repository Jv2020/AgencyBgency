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
						<%-- <a href="" onclick="window.open('/AgencyBgencyy/reviewdetail?seq=<%=dto.getSeq() %>', 'reviewDetail', 'width=800, height=600')">상세보기</a> --%>
						<a class="btn" href="#showdetail<%=i %>">상세보기</a>
						
						<!-- 리뷰보기 modal -->
						<div id="showdetail<%=i %>" class="modal">
							 	<div class="modal-top">
							 		<ul>
							 			<li><span>전시명</span><%=dto.getTitle() %></li>
							 		</ul>
								</div><!-- //modal-top -->
									
								<textarea name="review" readonly="readonly"><%=dto.getReview() %></textarea>
								<div class="modal-btm">
									<input class="closeBtn" type="button" value="취소">
								</div>
						</div><!-- //rvwrite -->
						
					</td>
					<td>
						<%-- <a href="/AgencyBgencyy/updateReview?seq=<%=dto.getSeq() %>">수정</a> --%>
						<a class="btn" href="#rvwrite<%=i %>">수정</a>
						
							<!-- 리뷰수정 modal -->
							<div id="rvwrite<%=i %>" class="modal">
							 	<form id="frm2" action="/AgencyBgencyy/updatereviewAf" onsubmit="return rewrite()">
								   <input type="hidden" name="seq" value="<%=dto.getSeq() %>">
								 	<div class="modal-top">
								 		<ul>
								 			<li><span>전시명</span><%=dto.getTitle() %>
								 			<li>
								 				<span>평점</span>
								 				<%-- <div class='starrr' id='star1'></div>
												<input type="hidden" id="starrate" name="starrate" value="<%=dto.getStar() %>"> --%>
												<input type="radio" class="starrate<%=i %>" name="starrate" value="1">1점
												<input type="radio" class="starrate<%=i %>" name="starrate" value="2">2점
												<input type="radio" class="starrate<%=i %>" name="starrate" value="3" selected>3점
												<input type="radio" class="starrate<%=i %>" name="starrate" value="4">4점
												<input type="radio" class="starrate<%=i %>" name="starrate" value="5">5점
								 			</li>
								 		</ul>
									</div><!-- //modal-top -->
										
									<textarea name="review1" id="review1"><%=dto.getReview() %></textarea>
									<div class="modal-btm">
										<input type="submit" value="수정하기">
										<input class="closeBtn" type="button" value="취소">
									</div>
								</form>
							</div><!-- //rvwrite -->
					</td>
					<td>
						<a href="/AgencyBgencyy/deletereview?seq=<%=dto.getSeq() %>">삭제</a>
					</td>
					<%
				}
				%>
				</tr>
					<script>
					// popup
					$('a[href="#rvwrite<%=i %>"]').click(function(event) {
						  event.preventDefault();	
						  $(this).modal({
						  });
					});
					
					$('a[href="#showdetail<%=i %>"]').click(function(event) {
						  event.preventDefault();	
						  $(this).modal({
						  });
					});
					</script>
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

//$( document ).ready(function() {
$('.modal-btm .closeBtn').click(function(event) {
	 $('.jquery-modal').fadeOut('fast');
});

/* function rewrite(){
		//alert('submitBtn1 ss');
		var review = $("#review1").val();
		var star1 = $("#starrate").val();
		
		//alert(contNum);
		alert("star는 " + star1);
		alert(review);
		if(review == "") {
			alert("리뷰를 적어 주십시오.");
			$("#review1").focus();
			return false;
		}else if(star1 == "") {
			alert("별점을 설정해주십시오.");
			return false;
		}else {
			/* $("#frm").attr({"action":"/AgencyBgencyy/updateWr", "target":"_self"}).submit();
			/* cyh.submit(); */
			//alert("이후에 submit");
			//$("#frm"+).submit();
//			$("#submitBtn1").attr("type","submit");
		//	document.querySelector("#submitBtn1").type="submit";
		//	document.querySelector("#submitBtn1").submit()
//			return true;
//		}	
//} */

/* 	$("#submitBtn1").click(function () {
	}); */
	
//s});
</script>

<%@include file ="../include/footer.jsp" %>		