<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
request.setCharacterEncoding("UTF-8");
%>
<style>
.findIdBox {
	width:500px; 
	height:400px; 
	border:1px solid #ddd;
	margin: 0 auto;
	padding: 30px;
}
.findIdBox ul li #name{margin-left:20px; margin-top:0px;}
.findIdBox ul li p{margin-left:20px; margin-top:20px;}
.findIdBox ul li input{border:1px solid #ddd; background:#fff; color:#000; font-size:14px; width:395px; height:50px;  padding:0 10px; margin-left:20px; margin-top:3px; display:block}
.findIdBox ul li .sBtn{border:1px solid #5f0080; color:#5f0080; width:300px; height:40px; margin-left: 65px; margin-top: 25px;}

</style>


<div class="findIdBox">
<!-- <h1>아이디 찾기</h1> -->
	<form action="<%=request.getContextPath() %>/memberfindid" method="post">
		<ul>
			<li>
				<!-- 이름 입력 -->
				<p id="name">이름</p>
				<input type="text" name="memberName">
			</li>
			<li>
				<!-- 이메일 입력 -->
				<p>이메일</p>
				<input type="text" name="memberEmail">
			</li>
			<li>
				<!-- 휴대전화 입력 -->
				<p>휴대전화</p>
				<input type="text" name="memberPhone">
			</li>
				<!-- 아이디 찾기 버튼 -->
			<li>	
				<input type="submit" class="sBtn" value="아이디 찾기">
			</li>
		</ul>
	</form>
</div>

<%@include file ="../include/footer.jsp" %>