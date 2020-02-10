<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
div.loginBox{
	width:500px; 
	height:300px; 
	border:1px solid #ddd;
	margin: 0 auto;
	padding: 30px;
	
}
.loginBox ul{}
.loginBox ul li {width:300px; color:#333; font-size:18px;}
.loginBox ul li input{border:1px solid #ddd; width:400px; height:50px;  padding:0 10px; margin-left:19px; margin-top:15px; display:inline-block}
.loginBox ul li span{}
.loginBox ul li input.sBtn:{background:#5f0080; color:#fff;}


</style>   
<%
request.setCharacterEncoding("UTF-8");
%>



<div class="loginBox">
	<form action="<%=request.getContextPath() %>/memberlogin" method="post">
		<ul>
			<li>
				<!-- 아이디 입력 -->
				<input type="text" name="memberId" placeholder="아이디를 입력해주세요">
			</li>
			<li>
				<!-- 비밀번호 입력 -->
				<input type="text" name="memberPassword" placeholder="비밀번호를 입력해주세요">
			</li>
			<li>
				<!-- 아이디 찾기 버튼 -->
				<a></a>
				<!-- <input type="button" onclick="location.href='findid.jsp'" value="아이디 찾기">
				<input type="button" onclick="location.href='findpassword.jsp'" value="비밀번호 찾기"> -->
			</li>
			<li>
				<!-- 가입하기 버튼 -->
				<input class="sBtn" type="submit" value="로그인">
			</li>	
				
		</ul>
	</form>
</div>


<script src="<%=request.getContextPath() %>/js/login.js"></script>

<%@include file ="../include/footer.jsp" %>