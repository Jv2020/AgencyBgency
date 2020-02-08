<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
	String sseq = request.getParameter("seq");
	String ex = request.getParameter("ex");
%>
<style>
.ex-datail-top{	
}
.ex-datail-top .img{
	position:relative; width:400px; height:575px;
	float:left;
}
.ex-datail-top .img img{
	position:absolute; top:50%; left:50%;
	max-width:400px; max-height:575px; 
	width:auto; height:auto;
	transform:translate(-50%, -50%);
	
}
.ex-datail-top .cont{
	float:right;
	width: 550px;
	height: 575px;
	position: relative;
}
.ex-datail-top .cont h4{
	font-size: 35px;
	margin-bottom: 50px;
}
.ex-datail-top .cont p{
	line-height:60px;
	font-size: 25px;
}
.ex-datail-top .cont p span{ 
	display: inline-block;
	width: 110px;
	color:#868686;
}
.ex-datail-top .cont a{
	display:block; width:240px; height:70px; line-height:68px;
margin:70px auto 0; border:1px solid #5f0080; background: #5f0080; outline:none;
font-size:18px; color:#fff; text-align: center;
position: absolute; bottom:0; right:50%;margin-right:-120px;
border-radius: 10px;
}

.ex-datail-mid{
	border-top: 1px solid #ddd;
	margin-top:60px;
	padding: 40px 0;
	min-height:300px;
}
.ex-datail-mid h5 {
	font-size: 30px;
	margin-bottom: 50px;
	text-align: center;
}
.ex-datail-mid .txt{
	font-size: 18px;
}
.ex-datail-btm{
	position:relative;
	min-height:300px;
}
/* .ex-detail-btm:before {position:absolute; top:0; left:50%; margin-left:-960px; width:1920px; height:100px; content:''; background:#ccc;} */
.ex-datail-btm h5{
	font-size: 30px;
	margin-bottom: 50px;
	text-align: center;
}
.ex-datail-btm h5{}
.ex-datail-btm .cont{}
.ex-datail-btm .cont ul{}
.ex-datail-btm .cont ul li{
	float: left;
	width: 240px;
	margin-left:30px;
	box-shadow: 0 0 10px rgba(0,0,0,0.1);
	padding:20px;
	transition:all 0.3s ease-in-out;
	
}

.ex-datail-btm .cont ul li:first-child{
	margin-left:0;
}
.ex-datail-btm .cont ul li:hover{
	transform:translatey(-12px);
}
.ex-datail-btm .cont ul li .ex-star{ text-align: center; }
.ex-datail-btm .cont ul li p{margin:12px 0;
overflow: hidden;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 2; /* 라인수 */
-webkit-box-orient: vertical;
word-wrap:break-word; 
line-height: 24px;
height: 48px;}
.ex-datail-btm .cont ul li span{ display:block; color: #868686; text-align: right;}
	
</style>
<div class="ex-datail-top clfix">
	<div class="img">
		<img src="https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586">
	</div>
	<div class="cont">
		<h4>&lt; 상상마당 야외전시 : 조각 공원 &gt;</h4>
		<p><span>장소</span>상상마당 춘천 </p>
		<p><span>기간</span>2020-01-10~2020-03-03</p>
		<p><span>시간	</span>09:00 ~ 17:00</p>
		<p><span>관람료</span>5,000원</p>
		<p><span>문의</span>02-1233-1222</p>
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
document.querySelector("#ex-title").innerHTML= "현재전시";
document.querySelector("#loc_depth02").innerHTML= ex_title;

</script>







<%@include file ="../include/footer.jsp" %>		