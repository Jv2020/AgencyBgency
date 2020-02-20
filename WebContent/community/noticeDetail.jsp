<%@page import="KSJ.files.dto.FilesDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="BJH.notice.dto.NoticeDto"%>
<%@page import="BJH.notice.dao.NoticeDao"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<%

NoticeDto dto = (NoticeDto)request.getAttribute("noticeDto");
FilesDto fDto = (FilesDto)request.getAttribute("fileDto");
String savePath ="";
String fileName ="";
String originName = "";
	if(fDto != null){
		savePath = request.getSession().getServletContext().getRealPath(fDto.getFilepath());
		fileName = fDto.getFilename();
		originName = fDto.getOriginName();
	}
String choice = "";
	if(dto.getChoice()==3){
		choice="[ 할인정보 ]";
	}else if(dto.getChoice()==2){
		choice="[ 이벤트 ]";
	}else{
		choice="[ 공지사항 ]";
	}
String regDate = dto.getReg_date();
String title = dto.getTitle();
String content = dto.getContent();


%>
<div id="myReserve">	
	<!-- <p><label><input type="checkbox" class="mr10">모두 선택</label></p> -->
	<table class="reservetbl">
		<colgroup>
			<col style="width:40%">
			<col style="width:60%">
			
		</colgroup>
		
			<tr>
				<th>공지구분</th>
				<td>
					<label><b><%=choice %></b></label>
				</td>
			</tr>
			
			<tr>
				<th>작성일</th>
				<td>
					<label><%=regDate %></label>
				</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<label><%=title %></label>
				</td>
			</tr>
			
			<tr>
				<th>첨부파일</th>
				<td>
					<%
					if(fDto != null){
					/* if(fDto.getFilename()==null || fDto.getFilename().equals("")){ */
					System.out.println("path="+savePath+fileName);
					%>
					<a href="<%=request.getContextPath()%>/upload/notice/<%=fileName%>"><%=originName %></a>
					<% 
					}else{
					%>
					<a href="#">첨부파일 없음</a>
					<%
					}
					%>
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<label><%=content %></label>
					
				</td>
			</tr>

	</table>	
	
	<div class="pagingWrap">	
	
	</div>
	
</div><!-- //myReserve -->



<%@include file ="../include/footer.jsp" %>		