<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="BJH.notice.dto.NoticeDto"%>
<%@page import="BJH.notice.dao.NoticeDao"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<%

NoticeDao noticeDao = NoticeDao.getInstance();
String sNoticePageNumber = request.getParameter("pageNum");
System.out.println("------sNoticePageNumber----------" + sNoticePageNumber);
//List<NoticeDto> noticeList = noticeDao.getNoticePagingList(page);

int noticePageNumber =0;
	if(sNoticePageNumber != null && !sNoticePageNumber.equals("")){
		noticePageNumber = Integer.parseInt(sNoticePageNumber);
	}

	int noticeLength = noticeDao.getAllNoticeLength();
	int noticePage = noticeLength / 10;
	if(noticeLength % 10 > 0){
		noticePage = noticePage +1;
	}
	System.out.println("noticePageNum = " + noticePageNumber);
	System.out.println("noticePage = "+noticePage);
	System.out.println("Notice DEL=0 총 갯수="+noticeLength);
	List<NoticeDto> noticeList = (List<NoticeDto>)request.getAttribute("noticeList");
	if(noticeList == null){
		noticeList = noticeDao.getNoticePagingList10(noticePageNumber);
	}
	String choice ="";
%>
<div id="myReserve">	
	<!-- <p><label><input type="checkbox" class="mr10">모두 선택</label></p> -->
	<table class="reservetbl">
		<colgroup>
			<col style="width:10%">
			<col style="width:52%">
			<col style="width:20%">
			<col style="width:18%">
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>상세보기</th>
			<tr>
		</thead>
		<tbody>
		<%
		if(noticeList.size() == 0 || noticeList == null){
		%>
			<tr>
				<td colspan="3"> 공지사항이 없습니다.</td>
			</tr>
		<%
		}else{
			int noticeCount = 0;
			if(noticeLength <= 10){
				noticeCount = noticeLength;
			}else{
				noticeCount = noticeLength-(10*noticePageNumber);
			}
			for(int i = 0; i < noticeList.size(); i++){
				NoticeDto dto = noticeList.get(i);
				String sregDate = dto.getReg_date();
				int idx = sregDate.indexOf(" ");
				String regDate = sregDate.substring(0, idx);

			
				
			%>
			<tr>
				
				<td><%=noticeCount-- %></td>
				<%
				if(dto.getChoice()==3){
					choice="[ 할인정보 ]";
				}else if(dto.getChoice()==2){
					choice="[ 이벤트 ]";
				}else{
					choice="[ 공지사항 ]";
				}
				%>
				<td align="left"><span><b><%=choice %></b> <%=dto.getTitle() %></span></td>
				<td><%=regDate%></td>
				<td>
									
					<a href="<%=request.getContextPath()%>/vNotice?seq=<%=dto.getSeq()%>">더보기 +</a>					
				</td>
			</tr>
			<% 							
			}//for end
		}//if end
		%>
	
		</tbody>		
	</table>	
	
	<div class="pagingWrap">	
		<% 
		for(int i = 0; i<noticePage; i++){
			if(noticePageNumber == i){
			%>	
			<span class="on"><%=i+1 %></span>&nbsp;		
			<%
			}else{
			%>
			<span>
				<a href="<%=request.getContextPath() %>/vNotice?pageNum=<%=i %>"><%=i+1 %></a>
			</span>
			<%
			}	
		}
		%>
	</div>
	
</div><!-- //myReserve -->



<%@include file ="../include/footer.jsp" %>		