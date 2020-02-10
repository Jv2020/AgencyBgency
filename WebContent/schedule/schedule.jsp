<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<ExhibitDto> newlist = (List<ExhibitDto>)request.getAttribute("newlist");
	List<ExhibitDto> endlist = (List<ExhibitDto>)request.getAttribute("endlist");
	ExhibitDto recommandDto = (ExhibitDto)request.getAttribute("recommandDto");
%>    
<link rel="stylesheet" type="text/css" href="/AgencyBgencyy/exhibit/css/exdetail.css">

<div class="ex-datail-top clfix" style="border: 1px solid;">
	<div style="width:250px; float: left">
		<img src="https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586" width="250px">
	</div>
	<div style="float: left;width:250px;">
		2월의 추천전시
		<h1><%=recommandDto.getTitle() %></h1>
	</div>
<div style="float: right; width: 450px; height:400px; border: 1px solid">
	ss
</div>
</div>


<div class="ex-datail-mid">
	<h5>이달의 새로운 전시</h5>
	<%
	if(newlist.size() > 0) {
		for(int i= 0; i<newlist.size(); i++){
			ExhibitDto dto = newlist.get(i);
			%>
			
	<div class="txt">
			제목 [
			<%= i+" ] " + dto.getTitle() %>
		</div>
			
			<%
		}
	}else{
		// 리스트 불러올게 없을 때 
		
			%>
			<div class="txt">
				새로운 전시가 없습니다.
			</div>
			<%
	}
	%>
</div>

<div class="ex-datail-mid">
	<h5>이달의 마감 전시</h5>
	<%
	if(endlist.size() > 0) {
		for(int i= 0; i<endlist.size(); i++){
			ExhibitDto dto = endlist.get(i);
			%>
			
		<div class="txt" style="width: 30px; float: left">
			제목 [
			<%= i+" ] " + dto.getTitle() %>
		</div>

			
			<%
		}
	}else{
		// 리스트 불러올게 없을 때 
		
			%>
			<div class="txt">
				새로운 전시가 없습니다.
			</div>
			<%
	}
	%>
	
</div>


<%@include file ="../include/footer.jsp" %>		