<%@page import="NWH.member.dto.MemberDto"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
request.setCharacterEncoding("UTF-8");
%>


<h1>비밀번호 찾기</h1>
<div>
	<form action="<%=request.getContextPath() %>/memberfindpassword" method="post">
		<%-- <div>
		<%=mem.getId() %>님
		</div> --%>
		<div>
			<!-- 아이디 입력 -->
			아이디:<input type="text" name="memberId">
		</div>
		<div>
			<!-- 이름 입력 -->
			이름:<input type="text" name="memberName">
		</div>
		
			<!-- 힌트 질문/답 입력 -->
		
        <div>비밀번호 찾기 질문</div>
 	       <select name="memberQuestion">
    	       <option value="1" selected>기억에 남는 추억의 장소는?</option>
               <option value="2">나의 보물 1호는?</option>
               <option value="3">나의 출신 초등학교는?</option>
               <option value="4">가장 좋아하는 색깔은?</option>
               <option value="5">아버지 성함은?</option>
           </select><br>
           <input type="text" name="memberAnswer" placeholder="답을 입력해주세요">
                        
          
			<!-- 가입하기 버튼 -->
			<input type="submit" value="비밀번호 찾기">
	</form>
</div>


<%@include file ="../include/footer.jsp" %>