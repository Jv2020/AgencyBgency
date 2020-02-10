<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%
	
	request.setCharacterEncoding("utf-8");
	
	String result = request.getParameter("result");
	
	System.out.println("입력결과="+result);
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<% 
if(result.equals("true")){
	%>
	<script>
	alert("정상적으로 등록 되었음");
	location.href="./amain.jsp";
	</script>
	<%
	}else{
		
	%>
	<script>
	alert("잘못된 입력 입니다");
	location.href="./noticeWrite.jsp";
	</script>
	<%
	}
	%>


</body>
</html>