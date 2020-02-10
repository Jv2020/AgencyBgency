<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
request.setCharacterEncoding("UTF-8");
%>


<h1>아이디 찾기</h1>
<div>
	<form action="<%=request.getContextPath() %>/memberfindid" method="post">
		<div>
			<!-- 이름 입력 -->
			이름:<input type="text" name="memberName">
		</div>
		<div>
			<!-- 이메일 입력 -->
			이메일:<input type="text" name="memberEmail">
		</div>
		<div>
			<!-- 휴대전화 입력 -->
			휴대전화:<input type="text" name="memberPhone">
		</div>
			<!-- 가입하기 버튼 -->
			<input type="submit" value="아이디 찾기">
	</form>
</div>

<%@include file ="../include/footer.jsp" %>