<%@page import="java.util.Calendar"%>
<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/AgencyBgencyy/schedule/css/schedule.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%! 
// 현재 날짜 확인하기
public String getDate(){
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DATE);
	
	String today ="";
	today += year;
	
	if(month<10){ today += "0" + month; }
	else{ today += month; }
	
	if(day<10){ today += "0" + day; }
	else{ today += day; }
		
	return today;
}

public String getDate(String date){
	String str = date.substring(0,10);
	str = str.replaceAll("-", "").trim();
	return str;
}
public String getExPeriod(String begindatefull, String enddatefull){
	String status="";
	// 기준 : 오늘 
	int today = Integer.parseInt(getDate());
	int begindate = Integer.parseInt(getDate(begindatefull));
	int enddate = Integer.parseInt(getDate(enddatefull));
	
	if( today >= begindate && today <= enddate ){
		// 현재 전시 
		status = "now";
	}else if( today <= begindate) {
		// 예정 전시 
		status = "fut";
	}else{
		// 지난 전시 	
		status = "past";
	} 
	return status;
}
%>
<%
	List<ExhibitDto> newlist = (List<ExhibitDto>)request.getAttribute("newlist");	// 이달의 새로운 전시 
	List<ExhibitDto> endlist = (List<ExhibitDto>)request.getAttribute("endlist");	// 이달의 마감 전시
	List<ExhibitDto> monthList = (List<ExhibitDto>)request.getAttribute("monthList");	// 이달의 전시 
	ExhibitDto recommandDto = (ExhibitDto)request.getAttribute("recommandDto");		// 이달의 추천 전시 
%>    

<%
	String recommandPeriod="";
	// 추천전시 상태 
	if( recommandDto.getBegindate() != null ){	// 추천전시가 null이 아닐때 
		recommandPeriod = getExPeriod(recommandDto.getBegindate(),recommandDto.getEnddate() );
	}
%> <!-- 추천전시 및 일정 -->
<div class="sch-top clfix">
	<div class="recommand clfix">
		<div class="img">
		<%	// 추천전시가 없을 때 
				if( recommandDto.getTitle() == null ){
				%>
					 <img alt="이미지 없음" src="${pageContext.request.contextPath}/images/sub/commingsoon.jpeg" style="margin-top: 120px;"> 
				<%
				}else{
					// 추천전시 있을 때 
					if(recommandDto.getFilename() == null ){
						// 표지 없을 때 
						%>
						<span>
							<img alt="이미지 없음" id="title" src="${pageContext.request.contextPath}/images/sub/noimg.gif" style="margin-top: 80px; display: inline-block;"/>
						</span>
						<%
					}
					else {	
					// 표지 있을 때 
						%>
							 <img alt="이미지 없음" src="${pageContext.request.contextPath}/filedownload?filepath=/upload/title/&filename=<%=recommandDto.getFilename()%>"/> 
						<%
					}
				
				}
			%>
		</div>
		<div class="txt">
			<strong>이달의 추천전시</strong>
			<%	// 추천전시가 있을 때
				if(  recommandDto.getTitle() != null ){
				%>
					<h3>
						<a href="${pageContext.request.contextPath}/exdetail?ex=<%=recommandPeriod %>&seq=<%=recommandDto.getSeq()%>">
							<%=recommandDto.getTitle() %>
						</a>
					</h3>
					<p><%= recommandDto.getBegindate().substring(0,11)+" ~ " +  recommandDto.getEnddate().substring(0,11) %></p>
				<%
				}else{
					// 추천전시 없을 때 
					%>
					<h4 style="margin-top: 130px; text-align: center">진행된 전시가 없습니다.</h4>
					<%
				}
			%>
		</div>
	</div>
