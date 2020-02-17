<%@page import="KEC.reserv.dto.ReservDto"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<%

// 짐풀기
ReservDto dto = (ReservDto)request.getAttribute("dto");


//email - split
String email = dto.getEmail();
String[] edata = email.split("@");

//address - split
String address = dto.getAddress();
String[] radr = address.split("/");
String detail="";
if(radr.length == 3){
detail= radr[2];
	
}

%>
<style>
.depth02.mypageDepth a.depthReserve{background:#5f0080; color:#fff;}
</style>

<div class="ConfirmFrm">
	<form method="get" action="">
		<input type="hidden" value="<%=dto.getSeq() %>">
		<div class="frm_cont">
			<div class="frm_line clfix">
				<div class="tit">전시명</div>
				<div class="cont">
					<%=dto.getTitle() %>
				</div>				
			</div>
			<div class="frm_line clfix">
				<div class="tit">예매자 이름</div>
				<div class="cont">
					<%=dto.getName() %>
				</div>				
			</div>
			
			<div class="frm_line reser-birth clfix">
				<div class="tit">생년월일</div>
				<div class="cont">
					<%=dto.getBirthdate().substring(0, 4) %> 년 &nbsp;
					<%=dto.getBirthdate().substring(4, 6) %> 월 &nbsp;
					<%=dto.getBirthdate().substring(6, 8) %> 일 &nbsp;
				</div>									
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">연락처</div>
				<div class="cont">
					<%=dto.getPhone() %>
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">이메일 주소</div>
				<div class="cont">
					<%=edata[0]%>@<%=edata[1]%>
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">주소</div>
				<div class="cont">
					[우편번호] &nbsp;<%=radr[0]%><br><%=radr[1]%> <%=radr[2]%>
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">티켓 수령방법</div>
				<div class="cont">
					<%=dto.getReceive() %>
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">입장권 수량</div>
				<div class="cont">
					<%=dto.getQty() %> 매
				</div>				
			</div>		
			
			<div class="frm_line clfix">
				<div class="tit">결제 수단</div>
				<div class="cont">					
					<%=dto.getPayMethod() %>
				</div>				
			</div>	
			
			<div class="frm_line totalPrice clfix">
				결제금액<strong><%=dto.getTotalPrice() %></strong>원						
			</div>		
						
		</div><!-- frm_cont -->		
					
		<div class="reserv_btnWrap">
			<div class="clfix">
				<button class="reserv_btn02" type="button" style="float:left; margin-left:0;" onclick="del()">예매취소</button>		
				<a class="reserv_btn02 submit" style="float:left;" href="<%=request.getContextPath()%>/reservget?seq=<%=dto.getSeq() %>&page=update">정보수정</a>
				<a class="reserv_btn02" style="float:right; width:200px; background:#5f0080; color:#fff;" href="<%=request.getContextPath()%>/exhibitlist">목록</a>
			</div>		
		</div>
		
	</form><!-- ConfirmFrm -->
</div><!-- formWrap -->

<script>


var total = <%=dto.getTotalPrice() %>;	

// ex) 7000원 -> 7,000원
var len, point, str;	
total = total + "";
point = total.length % 3 ;
len = total.length;

totalPrice = total.substring(0, point);
while (point < len) {
	if (totalPrice != "") totalPrice += ",";
	totalPrice += total.substring(point, point + 3);
	point += 3;
}

$(".totalPrice strong").text(totalPrice);

// 예매취소
function del() {
if(confirm("예매 취소하시겠습니까?")) {
		// 확인 		
		alert("예매가 취소되었습니다");
		location.href="/AgencyBgencyy/reservedelte?seq=<%=dto.getSeq() %>";		
	} else {
		// 취소 		
	}
}


</script>


<%@include file ="../include/footer.jsp" %>