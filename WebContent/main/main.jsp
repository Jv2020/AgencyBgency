<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
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