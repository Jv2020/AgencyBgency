
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
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
	alert("정상적으로 적용 되었음");
	location.href="<%=request.getContextPath()%>/admin";
	
	<%
}else if(result.equals("fail")){
	%>
	alert("첨부파일 미 적용되었습니다.");
	location.href="<%=request.getContextPath()%>/admin";
	<%
}else if(result.equals("mfalse")){
	%>
	alert("검색 결과가 없습니다.");
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