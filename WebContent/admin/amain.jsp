<%@page import="BJH.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="BJH.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
//공지사항
NoticeDao noticeDao = NoticeDao.getInstance();
//List<NoticeDto> noticeList = noticeDao.getNoticeList();
NoticeDto noticeDto = null;
	// 공지 검색
	String noticeSearchWord = request.getParameter("noticeSearchWord");
	String noticeSearchChoice = request.getParameter("noticeSearchChoice");
	System.out.println ("noticeSearchWord ="+noticeSearchWord);
	System.out.println ("noticeSearchChoice ="+noticeSearchChoice);
	
	if(noticeSearchChoice == null || noticeSearchChoice.equals("")){
		noticeSearchChoice = "sel";
	}
	// 검색어 없을 경우
	if(noticeSearchChoice.equals("sel")){
		noticeSearchWord="";
	}
	if(noticeSearchWord == null){
		noticeSearchWord = "";
		noticeSearchChoice = "sel";
	}
	
	
//전시내역

//회원관리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="user-scalable=yes, maximum-scale=1.0, minimum-scale=0.25, width=1200">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>모두의 전시</title>

<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/AgencyBgencyy/css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="/AgencyBgencyy/css/style.css" type="text/css"> <!-- 디자인 CSS -->
<link rel="stylesheet" href="/AgencyBgencyy/css/admin.css" type="text/css">
</head>
<body>

<script type="text/javascript">
$(document).ready(function () {
	var _choice = '<%=noticeSearchChoice %>';
	var _searchWord = '<%=noticeSearchWord %>';
	if(_choice != '' && _choice != 'sel'){		
		if(_searchWord != ""){			
			$("#choice").val(_choice);
			$("#search").val(_searchWord);
		}
	}
});
</script>

<%
	//공지사항 페이징
	String sNoticePageNumber = request.getParameter("noticePageNumber");
	int noticePageNumber =0;
	
	
	if(sNoticePageNumber != null && !sNoticePageNumber.equals("")){
		noticePageNumber = Integer.parseInt(sNoticePageNumber);
	}
	

		List<NoticeDto> noticeList = noticeDao.getNoticePagingList(noticeSearchChoice,noticeSearchWord,noticePageNumber);
		
		
	int noticeLength = noticeDao.getAllNotice(noticeSearchChoice,noticeSearchWord);
	System.out.println("총 공지 갯수="+noticeLength);
	
	int noticePage = noticeLength / 5;
	if(noticeLength % 5 > 0 ){
		noticePage = noticePage + 1 ;
	}
%>

