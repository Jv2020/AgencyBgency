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
request.setCharacterEncoding("utf-8");
/* String filepath = (String)request.getAttribute("filepath");
String filename = (String)request.getAttribute("filename");
System.out.println(filename);
System.out.println(filepath); */

%>

upload complete<br>
방금 업로드한 이미지 
<p>이미지가 보여?

</p>
<%-- <img alt="<%=filename %>" src="${pageContext.request.contextPath}/filedownload?filename=<%=filename%>&filepath=<%=filepath%>"/>
 --%>
 <img alt="이미지 없음" src="${pageContext.request.contextPath}/filedownload?filename=1581673930741슬로우서울.jpg&filepath=/upload/title/"/>


</body>
</html>