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

<% 
if(result.equals("true")){
	%>
	<script>
	alert("���������� ��� �Ǿ���");
	location.href="./amain.jsp";
	</script>
	<%
	}else{
		
	%>
	<script>
	alert("�߸��� �Է� �Դϴ�");
	location.href="./noticeWrite.jsp";
	</script>
	<%
	}
	%>


</body>
</html>