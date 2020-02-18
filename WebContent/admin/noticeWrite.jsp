<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="user-scalable=yes, maximum-scale=1.0, minimum-scale=0.25, width=1200">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>모두의 전시</title>


<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/AgencyBgencyy/css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="/AgencyBgencyy/css/style.css" type="text/css"> <!-- 디자인 CSS -->

</head>
<body>
<!-- action="<%=request.getContextPath() %>/Notice_insert" -->
<form id="form" action="<%=request.getContextPath() %>/Notice?notice=insert" method="POST" enctype="multipart/form-data"> 
<%-- <form id="form" action="<%=request.getContextPath() %>/NoticeInsert" method="POST" enctype="multipart/form-data"> --%>
	<div align ="center">
		<table border="1">
			<col width="200"><col width="500">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" value="관리자" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" id="title" class="title" name="title" size="50" >
				</td>
			</tr>
			
			<tr>
				<th>파일 업로드</th>
				<td>
					<input type="file" class="fileName" name="fileName" style="width:400px">
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="20" cols="70" id="content" name="content"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>공지 구분</th>
				<td>
					<select id="choice" name="choice">
						<option value="1">공지</option>
						<option value="2">이벤트</option>
						<option value="3">할인</option>
					</select>
				</td>
			</tr>
			

			<tr align="center">
				<td colspan="2">
					<input type="submit" id="btn_submit" name="btn_submit"value="올리기">
					<input type="button" id="btn_return" name="btn_return"value="이전으로">
				</td>
			</tr>
		</table>
	</div>
</form>


<script type="text/javascript">




$("#btn_return").click(function (){
	location.href="<%=request.getContextPath()%>/admin";
})
$("#btn_submit").click(function (){

 
 var title = $('#title').val();
 var choice = $('#choice').val();

 
console.log(title);
console.log(content);

	if(!title == "" && title != null){
		if(!content =="" && content != null){
			
			var check = confirm("등록 하시겠습니까?");
			
			
			if(check){
			$("#btn_submit").submit();
			
			}
		}else{
			alert("내용이 입력되지 않았습니다.")
		}
	}else{
		alert("제목이 입력되지 않았습니다");
	}
	
	



</script>


</body>
</html>