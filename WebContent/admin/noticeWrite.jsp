<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="user-scalable=yes, maximum-scale=1.0, minimum-scale=0.25, width=1200">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>모두의 전시</title>


<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/AgencyBgencyy/css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="/AgencyBgencyy/css/style.css" type="text/css"> <!-- 디자인 CSS -->

</head>
<body>
<form action="../Notice" method="post" enctype="multipart/form-data"> 
	<div align ="center">
		<table border="1">
			<col width="200"><col width="500">
			<tr>
				<th>아이디</th>
				<td>관리자
					<input type="hidden" name="id" value="관리자" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" size="50">
				</td>
			</tr>
			
			<tr>
				<th>파일 업로드</th>
				<td>
					<input type="file" name="fileName" style="width:400px">
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="20" cols="70" name="content"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>공지 구분</th>
				<td>
					<select name="choice">
						<option value="1">공지</option>
						<option value="2">이벤트</option>
						<option value="3">할인</option>
					</select>
				</td>
			</tr>
			
			
			
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="올리기">
				</td>
			</tr>
			
		</table>

	</div>
	
	
</form>
</body>
</html>