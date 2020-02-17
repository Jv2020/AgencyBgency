<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
//멤버세션
MemberDto mem = (MemberDto)session.getAttribute("loginuser");
System.out.println("마지막 jsp 업데이트 dto: " + mem.toString());

//address - split
String address = mem.getAddress();
String[] radr = address.split("/");
%>

<div class="ConfirmFrm">
	<form method="post" action="<%=request.getContextPath() %>/MemberGetIdBeforeUpdate">
		<div class="frm_cont">
			<div class="frm_line clfix">
				<div class="tit">아이디</div>
				<div class="cont">
				<input type="hidden" name="memberId" value="<%=mem.getId() %>">
					<%=mem.getId() %>
				</div>
			</div>
			<div class="frm_line clfix">
				<div class="tit">이름</div>
				<div class="cont">
					<%=mem.getName() %>
				</div>
			</div>
			<div class="frm_line clfix">
				<div class="tit">연락처</div>
				<div class="cont">
					<%=mem.getPhone() %>
				</div>
			</div>
			<div class="frm_line clfix">
				<div class="tit">이메일</div>
				<div class="cont">
					<%=mem.getEmail() %>
				</div>
			</div>
			<div class="frm_line reser-birth clfix">
				<div class="tit">생년월일</div>
				<div class="cont">
					<%=mem.getBirthday().substring(0, 4) %> 년 &nbsp;
					<%=mem.getBirthday().substring(5, 7) %> 월 &nbsp;
					<%=mem.getBirthday().substring(8, 10) %> 일 &nbsp;
				</div>									
			</div>
			<div class="frm_line clfix">
				<div class="tit">성별</div>
				<div class="cont">
					<%
					if(mem.getGender().equals("male")){
					%>
						남성
					<%
					} else {
					%>											
						여성
					<%
					}
					%>
				</div>
			</div>
			<div class="frm_line clfix">
				<div class="tit">주소</div>
				<div class="cont">
					[우편번호] &nbsp;<%=radr[0]%><br><%=radr[1]%> <%=radr[2]%>
				</div>				
			</div>
			<div class="frm_line clfix">
				<div class="tit">비밀번호 힌트<br>질문</div>
				<div class="cont">
					<%
					if(mem.getQuestion().equals("1")){
					%>
						기억에 남는 추억의 장소는?					
					<%	
					} else if(mem.getQuestion().equals("2")){
					%>
						나의 보물 1호는?		
					<%	
					} else if(mem.getQuestion().equals("3")){
					%>
						나의 출신 초등학교는?
					<%	
					} else if(mem.getQuestion().equals("4")){
					%>
						가장 좋아하는 색깔은?
					<%	
					} else if(mem.getQuestion().equals("5")){
					%>
						아버지 성함은?
					<%	
					}
					%>
					<br>
					<%=mem.getHint() %>
				</div>
			</div>
			<%
			if(mem.getAuth() != 0){
			%>
				<div class="frm_line clfix">
					<div class="tit">전시관명</div>
					<div class="cont">
						<%=mem.getExhibit_name() %>
					</div>
				</div>
				<div class="frm_line clfix">
					<div class="tit">자격증번호</div>
					<div class="cont">
						<%=mem.getCerti_num() %>
					</div>
				</div>
			<%				
			}
			%>
			<div class="frm_line clfix"></div>
		</div>
		
		
	<div class="reserv_btnWrap">
		<button class="reserv_btn02" style="display:inline-block;" id="memUpdate" value="<%=mem.getId() %>">회원정보 수정</button>
		<button class="reserv_btn02" style="display:inline-block" id="dell" value="<%=mem.getId() %>">회원탈퇴</button>
	</div>
	</form><!-- ConfirmFrm -->
</div><!-- formWrap -->

<script>
function getContextPath() {
	   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

$("#dell").click(function(){
	var deleteId = $("#dell").val();
	var userInput = prompt("삭제를 하시려면 아이디를 다시 입력하세요");
	if(userInput == deleteId){
		location.href=getContextPath()+"/memberdeleteid?deleteId="+deleteId;		
	} else {
		alert("잘못된 아이디를 입력하셨습니다.");
	}
});


</script>




<%@include file ="../include/footer.jsp" %>