<div id="wrap" class="admin">
	<div class="inner">
		<div class="m_tit admin">
			<h2>관리자 페이지입니다</h2>
			<span></span>	
		</div>	<!-- //m_tit admin -->
		
		
				<!-- JH 작업 영역 -->
				<div>
					<h3>공지사항관리</h3>
					<div align="right">
							<input type="button" name="btn_noticeWrite" value="공지등록" onclick="location.href='./noticeWrite.jsp'">							
							<input type="button" name="btn_noticeDelete" value="삭제" onclick="location.href='./noticeDelete.jsp'">
					</div>
					<table border="1">					
						<col width="70"><col width="100"><col width="400"><col width="100"><col width="200"><col width="20">
						<tr>
							<th>글번호 </th>
							<th colspan="2">목록</th>
							<th>작성자</th>
							<th>작성일</th>
							<th><input type="checkbox" name="checkboxAll" class="checkboxAll"></th>
						</tr>
						
						<%
						if(noticeList.size() == 0){
						%>
						<tr>
							<td colspan="6">공지사항이 없습니다</td>
						</tr>
						<%
						}else{
							// 공지사항 for
								
							for(int i = 0; i<noticeList.size(); i++){
								noticeDto = noticeList.get(i);
								if(noticeDto.getDel()==0){
								%>
						<tr>
							<td><%=noticeDto.getRef()%></td>
									<% 
									if(noticeDto.getChoice() == 3){
									%>
							<td><strong>[할인정보]</strong></td>
							
							
									<%
									}else if(noticeDto.getChoice() == 2){
									%>
							<td><strong>[이벤트]</strong></td>
							
							
							<%
									}else{
									%>
									<td><strong>[공지사항]</strong></td>
							
							<%
									}
							%>
							<td align="left">
							<!-- 링크 넣어야함 -->
								<%=noticeDto.getTitle() %>
							</td>
							<td><%=noticeDto.getId() %></td>
							<td><%=noticeDto.getReg_date() %></td>
							<td><input type="checkbox" name="checkbox" value="<%=noticeDto.getRef()%>"></td>
						</tr>
						<% 
								}
							}
						}
						%>
	
					</table>
					<div align="center">
						<div align="center">
							<% // 현재 페이지
							for(int i = 0; i<noticePage; i++){
								if(noticePageNumber == i ){
							%>
							<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
								<%=i+1 %>
							</span>&nbsp;
							<% // 그외 페이지
								}else{
							%>
							<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
								style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
								[<%=i +1 %>]
							</a>&nbsp;
							
							<%
								}
							}
							%>
						</div>
					
						<div align="center"></div>
							<select id="noticeSearchChoice">
								<option value="select">선택</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<input type="text" id ="noticeSearchWord" name="noticeSearchWord">
							<input type="button" name="btn_noticeSearch" value="검색" onclick="searchNotice()">
						</div>
						
						
					</div><!-- //공지 이벤트 -->
				
				
				<div>	
					<h3>전시 관리</h3>
					<div align="right">
						<input type="button" name="btn_write" value="전시등록" onclick="location.href='#'">
						<input type="button" name="btn_delete" value="삭제" onclick="location.href='#'">
					</div>
					<table border="1">					
						<col width="70"><col width="500"><col width="100"><col width="200"><col width="20">
						<tr>
							<th>글번호 </th>
							<th>전시명</th>
							<th>등록자</th>
							<th>작성일</th>
							<th><input type="checkbox"></th>
						</tr>
						
						<tr>
							<td>1</td>
							<td>에이전시 비전시 </td>
							<td>비전시</td>
							<td>2020-02-20</td>
							<th><input type="checkbox"></th>
						</tr>
					</table>
					
				</div>
				<div></div>
				<div>	
					<h3>회원 관리</h3>
					<table border="1">					
						<col width="870">
						<tr>
							<th>회원ID검색</th>
							
							
						</tr>
						
						<tr>
							<td>
								<input type="text" id="_id"name="id" value="">
								<!-- 회원검색이동  -->
								<input type="submit" id="_btn_id" name="btn_id" value="검색" onclick="location.href='#'">
								
							</td>

						</tr>
					</table>
				</div>
				
<script type="text/javascript">
function goPage(pageNum) {
	var choice = $("#noticeSearchChoice").val();
	var word = $("#noticeSearchWord").val();
	
	if(word == ""){
		document.getElementById("noticeSearchChoice").value='sel';
	}
	var linkStr = "amain.jsp?noticePageNumber=" + pageNum;
	if(choice != 'sel' && word != ""){
		linkStr = linkStr + "&noticeSearchWord=" + word + "&noticeSearchChoice=" + choice;
	}
	location.href = linkStr;
	
}
function searchNotice(){
	var choice = $("#noticeSearchChoice").val();
	var word = $("#noticeSearchWord").val();
	
	if(word==""){
		document.getElementById("noticeSearchChoice").value='sel';
	}
	
	location.href = "./amain.jsp?noticeSearchWord=" + word + "&noticeSearchChoice=" + choice;
}

$( document ).ready( function() {
    $( '.checkboxAll' ).click( function() {
      $( '.checkbox' ).prop( 'checked', this.checked );
    } );
  } );


</script>
				<!-- //JH 작업 영역 -->	
					
				
			
					

			<span></span>
	</div><!-- //inner -->
</div><!-- //wrap -->

</body>
</html>