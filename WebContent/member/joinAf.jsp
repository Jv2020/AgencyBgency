<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
%>

<%
String isS = request.getParameter("isS");
System.out.println(isS);
%>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
if(isS.equals("true")){
%>
	<script type="text/javascript">
	alert("환영합니다.");
	location.href="login.jsp";
	</script>
<%
} else { 
%>	
	<script type="text/javascript">
	alert("회원가입에 실패하였습니다. 입력사항을 다시 확인하여 주시기 바랍니다.");
	location.href=history.back();
	</script>
<%
}
%>

</body>
</html>