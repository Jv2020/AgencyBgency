<%@page import="CYH.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="CYH.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의 전시 리뷰보기</title>
<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}


.reviewBox{}
.reviewBox .reviewTit {}
.reviewBox .reviewTit ul {width:100%; overflow:hidden;}
.reviewBox .reviewTit ul li {float:left; width:50%; height:100px; background:#333;}
.reviewBox .reviewTit ul li:first-child {background:#ccc;}
.reviewBox .reviewCont ul li {width: 100%; height: 100px; background: #0000ff;}
.reviewBox .reviewCont {min-height:10px;}
.reviewBox .reviewBtm {}
.reviewBox .reviewBtm ul {background:#333; overflow:hidden;}
.reviewBox .reviewBtm ul li {float:left; width:33.33333%; height:100px;}

</style>

</head>
<body>



<p><b>뮤지컬 `모차르트!` 10주년 기념공연</b><p>

<div class="setcionInfo">
		<img src="http://www.sejongpac.or.kr/upload/PERFORM1/200611_g_b257_2.jpg" alt="" align="left" hspace="30">
	
				
		<ul class="list border_line">
			<li><span>기간 : </span><p>2020.06.11 (목)  ~ 2020.08.09 (일)</p></li>
					
			<li><span>장소 : </span>
				<p>
				세종대극장	
				</p>
			</li>
			<li><span>시간 : </span><p>화목 오후7시<br>
					수금 오후3시, 오후8시<br>
					토 오후2시, 오후7시 <br>
					일 오후3시
					(공연시간 : 175  분 / 인터미션 : 20 분)
						
			</p></li>
		</ul>
</div>
<br clear="left">

<hr>
<!--
<select id="mySelect" onchange="selectgency()">
	<option>전체</option>
	<option>A전시회</option>
	<option>B전시회</option>
	<option>C전시회</option>
</select>
<script type="text/javascript">
function selectgency() {
	var x = document.getElementById("mySelect").value;
	document.getElementById("showgency").innerHTML = x + " 리뷰보기";
}
</script>
-->
<br><br>

<div class="showgency">

<span id="showlistgency">전체 리뷰입니다.</span>
<button type="button" id="writeReview" onclick="writeReview()">리뷰작성</button>

<script type="text/javascript">
function writeReview() {
	
}
</script>
<br><br>

<%
ReviewDao dao = ReviewDao.getInstance();
List<ReviewDto> list = dao.getReviewList();

for(int i = 0; i < list.size(); i++) {
	System.out.println("review title[" +i+"]" + list.get(i).getTitle() );
	
	System.out.println(list.get(i));
}
%>




<%for(int i = 0; i < list.size(); i++) {
	ReviewDto dto = list.get(i);
%>
<div class="reviewBox">
	<div class="reviewTit">
		<ul>
			<li>
				<%=dto.getTitle() %>
			</li>
			<li>
				<%=dto.getStar() %>
			</li>
		</ul>
	</div>
	<div class="reviewCont">
		<ul class="">
			<li>
				<%=dto.getReview() %>
			</li>
		</ul>
	</div>
	<div class="reviewBtm">
		<ul class="clfix">
			<li>
				<%=dto.getId() %>
			</li>
			<li>
				<%=dto.getRegdate() %>
			</li>
			<li>
				좋아요 :<%=dto.getLike_number() %>	/
				싫어요 :<%=dto.getDislike_number() %>
			</li>
		</ul>
	</div>
</div><!-- //reviewBox -->

</div>
<%
}
%>

<button type="button" id="moreReview">+더보기</button>








</body>
</html>