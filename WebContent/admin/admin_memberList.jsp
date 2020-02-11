<%@page import="java.util.List"%>
<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
//response.sendRedirect("/Member_list");


List<MemberDto> memberList = (List<MemberDto>)request.getAttribute("memberList");

// 일반/승인/큐레이터 회원수 (관리자 제외)
int memberTotalCount = 0;
// 탈퇴 회원수
int memberOutCount =0;
// 관리자 수 
int adminCount = 0;
for(int i = 0 ; i<memberList.size(); i++){
	if(memberList.get(i).getAuth()==3){
		adminCount += 1;
	}else if(memberList.get(i).getAuth()==4){
		memberOutCount += 1;
	}else{
		memberTotalCount += 1;
	};
};
System.out.println("size="+memberList.size());
System.out.println("회원수="+memberTotalCount);
System.out.println("탈퇴회원="+memberOutCount);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div align="center">
	<h3>회원 리스트 [현재 회원:<%=memberTotalCount %>명][관리자:<%=adminCount %>명][탈퇴 회원:<%=memberOutCount %>]</h3>
		
		<table border="1">
			<tr>
				<th>
					<select>
						<option value="default" selected="selected">회원구분</option>
						<option value="0">[일반회원]</option>
						<option value="1">[승인대기]</option>
						<option value="2">[큐레이터]</option>
						<option value="3">[관리자]</option>
					</select>
				</th>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>이메일주소</th>
				<th>주소</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>연락처</th>
				<th>패스워드 찾기 질문</th>
				<th>패스워드 힌트</th>
				<th>계정 권한</th>
				<th>전시관명</th>
				<th>자격증번호</th>
				<th><input type="checkbox" id="checkboxAll" name="checkboxAll"></th>
			</tr>
			<%
			 for(int i = 0 ; i<memberList.size();i++){
				System.out.println(i+"번dto="+memberList.get(i));
				//AUTH 
				// 0->일반 회원 	1->승인대기중	 2->큐레이터 	3->관리자	 	4->회원탈퇴
				if(memberList.get(i).getAuth()<4){	// 탈퇴인원 제외
			%>
			<tr>
			<%
					if(memberList.get(i).getAuth() == 0){
			%>
				<td>[일반회원]</td>
			<%
					}else if(memberList.get(i).getAuth() == 1){
			%>	
				<td>[큐레이터(승인대기)]</td>
			<%
					}else if(memberList.get(i).getAuth() == 2){
			%>	
				<td>[큐레이터]</td>	
			<%
					}else{ 
			%>
				<td>[관리자]</td>
			<%
					}// if 회원 구분
			%>

				<td><%=memberList.get(i).getId() %></td>
				<td><%=memberList.get(i).getPassword() %></td>
				<td><%=memberList.get(i).getName() %></td>
				<td><%=memberList.get(i).getEmail() %></td>
				<td><%=memberList.get(i).getAddress() %></td>
				<td><%=memberList.get(i).getBirthday() %></td>
				<td><%=memberList.get(i).getGender() %></td>
				<td><%=memberList.get(i).getPhone() %></td>
				<td><%=memberList.get(i).getQuestion() %></td>
				<td><%=memberList.get(i).getHint() %></td>
				<td><%=memberList.get(i).getAuth() %></td>
				<td><%=memberList.get(i).getExhibit_name() %></td>
				<td><%=memberList.get(i).getCerti_num() %></td>
				<td><input type="checkbox" id="checkbox" name="checkbox" value="<%=memberList.get(i).getId()%>"></td>
			</tr>
			
			<%
				};
			};
			%>
			
			
		</table>
		<div align="center">
			<input  type="button" id="btn_memberDelete" value="탈퇴" onclick="">
			<input  type="button" value="메인으로" onclick="location.href='./admin/amain.jsp'">
		</div>
</div>
<script type="text/javascript">

$(document).ready(function(){
	 //최상단 체크박스 클릭
    $("#checkboxAll").click(function(){
        //클릭되었으면
        if($("#checkboxAll").prop("checked")){
            //input태그의 name이 checkbox인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=checkbox]").prop("checked",true);
            
        //클릭이 안되있으면
        }else{
            //input태그의 name이 checkbox인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=checkbox]").prop("checked",false);
            
        };
    });
	 
    var checkboxCount = $('input:checkbox[id="checkbox"]:checked').length ;
	var checkbox_val = $('input:checkbox[id="checkbox"]').val();
	
	$("#btn_memberDelete").click(function(){
		var memberDel = confirm("정말로 탈퇴 시키겠습니까?");
		var deleteList = new Array();
		   $('input[name="checkbox"]:checked').each(function(index, item){
			   deleteList.push($(item).val());
		   });// for each end
	  	if(memberDel){
		   
		   var jsonData = {"pdeleteList":deleteList}
		   
		   alert("선택한 ID="+deleteList);
			   $.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/Member_Delete",
					data : jsonData,
					contentType :"application/x-www-form-urlencoded; charset=UTF-8",
					datatype : "json",
			  		success : function(data) {

			       		 alert("성공적으로 탈퇴되었습니다.");
			       		 //location.href="/admin/admin_memberList.jsp";
			        }
					
					});// ajax end
	  	}// if end
	}); //click end
});


</script>

</body>
</html>