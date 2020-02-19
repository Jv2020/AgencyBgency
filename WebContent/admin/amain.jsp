<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="NWH.member.dto.MemberDto"%>
<%@page import="BJH.notice.dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="BJH.notice.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<NoticeDto> noticeList = (List<NoticeDto>) request.getAttribute("noticeList");
	List<MemberDto> memberList = (List<MemberDto>) request.getAttribute("memberList");
	List<ExhibitDto> exhibitList = (List<ExhibitDto>) request.getAttribute("exhibitList");

	String snoticePageNumber = (String) request.getAttribute("noticePageNumber");
	String saccessPageNumber = (String) request.getAttribute("accessPageNumber");
	String sexhibitPageNumber = (String) request.getAttribute("exhibitPageNumber");

	int noticePageNumber = 0;
	if (snoticePageNumber != null) {
		noticePageNumber = Integer.parseInt(snoticePageNumber);
	}
	System.out.println("noticePageNumber = " + noticePageNumber);

	int accessPageNumber = 0;
	if (saccessPageNumber != null) {
		accessPageNumber = Integer.parseInt(saccessPageNumber);
	}
	System.out.println("accessPageNumber = " + accessPageNumber);

	int exhibitPageNumber = 0;
	if (sexhibitPageNumber != null) {
		exhibitPageNumber = Integer.parseInt(sexhibitPageNumber);
	}
	System.out.println("exhibitPageNumber = " + exhibitPageNumber);

	Object snoticeLength = request.getAttribute("noticeLength");
	Object saccessLength = request.getAttribute("accessLength");
	Object sexhibitLength = request.getAttribute("exhibitLength");

	int accessLength = 0;
	if (saccessLength != null) {
		accessLength = (Integer) saccessLength;
	}
	System.out.println("accessLength = " + accessLength);

	int noticeLength = 0;
	if (snoticeLength != null) {
		noticeLength = (Integer) snoticeLength;
	}
	System.out.println("noticeLength = " + noticeLength);

	int exhibitLength = 0;
	if (sexhibitLength != null) {
		exhibitLength = (Integer) sexhibitLength;
	}
	System.out.println("exhibitLength = " + exhibitLength);

	NoticeDto noticeDto = null;
	MemberDto memberDto = null;
	ExhibitDto exhibitDto = null;

	//5개씩 만 보여주기
	int noticePage = noticeLength / 5;
	if (noticeLength % 5 > 0) {
		noticePage = noticePage + 1;
	}
	System.out.println("noticePage = " + noticePage);

	int accessPage = accessLength / 5;
	if (accessLength % 5 > 0) {
		accessPage = accessPage + 1;
	}
	System.out.println("accessPage = " + accessPage);

	int exhibitPage = exhibitLength / 5;
	if (exhibitLength % 5 > 0) {
		exhibitPage = exhibitPage + 1;
	}
	System.out.println("exhibitPage = " + exhibitPage);
	//
	String noticeResult = request.getParameter("noticeResult");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="user-scalable=yes, maximum-scale=1.0, minimum-scale=0.25, width=1200">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>모두의 전시</title>

