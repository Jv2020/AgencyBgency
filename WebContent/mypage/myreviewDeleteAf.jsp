<%@page import="NWH.member.dto.MemberDto"%>
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
MemberDto dto = (MemberDto)session.getAttribute("loginuser");
String id = dto.getId();
%>

<%
String isS = (String)request.getAttribute("isS");
System.out.println("myreviewDeleteAf.jsp에 들어온 isS는 " + isS);

if(isS.equals("true")) {
	%>
	<script type="text/javascript">
	alert("삭제하였습니다.");
	location.href="/AgencyBgencyy/myreviewEntrance?id=<%=id %>";
	</script>
	<%
}else {
	%>
	<script type="text/javascript">
	alert("삭제에 실패했습니다.");
	location.href="/AgencyBgencyy/myreviewEntrance?id=<%=id %>";
	</script>
	<%
}
%>










</body>
</html>