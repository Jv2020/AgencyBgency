
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%
	
	request.setCharacterEncoding("utf-8");
	
	String result = request.getParameter("result");
	
	System.out.println("�Է°��="+result);
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
	alert("���������� ��� �Ǿ���");
	location.href="<%=request.getContextPath()%>/admin";
	
	<%
}else if(result.equals("fail")){
	%>
	alert("���� ���ε忡 �����Ͽ����ϴ�.");
	location.href="<%=request.getContextPath()%>/admin";
	<%
}else{
	%>
	alert("�߸��� �Է� �Դϴ�");
	location.href="<%=request.getContextPath()%>/admin";
	<%
}
	%>
	</script>


</body>
</html>