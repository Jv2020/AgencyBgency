<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String deleteCheck = request.getParameter("delete");
if(deleteCheck.equals("true")){
	%>
		<script type="text/javascript">
			alert('전시등록이 취소되었습니다.');
			location.href="${pageContext.request.contextPath}/curatorexhibitlist?page=0";
		</script>
	<%
}else{
	%>
		<script type="text/javascript">
			alert('등록취소 실패!');
			location.href="${pageContext.request.contextPath}/curatorexhibitlist?page=0";
		</script>
	<%
	
}

%>

</body>
</html>