<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<% 
// 전시 디테일 dto
ExhibitDto edto = (ExhibitDto)request.getAttribute("exhibitDto");
//System.out.println("edto title : " + edto.getTitle());

// member 
MemberDto mem = (MemberDto)session.getAttribute("loginuser");

// email - split
String email = mem.getEmail();
String[] edata = email.split("@");

// address - split
String address = mem.getAddress();
String[] madr = address.split("/");
String detail="";
if(madr.length == 3){
detail= madr[2];
	
}

%>	
<style>
.reserv_exInfo {width:100%; padding:30px 10px; border-top:1px solid #ddd; border-bottom:1px solid #ddd; margin-bottom:40px;}
.reserv_exInfo h3 {font-size:25px;}
.reserv_exInfo ul {margin-top:20px;}
.reserv_exInfo ul li {position:relative; font-size:18px; line-height:32px; color:#333; padding-left:20px;}
.reserv_exInfo ul li:before {position:absolute; top:50%; left:0; margin-top:-2px; content:''; background:#5f0080; width:4px; height:4px;}
.reserv_exInfo ul li span {display:inline-block; width:120px; letter-spacing:5px; color:#333; font-weight:500;}
.reserv_exInfo ul li i.ex_price {font-style:normal;}

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
input.readOnly[type="text"] {background:#f1e9ff;}
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


</style>

<div class="reserv_exInfo">
	<h3><%=edto.getTitle() %></h3>
	<ul>
		<li><span>장 &nbsp; 소</span><%=edto.getPlace() %></li>
		<li><span>기 &nbsp; 간</span><%= edto.getBegindate().substring(0, 10)+" ~ "+ edto.getEnddate().substring(0, 10) %></li>
		<li><span>시 &nbsp; 간</span><%=edto.getEx_time().substring(0, 2) +":" +edto.getEx_time().substring(2, 4)+" - " + edto.getEx_time().substring(4, 6) +":" +edto.getEx_time().substring(6, 8) %></li>
		<li><span>가 &nbsp; 격</span><input class="ex_price_hidden" type="hidden" value='<%=edto.getPrice() %>'><i class="ex_price"></i>원</li>
		<li><span>문 &nbsp; 의</span><%=edto.getContact() %></li>
	</ul>
</div>

<div class="insertFrm">
	<form method="post" action="">
		<input type="hidden" name="title" value="<%=edto.getTitle() %>">
		<div class="frm_cont">
			<div class="frm_line clfix">
				<div class="tit">예매자 이름 <input name="id" type="hidden" value="<%=mem.getId() %>"></div>
				<div class="cont">
					<input name="reservName" class="ttext readOnly" type="text" value=" <%=mem.getName() %>" readonly="readonly">
				</div>				
			</div>
			
			<div class="frm_line reser-birth clfix">
				<div class="tit">생년월일</div>
				<div class="cont mr20">
					<input name="reservYear" class="byear readOnly" type="text" value="<%=mem.getBirthday().substring(0, 4) %>" maxlength="4" readonly="readonly"> 년
				</div>				
				<div class="cont mr20">
					<input name="reservMonth" class="bmonth readOnly" type="text" value="<%=mem.getBirthday().substring(5, 7) %>" maxlength="2" readonly="readonly"> 월
				</div>
				<div class="cont">
					<input name="reservDay" class="bday readOnly" type="text" value="<%=mem.getBirthday().substring(8, 10) %>" maxlength="2" readonly="readonly"> 일			
				</div>									
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">연락처</div>
				<div class="cont i-mg-none">
					<input name="reservPhone" type="text" value="<%=mem.getPhone() %>">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">이메일 주소</div>
				<div class="cont i-mg-none">
					<input name="reservEmail01" type="text" value="<%=edata[0]%>">
					<span class="frm-mg">@</span>
					<input name="reservEmail02" type="text" value="<%=edata[1]%>">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">주소</div>
				<div class="cont">
					<input name="post" type="text" id="sample4_postcode" readonly="readonly" value="<%=madr[0] %>" placeholder="우편번호"> 
				    <span onclick="sample4_execDaumPostcode()" class="frm_adr_btn">주소검색</span><br>
				    <input name="address01" type="text" class="mt08" id="sample4_roadAddress" value="<%=madr[1] %>" placeholder="도로명주소">
				    <input type="text" style="display:none;" id="sample4_jibunAddress" placeholder="지번주소">
				    <span id="guide" style="color:#999;display:none"></span>
				    <input name="address02" type="text"  class="mt08" id="sample4_detailAddress" value="<%=detail %>" placeholder="상세주소">
				    <input type="text" style="display:none;" id="sample4_extraAddress" placeholder="참고항목">
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
						<span class="minus" onclick="minus()">-</span>
						<input name="qty" type="text" value="0" readonly="readonly">
						<span class="plus" onclick="plus()">+</span>
					</div>
				</div>				
			</div>		
			
			<div class="frm_line clfix">
				<div class="tit floatNone">결제 수단</div>
				<div class="cont floatNone mt20">					
					<input type="radio" id="r-payment1" name="r-payment" value="무통장입금" checked="checked"><label for="r-payment1"><span></span>무통장 입금</label>
					<input type="radio" id="r-payment2" name="r-payment" value="신용카드"><label for="r-payment2"><span></span>신용카드</label>
					<input type="radio" id="r-payment3" name="r-payment" value="휴대폰"><label for="r-payment3"><span></span>휴대폰</label>
					<input type="radio" id="r-payment4" name="r-payment" value="카카오페이"><label for="r-payment4"><span></span>카카오페이</label>
				</div>				
			</div>	
			
			<div class="frm_line totalPrice clfix">
				<input type="hidden" value="0" name="totalprice">
				결제금액<strong class="tprice">0</strong>원						
			</div>		
						
		</div><!-- frm_cont -->
		
		<button class="reserv_btn">결제하기</button>
		
	</form><!-- insertFrm -->
</div><!-- formWrap -->
<!-- 카카오 주소 검색 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'none'; // block -> none;
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

var total = <%=edto.getPrice() %>;
var len, point;	
total = total + "";
point = total.length % 3 ;
len = total.length;

totalPrice = total.substring(0, point);
while (point < len) {
	if (totalPrice != "") totalPrice += ",";
	totalPrice += total.substring(point, point + 3);
	point += 3;
}

$(".ex_price").text(totalPrice);


//입장권 수량 + / - 하기
function minus(){
   var qty = $(".qtyBox input").val();
   qty = (Number(qty)-1); // 수량 -1
   if(qty>=0){ // 0 이하는 적용 안됨
	$(".qtyBox input").val(qty);
	calc();
   }   
};

function plus() {
   var qty = $(".qtyBox input").val();
   qty = (Number(qty)+1); // 수량 +1
   if($(".qtyBox input").val()<50){ // 50 이상은 적용 안됨
	$(".qtyBox input").val(qty);
	 calc();
   }
};	

// 총 결제 금액 계산하기
function calc(){
	// var ex_price = $('i.ex_price').text().replace(",","");
	var ex_price = $('input.ex_price_hidden').val();
	var qty = $(".qtyBox input").val();
	var total = "";	
	total = ex_price*qty;	
	$(".totalPrice input").val(total);
	
	
	// ex) 7000원 -> 7,000원
	var len, point;	
	total = total + "";
	point = total.length % 3 ;
	len = total.length;
	
	totalPrice = total.substring(0, point);
	while (point < len) {
		if (totalPrice != "") totalPrice += ",";
		totalPrice += total.substring(point, point + 3);
		point += 3;
	}

	$(".tprice").text(totalPrice);
	
}
	
$(document).ready(function(){	
	// 결제하기 누르면 submit / input 값 없을 때 focus 
	$('button.reserv_btn').click(function(){
		if( $("input[name=reservName]").val().trim() == "" ){
			alert("이름을 입력해주세요");
			$("input[name=reservName]").focus();
			return false;
		}else if( $("input[name=reservYear]").val().trim() == ""){
			alert("년도를 입력해주세요");
			return false;
			$("input[name=reservYear]").focus();
		}else if( $("input[name=reservMonth]").val().trim() == ""){
			alert("월 입력해주세요");
			$("input[name=reservMonth]").focus();
			return false;
		}else if( $("input[name=reservDay]").val().trim() == ""){
			alert("일을 입력해주세요");
			$("input[name=reservDay]").focus();
			return false;
		}else if( $("input[name=reservPhone]").val().trim() == ""){
			alert("연락처를 입력해주세요");
			$("input[name=reservPhone]").focus();
			return false;
		}else if( $("input[name=reservEmail01]").val().trim() == ""){
			alert("이메일을 입력해주세요");
			$("input[name=reservEmail01]").focus();
			return false;
		}else if( $("input[name=reservEmail02]").val().trim() == ""){
			alert("이메일을 입력해주세요");
			$("input[name=reservEmail02]").focus();
			return false;
		}else if( $("[name=post]").val().trim() == ""){
			alert("우편번호를 입력해주세요");
			$("[name=post]").focus();
			return false;
		}else if( $("input[name=address01]").val().trim() == ""){
			alert("도로명 주소를 입력해주세요");
			$("input[name=address01]").focus();
			return false;
		}else if( $("input[name=address02]").val().trim() == ""){
			alert("상세주소를 입력해주세요");
			$("input[name=address02]").focus();
			return false;
		}else if( $("input[name=qty]").val() == "0"){
			alert("입장권 매수를 선택해주세요");
			$("input[name=qty]").focus();
			return false;
		}else {
			$("form").attr({"action":"/AgencyBgencyy/reservinsert"}).submit();
		}
		
	});
});
</script>

<%@include file ="../include/footer.jsp" %>		