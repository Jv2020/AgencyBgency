<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String findPassword = (String)request.getAttribute("findPassword");
System.out.println("파인드패스워드에프터:"+findPassword);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(!findPassword.equals("1")){
%>
	<script type="text/javascript">
		alert("<%=findPassword%>");
		location.href="<%=request.getContextPath()%>/LoginEntrance";
	</script>
<%
} else {
%>
	<script type="text/javascript">
		alert("잘못된 정보를 입력하셨습니다. 다시 확인해 주세요");
		location.href="<%=request.getContextPath()%>/FindPasswordEntrance";
	</script>
<%	
}
%>

</body>
</html>