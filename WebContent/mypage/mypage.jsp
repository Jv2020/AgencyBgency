<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
//멤버세션
MemberDto mem = (MemberDto)session.getAttribute("loginuser");
System.out.println("마지막 jsp 업데이트 dto: " + mem.toString());

//address - split
String address = mem.getAddress();
String[] radr = address.split("/");
%>


<style>
.insertFrm {}
.ConfirmFrm {width:800px; margin:0 auto;}

.ConfirmFrm .frm_cont .frm_line > div.tit {padding:10px 0;}
.ConfirmFrm .frm_cont .frm_line > div.cont {padding:10px 20px; background:#f7f7f7; width:630px; font-size:16px;}

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

.reserv_btnWrap {width:100%; text-align:center; margin:0px 0 0; overflow:hidden;}
.reserv_btnWrap button:first-child {margin-left:298px;}
.reserv_btnWrap a.reserv_btn02 {float:right; width:200px; background:#5f0080; color:#fff;}
button.reserv_btn02, a.reserv_btn02 {display:block; float:left; width:160px; height:60px; line-height:58px;
border:1px solid #5f0080; outline:none; margin-left:59px;
font-size:18px; color:#5f0080;}
button.reserv_btn03 {display:block; float:right; width:70px; height:30px; 
border:1px solid #5f0080; outline:none; margin-right:150px; margin-top:30px;
font-size:13px; color:#5f0080;}
button.reserv_btn02:hover {background:#5f0080; color:#fff; transition:all .2s ease-in-out;}

</style>

<div class="ConfirmFrm">
	<form method="post" action="<%=request.getContextPath() %>/MemberGetIdBeforeUpdate">
		<div class="frm_cont">
			<div class="frm_line clfix">
				<div class="tit">아이디</div>
				<div class="cont">
				<input type="hidden" name="memberId" value="<%=mem.getId() %>">
					<%=mem.getId() %>
				</div>
			</div>
			<div class="frm_line clfix">
				<div class="tit">이름</div>
				<div class="cont">
					<%=mem.getName() %>
				</div>
			</div>
			<div class="frm_line clfix">
				<div class="tit">연락처</div>
				<div class="cont">
					<%=mem.getPhone() %>
				</div>
			</div>
			<div class="frm_line clfix">
				<div class="tit">이메일</div>
				<div class="cont">
					<%=mem.getEmail() %>
				</div>
			</div>
			<div class="frm_line reser-birth clfix">
				<div class="tit">생년월일</div>
				<div class="cont">
					<%=mem.getBirthday().substring(0, 4) %> 년 &nbsp;
					<%=mem.getBirthday().substring(5, 7) %> 월 &nbsp;
					<%=mem.getBirthday().substring(8, 10) %> 일 &nbsp;
				</div>									
			</div>
			<div class="frm_line clfix">
				<div class="tit">성별</div>
				<div class="cont">
					<%
					if(mem.getGender().equals("male")){
					%>
						남성
					<%
					} else {
					%>											
						여성
					<%
					}
					%>
				</div>
			</div>
			<div class="frm_line clfix">
				<div class="tit">주소</div>
				<div class="cont">
					[우편번호] &nbsp;<%=radr[0]%><br><%=radr[1]%> <%=radr[2]%>
				</div>				
			</div>
			<div class="frm_line clfix">
				<div class="tit">비밀번호 힌트 질문</div>
				<div class="cont">
					<%
					if(mem.getQuestion().equals("1")){
					%>
						기억에 남는 추억의 장소는?					
					<%	
					} else if(mem.getQuestion().equals("2")){
					%>
						나의 보물 1호는?		
					<%	
					} else if(mem.getQuestion().equals("3")){
					%>
						나의 출신 초등학교는?
					<%	
					} else if(mem.getQuestion().equals("4")){
					%>
						가장 좋아하는 색깔은?
					<%	
					} else if(mem.getQuestion().equals("5")){
					%>
						아버지 성함은?
					<%	
					}
					%>
					<br>
					<%=mem.getHint() %>
				</div>
			</div>
			<%
			if(mem.getAuth() != 0){
			%>
				<div class="frm_line clfix">
					<div class="tit">전시관명</div>
					<div class="cont">
						<%=mem.getExhibit_name() %>
					</div>
				</div>
				<div class="frm_line clfix">
					<div class="tit">자격증번호</div>
					<div class="cont">
						<%=mem.getCerti_num() %>
					</div>
				</div>
			<%				
			}
			%>
			<div class="frm_line clfix"></div>
		</div>
		
		
	<div class="reserv_btnWrap">
		<button class="reserv_btn02" style="display:inline-block;" id="memUpdate" value="<%=mem.getId() %>">회원정보 수정</button>
	</div>
	</form><!-- ConfirmFrm -->
</div><!-- formWrap -->
	<div class="reserv_btnWrap">
		<button class="reserv_btn03" style="display:inline-block" id="dell" value="<%=mem.getId() %>">회원탈퇴</button>
	</div>

<script>
function getContextPath() {
	   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

$("#dell").click(function(){
	var deleteId = $("#dell").val();
	var userInput = prompt("삭제를 하시려면 아이디를 다시 입력하세요");
	if(userInput == deleteId){
		location.href=getContextPath()+"/memberdeleteid?deleteId="+deleteId;		
	} else {
		alert("잘못된 아이디를 입력하셨습니다.");
	}
});


</script>




<%@include file ="../include/footer.jsp" %>

