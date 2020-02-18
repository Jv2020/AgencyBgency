<%@page import="CYH.ReviewDto"%>
<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
<script src="<%=request.getContextPath() %>/community/starrr-gh-pages/dist/starrr.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/community/starrr-gh-pages/dist/starrr.css">

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
<title>수정하기</title>
</head>
<body>

<%
// 로그인 세션
MemberDto sdto = (MemberDto)session.getAttribute("loginuser");
String id = sdto.getId();
%>

<%
ReviewDto dto = (ReviewDto)request.getAttribute("dto");

// System.out.println(dto.getId() + dto.getTitle());
%>


<form action="/AgencyBgencyy/updatereviewAf">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
<div class="1">
	<div class="2-1">
		<div class="3-1">
			전시명 : <%=dto.getTitle() %>
			<input type="hidden" name="title" value="<%=dto.getTitle() %>">
		</div>
		<div class="3-2">
			평점 : <div class='starrr' id='star1'></div>
			    <div>
			      <span class='your-choice-was' style='display: none;'>
			        <span class='choice'></span>/5
			        <input type="hidden" id="starrate" name="starrate">
			      </span>
			    </div>
		</div>
	</div>
	<div class="2-2">
		<textarea rows="20" cols="60" name="review"><%=dto.getReview() %></textarea>
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

<script type="text/javascript">
/* 
function updateReview(e) {
	var id = $("#id").val();
	var review = $("#review").val();
	
	var result = confirm("수정하시겠습니까?");
	
	if(result) {
		
		$.ajax({
			url: "/AgencyBgencyy/updatereviewAf",
			type: "post",
			data: {
				id : id,
				review : review,
				star : star
			},
			success: function (data) {
				alert("전송 완료");
			}
		})
		
	}
}
 */
</script>

<script>
$(document).ready(function () {
	$('#star1').starrr({
	    change: function (e, value) {
	        if (value) {
	            $('.your-choice-was').show();
	            $('.choice').text(value);
	            $('#starrate').val($('.choice').text());
	        } else {
	            $('.your-choice-was').hide();
	         //   alert("별점을 입력해주세요");
	            $('#starrate').val("");
	            
	        }
	    }
	});
});


function closeWindow() {
	const result = confirm("정말로 취소하시겠습니까?");
	
	if(result) {
		window.close();
	}
}
</script>








</body>
</html>