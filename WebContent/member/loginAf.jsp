<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
MemberDto mem = (MemberDto)session.getAttribute("loginuser");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if(mem == null){
	%>
		<script>
			alert("아이디와 비밀번호를 다시 확인해 주세요.");
			location.href=history.back();
		</script>
	<%
	} else if(mem.getAuth() == 3){
	%>
		<script>
			alert("관리자");
			location.href = "<%=request.getContextPath()%>/admin";
		</script>
	<%		
	} else {
	%>
		<script>
			location.href="<%=request.getContextPath()%>/mainEntrance"
		</script>
	<%
	}
	%>

</body>
</html>