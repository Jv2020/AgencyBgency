
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

	<script>
<% 
if(result.equals("true")){
	%>
	alert("정상적으로 등록 되었음");
	location.href="<%=request.getContextPath()%>/admin";
	
	<%
}else if(result.equals("fail")){
	%>
	alert("파일 업로드에 실패하였습니다.");
	location.href="<%=request.getContextPath()%>/admin";
	<%
}else{
	%>
	alert("잘못된 입력 입니다");
	location.href="<%=request.getContextPath()%>/admin";
	<%
}
	%>
	</script>


</body>
</html>