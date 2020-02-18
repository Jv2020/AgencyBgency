<%@page import="BJH.notice.dto.NoticeDto"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Calendar"%>
<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	String str = date.substring(0,11);
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
request.setCharacterEncoding("UTF-8");

%>


	





<style>
/* main - 전체 검색 */
.searchResult {width:100%;}
table.searchtbl {width:100%; text-align:center;}
table.searchtbl th {position:relative; height:50px; line-height:50px; background:#f7f7f7; border-top:1px solid #ddd; border-bottom:1px solid #ddd; font-weight:normal;}
table.searchtbl th:before {position:absolute; top:50%; left:0; margin-top:-10px; content:''; width:1px; height:20px; background:#ddd;}
table.searchtbl th:first-child:before {display:none;}
table.searchtbl td {position:relative; padding:0 20px; height:80px; border-bottom:1px solid #ddd;}
table.searchtbl td > span {
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    line-height:25px;
    max-height:50px;
}
table.reservetbl td a, table.reservetbl td button {position:relative; z-index:1; display:inline-block; border:1px solid #5f0080; transition:all 0.3s ease-in-out; line-height:35px; padding:0 20px; color:#5f0080; overflow:hidden; outline:none;}
table.reservetbl td a:before, table.reservetbl td button:before {position:absolute; top:0; left:0; transform: translate(-100%, 0); display:inline-block; transition:all 0.3s ease-in-out; width:100%; height:100%; content:''; background:#5f0080; z-index:-1;}
table.reservetbl td a:hover, table.reservetbl td button:hover {color:#fff;}
table.reservetbl td a:hover:before, table.reservetbl td button:hover:before {transform: translate(0);}

.pagingWrap {width:100%; text-align:center; font-size:0;}
.pagingWrap span {position:relative; display:inline-block; width:35px; height:35px; line-height:35px; color:#333; font-size:18px; margin:50px 10px 0; cursor:pointer;}
.pagingWrap span.on {color:#5f0080;}
.pagingWrap span.on:before {position:absolute; bottom:0; left:50%; margin-left:-10px; content:''; width:20px; height:2px; background:#5f0080;}
.pagingWrap span:hover {color:#5f0080;}
</style>
<%

Map<String, List<ExhibitDto>> exhibitDtomap = (Map<String, List<ExhibitDto>>)request.getAttribute("exhibitDtolist");
List<NoticeDto> noticeAllList = (List<NoticeDto>)request.getAttribute("noticeAllList");

%>

<!-- 전시제목 -->
<h1>전시 제목에 대한 결과</h1>
<div class ="searchResult">
	<table class="searchtbl">
		<colgroup>
			<col style="width:35%">
			<col style="width:20%">
			<col style="width:15%">
			<col style="width:30%">
		</colgroup>
		<thead>
			<tr>
				<th>전시명</th>
				<th>장소</th>
				<th>관람료</th>
				<th>전시기간</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(exhibitDtomap.get("title") != null){
		%>
			<%
				System.out.println("타이틀 갯수: "+exhibitDtomap.get("title").size());
				for(int i=0; i< exhibitDtomap.get("title").size(); i++){ 
				ExhibitDto dto = exhibitDtomap.get("title").get(i);
				String exstatus = getExPeriod(dto.getBegindate(), dto.getEnddate());
		%>
			<tr>
				<td><a href="<%=request.getContextPath()%>/exdetail?ex=<%=exstatus%>&seq=<%=exhibitDtomap.get("title").get(i).getSeq()%>"><%=exhibitDtomap.get("title").get(i).getTitle() %></a></td>
				<td><%=exhibitDtomap.get("title").get(i).getPlace() %></td>
				<td><%=exhibitDtomap.get("title").get(i).getPrice() %>원</td>
				<td><%=exhibitDtomap.get("title").get(i).getBegindate().substring(0,11) %> ~ <%=exhibitDtomap.get("title").get(i).getEnddate().substring(0,11)%></td>
			</tr>	
		<%
			}	
		%>
		<%
			} else {
		%>
			<tr>
				<td colspan="4">검색하신 결과가 없습니다.</td>
			</tr>
		<%	
			}
		
		%>
		
		</tbody>
	</table>
</div>
<br>
<!-- 전시컨텐츠 -->
<h1>전시 컨텐츠에 대한 결과</h1>
<div class ="searchResult">
	<table class="searchtbl">
		<colgroup>
			<col style="width:35%">
			<col style="width:20%">
			<col style="width:15%">
			<col style="width:30%">
		</colgroup>
		<thead>
			<tr>
				<th>전시명</th>
				<th>장소</th>
				<th>관람료</th>
				<th>전시기간</th>
			</tr>
		</thead>
		<tbody>
		<%
		if(exhibitDtomap.get("content") != null){
		%>
			<%
			System.out.println("컨텐츠 갯수: "+exhibitDtomap.get("content").size());
			for(int i=0; i< exhibitDtomap.get("content").size(); i++){ 
			ExhibitDto dto = exhibitDtomap.get("content").get(i);
			String exstatus = getExPeriod(dto.getBegindate(), dto.getEnddate());
		%>
			<tr>
				<td><a href="<%=request.getContextPath()%>/exdetail?ex=<%=exstatus%>&seq=<%=exhibitDtomap.get("content").get(i).getSeq()%>"><%=exhibitDtomap.get("content").get(i).getTitle() %></a></td>
				<td><%=exhibitDtomap.get("content").get(i).getPlace() %></td>
				<td><%=exhibitDtomap.get("content").get(i).getPrice() %>원</td>
				<td><%=exhibitDtomap.get("content").get(i).getBegindate().substring(0,11) %> ~ <%=exhibitDtomap.get("content").get(i).getEnddate().substring(0,11)%></td>
			</tr>	
		<%
			}	
		%>
		<%
		} else {
		%>
			<tr>
				<td colspan="4">검색하신 결과가 없습니다.</td>
			</tr>
		<%	
		}
		%>
		</tbody>
	</table>
</div>
<br>
	


<%@include file ="../include/footer.jsp" %>