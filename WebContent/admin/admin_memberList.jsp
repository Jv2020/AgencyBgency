<%@page import="java.util.List"%>
<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
	//response.sendRedirect("/Member_list");
	request.setCharacterEncoding("utf-8");	
	List<MemberDto> memberList = (List<MemberDto>)request.getAttribute("memberList");
	List<MemberDto> outMemberList = (List<MemberDto>)request.getAttribute("outMemberList");
	String sadmin_memberPageNumber = (String)request.getAttribute("admin_memberPageNumber");
	int admin_memberPageNumber = 0;
	if(sadmin_memberPageNumber != null){
		admin_memberPageNumber = Integer.parseInt(sadmin_memberPageNumber);
	}
	System.out.println("admin_memberPageNumber = "+admin_memberPageNumber);
	Object sadmin_memberLength = request.getAttribute("admin_memberLength");
	
	int admin_memberLength = 0;
	if(sadmin_memberLength != null){
		admin_memberLength = (Integer)sadmin_memberLength;
	}
	System.out.println("admin_memberLength = "+admin_memberLength);
	MemberDto admin_memberDto = null;
	
	int admin_memberPage = admin_memberLength / 10;
	if(admin_memberLength % 10 > 0) {
		admin_memberPage = admin_memberPage + 1;
	}
	System.out.println("admin_memberPage = "+admin_memberPage);
	//휴면계정 보기
	
	
	// 일반/승인/큐레이터 회원수 (관리자 포함)
	int memberTotalCount = 0;
	// 일반
	int memberBasic = 0;
	// 승인대기
	int memberWait = 0;
	// 큐레이터
	int memberQ = 0;
	// 탈퇴 회원수
	int memberOutCount = 0;
	// 관리자 수 
	int adminCount = 0;

	for (int i = 0; i < memberList.size(); i++) {
		if (memberList.get(i).getDel() == 0) {
			if (memberList.get(i).getAuth() == 0) {
				memberBasic += 1; // 일반			
			} else if (memberList.get(i).getAuth() == 1) {
				memberWait += 1; // 승인
			} else if (memberList.get(i).getAuth() == 2) {
				memberQ += 1; // 큐레이터
			} else {
				adminCount += 1; // 관리자
			} ;
		} ;
	} ;

	for (int i = 0; i < outMemberList.size(); i++) {

		if (outMemberList.get(i).getDel() == 1) {
			memberOutCount += 1;
		};
	} ;
	System.out.println("size=" + memberList.size());
	System.out.println("회원수=" + memberTotalCount);
	System.out.println("탈퇴회원=" + memberOutCount);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div align="center">
		<h3>회원 리스트 :</h3>
		<h4>
			[현재 회원:<%=admin_memberLength%>명(일반:<%=memberBasic%>명),(승인대기:<%=memberWait%>명),(큐레이터:<%=memberQ%>명),(관리자:<%=adminCount%>명)]
		</h4>
		<h3 align="center">
		<input type="button" value="메인으로"	onclick="location.href='<%=request.getContextPath()%>/admin'">	
		</h3>
	<div><!-- 현재회원 -->
		<table border="1">
			
			<tr align="center">
				<th align="left" width="130"><select>
						<option value="default" selected="selected">회원구분</option>
						<option value="0">[일반회원]</option>
						<option value="1">[승대기]</option>
						<option value="2">[큐레이터]</option>
						<option value="3">[관리자]</option>
				</select></th>
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
				for (int i = 0; i < memberList.size(); i++) {
					System.out.println(i + "번dto=" + memberList.get(i));
					if (memberList.get(i).getDel() == 0) {
			%>
			<tr align="center">
				<%
					if (memberList.get(i).getAuth() == 0) {
				%>
				<td align="left">[일반회원]</td>
				<%
					} else if (memberList.get(i).getAuth() == 1) {
				%>
				<td align="left">[큐레이터(대기)]</td>
				<%
					} else if (memberList.get(i).getAuth() == 2) {
				%>
				<td align="left">[큐레이터]</td>
				<%
					} else {
				%>
				<td align="left">[관리자]</td>
				<%
					} // if 회원 구분
				%>

				<td><%=memberList.get(i).getId()%></td>
				<td><%=memberList.get(i).getPassword()%></td>
				<td><%=memberList.get(i).getName()%></td>
				<td><%=memberList.get(i).getEmail()%></td>
				<td><%=memberList.get(i).getAddress()%></td>
				<td><%=memberList.get(i).getBirthday()%></td>
				<td><%=memberList.get(i).getGender()%></td>
				<td><%=memberList.get(i).getPhone()%></td>
				<td><%=memberList.get(i).getQuestion()%></td>
				<td><%=memberList.get(i).getHint()%></td>
				<td><%=memberList.get(i).getAuth()%></td>
				<td><%=memberList.get(i).getExhibit_name()%></td>
				<td><%=memberList.get(i).getCerti_num()%></td>
				
				<td><input type="checkbox" id="checkbox" name="checkbox"
					value="<%=memberList.get(i).getId()%>"></td>
			</tr>

			<%
				} ;
			} ;
			%>


		</table>
		<div align="center">
				<% // 현재 페이지 번호
				for(int i = 0; i<admin_memberPage; i++){
					if(admin_memberPageNumber == i ){
				%>
				<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
					<%=i+1 %>
				</span>&nbsp;
				<% // 그외 페이지 번호
					}else{
				%>
				<a href="#none" title="<%=i+1 %>페이지" onclick="GoPage(<%=i %>)"
					style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
					[<%=i +1 %>]
				</a>&nbsp;
				
				<%
					}
				}
				%>
			</div>
		<div align="center">
			<input type="button" id="btn_memberDelete" value="탈퇴" onclick="memberDelete()">
		</div>
	</div><!-- // 현재회원 -->
