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
	String b = request.getParameter("b");
	if(b.equals("true")){
		%>
		<script type="text/javascript">
			alert("전시가 성공적으로 등록되었습니다!");
			location.href="${pageContext.request.contextPath}/mypage/myexhibit.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("전시 등록 실패!");
			location.href="${pageContext.request.contextPath}/mypage/curatordetail.jsp";
		</script>
		<%
		
	}

%>

</body>
</html>