<!-- 캘린더 -->
	<div class="calendar">
		<div class="cal-top">
			<span class="prev" id="prev"> <i class="fas fa-chevron-left"></i> </span>
			<div class="month">
				<span id="year">2020</span>
				<strong id="month">02</strong>
			</div>
			<span class="next" id="next"> <i class="fas fa-chevron-right"></i> </span>
		</div>
		<div class="cal-cont">
			<ul id="cal-data">
		<!-- 캘린더 데이터 들어감 -->
		<%
		if(monthList.size()>0){
			for(int i=0; i< monthList.size(); i++){ 
				ExhibitDto dto = monthList.get(i);
				String exstatus = getExPeriod(dto.getBegindate(), dto.getEnddate());
			%>
				<li>
					<div class="day"><%=i+1 %></div>
					<div class="desc">
						<h4><a href="<%=request.getContextPath()%>/exdetail?ex=<%=exstatus%>&seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></h4>
						<p><%=dto.getPlace() %></p>
					</div>
				</li>
				
				<%
			}
			}else{
				
			}
		%>
			</ul>
		</div>
	
	</div>
</div>

<!-- 이달의 새로운 전시 -->
<div class="sch-btm">
<h5>이달의 새로운 전시</h5>
	<div class="txt">
	<ul class="e_list clfix">
	<% 
	if(newlist.size() > 0 ){
			//exstatus="";	// 현재/지난/예정 전시인지 확인하기 
			for(int i=0; i<newlist.size();i++) {
		
			ExhibitDto dto = newlist.get(i);
			String bdate = getDate(dto.getBegindate());
			String edate = getDate(dto.getEnddate());
			
			String exstatus = getExPeriod(dto.getBegindate(), dto.getEnddate());
		
		%>
		<li>
			<div class='img'>
				 <%
					// 표지 없을 때 
					if(dto.getFilename() == null ){
						%>
							<a href='${pageContext.request.contextPath}/exdetail?ex=<%=exstatus %>&seq=<%=dto.getSeq()%>'   style="background: #f8f8f7;">
								<img alt="이미지 없음" id="title" src="${pageContext.request.contextPath}/images/sub/noimg.gif"/>
						<%
					}
					// 표지 있을 때 
					else {	
						%>
							<a href='${pageContext.request.contextPath}/exdetail?ex=<%=exstatus %>&seq=<%=dto.getSeq()%>'>
								 <img alt="이미지 없음" src="${pageContext.request.contextPath}/filedownload?filepath=/upload/title/&filename=<%=dto.getFilename()%>" /> 
						<%
					}
				
				%>
				
				
				</a>
			</div>
			<div class='txt'>
				<a href='${pageContext.request.contextPath}/exdetail?ex=<%=exstatus %>&seq=<%=dto.getSeq()%>'>
					<h3><%=dto.getTitle() %></h3>
				</a> 
				<p><%=dto.getPlace() %></p>
				<span><%=bdate+"~ "+edate%></span>
			</div>
		</li>
		
		<% 
		}
	}else{	// 리스트가 없을 시
		%>
			<li>
				<div>
					새로운 전시가 없습니다.
				</div>
			</li>
		<%
	}
	%>
	</ul>
</div>
<div class="sch-btm">
<!-- 이달의 마감전시 -->
<h5>이달의 마감전시</h5>
	<div class="txt">
			<ul class="e_list clfix">
				<% 
				if(endlist.size() > 0 ){
					for(int i=0; i<endlist.size();i++) {
					ExhibitDto dto = endlist.get(i);
					String bdate = dto.getBegindate().substring(0,11);
					String edate = dto.getEnddate().substring(0,11);
					
					String exstatus = getExPeriod(dto.getBegindate(), dto.getEnddate());
					%>
					<li>
						<div class='img'>
								 <%
								// 표지 있을 때 
								if(dto.getFilename() == null ){
									%>
									<a href='${pageContext.request.contextPath}/exdetail?ex=<%=exstatus %>&seq=<%=dto.getSeq()%>' style="background: #f8f8f7;">
										<img alt="이미지 없음" id="title" src="${pageContext.request.contextPath}/images/sub/noimg.gif"/>
									<%
								}
								else {	// 표지 없을 때 
									%>
									<a href='${pageContext.request.contextPath}/exdetail?ex=<%=exstatus %>&seq=<%=dto.getSeq()%>'>
										 <img alt="이미지 없음" src="${pageContext.request.contextPath}/filedownload?filepath=/upload/title/&filename=<%=dto.getFilename()%>"/> 
									<%
								}
							
							%>
								
							</a>
						</div>
						<div class='txt'>
							<a href='${pageContext.request.contextPath}/exdetail?ex=<%=exstatus %>&seq=<%=dto.getSeq()%>'>
								<h3><%=dto.getTitle() %></h3>
							</a> 
							<p><%=dto.getPlace() %></p>
							<span><%=bdate+"~ "+edate%></span>
						</div>
					</li>
					
					<% 
					}
				}else{	// 리스트가 없을 시
					%>
					<li>
						<div>
							새로운 전시가 없습니다.
						</div>
					</li>
					<%
				}
				%>
				</ul>
	</div>
