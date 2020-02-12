<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="starrr.css">
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
<title>Insert title here</title>

</head>
<body>
<%
String title = request.getParameter("title");
%>





<form action="/AgencyBgencyy/writereview">
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
			<input type="button" onclick="confirm()" value="취소">
		</div>
	</div>
</div>
</form>


<script type="text/javascript">
function confirm() {
	
}

</script>

<!-- <div class='starrr' id='star1'></div> -->

    <div class='starrr' id='star2'></div>

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
            }
        });
    </script>






































</body>
</html>
<%@include file ="../include/footer.jsp" %>