<!--휴면계정-->
	<div>
	<h4>[탈퇴 처리:<%=memberOutCount%>명]</h4>
		<table border="1">
			<tr align="center"> 
				<th align="left" width="130"><select>
						<option value="default" selected="selected">회원구분</option>
						<option value="0">[일반회원]</option>
						<option value="1">[승인대기]</option>
						<option value="2">[큐레이터]</option>
						<option value="3">[관리자]</option>
				</select></th>
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

				<th><input type="checkbox" id="checkboxAll2" name="checkboxAll2"></th>
			</tr>
			<%
				for (int i = 0; i < outMemberList.size(); i++) {
					System.out.println(i + "번dto=" + outMemberList.get(i));
					if (outMemberList.get(i).getDel() == 1) {
			%>
			<tr align="center">
				<%
					if (outMemberList.get(i).getAuth() == 0) {
				%>
				<td align="left">[일반회원]</td>
				<%
					} else if (outMemberList.get(i).getAuth() == 1) {
				%>
				<td align="left">[큐레이터(대기)]</td>
				<%
					} else if (outMemberList.get(i).getAuth() == 2) {
				%>
				<td align="left">[큐레이터]</td>
				<%
					} else {
				%>
				<td align="left">[관리자]</td>
				<%
					} // if 회원 구분
				%>

				<td><%=outMemberList.get(i).getId()%></td>
				<td><%=outMemberList.get(i).getPassword()%></td>
				<td><%=outMemberList.get(i).getName()%></td>
				<td><%=outMemberList.get(i).getEmail()%></td>
				<td><%=outMemberList.get(i).getAddress()%></td>
				<td><%=outMemberList.get(i).getBirthday()%></td>
				<td><%=outMemberList.get(i).getGender()%></td>
				<td><%=outMemberList.get(i).getPhone()%></td>
				<td><%=outMemberList.get(i).getQuestion()%></td>
				<td><%=outMemberList.get(i).getHint()%></td>
				<td><%=outMemberList.get(i).getAuth()%></td>
				<td><%=outMemberList.get(i).getExhibit_name()%></td>
				<td><%=outMemberList.get(i).getCerti_num()%></td>
				
				<td><input type="checkbox" id="checkbox2" name="checkbox2"
					value="<%=outMemberList.get(i).getId()%>"></td>
			</tr>

			<%
				} ;
			} ;
			%>

		</table>
		<div align="center">
			<input type="button" id="btn_memberRecover" value="복구" onclick="memberRecover()">
		</div>
	</div><!-- 탈퇴회원 -->
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
            
        }
    });
    
    $("#checkboxAll2").click(function(){
        //클릭되었으면
        if($("#checkboxAll2").prop("checked")){
            //input태그의 name이 checkbox인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=checkbox2]").prop("checked",true);
            
        //클릭이 안되있으면
        }else{
            //input태그의 name이 checkbox인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=checkbox2]").prop("checked",false);
            
        }
    });
}); //JQuery ready end
    
//체크박스 선택갯수(회원)	
	var checkboxCount = $('input:checkbox[id="checkbox"]:checked').length ;
	var checkbox_val = $('input:checkbox[id="checkbox"]').val();
//체크박스 선택갯수(탈퇴회원)		
	var checkbox2Count = $('input:checkbox2[id="checkbox"]:checked').length ;
	var checkbox2_val = $('input:checkbox2[id="checkbox"]').val();

//}); //JQuery ready end
function memberDelete(){
	var memberDel = confirm("정말로 탈퇴 시킬꺼야?");
	var memDeleteList = new Array();
	   $('input[name="checkbox"]:checked').each(function(index, item){
		   memDeleteList.push($(item).val());
	   });// for each end
  	if(memberDel){
	   
	   var jsonData = {"pmemDeleteList":memDeleteList}
	   
	   alert("선택한 회원 ID="+memDeleteList);
		   $.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/Admin_Member?member=delete",
				data : jsonData,  
				contentType :"application/x-www-form-urlencoded; charset=UTF-8",
				datatype : "text",
		  		success : function(data) {
		       		 alert("성공적으로 탈퇴처리 되었습니다.");
		       		 console.log(data)
		       		 
		       		 if(data === true){
		       			 
		       			 location.href="${pageContext.request.contextPath}/Admin_Member?member=list";
		       		 }
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		alert("탈퇴 처리 실패 했습니다.");
		    	}
				});// ajax end
  	}// if end
}
function memberRecover() {
	
	var memberRec = confirm("복귀 시키시겠습니까?");
	var memRecoverList = new Array();
	   $('input[name="checkbox2"]:checked').each(function(index, item){
		   memRecoverList.push($(item).val());
	   });// for each end
  	if(memberRec){
	   var jsonData = {"pmemRecoverList":memRecoverList}
	   alert("선택한 회원 ID="+memRecoverList);
		   $.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/Admin_Member?member=recovery",
				data : jsonData,  
				contentType :"application/x-www-form-urlencoded; charset=UTF-8",
				datatype : "text",
		  		success : function(data) {
		       		 alert("성공적으로 복구되었습니다.");
		  				console.log(data)
		       		 if(data === true){

		       			 location.href="${pageContext.request.contextPath}/Admin_Member?member=list";
		       		 }
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		alert("복구에 실패 했습니다.");
		    	}
				});// ajax end
  	}// if end
}

function GoPage(pageNum) {

	
	var linkStr = getContextPath() + "/Admin_Member?member=list&admin_memberPageNumber="+pageNum;
	
	location.href = linkStr;
	
};
</script>




</body>
</html>