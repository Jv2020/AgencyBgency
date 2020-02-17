<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
MemberDto memberDto = (MemberDto)request.getAttribute("memberDetail");

int iauth = memberDto.getAuth();
String auth = "";
if(iauth == 3){
	auth = "관리자";
}else if(iauth == 2){
	auth = "큐레이터";
}else if(iauth == 1){
	auth = "일반(큐레이터대기)";
}else{
	auth = "일반회원";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>


	<div align ="center">
		<h2> <%=memberDto.getName() %>님 회원 정보</h2>
		<table border="1">
			<col width="200"><col width="500">
			<tr>
				<th>ID</th>
				<td>
					<input type="text" id="id"name="memberId" value="<%=memberDto.getId() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>PW</th>
				<td>
					<input type="text" name="pwd" value="<%=memberDto.getPassword() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="pwd" value="<%=memberDto.getName() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>EMAIL</th>
				<td>
					<input type="text" name="id" value="<%=memberDto.getEmail() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="id" value="<%=memberDto.getAddress() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="id" value="<%=memberDto.getBirthday() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td>
					<input type="text" name="id" value="<%=memberDto.getGender() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>연락처</th>
				<td>
					<input type="text" name="id" value="<%=memberDto.getPhone() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>전시관명</th>
				<td>
					<input type="text" name="id" value="<%=memberDto.getExhibit_name() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>자격번호</th>
				<td>
					<input type="text" name="id" value="<%=memberDto.getCerti_num() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>등급</th>
				<td>
					<input type="text" name="id" value="<%=auth%>" readonly="readonly">
				</td>
			</tr>
			

			<tr align="center">
				<td colspan="2">
					<input type="button" id ="btn_delete" value="탈퇴" >
					<input type="button" id="btn_return" name="btn_return"value="이전으로" onclick="location.href='<%=request.getContextPath()%>/admin'">
				</td>
			</tr>
		</table>
	</div>
<script type="text/javascript">
$("#btn_delete").click(function() {
	var check = confirm("정말로 탈퇴 시키겠습니까?");
	var deleteList = new Array();
	 $('input[name="memberId"]').each(function(index, item){
		   deleteList.push($(item).val());
	   });// for each end
	console.log(deleteList);
  	if(check){
	   
	   var jsonData = {"pmemDeleteList":deleteList};
	   
	   alert("선택한 회원ID="+deleteList);
		   $.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/Admin_Member?member=delete",
				data : jsonData,
				contentType :"application/x-www-form-urlencoded; charset=UTF-8",
				datatype : "text",
		  		success : function(data) {
		  			 console.log(data);
		  			 alert(data);
		       		 if(data==true){
		       		 alert("성공적으로 탈퇴되었습니다.");
			       		location.href="<%=request.getContextPath()%>/admin";
		       		 }else{
		       			alert("탈퇴 실패 했습니다.");
		       			location.href="<%=request.getContextPath()%>/admin";
		       		 }
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		alert("삭제에 실패 했습니다.");
		    		
		    		location.href="<%=request.getContextPath()%>/admin";
		    	}
			 
				});// ajax end
  	}// if end
})
</script>

</body>
</html>