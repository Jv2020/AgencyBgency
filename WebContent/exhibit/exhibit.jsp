<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/AgencyBgencyy/exhibit/css/exhibitlist.css">

<!-- 데이터 뿌리기 -->
<ul class="e_list clfix" id="main-exhibits">
<%
	List<ExhibitDto> list = (List<ExhibitDto>)request.getAttribute("list");
	int allContentSize = (int)request.getAttribute("allContentSize");
	
	for(int i = 0; i < list.size(); i++ ){
		ExhibitDto dto = list.get(i);
		String begindate = dto.getBegindate().substring(0,11);
		String enddate = dto.getEnddate().substring(0,11);
		%>
		<li>
			<div class='img'>
					<%	
					// 표지 있을 때 
					if(dto.getFilename() == null ){
						%>
						<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>' style="background: #f8f8f7;">
							<img alt="이미지 없음" id="title" src="${pageContext.request.contextPath}/images/sub/noimg.gif"/>
						</a>
						<%
					}
					else {	// 표지 없을 때 
						%>
						<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>'>
							 <img alt="이미지 없음" src="${pageContext.request.contextPath}/filedownload?filepath=/upload/title/&filename=<%=dto.getFilename()%>"/> 
						</a>
						<%
					}
			%>
			</div>
			<div class='txt'>
				<h3>
					<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>'>
						<%=dto.getTitle() %>
					</a>
				</h3>
					<p><%= dto.getPlace()%></p>
					<span><%=begindate+"~"+enddate %></span>
			</div>
		</li>
		
		<%
	}
%>

</ul>
	<%
	if(list.size() == 0){
		%>
		<div style="height: 100px; line-height:200px; text-align: center;">현재 진행중인 전시가 없습니다.</div>
		<%
	}%>
<input type="hidden" id="current" value="now">
<div class="listmore" id="moreBtn" onclick="listmore()">더보기</div>


<script>
var morecount = 0;
// 더보기버튼
var showContent = $("#main-exhibits li").length;	// 
var allcontents = <%=allContentSize%>;	// 현재 모든 컨텐츠 개수
alert(showContent);
alert(allcontents);
if( showContent >= allcontents  ){
	$("#moreBtn").hide();
}
function listmore(){
	var choice = $("#current").val();
	$.ajax({
		// 현재 전시 가져오기 
		url:"${pageContext.request.contextPath}/exhibitmorelist",
		data:"choice="+choice+"&count="+morecount,
		type:"get",
		dataType:"json",
		success: function (data) {
				console.log(data);	
				if(data == false){
					document.querySelector("#moreBtn").style.display = "none";
					morecount = 0;
					return;
				}
			for(var i=0; i<data.length; i++){
				console.log(data[i].title);
				console.log(data[i].filename);
				
				var begindate = data[i].begindate.substring(0,11);
				var enddate = data[i].enddate.substring(0,11);
				if(data[i].filename== null){	// 타이틀 이미지 없음 
					document.querySelector("#main-exhibits").innerHTML += 
						"<li>"+
							"<div class='img'>" + 
								"<a href='exdetail?ex=now&seq="+data[i].seq+"' style='background: #f8f8f7;'>"+
								"<img alt='이미지 없음' src='${pageContext.request.contextPath}/images/sub/noimg.gif'> "+
								"</a>"+
							"</div>"+
							"<div class='txt'>"+
								"<h3><a href='exdetail?ex=now&seq="+data[i].seq+"'>"+ data[i].title +"</a></h3>"+
								"<p>"+data[i].place+"</p>"+
								"<span>"+begindate+" ~ "+enddate+"</span>"+
							"</div>"+
						"</li>";
				}else{
					document.querySelector("#main-exhibits").innerHTML += 
						"<li>"+
							"<div class='img'>" + 
								"<a href='exdetail?ex=now&seq="+data[i].seq+"'>"+
								"<img alt='이미지 없음' src='${pageContext.request.contextPath}/filedownload?filepath=/upload/title/&filename="+data[i].filename+"'/>"+
								"</a>"+
							"</div>"+
							"<div class='txt'>"+
								"<a href='exdetail?ex=now&seq="+data[i].seq+"'><h3>"+ data[i].title +"</h3></a>"+
								"<p>"+data[i].place+"</p>"+
								"<span>"+begindate+" ~ "+enddate+"</span>"+
							"</div>"+
						"</li>";
					
				}}
		},
		complete: function(data) {
			showContent = $("#main-exhibits li").length;
			console.log(showContent);
			if( showContent >= allcontents ){
				$("#moreBtn").hide();
			}
		}
	});
	morecount = morecount+1;
	
};
</script>


<%@include file ="../include/footer.jsp" %>		