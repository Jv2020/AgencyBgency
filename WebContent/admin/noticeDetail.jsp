<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.catalina.util.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="KSJ.files.dto.FilesDto"%>
<%@page import="BJH.notice.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
// 공지글 시퀀스
request.setCharacterEncoding("utf-8");



NoticeDto noticeDto = (NoticeDto)request.getAttribute("noticeDetail");
FilesDto fileDto = (FilesDto)request.getAttribute("fileDto");

String fileName = fileDto.getFilename();
String originName = fileDto.getOriginName();

String savePath = request.getSession().getServletContext().getRealPath(fileDto.getFilepath());//"/upload/notice"
System.out.println("savePath= "+savePath);
ServletContext context = getServletContext();
int seq = noticeDto.getSeq(); 



%>





<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="user-scalable=yes, maximum-scale=1.0, minimum-scale=0.25, width=1200">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>모두의 전시</title>


<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/AgencyBgencyy/css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="/AgencyBgencyy/css/style.css" type="text/css"> <!-- 디자인 CSS -->

</head>
<body>
<form action="<%=request.getContextPath() %>/Notice?notice=update&seq=<%=seq%>" method="post" enctype="multipart/form-data"> 
	<div align ="center">
		<table border="1">
			<col width="200"><col width="500">
			<tr>
				<th>아이디</th>
				<td>관리자
					<input type="hidden" name="id" value="<%=noticeDto.getId() %>" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="<%=noticeDto.getTitle()%>"size="50" >
				</td>
			</tr>
			
			<tr>
				<th>파일 업로드</th>
				<td>
					<%
					if(fileDto.getFilename()==null || fileDto.getFilename().equals("")){
					%>
					<input type="file" name="fileName" title="첨부파일" value=""  style="width:400px" >	
					<% 
					}else{
					%>
					<a href="#"><%=fileDto.getOriginName() %></a>
					<input type="file" name="fileName" title="첨부파일" value=""  style="width:400px" >
					<%
					}
					%>
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td align="left">
					<textarea rows="20" cols="70" name="content">
						<%=noticeDto.getContent() %>
					</textarea>
				</td>
			</tr>
			
			<tr>
				<th>공지 구분</th>
				<td>
					<select name="choice">
					<% 
					if(noticeDto.getChoice() == 1){
					%>
						<option value="1" selected="selected">공지</option>
						<option value="2">이벤트</option>
						<option value="3">할인</option>
					<% 					
					}else if(noticeDto.getChoice()==2){
					%>
						<option value="1">공지</option>
						<option value="2" selected="selected">이벤트</option>
						<option value="3">할인</option>
					<%
					}else{
					%>
						<option value="1">공지</option>
						<option value="2">이벤트</option>
						<option value="3" selected="selected">할인</option>
					<% 
					}
					%>
						
					
					</select> 
					
					
				
					
				</td>
			</tr>
			
			<tr align="center" >
				<td colspan="2">
					<input type="submit" value="수정하기">
					<input type="button" value="이전으로" onclick="location.href='<%=request.getContextPath() %>/admin/test.jsp'">
				</td>
			</tr>
		</table>
	</div>
</form>
</body>

</html>
