<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<style>
.cont-top{
	padding-left: 80px;
}
.cont-top .title-img{
	border: 1px dashed;
	position:relative; width:280px; height:400px;
	float:left;
}
.cont-top .title-img .title-btn{
	text-align: center;
	line-height: 400px;
	font-size: 40px;
}
.cont-top ul{
	float: right;
	width: 580px;
}
.cont-top ul li{
	width: 100%;
	margin-top: 30px;
	line-height: 30px;
	overflow: hidden;
}
.cont-top ul li:first-child{
	margin-top: 0;
}
.cont-top ul li span{
	float: left;
	display: block;
	width: 150px;
	font-size: 20px;
}
.cont-top ul li input{
	float: left;
	display: block;
	width: 300px;
	height: 30px;
}
.cont-mid {
	padding-left: 80px;
}
.cont-mid textarea{
width: 845px;
    height: 500px;
    margin-top: 50px;
}
.cont-mid input{
display: block;
width: 100px;
margin: 20px auto 0;

}
.cont-btm{

display: block;
width: 100px;
margin: 20px auto 0;
}

</style>
<form id="frm">
<div class="cont-top clfix">
	<div class="title-img">
		<div class="title-btn"> + </div>
	</div>
	<ul class="info">
		<li>
				<span> 제목 </span>
				<input type="text" >
		</li>
		<li>
				<span> 시작일 </span>
				<input type="text" >
		</li>
		<li>
				<span> 마감일 </span>
				<input type="text" >
		</li>
		<li>
				<span> 미술관 </span>
				<input type="text"readonly="readonly">
		</li>
		<li>
				<span> 지역분류 </span>
				<input type="text" >
		</li>
		<li>
				<span> 가격 </span>
				<input type="text" >
		</li>
		<li>
				<span> 큐레이터번호 </span>
				<input type="text" readonly="readonly" >
		</li>
	</ul>
</div>
<div class="cont-mid">
<textarea rows="10" cols="80"></textarea>
<input type="button" value="이미지 첨부">
</div>
<div class="cont-btm">
	<input type="button" value="작성하기">
</div>
</form>



<%@include file ="../include/footer.jsp" %>		