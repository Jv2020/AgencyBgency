<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/AgencyBgencyy/schedule/css/schedule.css">

<%
	
	List<ExhibitDto> newlist = (List<ExhibitDto>)request.getAttribute("newlist");	// 이달의 새로운 전시 
	List<ExhibitDto> endlist = (List<ExhibitDto>)request.getAttribute("endlist");	// 이달의 마감 전시
	ExhibitDto recommandDto = (ExhibitDto)request.getAttribute("recommandDto");		// 이달의 추천 전시 
%>    
<%

%>
<!-- 추천전시 및 일정 -->
<div class="sch-top clfix">
	<div class="recommand clfix">
		<div class="img">
			<img src="https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586">
		</div>
		<div class="txt">
			<strong>이달의 추천전시</strong>
			<h3>
				<a href="${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=recommandDto.getSeq()%>">
					<%=recommandDto.getTitle() %>
				</a>
			</h3>
			<p><%= recommandDto.getBegindate().substring(0,11)+" ~ " +  recommandDto.getEnddate().substring(0,11) %></p>
		</div>
	</div>
	<div class="calendar">
		<div class="cal-top">
			<span class="prev"> <i class="fas fa-chevron-left"></i> </span>
			<div class="month">
				<span>2020</span>
				<strong>02</strong>
			</div>
			<span class="next"> <i class="fas fa-chevron-right"></i> </span>
		</div>
		<div class="cal-cont">
			<ul>
				<li>
					<div class="day">01</div>
					<div class="desc">
						<h4><a href="#">시간의 풍경 제목은 두줄까지 함</a></h4>
						<p>상상마당</p>
					</div>
				</li>
				
				<li>
					<div class="day">01</div>
					<div class="desc">
						<h4><a href="#">시간의 풍경 제목은 두줄까지 함</a></h4>
						<p>상상마당</p>
					</div>
				</li>
				
				<li>
					<div class="day">01</div>
					<div class="desc">
						<h4><a href="#">시간의 풍경 제목은 두줄까지 함</a></h4>
						<p>상상마당</p>
					</div>
				</li>
				
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
		for(int i=0; i<newlist.size();i++) {
		ExhibitDto dto = newlist.get(i);
		String bdate = dto.getBegindate().substring(0,11);
		String edate = dto.getEnddate().substring(0,11);
		%>
		<li>
			<div class='img'>
				<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>'>
					<img src='https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586'>
				</a>
			</div>
			<div class='txt'>
				<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>'>
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
					%>
					<li>
						<div class='img'>
							<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>'>
								<img src='https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586'>
							</a>
						</div>
						<div class='txt'>
							<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>'>
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


<%@include file ="../include/footer.jsp" %>		