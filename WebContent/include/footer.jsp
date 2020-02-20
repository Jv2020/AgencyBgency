<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			</div><!-- //sub_cont -->	
		</div><!-- //inner -->		
	</div><!-- //sub_contents -->
	
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
			<div class="footer_logo"><a href="/AgencyBgencyy.jsp">
				<img src="/AgencyBgencyy/images/main/logo_footer.png" alt="모두의 전시" />
			</a></div>			
			<address>
			(주)모두의 전시 &nbsp;서울특별시 서초구 서초4동 강남대로 459
			</address>
			<p class="copyright">Copyright by bitcamp All Rights Reserved.</p>
			<div class="footer_sns">
				<span><a href="#"><img src="${pageContext.request.contextPath}/images/main/ico_insta.png" alt="인스타그램"></a></span>
				<span><a href="#"><img src="${pageContext.request.contextPath}/images/main/ico_fb.png" alt="페이스북"></a></span>
				<span><a href="#"><img src="${pageContext.request.contextPath}/images/main/ico_blog.png" alt="네이버블로그"></a></span>
				<span><a href="#"><img src="${pageContext.request.contextPath}/images/main/ico_naverpost.png" alt="네이버포스트"></a></span>
				<span><a href="#"><img src="${pageContext.request.contextPath}/images/main/ico_youtube.png" alt="유튜브"></a></span>				
			</div>
		</div><!-- //inner -->
	</div><!-- //footer -->
</div><!-- //wrap -->

</body>
</html>