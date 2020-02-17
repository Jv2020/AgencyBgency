<%@page import="KSJ.files.dto.FilesDto"%>
<%@page import="CYH.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@include file ="/include/header.jsp" %>
<!-- font awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv" crossorigin="anonymous">
<%
//로그인 세션
MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
boolean logincheck =false;

//로그인 여부 확인하기
if( loginuser != null){
	logincheck= true;
} 
else{
	%>
	<script type="text/javascript">
		alert('로그인 만료!');
	</script>
	<%
}
%>

<%
	request.setCharacterEncoding("utf-8");
	String nowpath = request.getContextPath();

	//등록한 전시 dto
	ExhibitDto edto = (ExhibitDto)request.getAttribute("edto");
	// 저장한 파일 file list
	 List<FilesDto>  flist = (List<FilesDto>)request.getAttribute("flist");
	// 표지 파일 이름
	FilesDto titleFile = flist.get(0);
	String filepath = (String)request.getAttribute("filepath");
	String filename = (String)request.getAttribute("filename");

	System.out.println(filename);
	System.out.println(filepath); 
	
	String begindate = edto.getBegindate().substring(0, 4)+"-"+ edto.getBegindate().substring(4, 6)+"-"+ edto.getBegindate().substring(6);
	String enddate = edto.getEnddate().substring(0, 4)+"-"+ edto.getEnddate().substring(4, 6)+"-"+ edto.getEnddate().substring(6);
	
	/* 
 */	
		
	
%>
<link rel="stylesheet" type="text/css" href="<%=nowpath %>/exhibit/css/exdetail.css">
<div class="ex-datail-top clfix">
	<div class="img">
		 <img alt="이미지 없음" src="${pageContext.request.contextPath}/filedownload?filepath=<%=titleFile.getFilepath()%>&filename=<%=titleFile.getFilename()%>"/>
	</div>
	<div class="cont">
		<h4>&lt; <%=edto.getTitle() %> &gt;</h4>
		<p><span>장소</span><%=edto.getPlace() %> </p>
		<p><span>기간</span><%= begindate+" ~ "+enddate %></p>
		<p><span>시간	</span><%=edto.getEx_time().substring(0, 2) +":" +edto.getEx_time().substring(2, 4)+" - " + edto.getEx_time().substring(4, 6) +":" +edto.getEx_time().substring(6, 8) %></p>
		<p id="price"><span>관람료</span></p>
		<p><span>문의</span><%= edto.getContact()==null? "": edto.getContact()%></p>
		<a href="#" id="showMyExhibit">목록보기</a>
		<!-- ${pageContext.request.contextPath}/reservation/reserv.jsp -->
	</div>
</div>
<div class="ex-datail-mid">
	<h5>전시안내</h5>
	<div class="txt">
		<%=edto.getContent() %>
	</div>
</div>

<script>
var ex = "now";	// 전시 기간 상태 
var ex_title = "";
if(ex == "now"){ ex_title="현재전시"; }
else if(ex == "fut"){	ex_title="예정전시"; }
else if(ex == "past"){	ex_title="지난전시"; }

</script>


<script>


$(document).ready(function() {
	

	var total = <%=edto.getPrice()%>;
	//ex) 7000원 -> 7,000원
	var len, point, str;	
	total = total + "";
	point = total.length % 3 ;
	len = total.length;
	
	totalPrice = total.substring(0, point);
	while (point < len) {
		if (totalPrice != "") totalPrice += ",";
		totalPrice += total.substring(point, point + 3);
		point += 3;
	}

$("#price").append(totalPrice+"원");


// 목록보기 버튼 클릭시 이벤트
$("#showMyExhibit").click(function() {
	
	if(<%=logincheck%> == false){
			// 로그인이 안됨 
		if(confirm("로그인이 필요합니다. 로그인 페이지로 이동합니다.")){
			location.href="${pageContext.request.contextPath}/member/login.jsp?choice=resv";
			/* 로그인 후 다시 정보를 가지고 이 페이지로 올 수 있도록 설계 해보기?  */
		}
	}else {
		// 전체 목록으로 돌아가기 
		location.href="${pageContext.request.contextPath}/curatorexhibitlist?page=0"; 
	}
		
	
	
	});
});
</script>







<%@include file ="../include/footer.jsp" %>		