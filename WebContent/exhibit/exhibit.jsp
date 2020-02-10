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

	for(int i=0; i < list.size(); i++ ){
		ExhibitDto dto = list.get(i);
		String begindate = dto.getBegindate().substring(0,11);
		String enddate = dto.getEnddate().substring(0,11);
		%>
		<li>
			<div class='img'>
				<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>'>
					<img src='https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586'>
				</a>
			</div>
			<div class='txt'>
				<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>'><h3><%=dto.getTitle() %></h3></a>
					<p><%= dto.getPlace()%></p>
					<span><%=begindate+"~"+enddate %></span>
			</div>
		</li>
		
		<%
	}
%>

</ul>
<input type="hidden" id="current" value="now">
<div class="listmore" id="moreBtn" onclick="listmore()">더보기</div>

<script src="${pageContext.request.contextPath}/exhibit/js/exhibitlist.js?ver=1"></script>


<script>
var morecount = 0;
// 더보기버튼
function listmore(){
var choice = document.querySelector("#current").value;
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
				
				var begindate = data[i].begindate.substring(0,11);
				var enddate = data[i].enddate.substring(0,11);
				document.querySelector("#main-exhibits").innerHTML += 
					"<li>"+
						"<div class='img'>" + 
							"<a href='ex_detail.jsp?ex=now&seq="+data[i].seq+"'>"+
							"<img src='https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586'>"+
							"</a>"+
						"</div>"+
						"<div class='txt'>"+
							"<a href='ex_detail.jsp?ex=now&seq="+data[i].seq+"'><h3>"+ data[i].title +"</h3></a>"+
							"<p>"+data[i].content+"</p>"+
							"<span>"+begindate+" ~ "+enddate+"</span>"+
						"</div>"+
					"</li>";
			}	
		}
	});
	morecount = morecount+1;
	
};
</script>


<%@include file ="../include/footer.jsp" %>		