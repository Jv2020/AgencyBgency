<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
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


</style>


<div class="insertFrm">
	<form method="post" action="">
		<div class="frm_cont border-btm">
			<div class="category">
				<div class="category-radius categoryBox">
					<span class="on">일반회원</span>
					<span class="curatorBtn">큐레이터</span>
				</div>
			</div>
			<div class="frm_line clfix">
				<div class="tit">아이디</div>
				<div class="cont">
					<input class="ttext" type="text" value="">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">비밀번호</div>
				<div class="cont">
					<input class="ttext" type="password" value="">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">비밀번호 재확인</div>
				<div class="cont">
					<input class="ttext" type="password" value="">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">이름</div>
				<div class="cont">
					<input class="ttext" type="text" value="">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">연락처</div>
				<div class="cont">
					<input type="text" placeholder="-없이 입력해주세요">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">이메일 주소</div>
				<div class="cont i-mg-none">
					<input type="text">
					<span class="frm-mg">@</span>
					<input type="text">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">생년월일</div>
				<div class="cont">
					<input class="byear" type="text" value="" maxlength="4" placeholder="년(4자)">
				</div>				
				<div class="cont">
					<select class="select-month">
						<option value="월">월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
				<div class="cont">
					<input class="bday" type="text" value="" maxlength="2" placeholder="일">	
					<span class="alert-birth">태어난 년도 4자리를 정확하게 입력하세요.</span>				
				</div>									
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">성별</div>
				<div class="cont">
					<input type="radio" id="male" name="gnder" checked="checked"/><label for="male"><span></span>남성</label>
  					<input type="radio" id="female" name="gnder" /><label for="female"><span></span>여성</label>
				</div>				
			</div>			
			
			<div class="frm_line clfix">
				<div class="tit">주소</div>
				<div class="cont">
					<input type="text" class="frm-address" value=""><span class="frm_adr_btn">주소검색</span><br>
					<input class="mt08" type="text" value="">
				</div>				
			</div>
			
			<div class="frm_line clfix" style="padding:40px 0;">
				<div class="tit floatNone">비밀번호 찾기 질문</div>
				<div class="cont floatNone mt20">
					<select class="select-hint">
						<option value="">기억에 남는 추억의 장소는?</option>
						<option value="">나의 보물 1호는?</option>
						<option value="">나의 출신 초등학교는?</option>
						<option value="">가장 좋아하는 색깔은?</option>
						<option value="">아버지 성함은?</option>
					</select><br>
					<input class="hint-answer" type="text" placeholder="답을 입력해주세요">
				</div>				
			</div>		
			
			<div class="frm_line curator clfix">
				<div class="tit">전시관명</div>
				<div class="cont">
					<input type="text">
				</div>				
			</div>
			
			<div class="frm_line curator clfix">
				<div class="tit">자격증번호</div>
				<div class="cont">
					<input type="text">
				</div>	
			</div>					
		</div><!-- frm_cont -->		
		
		<button class="reserv_btn">가입하기</button>
		
	</form><!-- insertFrm -->
</div><!-- formWrap -->

<script>
$('.categoryBox span').click(function(){
	$('.categoryBox span').removeClass('on');
	$(this).addClass('on');
	if($('span.curatorBtn').hasClass('on')){	
		$('.frm_line.curator').show()		
	}else{	
		$('.frm_line.curator').hide()		
	}
});
</script>


<%@include file ="../include/footer.jsp" %>		