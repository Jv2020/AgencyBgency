<%@page import="BJH.notice.dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="BJH.notice.dao.NoticeDao"%>
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
	String result = request.getParameter("result");
	System.out.println("result="+result);
	
	
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
	System.out.println("DEL=0 총 갯수="+noticeLength);
	
	
	// 5개씩
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
<!-- 공지 사항 -->

				<div>
					<h3>공지사항관리(총 게시글 수 : <%=noticeLength  %>개)</h3>
					<div align="right">
							<input type="button" name="btn_noticeWrite" value="공지등록" onclick="location.href='./noticeWrite.jsp'">							
							<input type="button" name="btn_noticeDelete" id ="btn_noticeDelete" value="삭제" >
					</div>
					<table border="1">					
						<col width="70"><col width="100"><col width="200"><col width="100"><col width="180"><col width="20">
						<tr>
							<th>글번호 </th>
							<th colspan="2">목록</th>
							<th>작성자</th>
							<th>작성일</th>
							<th><input type="checkbox" name="checkboxAll" class="checkboxAll" id="checkboxAll"></th>
						</tr>
						
						<%//공지 글 없을시 
						if(noticeList.size() == 0 && noticeList == null){
						%>
						<tr>
							<td colspan="6">공지사항이 없습니다</td>
						</tr>
						<%// 공지 글 존재 시
						}else{
							
							// 공지사항 반복문 
								int noticeCount = 0;;
								System.out.println("DEL=0 페이지 공지 갯수 = " + noticeList.size());
								
								
							if(noticeLength <= 5){
								noticeCount = noticeLength; //총 공지갯수 
							}else{
								noticeCount = noticeLength-(5*noticePageNumber);	//글 번호 순차
							}
							for(int i = 0;  i < noticeList.size(); i++){
								noticeDto = noticeList.get(i);
								if(noticeDto.getDel()==0){// del=0  만 추출 
								%>
						<tr>
							<td><%=noticeCount--%></td>
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
								<!-- <a href="../notice_detail?seq=<%=noticeDto.getSeq() %>"> -->
								<a href="<%=request.getContextPath() %>/notice_detail?seq=<%=noticeDto.getSeq() %>">
								
									<%=noticeDto.getTitle() %>
								</a>
							</td>
							<td><%=noticeDto.getId() %></td>
							<td><%=noticeDto.getReg_date() %></td>
							<td><input type="checkbox" id ="checkbox" name="checkbox" value="<%=noticeDto.getSeq()%>"></td>
						</tr>
						<% 
								}// DEL=0
								} // for end
						} // else
						%>
	
					</table>
					<div align="center">
						<div align="center">
							<% // 현재 페이지 번호
							for(int i = 0; i<noticePage; i++){
								if(noticePageNumber == i ){
							%>
							<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
								<%=i+1 %>
							</span>&nbsp;
							<% // 그외 페이지 번호
								}else{
							%>
							<a href="#none" title="<%=i+1 %>페이지" onclick="noticeGoPage(<%=i %>)"
								style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
								[<%=i +1 %>]
							</a>&nbsp;
							
							<%
								}
							}
							%>
						</div>
					
						<div align="center">
							<select id="noticeSearchChoice">
								<option value="select" selected="selected">선택</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<input type="text" id ="noticeSearchWord" name="noticeSearchWord" width="80" value="">
							<input type="button" name="btn_noticeSearch" value="검색" onclick="searchNotice()">
						</div>
						
						
					</div>
>
<!-- //공지사항 end -->				
		
				<div>	
					<h3>전시 관리</h3>
					<div align="right">
						<input type="button" name="btn_write" value="전시등록" onclick="location.href='#'">
						<input type="button" name="btn_delete" value="삭제" onclick="location.href='#'">
					</div>
					<table border="1">					
						<col width="50"><col width="200"><col width="200"><col width="100"><col width="150"><col width="20">
						<tr>
							<th>글번호 </th>
							<th>전시명</th>
							<th>전시관명</th>
							<th>게시자ID</th>
							<th>작성일</th>
							<th><input type="checkbox"></th>
						</tr>
						
						<tr>
							<td>1</td>
							<td>아재개그넘버원 </td>
							<td>비트캠프강남지점</td>
							<td>mrCHOI</td>
							<td>2020-02-11</td>
							<td><input type="checkbox"></td>
						</tr>
					</table>
				</div>
<!--전시페이징 -->
		  
				<div align="center">
						<%-- <div align="center">
							<% // 현재 페이지 번호
							for(int i = 0; i<exhibitPage; i++){
								if(exhibitPageNumber == i ){
							%>
							<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
								<%=i+1 %>
							</span>&nbsp;
							<% // 그외 페이지 번호
								}else{
							%>
							<a href="#none" title="<%=i+1 %>페이지" onclick="exhibitGoPage(<%=i %>)"
								style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
								[<%=i +1 %>]
							</a>&nbsp;
							
							<%
								}
							}
							%>
						</div> --%>
					
						<div align="center">
							<select id="exhibitSearchChoice">
								<option value="select" selected="selected">선택</option>
								<option value="exhibit">전시명</option>
								<option value="place">전시관</option>
								<option value="name">게시자명</option>
							</select>
							<input type="text" id ="exhibitSearchWord" name="exhibitSearchWord" width="80" value="">
							<input type="button" name="btn_exhibitSearch" value="검색" onclick="searchExhibit()">
						</div>
				</div> 

<!-- //전시페이징 end  -->				
				