</div>
</div>


<!-- 전시 스케쥴 보기 버튼 바꿈 -->
<script>
	
$("#prev").click(function() {

	var syear = $("#year").text();
	var smonth = $("#month").text();
	
	var year = parseInt(syear);
	var month = parseInt(smonth);

	if(smonth === '01'){
		year = year-1;
		month = 12;
	}else{
		month = month-1;
	}
	if(month < 10){
		month = "0" + month;
	}
	$("#year").text(year);
	$("#month").text(month);
	
	$.ajax({
		url: "./exhibitmonthsch",
		type:"post",
		data:"year="+year+"&month="+month,
		dataType: "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function( data ) {
			var str = "";
			var exstatus ="";

			for(var i=0; i<data.length; i++){
				
				var begindate = data[i].begindate.substring(0,4)+data[i].begindate.substring(5,7)+data[i].begindate.substring(8,10);
				var enddate = data[i].enddate.substring(0,4)+data[i].enddate.substring(5,7)+data[i].enddate.substring(8,10);
				begindate = parseInt(begindate);
				enddate = parseInt(enddate);
				today = parseInt(getDate());
				
				if( today >= begindate && today <= enddate ){
					exstatus = "now";
				}else if( today > enddate ){
					exstatus = "past";
				}else{
					exstatus = "fut";
				}
				
				str += '<li>'
						+'<div class="day">'+(1+i)+'</div>'
						+'<div class="desc">'
						+ '<h4><a href="/AgencyBgencyy/exdetail?ex='+exstatus+'&seq='+data[i].seq+'">'+data[i].title+'</a></h4>'
						+	'<p>'+data[i].place+'</p>'
						+'</div></li>';
			}
					
			$("#cal-data").html(str);
		}
	});
});

$("#next").click(function() {

	var syear = $("#year").text();
	var smonth = $("#month").text();
	
	var year = parseInt(syear);
	var month = parseInt(smonth);

	if(smonth === '12'){
		year = year+1;
		month = 1;
	}else{
		month = month+1;
	}
	if(month < 10){
		month = "0" + month;
	}
	$("#year").text(year);
	$("#month").text(month);
	
	$.ajax({
		url: "./exhibitmonthsch",
		type:"post",
		data:"year="+year+"&month="+month,
		dataType: "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function( data ) {
			var str = "";	// html 담을 변수 
			var exstatus="";	// 전시 상태를 담을 변수 
			for(var i=0; i<data.length; i++){
				
				var begindate = data[i].begindate.substring(0,4)+data[i].begindate.substring(5,7)+data[i].begindate.substring(8,10);
				var enddate = data[i].enddate.substring(0,4)+data[i].enddate.substring(5,7)+data[i].enddate.substring(8,10);
				begindate = parseInt(begindate);
				enddate = parseInt(enddate);
				var today = parseInt(getDate());
				
				if( today >= begindate && today <= enddate ){
					exstatus = "now";
				}else if( today > enddate ){
					exstatus = "past";
				}else{
					exstatus = "fut";
				}
				//if(begindate>)
				str += '<li>'
						+'<div class="day">'+(1+i)+'</div>'
						+'<div class="desc">'
						+ '<h4><a href="/AgencyBgencyy/exdetail?ex='+exstatus+'&seq='+data[i].seq+'">'+data[i].title+'</a></h4>'
						+	'<p>'+data[i].place+'</p>'
						+'</div></li>';
			}
			$("#cal-data").html(str);
		}
	});
	
	
	
});
function getDate(){
	var date = new Date();
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();

	if(m < 10){ 
		m = "0" + m;
	}if(d < 10){
		d = "0" + d;
	}
	return y + m + d + "";
}



</script>
<!-- Ajax  -->
<%@include file ="../include/footer.jsp" %>		