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
	<form method="post" action="/AgencyBgencyy/reserveupdate">
		<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
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
					<input type="text" name="phone" value="<%=dto.getPhone() %>">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">이메일 주소</div>
				<div class="cont i-mg-none">
					<input name="reservEmail01" type="text" value="<%=edata[0]%>">
					<span class="frm-mg">@</span>
					<input name="reservEmail02" type="text" value="<%=edata[1]%>">
				</div>				
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">주소</div>
				<div class="cont">
					<input name="post" type="text" id="sample4_postcode" readonly="readonly" value="<%=radr[0] %>" placeholder="우편번호"> 
				    <span onclick="sample4_execDaumPostcode()" class="frm_adr_btn">주소검색</span><br>
				    <input name="address01" type="text" class="mt08" id="sample4_roadAddress" value="<%=radr[1] %>" placeholder="도로명주소">
				    <input type="text" style="display:none;" id="sample4_jibunAddress" placeholder="지번주소">
				    <span id="guide" style="color:#999;display:none"></span>
				    <input name="address02" type="text"  class="mt08" id="sample4_detailAddress" value="<%=detail %>" placeholder="상세주소">
				    <input type="text" style="display:none;" id="sample4_extraAddress" placeholder="참고항목">
				</div>					
			</div>
			
			<div class="frm_line clfix">
				<div class="tit">티켓 수령방법</div>
				<div class="cont">
					<input type="radio" id="r-ticket1" name="r-ticket" checked="checked" value="현장수령"/><label for="r-ticket1" style="background-color:#f7f7f7;"><span></span>현장수령</label>
  					<input type="radio" id="r-ticket2" name="r-ticket" value="배송"/><label for="r-ticket2" style="background-color:#f7f7f7;"><span></span>배송</label>
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
					
		<button class="reserv_btn" type="submit" >수정완료</button>		
		
		
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

</script>


<%@include file ="../include/footer.jsp" %>