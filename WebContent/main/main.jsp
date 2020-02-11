<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 여기는 contextPath 
	String contextPath = request.getContextPath();
	// 로그인 세션
	MemberDto mem = (MemberDto)session.getAttribute("loginuser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="user-scalable=yes, maximum-scale=1.0, minimum-scale=0.25, width=1200">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>모두의 전시</title>

<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/AgencyBgencyy/css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="/AgencyBgencyy/css/style.css" type="text/css"> <!-- 디자인 CSS -->

</head>
<body>


<div id="wrap">
	<div class="banner-top">
		<div class="inner">
			<p><strong>모두의 전시</strong>에 오신 것을 환영합니다</p>
			<button></button>
		</div>
	</div><!-- //banner-top -->
	<div id="header">		
		<div class="header_top">
			<div class="inner">
				<%
				if( mem == null){	
				%>
					<!--로그인세션이 없을때 -->
					<span><a href="<%=contextPath %>/member/login.jsp">로그인</a></span>
					<span><img src="<%=contextPath %>/images/main/header_dot.jpg" alt="·"></span>
					<span><a href="<%=contextPath %>/member/join.jsp">회원가입</a></span>
					<span><img src="<%=contextPath %>/images/main/header_dot.jpg" alt="·"></span>
				<%
				} else {
				%>
				<!--로그인세션이 있을때 -->
					<span><a href="<%=contextPath %>/member/logout.jsp">로그아웃</a></span>
					<span><img src="<%=contextPath %>/images/main/header_dot.jpg" alt="·"></span>
					<span><a href="<%=contextPath %>/mypage/mypage.jsp">마이페이지</a></span>
					<span><img src="<%=contextPath %>/images/main/header_dot.jpg" alt="·"></span>
				<%
				}
				%>
				
				<span><a href="<%=contextPath %>/community/notice.jsp">공지사항</a></span>
				<h1 class="logo"><a href="<%=contextPath %>/main/main.jsp">
					<img src="<%=contextPath %>/images/main/logo.png" alt="모두의 전시" />
				</a></h1>	
			</div><!-- //inner -->
		</div><!-- //header_top -->
		
		<div class="header-btm">
			<div class="inner">
				<%@include file ="../include/gnb.jsp" %>	
				<div class="searchWrap">
					<form name="serach" method="get" action="">
						<input type="text" maxlength="20" placeholder="검색어를 입력해주세요">
						<button></button>
					</form>
				</div>
			</div><!-- //inner -->
		</div><!-- //header-btm -->
	</div><!-- //header -->
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		$(".banner-top button").click(function(){
			$(".banner-top").slideUp();
		});
		
		$(".header-btm").each(function(){
			var header = $(this);
			var headerOffset = header.offset().top;
		 
			$(window).scroll(function(){
				var wScroll = $(window).scrollTop();
				if( wScroll > headerOffset){
				  header.addClass("fixed");
				} else {
				  header.removeClass("fixed");
				}
			});
		});
		
		$('.navi_btn').click(function(e){
			if($(this).hasClass('on')){	
				$(this).removeClass('on')		
				$('.navi_btn img').attr("src","../images/main/navi_btn.jpg");
			}else{	
				$(this).addClass('on')		
				$('.navi_btn img').attr("src","../images/main/navi_btn_close.jpg");
			}
		});				
	});
	</script>	
	
	<div id="visual_wrap">
		<link rel="stylesheet" href="../css/bxslider.css" type="text/css" />
		<script type="text/javascript" src="../js/bxslider.js"></script>
		<ul id="visual">
			<li><p style="background:url(../images/main/visual3.gif) no-repeat;"></p></li>
			<li><p style="background:url(../images/main/visual2.gif) no-repeat;"></p></li>
			<li><p style="background:url(../images/main/visual1.gif) no-repeat;"></p></li>
		</ul>
	</div><!-- //visual_wrap -->
	<script type="text/javascript">
		$(document).ready(function(){
			$('#visual').bxSlider({
				mode:'fade',
				pager:false,
				controls:true,
				autoControls: false
			});
		});
	</script>

	<div id="contents">
		<div id="section1">
			<div class="inner">
				<div class="m_tit">
					<h2>인기전시</h2>
					<span></span>
				</div>
			</div><!-- //inner -->
		</div><!-- //section1 -->
		
		<div id="section2">
			<div class="inner">
				<div class="m_tit">
					<h2>월별전시</h2>
					<span></span>
				</div>
			</div><!-- //inner -->
		</div><!-- //section2 -->
		
		<div id="section3">
			<div class="inner">
				<div class="m_tit">
					<h2>게시판</h2>
					<span></span>
				</div>
			
			</div><!-- //inner -->
		</div><!-- //section3 -->		
		
	</div><!-- //contents -->
	
	<div class="btn_top"></div>
	
	<script>
      $( document ).ready( function() {
        $( window ).scroll( function() {
          if ( $( this ).scrollTop() > 200 ) {
            $( '.btn_top' ).addClass("on");
          } else {
            $( '.btn_top' ).removeClass("on");
          }
        } );
        $( '.btn_top' ).click( function() {
          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
          return false;
        } );
      } );
    </script>

	<div id="footer">
		<div class="inner">
			<div class="footer_logo"><a href="/AgencyBgencyy/main/main.jsp">
				<img src="../images/main/logo.png" alt="모두의 전시" />
			</a></div>			
			<address>
			(주)모두의 전시 &nbsp;서울특별시 서초구 서초4동 강남대로 459
			</address>
			<p class="copyright">Copyright by bitcamp All Rights Reserved.</p>
			<div class="footer_sns">
				<span><a href="#"><img src="../images/main/ico_insta.png" alt="인스타그램"></a></span>
				<span><a href="#"><img src="../images/main/ico_fb.png" alt="페이스북"></a></span>
				<span><a href="#"><img src="../images/main/ico_blog.png" alt="네이버블로그"></a></span>
				<span><a href="#"><img src="../images/main/ico_naverpost.png" alt="네이버포스트"></a></span>
				<span><a href="#"><img src="../images/main/ico_youtube.png" alt="유튜브"></a></span>				
			</div>
		</div><!-- //inner -->
	</div><!-- //footer -->
</div><!-- //wrap -->

</body>
</html>