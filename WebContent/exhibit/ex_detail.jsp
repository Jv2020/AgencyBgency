<%@page import="CYH.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@include file ="/include/header.jsp" %>
<!-- font awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv" crossorigin="anonymous">
<%
//로그인 세션
//MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
boolean logincheck = true;

//로그인 여부 확인하기
/* if( mem != null){
	logincheck= true;
} 
 */%>

<%
	// 전시 종류(현재,지난,예정)를 확인해주는 값  
	String ex = (String)request.getAttribute("ex");

	// 전시 디테일 dto
	ExhibitDto dto = (ExhibitDto)request.getAttribute("dto");
	String nowpath = request.getContextPath();
	
	// 해당 전시에 달린 리뷰 리스트 
	List<ReviewDto> reviewList =  (List<ReviewDto>) request.getAttribute("reviewList");
	
%>
<link rel="stylesheet" type="text/css" href="<%=nowpath %>/exhibit/css/exdetail.css">
<div class="ex-datail-top clfix">
	<div class="img">
		<img src="https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586">
	</div>
	<div class="cont">
		<h4>&lt; <%=dto.getTitle() %> &gt;</h4>
		<p><span>장소</span><%=dto.getPlace() %> </p>
		<p><span>기간</span><%= dto.getBegindate().substring(0, 10)+" ~ "+ dto.getEnddate().substring(0, 10) %></p>
		<p><span>시간	</span><%=dto.getEx_time().substring(0, 2) +":" +dto.getEx_time().substring(2, 4)+" - " + dto.getEx_time().substring(4, 6) +":" +dto.getEx_time().substring(6, 8) %></p>
		<p id="price"><span>관람료</span></p>
		<p><span>문의</span><%= dto.getContact() %></p>
		<a href="#" id="resvBtn">예매하기</a>
		<!-- ${pageContext.request.contextPath}/reservation/reserv.jsp -->
	</div>
</div>
<div class="ex-datail-mid">
	<h5>전시안내</h5>
	<div class="txt">
		<%=dto.getContent() %>
	</div>
</div>
<div class="ex-datail-btm">
	<h5>Review</h5>
	<div class="cont">
		<ul class="clfix">
		<%
		if(reviewList.size()>0){
			for(int i = 0; i < reviewList.size(); i++ ){
			ReviewDto rdto = reviewList.get(i);
			
		%>

		<li>
			<div class="ex-star">
				<%
					for(int j=0; j<rdto.getStar(); j++){
						%>
						<i class="fas fa-star"></i>
						<%
					}
				%>
			</div>
			<p><%=rdto.getReview() %></p>
			<span>by <%=rdto.getId() %></span>
			<!-- 여기에 더보기 버튼으로 링크 걸어두기 (시간남으면) -->
		</li>
	<% 	 }
		}
	else{
		%>
			<div style="text-align: center">등록된 리뷰가 없습니다! </div>
		<%
	}
	%>
		</ul>
	</div>
</div>

<script>
var ex = "<%=ex%>";	// 전시 기간 상태 
var ex_title = "";
if(ex == "now"){ ex_title="현재전시"; }
else if(ex == "fut"){	ex_title="예정전시"; }
else if(ex == "past"){	ex_title="지난전시"; }
document.querySelector("#ex-title").innerHTML= ex_title;
document.querySelector("#loc_depth02").innerHTML= ex_title;

</script>


<script>
// 예매하기 버튼클릭시 이벤트
$("#resvBtn").click(function() {
	
	if( ex == "past"){
		alert("지난 전시입니다!")
	}
	else{
		if(<%=logincheck%> == false){
			// 로그인이 안됨 
			if(confirm("로그인이 필요합니다. 로그인 페이지로 이동합니다.")){
				location.href="${pageContext.request.contextPath}/member/login.jsp?choice=resv";
				/* 로그인 후 다시 정보를 가지고 이 페이지로 올 수 있도록 설계 해보기?  */
			}
		}else {
			// 예매 페이지로 이동
			$("#resvBtn").attr("href", "${pageContext.request.contextPath}/reservation/reserv.jsp");
		}
		
	}
	
	
	
});

	var total = <%=dto.getPrice()%>;
	//ex) 7000원 -> 7,000원
	var len, point, str;	
	total = total + "";
	point = total.length % 3 ;
	len = total.length;
	
	totalPrice = total.substring(0, point);
	while (point < len) {
		if (totalPrice != "") totalPrice += ",";
		totalPrice += total.substring(point, point + 3);
		point += 3;
	}

$("#price").append(totalPrice+"원");

</script>







<%@include file ="../include/footer.jsp" %>		