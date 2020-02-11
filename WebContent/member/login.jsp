<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
div.loginBox{
	width:500px; 
	height:360px; 
	border:1px solid #ddd;
	margin: 0 auto;
	padding: 30px;
	
}
.loginBox ul{}
.loginBox ul li input{border:1px solid #5f0080; background:#5f0080; color:#fff; font-size:18px; width:400px; height:50px;  padding:0 10px; margin-left:19px; margin-top:15px; display:block}
.loginBox ul li button{border:1px solid #5f0080; background:#fff; color:#5f0080; font-size:18px; width:400px; height:50px;  padding:0 10px; margin-left:19px; margin-top:15px; display:block}
.loginBox ul li input.textBox{border:1px solid #ddd; background:#fff; color:#000; font-size:14px; width:400px; height:50px;  padding:0 10px; margin-left:19px; margin-top:15px; display:block}
.loginBox ul li a.findId{font-size:14px;  margin-left:250px; display:inline-block;  }


</style>   
<%
request.setCharacterEncoding("UTF-8");
%>



<div class="loginBox">
	<form action="<%=request.getContextPath() %>/memberlogin" method="post">
		<ul>
			<li>
				<!-- 아이디 입력 -->
				<input class="textBox" type="text" name="memberId" placeholder="아이디를 입력해주세요">
			</li>
			<li>
				<!-- 비밀번호 입력 -->
				<input class="textBox" type="text" name="memberPassword" placeholder="비밀번호를 입력해주세요">
			</li>
			<li>
				<!-- 아이디 찾기 버튼 -->
				<a href=findid.jsp class="findId">아이디 찾기</a> | <a href=findpassword.jsp>비밀번호 찾기</a> 
				<!-- <input type="button" onclick="location.href='findid.jsp'" value="아이디 찾기">
				<input type="button" onclick="location.href='findpassword.jsp'" value="비밀번호 찾기"> -->
			</li>
			<li>
				<!-- 로그인 버튼 -->
				<input class="sBtn" type="submit" value="로그인">
			</li>
			<li>
				<!-- 가입하기 버튼 -->
				<button class="joinBtn" type="button" onclick="location.href='join.jsp'">가입하기</button>
			</li>	
<<<<<<< Updated upstream
				
		</ul>s
=======
		</ul>
	</form>
>>>>>>> Stashed changes
</div>


<script src="<%=request.getContextPath() %>/js/login.js"></script>

<%@include file ="../include/footer.jsp" %>