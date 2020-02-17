<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul class="gnb clfix">
	<li class="navi_btn"><a href="#none">
		<div class="hamburger">
          <span class="line"></span>
          <span class="line"></span>
          <span class="line"></span>
        </div>
		전체메뉴
	</a></li>
	<li><a href="<%=request.getContextPath()%>/aboutusentrance">ABOUT US</a></li>
	<li><a href="/AgencyBgencyy/exhibitlist">EXHIBIT</a></li>
	<li><a href="/AgencyBgencyy/exhibitschedule">SCHEDULE</a></li>
	<li><a href="/AgencyBgencyy/community/notice.jsp">COMMUNITY</a></li>					
</ul>	

<div class="all_menu">
	<div class="inner">
		<ul>
			<li>
				<strong>ABOUT US</strong>
				<a href="<%=request.getContextPath()%>/aboutusentrance">모두의 전시</a>
			</li>
			<li>
				<strong>EXHIBIT</strong>
				<a href="#none">현재전시</a>
				<a href="#none">예정전시</a>
				<a href="#none">지난전시</a>
			</li>
			<li>
				<strong>SCHEDULE</strong>
				<a href="#none">월별 전시</a>
			</li>
			<li>
				<strong>COMMUNITY</strong>
				<a href="#none">공지사항</a>
				<a href="#none">자주묻는질문</a>
				<a href="#none">리뷰</a>
			</li>
		</ul>
	</div>
</div>

<script>
$(document).ready(function(){
	  $(".navi_btn").click(function(){
	    $(this).find('.hamburger').toggleClass("active");
	    $('.all_menu').toggleClass("active");
	    $('html, body').toggleClass("active");n
	});
});
</script>