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

System.out.println("updateReviewAf.jsp에 들어온 isS는 " + isS);

if(isS.equals("true")) {
%>
	<script type="text/javascript">
	alert("수정에 성공했습니다.");
	location.href = "/AgencyBgencyy/myexhibitEntrance";
	</script>
<%
}else {
%>
	<script type="text/javascript">
	alert("수정에 실패했습니다.");
	location.href = "/AgencyBgencyy/myexhibitEntrance";
	</script>
<%
}
%>



</body>
</html>