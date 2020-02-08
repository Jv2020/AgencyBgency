<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email1 = request.getParameter("memberEmail1");
String email2 = request.getParameter("memberEmail2");
System.out.println(email1);
System.out.println(email2);
String email = email1 + "@" + email2;
System.out.println(email);

String year = request.getParameter("memberYear");
String month = request.getParameter("memberMonth");
String date = request.getParameter("memberDate");
System.out.println(year);
System.out.println(month);
System.out.println(date);
String birth = year + "-" + month + "-" + date;
System.out.println(birth);


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>