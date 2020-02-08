<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="user-scalable=yes, maximum-scale=1.0, minimum-scale=0.25, width=1200">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>모두의 전시</title>

<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="../css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="../css/style.css" type="text/css"> <!-- 디자인 CSS -->
</head>
<body>

<div id="wrap">
	<div id="header">		
		<div class="header_top">
			<div class="inner">
				<span><a href="#">로그인</a></span>
				<span><img src="../images/main/header_dot.jpg" alt="·"></span>
				<span><a href="#">회원가입</a></span>
				<span><img src="../images/main/header_dot.jpg" alt="·"></span>
				<span><a href="#">공지사항</a></span>
				<h1 class="logo"><a href="/main.php">
					<img src="../images/main/logo.png" alt="모두의 전시" />
				</a></h1>
			</div><!-- //inner -->
		</div><!-- //header_top -->
		
		<div class="header-btm">
			<div class="inner">
				<ul class="gnb clfix">
					<li class="navi_btn"><a href="#"><img alt="전체메뉴 버튼" src="../images/main/navi_btn.jpg">전체메뉴</a></li>
					<li><a href="#">ABOUT US</a></li>
					<li><a href="#">EXHIBIT</a></li>
					<li><a href="#">SCHEDULE</a></li>
					<li><a href="#">COMMUNITY</a></li>					
				</ul>	
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











	<div id="footer">
		<div class="inner">
			<div class="footer_logo"><a href="/main.php">
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



</div>

</body>
</html>