<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/AgencyBgencyy/css/reset.css"type="text/css">
<!-- 리셋 CSS -->
<link rel="stylesheet" href="/AgencyBgencyy/css/style.css" type="text/css">
<!-- 디자인 CSS -->
<!-- <link rel="stylesheet" href="/AgencyBgencyy/css/admin.css" type="text/css"> -->
</head>
<body>
	<div id="wrap" class="admin">
		<div class="inner">
			<div class="m_tit admin">
				<h2>관리자 페이지입니다</h2>
				<span></span>
			</div>
			<!-- //m_tit -->
			
			<ul id="dot">
				<li><a href="#admin01">공지사항관리</a></li>
				<li><a href="#admin02">전시관리</a></li>
				<li><a href="#admin03">큐레이터승인</a></li>
				<li><a href="#admin04">회원관리</a></li>
			</ul>

			<div class="tabcontWrap">
				<!-- 공지사항 시작 -->
				<div class="tab_con" id="admin01">
					<h3>공지사항관리</h3>
					<div class="admin-btn">
						<span>총 게시글 수: <%=noticeLength%>개</span>
						<input type="button" name="noticeWrite" value="공지등록"
							onclick="location.href='<%=request.getContextPath()%>/Notice?notice=write'">
						<input type="button" name="btn_noticeDelete" id="btn_noticeDelete"
							value="삭제">
					</div>
					<table class="admintbl">
						<col width="70">
						<col width="100">
						<col width="200">
						<col width="100">
						<col width="180">
						<col width="20">
						<tr>
							<th>글번호</th>
							<th colspan="2">타이틀</th>
							<th>작성자</th>
							<th>작성일</th>
							<th><input type="checkbox" name="chk_noticeAll"
								class="chk_noticeAll" id="chk_noticeAll"></th>
						</tr>

						<%
							if (noticeLength == 0 || noticeList == null || noticeList.size() == 0) {
						%>
						<tr>
							<td colspan="6">공지사항이 없습니다</td>
						</tr>
						<%
							//공지글 존재시 반복문 
							} else {
								int noticeCount = 0;
								if (noticeLength <= 5) {
									noticeCount = noticeLength;
								} else {
									noticeCount = noticeLength - (5 * noticePageNumber);
								}
								for (int i = 0; i < noticeList.size(); i++) {
									noticeDto = noticeList.get(i);
									if (noticeDto.getDel() == 0) {// del=0  만 추출
						%>
						<tr>
							<td><%=noticeCount--%></td>
							<%
								if (noticeDto.getChoice() == 3) {
							%>
							<td><strong>[할인정보]</strong></td>
							<%
								} else if (noticeDto.getChoice() == 2) {
							%>
							<td><strong>[이벤트]</strong></td>
							<%
								} else {
							%>
							<td><strong>[공지사항]</strong></td>
							<%
								} //if end
							%>
							<td><a
								href="<%=request.getContextPath()%>/Notice?notice=detail&seq=<%=noticeDto.getSeq()%>">
									<%=noticeDto.getTitle()%>
							</a></td>
							<td><%=noticeDto.getId()%></td>
							<td><%=noticeDto.getReg_date()%></td>
							<td><input type="checkbox" id="chk_notice" name="chk_notice"
								value="<%=noticeDto.getSeq()%>"></td>
						</tr>
						<%
							} // if end
								} // for end
							} //else end
						%>

					</table>
					<div class="pagingWrap admin">
						<%
							// 현재 페이지 번호
							for (int i = 0; i < noticePage; i++) {
								if (noticePageNumber == i) {
						%>
						<span class="on">
							<%=i + 1%>
						</span>
						<%
							// 그외 페이지 번호
								} else {
						%>
						<span title="<%=i + 1%>페이지" onclick="noticeGoPage(<%=i%>)"><%=i + 1%></span>

						<%
							}
							}
						%>
					</div>
					<div align="center" class="mt40">
						<select id="noticeSearchChoice">
							<option value="sel" selected="selected">선택</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> <input type="text" id="noticeSearchWord" name="noticeSearchWord"
							width="80" value=""> <input type="button"
							name="btn_noticeSearch" value="검색" onclick="searchNotice()">
					</div>
				</div><!-- // 공지사항 끝  -->		
						
				
				<!-- 전시관리 시작 -->	
				<div class="tab_con" id="admin02">
					<h3>전시관리</h3>
					<div class="admin-btn">
						<span>총 등록 수: <%=exhibitLength%>개</span>
						<input type="button" name="btn_exhibitDelete" id="btn_exhibitDelete"
							value="전시삭제">
					</div>					
					<table class="admintbl">
						<col width="70">
						<col width="100">
						<col width="200">
						<col width="100">
						<col width="180">
						<col width="20">
						<tr>
							<th>글번호</th>
							<th>전시명</th>
							<th>전시관명</th>
							<th>시작일</th>
							<th>종료일</th>
							<th><input type="checkbox" name="chk_exhibitAll"
								class="chk_exhibitAll" id="chk_exhibitAll"></th>
						</tr>
	
						<%
							if (exhibitList.size() == 0 || exhibitList == null || exhibitLength == 0) {
						%>
						<tr>
							<td colspan="6">등록된 전시가 없습니다</td>
						</tr>
						<%
							//전시 존재시 반복문 
							} else {
								int exhibitCount = 0;
								if (noticeLength <= 5) {
									exhibitCount = exhibitLength;
								} else {
									exhibitCount = exhibitLength - (5 * exhibitPageNumber);
								}
								for (int i = 0; i < exhibitList.size(); i++) {
									exhibitDto = exhibitList.get(i);
									if (exhibitDto.getDel() == 0) {// del=0  만 추출
						%>
						<tr>
							<td><%=exhibitCount--%></td>
							<td><a
								href="<%=request.getContextPath()%>/exhibit_detail?seq=<%=exhibitDto.getSeq()%>">
									<%=exhibitDto.getTitle()%>
							</a></td>
							<td><%=exhibitDto.getPlace()%></td>
							<td><%=exhibitDto.getBegindate()%>
							<td><%=exhibitDto.getEnddate()%>
							<td><input type="checkbox" id="chk_exhibit"
								name="chk_exhibit" value="<%=exhibitDto.getSeq()%>"></td>
						</tr>
						<%
							} // if end
								} // for end
							} //else end
						%>
	
					</table>					
	
					<div class="pagingWrap admin">
						<%
							// 현재 페이지 번호
							for (int i = 0; i < exhibitPage; i++) {
								if (exhibitPageNumber == i) {
						%>
						<span class="on"><%=i + 1%></span>
						<%
							// 그외 페이지 번호
								} else {
						%>
						<span title="<%=i + 1%>페이지" onclick="exhibitGoPage(<%=i%>)"><%=i + 1%>
						</span>	
						<%
							}
							}
						%>
					</div>
					
					<div align="center" class="mt40">
						<select id="exhibitSearchChoice">
							<option value="sel" selected="selected">선택</option>
							<option value="title">전시명</option>
							<option value="place">장소</option>
						</select> <input type="text" id="exhibitSearchWord" name="exhibitSearchWord"
							width="80" value=""> <input type="button"
							name="btn_exhibitSearch" value="검색" onclick="searchExhibit()">
					</div>
					
				</div><!-- // 전시관리 끝  -->
				
				<!-- 큐레이터 승인 시작 -->	
				<div class="tab_con" id="admin03">
					<h3>큐레이터 승인</h3>
					<div class="admin-btn">
						<span>총 신청 수: <%=accessLength%>개</span>
						<input type="button" id="btn_access" name="btn_access" value="승인">
					</div>							
					<table class="admintbl">
						<col width="50">
						<col width="200">
						<col width="200">
						<col width="150">
						<col width="150">
						<col width="20">
						<tr>
							<th>번호</th>
							<th>전시관명</th>
							<th>자격번호</th>
							<th>회원명</th>
							<th>계정</th>
							<th><input type="checkbox" name="chk_accessAll"
								class="chk_accessAll" id="chk_accessAll"></th>
						</tr>
						<%
							if (accessLength == 0 || memberList == null || memberList.size() == 0) {
						%>
						<tr>
							<td colspan="6">대기중인 인원이 없습니다</td>
						</tr>
						<%
							} else {
								int accessCount = 0;
								if (accessLength <= 5) {
									accessCount = accessLength;
								} else {
									accessCount = accessLength - (5 * accessPageNumber);
								}
								for (int i = 0; i < memberList.size(); i++) {
									memberDto = memberList.get(i);
									if (memberDto.getAuth() == 1 && memberDto.getDel() == 0) {
						%>
						<tr>
							<td><%=accessCount--%></td>
							<td><%=memberDto.getExhibit_name()%></td>
							<td><%=memberDto.getCerti_num()%></td>
							<td><%=memberDto.getName()%></td>
							<td><%=memberDto.getId()%></td>
							<td><input type="checkbox" name="chk_access" id="chk_access"
								value="<%=memberDto.getId()%>"></td>
						</tr>
						<%
							} ;//if end
								} ;// for end
							}
						%>
					</table>					
					<div class="pagingWrap admin">
						<%
							// 현재 페이지 번호
							for (int i = 0; i < accessPage; i++) {
								if (accessPageNumber == i) {
						%>
						<span class="on"><%=i + 1%></span>
						<%
							// 그외 페이지 번호
								} else {
						%>
						<span title="<%=i + 1%>페이지" onclick="accessGoPage(<%=i%>)"><%=i + 1%></span>	
						<%
							}
						}
						%>
					</div>
					<div align="center" class="mt40">
						<select id="accessSearchChoice">
							<option value="sel" selected="selected">선택</option>
							<option value="id">ID</option>
							<option value="place">전시관명</option>
							<option value="name">회원명</option>
						</select>
						<input type="text" id="accessSearchWord" name="accessSearchWord"
							width="80" value=""> <input type="button"
							name="btn_accessSearch" value="검색" onclick="searchAccess()">	
					</div>
				</div><!-- // 큐레이터 승인 끝  -->
				
				<!-- 회원 관리 시작 -->	
				<div class="tab_con" id="admin04">
					<form action="<%=request.getContextPath()%>/Admin_Member?member=search" method="POST">
						<h3>회원 관리</h3>			
						<table class="admintbl mt40">
							<tr>
								<th>회원 검색</th>
							</tr>
							<tr>
								<td><select id="searchChoice" name="searchChoice">
										<option value="sel" selected="selected">선택</option>
										<option value="id">ID</option>
										<option value="name">이름</option>
								</select> <input type="text" id="searchWord" name="searchWord" width="80"
									value=""> <!-- 회원검색이동  --> <input type="submit"
									id="btn_id" name="btn_id" value="검색"> <input
									type="button" id="btn_memberAll" name="btn_memberAll"
									value="전체리스트보기"
									onclick="location.href='<%=request.getContextPath()%>/Admin_Member?member=list'">
								</td>
							</tr>
						</table>
					</form>
				</div><!-- // 회원 관리 끝  -->

			</div>
			<!-- // tabcontWrap  -->

		
		</div>
		<!-- //inner -->
	</div>
	<!-- //wrap -->

