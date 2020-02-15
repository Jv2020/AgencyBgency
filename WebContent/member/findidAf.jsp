<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String findId = (String)request.getAttribute("findid");
System.out.println("파인드아이디에프터:"+findId);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(!findId.equals("1")){
%>
	<script type="text/javascript">
		alert("<%=findId%>");
		location.href="<%=request.getContextPath()%>/LoginEntrance";
	</script>
<%
} else {
%>
	<script type="text/javascript">
		alert("잘못된 정보를 입력하셨습니다. 다시 입력해주세요.");
		location.href="<%=request.getContextPath()%>/FindIdEntrance";
	</script>
<%	
}
%>

</body>
</html>