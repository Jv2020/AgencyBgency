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
//String isS = request.getParameter("isS");
String isS = "true";
System.out.println("isS는 " + isS);

if(isS.equals("true")) {
%>
	<script type="text/javascript">
	alert("리뷰를 작성했습니다.");
	location.href="/AgencyBgencyy/myreviewEntrance?id=<%=id %>";
	</script>
<%
}else {
%>
	<script type="text/javascript">
	alert("리뷰작성에 실패했습니다.");
	location.href="/AgencyBgencyy/myreviewEntrance?id=<%=id %>s";
	</script>
<%
}
%>


</body>
</html>