<%@page import="KEC.reserv.dto.ReservDto"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<%

// 짐풀기
ReservDto dto = (ReservDto)request.getAttribute("dto");


//email - split
String email = dto.getEmail();
String[] edata = email.split("@");

//address - split
String address = dto.getAddress();
String[] radr = address.split("/");
String detail="";
if(radr.length == 3){
detail= radr[2];
	
}

%>
<style>
.insertFrm {}
.ConfirmFrm {width:800px; margin:0 auto;}

.ConfirmFrm .frm_cont .frm_line > div.tit {padding:10px 0;}
.ConfirmFrm .frm_cont .frm_line > div.cont {padding:10px 20px; background:#f7f7f7; width:630px; font-size:16px;}
.ConfirmFrm > h3 {line-height:1; text-align:center; font-size:23px; margin-bottom:30px; font-weight:500;}
.ConfirmFrm > h3 span {color:#5f0080;}

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
    background: #fff url(/AgencyBgencyy/images/sub/ico_radio_off.png) no-repeat 0 center;
    color: #000;
    cursor: pointer;
    white-space:nowrap;
}

input[type="radio"]:checked + label {
    background: #fff url(/AgencyBgencyy/images/sub/ico_radio_on.png) no-repeat 0 center;
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

.reserv_btnWrap {width:100%; text-align:center; font-size:0; margin:70px 0 0; overflow:hidden;}
button.reserv_btn02, a.reserv_btn02 {display:inline-block; width:160px; height:60px; line-height:58px;
border:1px solid #5f0080; outline:none; margin-left:20px; font-size:18px; color:#5f0080;}
button.reserv_btn02:hover, a.reserv_btn02:hover {background:#5f0080; color:#fff; transition:all .2s ease-in-out;}

.depth02.mypageDepth a.reservedepth{background:#5f0080; color:#fff;}
</style>

<div class="ConfirmFrm">
	<form method="get" action="">
		<input type="hidden" value="<%=dto.getSeq() %>">
		<div class="frm_cont">
			<div class="frm_line clfix">
				<div class="tit">전시명</div>
				<div class="cont">
					<%=dto.getTitle() %>
				</div>				
			</div>
			<div class="frm_line clfix">
				<div class="tit">예매자 이름</div>
				<div class="cont">
					<%=dto.getName() %>
				</div>				
			</div>
			
			<div class="frm_line reser-birth clfix">
				<div class="tit">생년월일</div>
				<div class="cont">
					<%=dto.getBirthdate().substring(0, 4) %> 년 &nbsp;
					<%=dto.getBirthdate().substring(4, 6) %> 월 &nbsp;
					<%=dto.getBirthdate().substring(6, 8) %> 일 &nbsp;
				</div>									
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">연락처</div>
				<div class="cont">
					<%=dto.getPhone() %>
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">이메일 주소</div>
				<div class="cont">
					<%=edata[0]%>@<%=edata[1]%>
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">주소</div>
				<div class="cont">
					[우편번호] &nbsp;<%=radr[0]%><br><%=radr[1]%> <%=radr[2]%>
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">티켓 수령방법</div>
				<div class="cont">
					<%=dto.getReceive() %>
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">입장권 수량</div>
				<div class="cont">
					<%=dto.getQty() %> 매
				</div>				
			</div>		
			
			<div class="frm_line clfix">
				<div class="tit">결제 수단</div>
				<div class="cont">					
					<%=dto.getPayMethod() %>
				</div>				
			</div>	
			
			<div class="frm_line totalPrice clfix">
				결제금액<strong><%=dto.getTotalPrice() %></strong>원						
			</div>		
						
		</div><!-- frm_cont -->		
					
		<div class="reserv_btnWrap">
			<div class="clfix">
				<button class="reserv_btn02" type="button" style="float:left; margin-left:0;" onclick="del()">예매취소</button>		
				<a class="reserv_btn02 submit" style="float:left;" href="/AgencyBgencyy/reservget?seq=<%=dto.getSeq() %>&page=update">정보수정</a>
				<a class="reserv_btn02" style="float:right; width:200px; background:#5f0080; color:#fff;" href="/AgencyBgencyy/exhibitlist">목록</a>7
			</div>		
		</div>
		
	</form><!-- ConfirmFrm -->
</div><!-- formWrap -->

<script>


var total = <%=dto.getTotalPrice() %>;	

// ex) 7000원 -> 7,000원
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

$(".totalPrice strong").text(totalPrice);

// 예매취소
function del() {
if(confirm("예매 취소하시겠습니까?")) {
		// 확인 
		location.href="/AgencyBgencyy/reservedelte?seq=<%=dto.getSeq() %>";
	} else {
		// 취소 
	}
}

// 정보수정
$('.reserv_btn02.submit').click(function(){
	// $("form").attr({"action":""}).submit();
});


</script>


<%@include file ="../include/footer.jsp" %>