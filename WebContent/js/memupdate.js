function getContextPath() {
   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

//연락처 정규식 + 멘트
var phone = document.querySelector(".memberPhone");
phone.addEventListener("change", function(e){
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


$('button#update').click(function(){
	if($('.phoneComentColor span').hasClass('alert-red') || $('.memberPhone').val().trim() == "") {
		alert("연락처를 확인해주세요");
		$('.memberPhone').focus();
		return false;
	} else if($('input[name=memberDetailStreetName]').val().trim() == ""){
		alert("상세주소를 확인해주세요");
		$('input[name=memberDetailStreetName]').focus();
		return false;
	} else {
		$("form").attr("action", getContextPath()+"/memberupdate").submit();
	}
	
});