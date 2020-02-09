<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@include file ="/include/header.jsp" %>
<%
	String ex = (String)request.getAttribute("ex");
	ExhibitDto dto = (ExhibitDto)request.getAttribute("dto");
	System.out.println("ex: " + ex);
	
	String nowpath = request.getContextPath();
	System.out.println("nowpath: " + nowpath);
%>


<link rel="stylesheet" type="text/css" href="<%=nowpath %>/exhibit/css/exdetail.css">

<style>
</style>
<div class="ex-datail-top clfix">
	<div class="img">
		<img src="https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586">
	</div>
	<div class="cont">
		<h4>&lt; <%=dto.getTitle() %> &gt;</h4>
		<p><span>장소</span><%=dto.getPlace() %> </p>
		<p><span>기간</span><%= dto.getBegindate().substring(0, 10)+" ~ "+ dto.getEnddate().substring(0, 10) %></p>
		<p><span>시간	</span><%=dto.getEx_time().substring(0, 2) +":" +dto.getEx_time().substring(2, 4)+" - " + dto.getEx_time().substring(4, 6) +":" +dto.getEx_time().substring(6, 8) %></p>
		<p><span>관람료</span>price dto 만들어야함</p>
		<p><span>문의</span><%= dto.getContact() %></p>
		<a href="../reservation/reserv.jsp">예매하기</a>
	</div>
</div>
<div class="ex-datail-mid">
	<h5>전시안내</h5>
	<div class="txt">
		dddddd
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
var ex = "<%=ex%>";
var ex_title = "";
if(ex == "now"){ ex_title="현재전시"; }
else if(ex == "fut"){	ex_title="예정전시"; }
else if(ex == "past"){	ex_title="지난전시"; }
document.querySelector("#ex-title").innerHTML= ex_title;
document.querySelector("#loc_depth02").innerHTML= ex_title;

</script>







<%@include file ="../include/footer.jsp" %>		