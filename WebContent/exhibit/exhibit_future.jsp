<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/exhibitlist.css">
<style>
</style>

<%
// 로그인 세션
String loginuser = (String)session.getAttribute("loginuser");
boolean logincheck = false;

// 로그인 여부 확인하기
if(loginuser != null){
	logincheck= true;
}

%>
<script>
// 처음 로딩화면
document.querySelector("#ex-title").innerHTML = "예정전시";
document.querySelector("#future").classList.add('active');
document.querySelector("#now").classList.remove('active');
document.querySelector("#past").classList.remove('active');
document.querySelector("#loc_depth02").innerHTML="예정전시";

document.addEventListener("DOMContentLoaded", function(){
		$.ajax({
			// 초기 예정 전시 가져오기 
			url:"../exhibitlist",
			data:"choice=future&page=0",
			type:"get",
			dataType:"json",
			success: function (data) {
				for(var i in data ){
					var begindate = data[i].begindate.substring(0,11);
					var enddate = data[i].enddate.substring(0,11);
					document.querySelector("#main-exhibits").innerHTML += 
						"<li>"+
							"<div class='img'>" + 
							"<a href='exde?ex=fut&seq="+data[i].seq+"'>"+
								"<img src='https://www.sangsangmadang.com/feah/temp/2019/201909/3a1d6da3-fa6b-40fe-8637-7e8f078d105c'>"+
							"</a>"+
							"</div>"+
							"<div class='txt'>"+
							"<a href='ex_detail.jsp?ex=fut&seq="+data[i].seq+"'><h3>"+ data[i].title +"</h3></a>"+
								"<p>"+data[i].content+"</p>"+
								"<span>"+begindate+" ~ "+enddate+"</span>"+
							"</div>"+
						"</li>";
					}		
				
			
			}//success
		});
});


</script>
<script src="js/exhibitlist.js?ver=1"></script>



<ul class="e_list clfix" id="main-exhibits">
<!-- 에이작스로 뿌리기 -->
</ul>
<div class="listmore" id="moreBtn" onclick="listmore()">더보기</div>




<script>
var morecount = 0;
// 더보기버튼
function listmore(){
	$.ajax({
		// 지난 전시 더 가져오기 
		url:"../exhibitmorelist",
		data:"choice=future&count=" + morecount,
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
							"<a href='ex_detail.jsp?ex=fut&seq="+data[i].seq+"'>"+
							"<img src='https://www.sangsangmadang.com/feah/temp/2019/201910/2cc23368-8ce4-4a08-9bf3-ce1c66567586'>"+
							"</a>"+
						"</div>"+
						"<div class='txt'>"+
							"<a href='ex_detail.jsp?ex=fut&seq="+data[i].seq+"'><h3>"+ data[i].title +"</h3></a>"+
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