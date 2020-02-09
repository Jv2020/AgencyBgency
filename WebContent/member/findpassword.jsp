<%@page import="NWH.member.dto.MemberDto"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
request.setCharacterEncoding("UTF-8");
%>
<%
MemberDto mem = (MemberDto)session.getAttribute("loginuser");
%>


<h1>비밀번호 찾기</h1>
<div>
	<form action="<%=request.getContextPath() %>/memberlogin" method="post">
		<%-- <div>
		<%=mem.getId() %>님
		</div> --%>
		<div>
			<!-- 아이디 입력 -->
			아이디:<input type="text" name="memberId">
		</div>
		<div>
			<!-- 비밀번호 입력 -->
			비밀번호:<input type="text" name="memberPassword">
		</div>
			<!-- 가입하기 버튼 -->
			<input type="submit" value="로그인">
	</form>
</div>


<script src="<%=request.getContextPath() %>/js/login.js"></script>

<%@include file ="../include/footer.jsp" %>