$('.categoryBox span').click(function(){
	// 일반 / 큐레이터 선택
   $('.categoryBox span').removeClass('on');
   $(this).addClass('on');
   $('.categoryBox span').value = 0;
   
   // 큐레이터 추가 질문	
   if($('span.curatorBtn').hasClass('on')){   
      $('.frm_line.curator').show()      
   }else{   
      $('.frm_line.curator').hide()      
   }
});

// 아이디 체크(정규식 + 멘트)
var memId = document.querySelector(".memberId");
memId.addEventListener("blur", function(e){
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	if($(".memberId").val() == ""){
		if($('span.idCheck').hasClass('alert-green')) {
    		$('.idComentColor span').removeClass('alert-green');
    	}
		document.querySelector(".idCheck").innerHTML = "";
	} else {
	    if( !idReg.test( $(".memberId").val() )) {
	    	if($('span.idCheck').hasClass('alert-green')) {
	    		$('.idComentColor span').removeClass('alert-green');
	    	}
	    	$('.idComentColor span').addClass('alert-red');
	    
	    	document.querySelector(".idCheck").innerHTML = "아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.";
	        return;
	    }  else {
	    	if($('span.idCheck').hasClass('alert-red')) {
	    		$('.idComentColor span').removeClass('alert-red');
	    	}
	    	$('.idComentColor span').addClass('alert-green');
	    	document.querySelector(".idCheck").innerHTML = "멋진 아이디군요~!";
	    }
	}
	});

 // 패스워드 체크(정규식 + 멘트)
    var memPwd = document.querySelector(".memberPwd");
    memPwd.addEventListener("blur", function(e){
    	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
    	if($(".memberPwd").val() == ""){
    		if($('span.pwdCheck').hasClass('alert-red')) {
        		$('.pwdComentColor span').removeClass('alert-red');
        	}
    		document.querySelector(".pwdCheck").innerHTML = "";
    	} else {
        if( !idReg.test( $(".memberPwd").val() )) {
        	if($('span.pwdCheck').hasClass('alert-green')) {
        		$('.pwdComentColor span').removeClass('alert-green');
        	}
        	$('.pwdComentColor span').addClass('alert-red');
        
        	document.querySelector(".pwdCheck").innerHTML = "비밀번호는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.";
            return;
        } else {
        	if($('span.pwdCheck').hasClass('alert-red')) {
        		$('.pwdComentColor span').removeClass('alert-red');
        	}
        	$('.pwdComentColor span').addClass('alert-green');
        	document.querySelector(".pwdCheck").innerHTML = "사용가능한 비밀번호 입니다";
        }
    	}
    });
    
// 패스워드 재확인 + 멘트
var pw = document.querySelector(".memberPwdReCheck");

pw.addEventListener("blur", function(e){
	var pw1 = document.querySelector(".memberPwd").value;
	var pw2 = document.querySelector(".memberPwdReCheck").value;	
	if(pw1 == "" || pw2 == ""){
		if($('span.idCheck').hasClass('alert-green')) {
    		$('.idComentColor span').removeClass('alert-green');
    	}
		document.querySelector(".pwdEqualCheck").innerHTML = "";
	} else {
	if(pw1 == pw2){
		if($('span.pwdEqualCheck').hasClass('alert-red')) {
    		$('.pwdReCheckComentColor span').removeClass('alert-red');
    	}
    	$('.pwdReCheckComentColor span').addClass('alert-green');
		document.querySelector(".pwdEqualCheck").innerHTML = "일치합니다.";
		
	} else {
		if($('span.pwdEqualCheck').hasClass('alert-green')) {
    		$('.pwdReCheckComentColor span').removeClass('alert-green');
    	}
    	$('.pwdReCheckComentColor span').addClass('alert-red');
		document.querySelector(".pwdEqualCheck").innerHTML = "비밀번호를 다시 확인해 주세요";
	}
	}
});

// 연락처 정규식 + 멘트
var phone = document.querySelector(".memberPhone");
phone.addEventListener("blur", function(e){
	var ph = /^\d{10,11}$/;
//	var ph = /^[0-9]+[0-9]{9,10}$/g;
	if($('.memberPhone').val() == ""){
		if($('span.memberPhone').hasClass('alert-red')){
			$('.phoneComentColor span').removeClass('alert-red');
		}
		document.querySelector(".phoneCheck").innerHTML = "";
	} else {
		if( !ph.test( $(".memberPhone").val() )) {
			if($('span.phoneCheck').hasClass('alert-green')) {
        		$('.phoneComentColor span').removeClass('alert-green');
        	}
        	$('.phoneComentColor span').addClass('alert-red');
        	document.querySelector(".phoneCheck").innerHTML = "정말인가요?";
            return;
		} else {
			if($('span.phoneCheck').hasClass('alert-red')) {
        		$('.phoneComentColor span').removeClass('alert-red');
        	}
        	$('.phoneComentColor span').addClass('alert-green');
        	document.querySelector(".phoneCheck").innerHTML = "";
		}
	}
});

$('button.sBtn').click(function(){
	if($('.idComentColor span').hasClass('alert-red') || $('.memberId').val().trim() == "") {
		alert("아이디를 확인해주세요");
		$('.memberId').focus();
		return false;
	} else if($('.pwdComentColor span').hasClass('alert-red') || $('.memberPwd').val().trim() == "") {
		alert("비밀번호를 확인해주세요");
		$('.memberPwd').focus();
		return false;
	} else if($('.pwdReCheckComentColor span').hasClass('alert-red') || $('.memberPwdReCheck').val().trim() == "") {
		alert("비밀번호 재확인을 확인해주세요");
		$('.memberPwdReCheck').focus();
		return false;
	} else if($('input[name=memberName]').val().trim() == "") {
		alert("이름을 입력해 주세요");
		$('input[name=memberName]').focus();
		return false;
	} else if($('.phoneComentColor span').hasClass('alert-red') || $('.memberPhone').val().trim() == "") {
		alert("연락처를 확인해주세요");
		$('.memberPhone').focus();
		return false;
	} else if($('input[name="memberEmail1"]').val().trim() == "" || $('input[name=memberEmail2]').val().trim() == "" ) {
		alert("이메일을 확인해주세요");
		$('.memberEmail1').focus();
		return false;
	} else if($('.select-month').val() == "월"){
		alert("생년월일을 확인해주세요");
		$('.select-month').focus();
		return false;
	} else if($('input[name=memberYear]').val().length < 4){
		alert("생년월일을 확인해주세요");
		$('input[name=memberYear]').focus();
		return false;
	} else if(parseInt($('input[name=memberDate]').val()) > 31){
		alert("생년월일을 확인해주세요");
		$('input[name=memberDate]').focus();
		return false;
	} else if($('input[name=memberPostCode]').val().trim() == ""){
		alert("주소를 확인해주세요");
		$('input[name=memberPostCode]').focus();
		return false;
	} else if($('input[name=memberAnswer]').val().trim() == ""){
		alert("비밀번호 찾기 질문을 확인해주세요");
		$('input[name=memberAnswer]').focus();
		return false;
	} else {
		$("form").attr("action", "../memberinsert").submit();
	}
	
});



//