<script type="text/javascript">


// 공지 삭제
$("#btn_noticeDelete").click(function(){
	var noticeDel = confirm("정말로 삭제 하시겠습니까?");
	var deleteList = new Array();
	   $('input[name="chk_notice"]:checked').each(function(index, item){
		   deleteList.push($(item).val());
	   });// for each end
	console.log(deleteList);
  	if(noticeDel){
	   
	   var jsonData = {"deleteList":deleteList}
	   
	   alert("선택한 공지글 SEQ="+deleteList);
		   $.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/Notice?notice=delete",
				data : jsonData,
				contentType :"application/x-www-form-urlencoded; charset=UTF-8",
				datatype : "text",
		  		success : function(data) {
		  			 console.log(data);
		       		 alert("성공적으로 삭제되었습니다.");
		       		 if(data==true){
			       		location.href="<%=request.getContextPath()%>/admin";
		       		 }
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		alert("삭제에 실패 했습니다.");
		    		
		    		location.href="<%=request.getContextPath()%>/admin";
		    	}
			 
				});// ajax end
  	}// if end
}); //click end

//전시 삭제
$("#btn_exhibitDelete").click(function(){
	var exhibitDel = confirm("정말로 삭제 하시겠습니까?");
	var deleteList = new Array();
	   $('input[name="chk_exhibit"]:checked').each(function(index, item){
		   deleteList.push($(item).val());
	   });// for each end
	console.log(deleteList);
  	if(noticeDel){
	   
	   var jsonData = {"deleteList":deleteList}
	   
	   alert("선택한 공지글 SEQ="+deleteList);
		   $.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/Exhibit_delete",
				data : jsonData,
				contentType :"application/x-www-form-urlencoded; charset=UTF-8",
				datatype : "text",
		  		success : function(data) {
		  			 console.log(data);
		       		 alert("성공적으로 삭제되었습니다.");
		       		 location.href="<%=request.getContextPath()%>/admin/test.jsp";
		       		 
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		alert("삭제에 실패 했습니다.");
		    		location.href="<%=request.getContextPath()%>/admin/test.jsp";
		    	}
			 
				});// ajax end
  	}// if end
}); //click end

