<%@page import="CYH.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세리뷰보기</title>
</head>
<body>

<%
ReviewDto dto = (ReviewDto)request.getAttribute("dto");
%>
<div class="1">
<%=dto.getTitle() %>
</div>
<div class="2">
<%=dto.getReview() %>
</div>
<div class="3">
<input type="button" value="닫기" onclick="window.close();">
</div>

</body>
</html>