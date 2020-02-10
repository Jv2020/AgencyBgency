<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@include file ="/include/header.jsp" %>
<%
//로그인 세션
String loginuser = (String)session.getAttribute("loginuser");
boolean logincheck = false;

//로그인 여부 확인하기
if(loginuser != null){
	logincheck= true;
} 
%>
<%
	String ex = (String)request.getAttribute("ex");
	ExhibitDto dto = (ExhibitDto)request.getAttribute("dto");
	String nowpath = request.getContextPath();
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
		<p><span>관람료</span><%=dto.getPrice() %></p>
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
			<li>
				<div class="ex-star">
					☆☆☆☆☆
				</div>
				<p>리뷰 내용입니다 리뷰 내용입니다리뷰리뷰 내용입니다 리뷰 내용입니다리뷰</p>
				<span>by Id1234</span>
			</li>
			<li>
				<div class="ex-star">
					☆☆☆☆☆
				</div>
				<p>리뷰 내용입니다 리뷰 내용입니다리뷰리뷰 내용입니다 리뷰 내용입니다리뷰</p>
				<span>by Id1234</span>
			</li>
			<li>
				<div class="ex-star">
					☆☆☆☆☆
				</div>
				<p>리뷰 내용입니다 리뷰 내용입니다리뷰리뷰 내용입니다 리뷰 내용입니다리뷰</p>
				<span>by Id1234</span>
			</li>
			<li>
				<div class="ex-star">
					☆☆☆☆☆
				</div>
				<p>리뷰 내용입니다 리뷰 내용입니다리뷰리뷰 내용입니다 리뷰 내용입니다리뷰</p>
				<span>by Id1234</span>
			</li>
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


</script>







<%@include file ="../include/footer.jsp" %>		