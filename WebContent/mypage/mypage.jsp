<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
MemberDto mem = (MemberDto)session.getAttribute("loginuser");
%>


<style>
.insertFrm {}
.frm_cont {}
.frm_cont.border-btm {border-bottom:1px solid #ddd;}
.frm_cont .category {width:100%; overflow:hidden; margin-bottom:20px;}
.frm_cont .category-radius{float:right; width:160px; border-radius:5px; font-size:0; border:1px solid #5f0080; text-align:center; overflow:hidden;}
.frm_cont .category span {display:inline-block; width:50%; padding:10px 0; font-size:14px; color:#5f0080; cursor:pointer;}
.frm_cont .category span.on {background:#5f0080; color:#fff;}

.frm_cont .frm_line {padding:20px 0; border-top:1px solid #ddd;}
.frm_cont .frm_line.curator {display:none;}
.frm_cont .frm_line > div {float:left;}
.frm_cont .frm_line > div.floatNone{float:none; width:100%;}
.frm_cont .frm_line .tit {width:150px; color:#333; font-size:18px;}
.frm_cont .frm_line .cont {}
.frm_cont .frm_line .cont.i-mg-none {font-size:0;}
.frm_cont .frm_line .cont.i-mg-none input {margin:0;}
.frm_cont .frm_line .cont input {border:1px solid #a1a1a1; height:30px; padding:0 10px; margin-right:10px;}
.frm_cont .frm_line .cont input.ttxt {width:200px;}
.frm_cont .frm_line .cont input.byear{width:90px;}
.frm_cont .frm_line .cont input.bday{width:90px;}
span.alert-red {color:red; font-size:13px;}
span.alert-green {color:#3ec629; font-size:13px;}
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

.frm_cont .frm_line .cont select.select-hint {
   width:450px;
   font-size:15px;
   background:#fff url(../images/sub/sel_arrow.png) no-repeat 97% 50%;
}
.frm_cont .frm_line .cont .hint-answer{width:300px; margin-top:8px;}


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

div.memEdit{
	width:500px; 
	height:360px; 
	margin: 0 auto;
	padding: 20px;
	padding-left: 76px;
}
.memEdit ul li button.memUpdate {
	border:1px solid #5f0080;
	background:#5f0080;
	color:#fff;
	font-size:18px;
	width:100px;
	height:34px;
	padding:0 10px;
	margin-left: 50px;
	display:inline-block;
	text-align:center;	
}
.memEdit ul li button.memDelete {
	border:1px solid #5f0080;
	background:#fff; color:#5f0080; 
	font-size:18px; 
	width:100px; 
	height:34px;  
	padding:0 10px; 
	margin-left: 50px; 
	display:inline-block; 
	text-align:center;}


</style>


<div class="insertFrm">
   <form method="post" action="">
      <div class="frm_cont border-btm">
         <div class="category">
            <div class="category-radius">
            	<%
            	if(mem.getAuth() == 0){
            	%>
	            	<span class="on">일반회원<input type="hidden" name="memberAuth" value="0"></span>
	               	<span class="curatorBtn">큐레이터<input type="hidden" value="1"></span>
            	<%	
            	} else if(mem.getAuth() == 1 || mem.getAuth() == 2) {
            	%>
	            	<span class="curatorBtn">일반회원<input type="hidden" name="memberAuth" value="0"></span>
	               	<span class="on">큐레이터<input type="hidden" value="1"></span>
            	<%	
            	} else {
				%>
					<span class="curatorBtn">일반회원<input type="hidden" name="memberAuth" value="0"></span>
	               	<span class="curatorBtn">큐레이터<input type="hidden" value="1"></span>
				<%            		
            	}
            	%>
            </div>
         </div>
         <div class="frm_line clfix">
            <div class="tit">아이디</div>
            <div class="cont idComentColor">
               <input class="ttext memberId" type="text" maxlength="20" name="memberId" value="<%=mem.getId() %>" readonly>
               <span class="idCheck"></span>
            </div>            
         </div>
         
         <div class="frm_line clfix">
            <div class="tit">이름</div>
            <div class="cont">
               <input class="ttext" type="text" name="memberName" value="<%=mem.getName() %>" readonly>
            </div>            
         </div>
         
         <div class="frm_line clfix">
            <div class="tit">연락처</div>
            <div class="cont phoneComentColor">
               <input class="memberPhone" type="text" maxlength="11" name="memberPhone" value="<%=mem.getPhone() %>" readonly>
               <span class="phoneCheck"></span>
            </div>            
         </div>
         
         <div class="frm_line clfix">
            <div class="tit">이메일 주소</div>
            <div class="cont i-mg-none">
               <%
               String[] emailArray = mem.getEmail().split("@");
               %>
               <input class="memberEmail1" type="text" name="memberEmail1" value="<%=emailArray[0]%>" readonly>
               <span class="frm-mg">@</span>
               <input class="memberEmail2" type="text" name="memberEmail2" value="<%=emailArray[1]%>" readonly>
            </div>            
         </div>
         
         <div class="frm_line clfix">
            <div class="tit">생년월일</div>
            <div class="cont">
	            <%
	            String[] birthArray = mem.getBirthday().split("-");
	            %>
                <input class="byear" type="text" name="memberYear" value="<%=birthArray[0] %>" maxlength="4" readonly>
            </div>            
            <div class="cont">
                <input class="byear" type="text" name="memberMonth" value="<%=birthArray[1] %>" readonly>
            </div>
            <div class="cont">
                <input class="bday" type="text" name="memberDate" value="<%=birthArray[2] %>" maxlength="2" placeholder="일" readonly>               
            </div>                           
         </div>
         
         <div class="frm_line clfix">
            <div class="tit">성별</div>
            <div class="cont">
	           	<%
	           	if(mem.getGender().equals("male")){
	       		%>
	   		 		<input type="text" id="male" name="memberGender" value="남성" readonly>
	       		<%	
	           	} else if(mem.getGender().equals("female")){ 
				%>
					<input type="text" id="female" name="memberGender" value="여성" readonly>
				<%            		
	           	}
	           	%>
            </div>            
         </div>         
         
         <div class="frm_line clfix">
            <div class="tit">주소</div>
            <div class="cont">
            	<%
	            String[] addressArray = mem.getAddress().split("/");
	            %>
               <!-- <input type="text" class="frm-address" value="서울특별시 서초구 서초4동 강남대로 459" readonly="readonly"><span class="frm_adr_btn">주소검색</span><br>
               <input class="mt08" type="text" value="2층 2강의실" readonly="readonly"> -->
               <input type="text" id="sample4_postcode" name="memberPostCode" readonly="readonly" value="<%=addressArray[0] %>" readonly><br>
                <!-- <span onclick="sample4_execDaumPostcode()" class="frm_adr_btn">주소검색</span><br> -->
                <input type="text" class="mt08" id="sample4_roadAddress" name="memberStreetName" value="<%=addressArray[1] %>" readonly>
                <input type="text" style="display:none;" id="sample4_jibunAddress" placeholder="지번주소">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text"  class="mt08" id="sample4_detailAddress" name="memberDetailStreetName" value="<%=addressArray[2] %>" readonly>
                <input type="text" style="display:none;" id="sample4_extraAddress" placeholder="참고항목">
            </div>            
         </div>
         
         <div class="frm_line clfix" style="padding:40px 0;">
            <div class="tit floatNone">비밀번호 찾기 질문</div>
            <div class="cont floatNone mt20">
               <%
               if(mem.getQuestion().equals("1")){
               %>
              		<input class="hint-answer" type="text" name="memberAnswer" value="기억에 남는 추억의 장소는?" readonly><br>
               		<input class="hint-answer" type="text" name="memberAnswer" value="<%=mem.getHint() %>" readonly>
               <%
               } else if(mem.getQuestion().equals("2")){
               %>
             		<input class="hint-answer" type="text" name="memberAnswer" value="나의 보물 1호는?" readonly><br>
              		<input class="hint-answer" type="text" name="memberAnswer" value="<%=mem.getHint() %>" readonly>
               <%
               } else if(mem.getQuestion().equals("3")){
               %>
               		<input class="hint-answer" type="text" name="memberAnswer" value="나의 출신 초등학교는?" readonly><br>
               		<input class="hint-answer" type="text" name="memberAnswer" value="<%=mem.getHint() %>" readonly>
               <%
               } else if(mem.getQuestion().equals("4")){
               %>
               		<input class="hint-answer" type="text" name="memberAnswer" value="가장 좋아하는 색깔은?" readonly><br>
               		<input class="hint-answer" type="text" name="memberAnswer" value="<%=mem.getHint() %>" readonly>
               <%
               } else if(mem.getQuestion().equals("5")){
               %>
               		<input class="hint-answer" type="text" name="memberAnswer" value="아버지 성함은?" readonly><br>
               		<input class="hint-answer" type="text" name="memberAnswer" value="<%=mem.getHint() %>" readonly>
               <%
               } 
               %>
               
                  <!-- <option value="1" selected>기억에 남는 추억의 장소는?</option>
                  <option value="2">나의 보물 1호는?</option>
                  <option value="3">나의 출신 초등학교는?</option>
                  <option value="4">가장 좋아하는 색깔은?</option>
                  <option value="5">아버지 성함은?</option>
               <br>
               <input class="hint-answer" type="text" name="memberAnswer" placeholder="답을 입력해주세요"> -->
            </div>            
         </div>      
         <div class="frm_line curator clfix">
            <div class="tit">전시관명</div>
            <div class="cont">
               <input type="text" name="memberExhibit_name">
            </div>            
         </div>
         
         <div class="frm_line curator clfix">
            <div class="tit">자격증번호</div>
            <div class="cont">
               <input type="text" name="memberCerti_num">
            </div>   
         </div>               
      </div><!-- frm_cont -->      
      
   </form><!-- insertFrm -->
</div><!-- formWrap -->

<div class="memEdit">
	<form>
		<ul>
			<li>
				<button class="memUpdate">회원수정</button>
				<button id ="dell" class="memDelete" value="<%=mem.getId() %>">회원탈퇴</button>
			</li>
		</ul>
	</form>
</div>

<script>
$("#dell").click(function(){
	var seletedId = {"id" : $("#dell").val()};
	alert(seletedId.id);
	$.ajax({
		url: "../memberdeleteid",
		type: "post",
		dataType: "text",
		contentType :"application/x-www-form-urlencoded; charset=UTF-8",
		data : seletedId,
		async:false,
		success : function(data){
			alert("성공");
			console.log("성공");
		},
		error : function(){
			alert("실패");
		}
	
	});
});


</script>
<%-- <script src="<%=request.getContextPath() %>/js/mypage.js"></script> --%>

<%@include file ="../include/footer.jsp" %>

