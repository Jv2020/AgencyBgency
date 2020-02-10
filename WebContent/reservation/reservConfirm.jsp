<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<style>
.insertFrm {}
.frm_cont {}
.frm_cont .frm_line {padding:20px 0; border-top:1px solid #ddd;}
.frm_cont .frm_line > div {float:left;}
.frm_cont .frm_line > div.floatNone{float:none; width:100%;}
.frm_cont .frm_line .tit {width:150px; color:#333; font-size:18px;}
.frm_cont .frm_line .cont {}
.frm_cont .frm_line .cont.i-mg-none {font-size:0;}
.frm_cont .frm_line .cont.i-mg-none input {margin:0;}
.frm_cont .frm_line.reser-birth .cont input{margin-right:0 !important;}
.frm_cont .frm_line .cont input {border:1px solid #a1a1a1; height:30px; padding:0 10px; margin-right:10px;}
.frm_cont .frm_line .cont input.ttxt {width:200px;}
.frm_cont .frm_line .cont input.byear{width:90px;}
.frm_cont .frm_line .cont input.bmonth{width:90px;}
.frm_cont .frm_line .cont input.bday{width:90px;}
span.alert-birth {color:red; font-size:13px;}
.frm_cont .frm_line .cont span.frm-mg {display:inline-block; font-size:20px; margin:0 10px; vertical-align:-7px;}
.frm_cont .frm_line .cont select {
	width:90px; height:30px;
	border-radius:0; outline:0; border:1px solid #a1a1a1;
	-webkit-appearance: none;
	-moz-appearance: none; 
	appearance: none; 
	background:#fff url(../images/sub/sel_arrow.png) no-repeat 92% 50%;
	padding-left:10px; font-size:13px; color:#333;
	margin-right:20px;
}
.frm_cont .frm_line .cont select::-ms-expand {display: none;}

.frm_cont .frm_line .cont input.frm-address{width:400px;}
.frm_cont .frm_line .cont span.frm_adr_btn {display:inline-block; width:80px; height:30px; line-height:30px;
text-align:center; background:#5f0080; color:#fff; cursor:pointer;}


input[type="radio"] {display:none;}
input[type="radio"] + label  {
	
	display: inline-block;
	color:#333; font-size:17px; line-height:30px; margin-right:35px;
    padding-left:30px;
    background: #fff url(../images/sub/ico_radio_off.png) no-repeat 0 center;
    color: #000;
    cursor: pointer;
    white-space:nowrap;
}

input[type="radio"]:checked + label {
    background: #fff url(../images/sub/ico_radio_on.png) no-repeat 0 center;
}

.frm_cont .frm_line .cont .qtyBox{width:100%; font-size:0;}
.frm_cont .frm_line .cont .qtyBox span {display:block; float:left; width:30px; height:30px; text-align:center; color:#5f0080; border:1px solid #5f0080; font-weight:bold; font-size:17px; cursor:pointer;}
.frm_cont .frm_line .cont .qtyBox span.minus {border-right:none;}
.frm_cont .frm_line .cont .qtyBox input {display:block; float:left; width:90px; border:1px solid #5f0080; margin:0; outline:none;}
.frm_cont .frm_line .cont .qtyBox span.plus {border-left:none;}

.frm_cont .frm_line.totalPrice {text-align:right; font-size:20px; padding-right:30px;} 
.frm_cont .frm_line.totalPrice strong {display:inline-block; font-size:35px; color:#5f0080; margin-left:15px; margin-right:3px;}

button.reserv_btn {display:block; width:240px; height:70px; line-height:68px;
margin:70px auto 0; border:1px solid #5f0080; outline:none;
font-size:18px; color:#5f0080;}
button.reserv_btn:hover {background:#5f0080; color:#fff; transition:all .2s ease-in-out;}


</style>


<div class="insertFrm">
	<form method="post" action="">
		<div class="frm_cont">
			<div class="frm_line clfix">
				<div class="tit">예매자 이름</div>
				<div class="cont">
					<input class="ttext" type="text" value="김비트" placeholer="김비트" readonly="readonly">
				</div>				
			</div>
			
			<div class="frm_line reser-birth clfix">
				<div class="tit">생년월일</div>
				<div class="cont mr20">
					<input class="byear" type="text" value="2000" maxlength="4" readonly="readonly"> 년
				</div>				
				<div class="cont mr20">
					<input class="bmonth" type="text" value="9" maxlength="4" readonly="readonly"> 월
				</div>
				<div class="cont">
					<input class="bday" type="text" value="02" maxlength="2" readonly="readonly"> 일			
				</div>									
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">연락처</div>
				<div class="cont i-mg-none">
					<input type="text" value="010"><span class="frm-mg">-</span>
					<input type="text" value="1234"><span class="frm-mg">-</span>
					<input type="text" value="5678">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">이메일 주소</div>
				<div class="cont i-mg-none">
					<input type="text" value="agency">
					<span class="frm-mg">@</span>
					<input type="text" value="naver.com">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">주소</div>
				<div class="cont">
					<input type="text" class="frm-address" value="서울특별시 서초구 서초4동 강남대로 459" readonly="readonly"><span class="frm_adr_btn">주소검색</span><br>
					<input class="mt08" type="text" value="2층 2강의실" readonly="readonly">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit floatNone">티켓 수령방법</div>
				<div class="cont floatNone mt20">
					<input type="radio" id="r-ticket1" name="r-ticket" checked="checked" value="현장수령"/><label for="r-ticket1"><span></span>현장수령</label>
  					<input type="radio" id="r-ticket2" name="r-ticket" value="배송"/><label for="r-ticket2"><span></span>배송</label>
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit floatNone">입장권 수량</div>
				<div class="cont floatNone mt20">
					<div class="qtyBox clfix">						
						<span class="minus">-</span>
						<input type="text" value="0" readonly="readonly">
						<span class="plus">+</span>
					</div>
				</div>				
			</div>		
			
			<div class="frm_line clfix">
				<div class="tit floatNone">결제 수단</div>
				<div class="cont floatNone mt20">					
					<input type="radio" id="r-payment1" name="r-payment" value="무통장 입금"><label for="r-payment1"><span></span>무통장 입금</label>
					<input type="radio" id="r-payment2" name="r-payment" value="신용카드"><label for="r-payment2"><span></span>신용카드</label>
					<input type="radio" id="r-payment3" name="r-payment" value="휴대폰"><label for="r-payment3"><span></span>휴대폰</label>
					<input type="radio" id="r-payment4" name="r-payment" value="카카오페이"><label for="r-payment4"><span></span>카카오페이</label>
				</div>				
			</div>	
			
			<div class="frm_line totalPrice clfix">
				결제금액<strong>0</strong>원						
			</div>		
						
		</div><!-- frm_cont -->
		
		<button class="reserv_btn">결제하기</button>
		
	</form><!-- insertFrm -->
</div><!-- formWrap -->

<%@include file ="../include/footer.jsp" %>		