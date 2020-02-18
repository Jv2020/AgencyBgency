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
String isS = (String)request.getAttribute("isS");
System.out.println("myreviewDeleteAf.jsp에 들어온 isS는 " + isS);

if(isS.equals("true")) {
	%>
	<script type="text/javascript">
	alert("삭제하였습니다.");
	location.href="/AgencyBgencyy/deleteReviewAf";
	</script>
	<%
}else {
	%>
	<script type="text/javascript">
	alert("삭제에 실패했습니다.");
	location.href="/AgencyBgencyy/deleteReviewAf";
	</script>
	<%
}
%>










</body>
</html>