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
//String isS = request.getParameter("isS");
String isS = "true";
System.out.println("isS는 " + isS);

if(isS.equals("true")) {
%>
	<script type="text/javascript">
	alert("리뷰를 작성했습니다.");
	location.href="/AgencyBgencyy/myexhibitEntrance";
	</script>
<%
}else {
%>
	<script type="text/javascript">
	alert("리뷰작성에 실패했습니다.");
	location.href="/AgencyBgencyy/myexhibitEntrance";
	</script>
<%
}
%>


</body>
</html>