<%@page import="CYH.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="CYH.ReviewDao"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/AgencyBgencyy/community/css/reviewDetail.css">

<%
int seq = Integer.parseInt(request.getParameter("seq"));


%>





<%-- <p><b><%=dto.getTitle() %></b><p> --%>



<div class="container"><!-- 리뷰를 작성할꺼야! -->
<form action="writereview">
  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">리뷰작성</button>
  <div id="demo" class="collapse">
    <div class="reviewBox">
	<div class="reviewTit">
		<ul>
			<li>
				<!-- 전시명 -->
				
			</li>
			<li>
				<!-- 별점 -->
				<div class='starrr' id='star1'></div>
			</li>
		</ul>
	</div>
	<div class="reviewCont">
		<ul class="">
			<li>
				<!-- 리뷰 -->
				<input type="text">
			</li>
		</ul>
	</div>
</div><!-- //reviewBox -->
  </div>
</form>
</div> <!-- container -->


<%
ReviewDao dao = ReviewDao.getInstance();
List<ReviewDto> list = dao.getReviewList();

/* for(int i = 0; i < list.size(); i++) {
	System.out.println("review title[" +i+"]" + list.get(i).getTitle() );
	
	System.out.println(list.get(i));
} */
%>

<%
for(int i = 0; i < list.size(); i++) {
	ReviewDto dto = list.get(i);
%>
<div class="reviewBox">
	<div class="reviewTit">
		<ul>
			<li>
				<%=dto.getTitle() %>
			</li>
			<li>
				<div class='starrr' id='star1'></div> <%=dto.getStar() %>
			</li>
		</ul>
	</div>
	<div class="reviewCont">
		<ul class="">
			<li>
				<%=dto.getReview() %>
			</li>
		</ul>
	</div>
	<div class="reviewBtm">
		<ul class="clfix">
			<li>
				<%=dto.getId() %>
			</li>
			<li>
				<%=dto.getRegdate() %>
			</li>
			<li>
				좋아요 :<%=dto.getLike_number() %>	/
				싫어요 :<%=dto.getDislike_number() %>
			</li>
		</ul>
	</div>
</div><!-- //reviewBox -->


<%
}
%>

<script>
	$('#star1').starrr({
		
		change: function (e, value) {
					if (value) {
						$('.your-choice-was').show();
						$('.choice').text(value);
					} else {
						$('.your-choice-was').hide();
					}
				}
	});
	
	var $s2input = $('#star2_input');
	
	$('#star2').starrr({
		max: 10,
		rating: $s2input.val(),
		change: function (e, value) {
		$s2input.val(value).trigger('input');
				}
	        });
    </script>
    <script src="../js/starrr.js"></script>

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