<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
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
if(!mem.getId().equals("")){
%>
	<script>
	alert("수정완료");
	location.href = "<%=request.getContextPath()%>/mypage/mypage.jsp"
	</script>
<%	
} else {
%>
	<script>
	alert("수정실패");
	location.href = "<%=request.getContextPath()%>/mypage/mypage.jsp"
	</script>
<%	
}
%>

</body>
</html>
