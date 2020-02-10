<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String findId = (String)request.getAttribute("findid");
System.out.println("파인트아이디에프터:"+findId);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(!findId.equals("")){
%>
	<script type="text/javascript">
		alert("여기에 찾아온 아이디 넣어야 하는데 어떻게 해야 할지 모르겠다!!!")
		location.href="<%=request.getContextPath()%>/member/login.jsp";
	</script>
<%
} else {
%>
	<script type="text/javascript">
		alert("찾지 못함");
		location.href="login.jsp";
	</script>
<%	
}
%>

</body>
</html>