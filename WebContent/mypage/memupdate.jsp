<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
//멤버세션
MemberDto mem = (MemberDto)request.getAttribute("loginuser");

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
.reserv_btnWrap button:first-child {margin-left:318px;}
.reserv_btnWrap a.reserv_btn02 {float:right; width:200px; background:#5f0080; color:#fff;}
button.reserv_btn02, a.reserv_btn02 {display:block; float:left; width:160px; height:60px; line-height:58px;
border:1px solid #5f0080; outline:none; margin-left:59px;
font-size:18px; color:#5f0080;}
button.reserv_btn02:hover {background:#5f0080; color:#fff; transition:all .2s ease-in-out;}

.frm_cont .frm_line .cont input.input-modify {}
.frm_cont .frm_line .cont input.input-modify::placeholder{}
.bgnone {background:none !important; padding:10px 0 !important;}

.frm_cont .frm_line .cont select.select-hint {
   width:450px;
   font-size:15px;
   background:#fff url(../images/sub/sel_arrow.png) no-repeat 97% 50%;
}
.frm_cont .frm_line .cont .hint-answer{width:300px; margin-top:8px;}



</style>

<div class="ConfirmFrm">
	<p style="text-align:right; margin-bottom:20px;"><b>*</b> 표시가 있는 부분은 수정 가능합니다</p>
	<form method="post" action="<%=request.getContextPath() %>/memberupdate">
		<div class="frm_cont">
			<div class="frm_line clfix">
				<!-- 아이디 -->
				<div class="tit">아이디</div>
				<div class="cont">
					<input type="hidden" id="id" name="memberId" value="<%=mem.getId() %>">
					<%=mem.getId() %>
				</div>
			</div>
			<div class="frm_line clfix">
				<!-- 이름 -->
				<div class="tit">이름</div>
				<div class="cont">
					<%=mem.getName() %>
				</div>
			</div>
			<div class="frm_line clfix">
				<!-- 연락처 -->
				<div class="tit">연락처 <b>*</b></div>
				<div class="cont">
					<input type="text" id="phone" name="memberPhone" value="<%=mem.getPhone() %>" class="input-modify" placeholder="">
				</div>
			</div>
			<div class="frm_line clfix">
				<!-- 이메일 -->
				<div class="tit">이메일</div>
				<div class="cont">
					<%=mem.getEmail() %>
				</div>
			</div>
			<div class="frm_line reser-birth clfix">
				<!-- 생년월일 -->
				<div class="tit">생년월일</div>
				<div class="cont">
					<%=mem.getBirthday().substring(0, 4) %> 년 &nbsp;
					<%=mem.getBirthday().substring(5, 7) %> 월 &nbsp;
					<%=mem.getBirthday().substring(8, 10) %> 일 &nbsp;
				</div>									
			</div>
			<div class="frm_line clfix">
				<!-- 성별 -->
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
				<!-- 주소 -->
				<div class="tit">주소 <b>*</b></div>
				<div class="cont">
					<!-- <input type="text" class="frm-address" value="서울특별시 서초구 서초4동 강남대로 459" readonly="readonly"><span class="frm_adr_btn">주소검색</span><br>
               <input class="mt08" type="text" value="2층 2강의실" readonly="readonly"> -->
               <input type="text" id="sample4_postcode" name="memberPostCode" readonly="readonly" placeholder="우편번호" value="<%=radr[0]%>"> 
                <span onclick="sample4_execDaumPostcode()" class="frm_adr_btn">주소검색</span><br>
                <input type="text" class="mt08" id="sample4_roadAddress" readonly="readonly" name="memberStreetName" placeholder="도로명주소" value="<%=radr[1]%>">
                <input type="text" style="display:none;" id="sample4_jibunAddress" placeholder="지번주소">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text"  class="mt08" id="sample4_detailAddress" name="memberDetailStreetName" placeholder="상세주소" value="<%=radr[2]%>">
                <input type="text" style="display:none;" id="sample4_extraAddress" placeholder="참고항목">
				</div>				
			</div>
			<div class="frm_line clfix">
				<!-- 비밀번호 힌트 질문 -->
				<div class="tit">비밀번호 힌트 질문 <b>*</b></div>
				<div class="cont">
	               	<select class="select-hint" id="memberQuestion" name="memberQuestion">
	               		<%
	               		if(mem.getQuestion().equals("1")){
			            %>
			                <option value="1" selected>기억에 남는 추억의 장소는?</option>
			                <option value="2" >나의 보물 1호는?</option>
			                <option value="3" >나의 출신 초등학교는?</option>
			                <option value="4" >가장 좋아하는 색깔은?</option>
			                <option value="5" >아버지 성함은?</option>
			            <%
	               		} else if(mem.getQuestion().equals("2")){
			            %>
			                <option value="1" >기억에 남는 추억의 장소는?</option>
			                <option value="2" selected>나의 보물 1호는?</option>
			                <option value="3" >나의 출신 초등학교는?</option>
			                <option value="4" >가장 좋아하는 색깔은?</option>
			                <option value="5" >아버지 성함은?</option>
			            <%
	               		} else if(mem.getQuestion().equals("3")){
			            %>
			                <option value="1" >기억에 남는 추억의 장소는?</option>
			                <option value="2" >나의 보물 1호는?</option>
			                <option value="3" selected>나의 출신 초등학교는?</option>
			                <option value="4" >가장 좋아하는 색깔은?</option>
			                <option value="5" >아버지 성함은?</option>
			            <%
	               		} else if(mem.getQuestion().equals("4")){
			            %>
			                <option value="1" >기억에 남는 추억의 장소는?</option>
			                <option value="2" >나의 보물 1호는?</option>
			                <option value="3" >나의 출신 초등학교는?</option>
			                <option value="4" selected>가장 좋아하는 색깔은?</option>
			                <option value="5" >아버지 성함은?</option>
			            <%
	               		} else if(mem.getQuestion().equals("5")){
			            %>
			                <option value="1" >기억에 남는 추억의 장소는?</option>
			                <option value="2" >나의 보물 1호는?</option>
			                <option value="3" >나의 출신 초등학교는?</option>
			                <option value="4" >가장 좋아하는 색깔은?</option>
			                <option value="5" selected>아버지 성함은?</option>
			            <%
	               		}
	               		%>
	                </select><br>
	                <!-- 비밀번호 힌트 답 -->
               		<input class="hint-answer" type="text" id="memberAnswer" name="memberAnswer" placeholder="답을 입력해주세요" value="<%=mem.getHint()%>">
            	</div>            
			</div>
			<div class="frm_line clfix" style="padding-bottom: 1px"></div>
			<div style="text-align: right;margin-bottom: 20px;">
			<!-- 비밀번호 변경 링크 -->
			<a href="#" style="color:#5f0080">비밀번호 변경</a>
			</div>
		</div>
		
		<div class="reserv_btnWrap">
			<!-- 수정완료 버튼 -->
			<button type="submit" id="update" class="reserv_btn02">수정완료</button>
		</div>
		
	</form><!-- ConfirmFrm -->
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
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>




<%@include file ="../include/footer.jsp" %>