<!-- 큐레이터승인 -->	

				<div>	
					<h3>!!큐레이터 승인대기자!!</h3>
					<div align="right">
						<input type="button" name="btn_waiting" value="승인" onclick="location.href='#'">
						
					</div>
					<table border="1">					
						<col width="50"><col width="200"><col width="200"><col width="150"><col width="150"><col width="20">
						<tr>
							<th>대기번호</th>	<!-- 카운트 -->
							<th>전시장명</th><!--memberDto.Exhibit_name -->
							<th>자격번호</th><!--memberDto.certi_num -->
							<th>실명</th><!--memberDto.name -->
							<th>계정명</th><!-- memberDto.id -->
							<th><input type="checkbox"></th>
							
						</tr>
						<tr>
							<td>1</td>	
							<td>싱글벙글페스티벌 </td>
							<td>2018-2008-318</td>
							<td>최용호</td>
							<td>sadMovie</td>
							<td><input type="checkbox"></td>
						</tr>
					</table>
				</div>
<!-- //큐레이터승인 -->
				
<!--큐레이터 페이징 -->
		   
				<div align="center">
						<%-- <div align="center">
							<% // 현재 페이지 번호
							for(int i = 0; i<accessPage; i++){
								if(accessPageNumber == i ){
							%>
							<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
								<%=i+1 %>
							</span>&nbsp;
							<% // 그외 페이지 번호
								}else{
							%>
							<a href="#none" title="<%=i+1 %>페이지" onclick="accessGoPage(<%=i %>)"
								style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
								[<%=i +1 %>]
							</a>&nbsp;
							
							<%
								}
							}
							%>
						</div> --%>
					
						<div align="center">
							<select id="accessSearchChoice">
								<option value="select" selected="selected">선택</option>
								<option value="title">전시관명</option>
								<option value="content">실</option>
							</select>
							<input type="text" id ="accessSearchWord" name="accessSearchWord" width="80" value="">
							<input type="button" name="btn_accessSearch" value="검색" onclick="searchAccess()">
						</div>
				</div>

<!-- //큐레이터 페이징 --> 

<!-- 회원검색 -->
			
				<div >	
					<h3>회원 관리</h3>
					<table border="1">					
						<col width="870">
						<tr>
							<th>회원검색</th>
						</tr>
						<tr>
							<td>
								<select id="memberSearchChoice">
								<option value="select" selected="selected">선택</option>
								<option value="id">ID</option>
								<option value="name">이름</option>
								
								<input type="text" id="memberDetail"name="memberDetail" width="80" value="">
								<!-- 회원검색이동  -->
								<input type="button" id="btn_id" name="btn_id" value="검색" onclick="location.href='#'">
								<input type="button" id="btn_memberAll" name="btn_memberAll" value="전체리스트보기"onclick="location.href='${pageContext.request.contextPath}/Member_list'">
							</td>
						</tr>
					</table>
				</div>
					
				
				
<script type="text/javascript">



// notice area javascript
function noticeGoPage(pageNum) {
	var choice = $("#noticeSearchChoice").val();
	var word = $("#noticeSearchWord").val();
	
	if(word == ""){
		document.getElementById("noticeSearchChoice").value='sel';
	};
	var linkStr = "amain.jsp?noticePageNumber=" + pageNum;
	if(choice != 'sel' && word != ""){
		linkStr = linkStr + "&noticeSearchWord=" + word + "&noticeSearchChoice=" + choice;
	};
	location.href = linkStr;
	
};
function searchNotice(){
	var choice = $("#noticeSearchChoice").val();
	var word = $("#noticeSearchWord").val();
	
	if(word==""){
		document.getElementById("noticeSearchChoice").value='sel';
	};
	
	location.href = "./amain.jsp?noticeSearchWord=" + word + "&noticeSearchChoice=" + choice;
};







$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkboxAll").click(function(){
        //클릭되었으면
        if($("#checkboxAll").prop("checked")){
            //input태그의 name이 checkbox인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=checkbox]").prop("checked",true);
            
        //클릭이 안되있으면
        }else{
            //input태그의 name이 checkbox인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=checkbox]").prop("checked",false);
            
        }
    });
    
	
	var checkboxCount = $('input:checkbox[id="checkbox"]:checked').length ;
	var checkbox_val = $('input:checkbox[id="checkbox"]').val();
	
	
	$("#btn_noticeDelete").click(function(){
		var noticeDel = confirm("정말로 삭제 하시겠습니까?");
		var deleteList = new Array();
		   $('input[name="checkbox"]:checked').each(function(index, item){
			   deleteList.push($(item).val());
		   });// for each end
	  	if(noticeDel){
		   
		   var jsonData = {"pdeleteList":deleteList}
		   
		   alert("선택한 공지글 SEQ="+deleteList);
			   $.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/Notice_delete",
					data : jsonData,
					contentType :"application/x-www-form-urlencoded; charset=UTF-8",
					datatype : "json",
			  		success : function(data) {
			       		 alert("성공적으로 삭제되었습니다.");
			       		 location.href="amain.jsp";
			        },
			    	error : function(xhr,status,error) {
			    		// Ajax error
			    		alert("삭제에 실패 했습니다.");
			    		location.href="amain.jsp";
						
			    		
			    	}
				 
					});// ajax end
	  	}// if end
	}); //click end
}); //JQuery ready end




</script>
				<!-- //JH 작업 영역  end-->	
					

			<span></span>
	</div><!-- //inner -->
</div><!-- //wrap -->

</body>
</html>