//큐레이터 승인
$("#btn_access").click(function(){
	var access = confirm("승인 하시겠습니까?");
	var accessList = new Array();
	   $('input[name="chk_access"]:checked').each(function(index, item){
		   accessList.push($(item).val());
	   });// for each end
	console.log(accessList);
  	if(access){
	   
	   var jsonData = {"accessList":accessList}
	   
	   alert("선택한 회원 ID="+accessList);
		   $.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/Admin_Member?member=access",
				data : jsonData,
				contentType :"application/x-www-form-urlencoded; charset=UTF-8",
				datatype : "text",
		  		success : function(data) {
		  			 console.log(data);
		       		 if(data==true){
		       		 alert("승인 허용 되었습니다.");
			       		location.href="<%=request.getContextPath()%>/admin";
		       		 }else{
		       		alert("승인 실패 "); 
		       			location.href="<%=request.getContextPath()%>/admin";
		       		 }
		        },
		    	error : function(xhr,status,error) {
		    		// Ajax error
		    		alert("승인에 실패 했습니다.");
		    		
		    		location.href="<%=request.getContextPath()%>/admin";
		    	}
			 
				});// ajax end
  	}// if end
}); //click end

</script>
	<script src="<%=request.getContextPath()%>/admin/admin.js"></script>

</body>
</html>