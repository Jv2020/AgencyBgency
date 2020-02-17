
<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="starrr.css" type="text/css">
<style type='text/css'>
img.ribbon {
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    border: 0;
    cursor: pointer;
}

.container {
    margin-top: 60px;
    text-align: center;
    max-width: 450px;
}

input {
    width: 30px;
    margin: 10px 0;
}
</style>
<title>리뷰쓰기</title>

</head>
<body>
<%
// 로그인 세션
MemberDto sdto = (MemberDto)session.getAttribute("loginuser");
String id = sdto.getId();
%>

<%
String title = request.getParameter("title");
%>


<form action="/AgencyBgencyy/writereviewAf">
<div class="1">
	<div class="2-1">
		<div class="3-1">
			전시명 : <input type="text" name="title" value="<%=title %>" readonly="readonly">
		</div>
		<div class="3-2">
			<div class='starrr' id='star2'></div>
		</div>
	</div>
	<div class="2-2">
		<textarea rows="20" cols="60" name="review"></textarea>
	</div>
	<div class="2-3">
		<div class="3-3">
			<input type="submit" value="리뷰올리기">
		</div>
		<div class="3-4">
			<input type="button" onclick="closeWindow()" value="취소">
		</div>
	</div>
</div>
</form>


<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
<script src="starrr.js"></script>

<script>
	$('#star1').starrr({
	    change: function (e, value) {
	        if (value) {
	            $('.your-choice-was').show();
	            $('.choice').text(value);
	        } else {
	            $('.your-choice-was').hide();
	        }
	    }
	});

	var $s2input = $('#star2_input');
	$('#star2').starrr({
	    max: 5,
	    rating: $s2input.val(),
	    change: function (e, value) {
	        $s2input.val(value).trigger('input');
	        
	        $.ajax({
	        	url: "/AgencyBgencyy/writereviewAf",
	        	type: "post",
	        	data: {
	        		star : value
	        	},
	        	// 통신이 성공했을 때 처리하는 callback 함수
	        	success: function(data) {
	        		$('#time').text(data);
	        		alert('평점 평가가 완료됐습니다. 결과: ', data,star);
	        	}
	        })
	    }
	});




// 모달창 꺼주는 메소드
function closeWindow() {
	// window tab close
	// var는 IE를 위해서 쓴다.
	// ES5는 let, const가 없다.
	const cw = window.open(window.location, '_self');
	cw.close();
}



</script>




</body>
</html>
