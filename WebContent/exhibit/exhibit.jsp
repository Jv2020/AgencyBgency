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
document.addEventListener("DOMContentLoaded", function(){
// 처음 로딩화면
$.ajax({
	// 현재 전시 가져오기 
	url:"../exhibitlist",
	data:"choice=now&page=0",
	type:"get",
	dataType:"json",
	success: function (data) {
		//console.log(data);
		for(var i =0; i<data.length; i++ ){
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
});


</script>
<script src="js/exhibitlist.js?ver=1"></script>



<ul class="e_list clfix" id="main-exhibits">
<!-- 에이작스로 뿌리기 -->
</ul>
<input type="hidden" id="current" value="now">
<div class="listmore" id="moreBtn" onclick="listmore()">더보기</div>




<script>
var morecount = 0;
// 더보기버튼
function listmore(){
var choice = document.querySelector("#current").value;
	$.ajax({
		// 현재 전시 가져오기 
		url:"../exhibitmorelist",
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
<script>
//현재
document.querySelector("#now").onclick = function(){
$.ajax({
	// 현재 전시 가져오기 
	url:"../exhibitlist",
	data:"choice=now&page=0",
	type:"get",
	dataType:"json",
	success: function (data) {
			document.querySelector("#main-exhibits").innerHTML  = "";
		for(var i in data ){
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
		
		
		document.querySelector("#now").classList.add('active');
		document.querySelector("#future").classList.remove('active');
		document.querySelector("#past").classList.remove('active');
		document.querySelector("#loc_depth02").innerHTML="현재전시";
		document.querySelector("#current").value = "now";
		document.querySelector("#moreBtn").style.display = "block";
		count = 0;
		}
	});
};


</script>



<%@include file ="../include/footer.jsp" %>		