<%@page import="java.util.Calendar"%>
<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="java.util.List"%>
<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 여기는 contextPath 
	String contextPath = request.getContextPath();
	// 로그인 세션
	MemberDto mem = (MemberDto)session.getAttribute("loginuser");
%>
<%
	List<ExhibitDto> popularEx = (List<ExhibitDto>)request.getAttribute("popularEx");
	List<ExhibitDto> monthList = (List<ExhibitDto>)request.getAttribute("monthList");	// 이달의 전시 
	ExhibitDto recommandDto = (ExhibitDto)request.getAttribute("recommandDto");		// 이달의 추천 전시 
%>
<%! 
// 현재 날짜 확인하기
public String getDate(){
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DATE);
	
	String today ="";
	today += year;
	
	if(month<10){ today += "0" + month; }
	else{ today += month; }
	
	if(day<10){ today += "0" + day; }
	else{ today += day; }
		
	return today;
}

public String getDate(String date){
	String str = date.substring(0,10);
	str = str.replaceAll("-", "").trim();
	return str;
}
public String getExPeriod(String begindatefull, String enddatefull){
	String status="";
	// 기준 : 오늘 
	int today = Integer.parseInt(getDate());
	int begindate = Integer.parseInt(getDate(begindatefull));
	int enddate = Integer.parseInt(getDate(enddatefull));
	
	if( today >= begindate && today <= enddate ){
		// 현재 전시 
		status = "now";
	}else if( today <= begindate) {
		// 예정 전시 
		status = "fut";
	}else{
		// 지난 전시 	
		status = "past";
	} 
	return status;
}
%>
<%
	String recommandPeriod="";
	// 추천전시 상태 
	if( recommandDto.getBegindate() != null ){	// 추천전시가 null이 아닐때 
		recommandPeriod = getExPeriod(recommandDto.getBegindate(),recommandDto.getEnddate() );
	}
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
<link rel="stylesheet" type="text/css" href="/AgencyBgencyy/exhibit/css/exhibitlist.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/AgencyBgencyy/schedule/css/schedule.css">
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
					<form name="serach" method="get" action="<%=request.getContextPath() %>/mainSearch">
						<input type="text" maxlength="20" name="mainSearchWord" placeholder="검색어를 입력해주세요">
						<button type="submit"></button>
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
				$('.navi_btn img').attr("src","/AgencyBgencyy/images/main/navi_btn.jpg");
			}else{	
				$(this).addClass('on')		
				$('.navi_btn img').attr("src","/AgencyBgencyy/images/main/navi_btn_close.jpg");
			}
		});				
	});
	</script>	
	
	<div id="visual_wrap">
		<link rel="stylesheet" href="/AgencyBgencyy/css/bxslider.css" type="text/css" />
		<script type="text/javascript" src="/AgencyBgencyy/js/bxslider.js"></script>
		<ul id="visual">
			<li><p style="background:url(/AgencyBgencyy/images/main/visual3.gif) no-repeat;"></p></li>
			<li><p style="background:url(/AgencyBgencyy/images/main/visual2.gif) no-repeat;"></p></li>
			<li><p style="background:url(/AgencyBgencyy/images/main/visual1.gif) no-repeat;"></p></li>
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
					<%
					for(int i = 0; i < popularEx.size(); i++ ){
						ExhibitDto dto = popularEx.get(i);
						String begindate = dto.getBegindate().substring(0,11);
						String enddate = dto.getEnddate().substring(0,11);
						%>
				<ul class="e_list clfix" id="main-exhibits">
					<li>
						<div class='img'>
								<%	
								// 표지 있을 때 
								if(dto.getFilename() == null ){
									%>
									<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>' style="background: #f8f8f7;">
										<img alt="이미지 없음" id="title" src="${pageContext.request.contextPath}/images/sub/noimg.gif"/>
									<%
								}
								else {	// 표지 없을 때 
									%>
									<a href='${pageContext.request.contextPath}/exdetail?ex=now&seq=<%=dto.getSeq()%>'>
										 <img alt="이미지 없음" src="${pageContext.request.contextPath}/filedownload?filepath=/upload/title/&filename=<%=dto.getFilename()%>"/> 
									<%
								}
						%>
							</a>
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
			</div><!-- //inner -->
		</div><!-- //section1 -->
		
		<div id="section2">
			<div class="inner">
				<div class="m_tit">
					<h2>월별전시</h2>
					<span></span>
				</div>
				<div class="sch-top clfix">
	<div class="recommand clfix">
		<div class="img">
		<%	// 추천전시가 없을 때 
				if( recommandDto.getTitle() == null ){
				%>
					 <img alt="이미지 없음" src="${pageContext.request.contextPath}/images/sub/commingsoon.jpeg" style="margin-top: 120px;"> 
				<%
				}else{
					// 추천전시 있을 때 
					if(recommandDto.getFilename() == null ){
						// 표지 없을 때 
						%>
						<span>
							<img alt="이미지 없음" id="title" src="${pageContext.request.contextPath}/images/sub/noimg.gif" style="margin-top: 80px; display: inline-block;"/>
						</span>
						<%
					}
					else {	
					// 표지 있을 때 
						%>
							 <img alt="이미지 없음" src="${pageContext.request.contextPath}/filedownload?filepath=/upload/title/&filename=<%=recommandDto.getFilename()%>"/> 
						<%
					}
				
				}
			%>
		</div>
		<div class="txt">
			<strong>이달의 추천전시</strong>
			<%	// 추천전시가 있을 때
				if(  recommandDto.getTitle() != null ){
				%>
					<h3>
						<a href="${pageContext.request.contextPath}/exdetail?ex=<%=recommandPeriod %>&seq=<%=recommandDto.getSeq()%>">
							<%=recommandDto.getTitle() %>
						</a>
					</h3>
					<p><%= recommandDto.getBegindate().substring(0,11)+" ~ " +  recommandDto.getEnddate().substring(0,11) %></p>
				<%
				}else{
					// 추천전시 없을 때 
					%>
					<h4 style="margin-top: 130px; text-align: center">진행된 전시가 없습니다.</h4>
					<%
				}
			%>
		</div>
	</div>
<!-- 캘린더 -->
	<div class="calendar">
		<div class="cal-top">
			<div class="month">
				<span id="year">2020</span>
				<strong id="month">02</strong>
			</div>
		</div>
		<div class="cal-cont">
			<ul id="cal-data">
		<!-- 캘린더 데이터 들어감 -->
		<%
		if(monthList.size()>0){
			for(int i=0; i< monthList.size(); i++){ 
				ExhibitDto dto = monthList.get(i);
				String exstatus = getExPeriod(dto.getBegindate(), dto.getEnddate());
			%>
				<li>
					<div class="day"><%=i+1 %></div>
					<div class="desc">
						<h4><a href="<%=request.getContextPath()%>/exdetail?ex=<%=exstatus%>&seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></h4>
						<p><%=dto.getPlace() %></p>
					</div>
				</li>
				
				<%
			}
		}
		%>
			</ul>
		</div>
	
	</div>
</div>
				
				
			</div><!-- //inner -->
		</div><!-- //section2 -->
		
		<div id="section3">
			<div class="inner">
				<div class="m_tit">
					<h2>공지사항</h2>
					<span></span>
				</div>
				<ul class="n-cont clfix">
					<li><a href="#">
						<h3>공지사항 타이틀입니다 공지사항 타이틀입니다</h3>
						<p>공지사항 상세 내용입니다. 공지사항 상세 내용입니다. 공지사항 상세 내용입니다.</p>
						<span>2020-02-01</span>
					</a></li>
					<li><a href="#">
						<h3>공지사항 타이틀입니다 공지사항 타이틀입니다</h3>
						<p>공지사항 상세 내용입니다. 공지사항 상세 내용입니다. 공지사항 상세 내용입니다.</p>
						<span>2020-02-01</span>
					</a></li>
					<li><a href="#">
						<h3>공지사항 타이틀입니다 공지사항 타이틀입니다</h3>
						<p>공지사항 상세 내용입니다. 공지사항 상세 내용입니다. 공지사항 상세 내용입니다.</p>
						<span>2020-02-01</span>
					</a></li>					
				</ul>			
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
				<img src="/AgencyBgencyy/images/main/logo.png" alt="모두의 전시" />
			</a></div>			
			<address>
			(주)모두의 전시 &nbsp;서울특별시 서초구 서초4동 강남대로 459
			</address>
			<p class="copyright">Copyright by bitcamp All Rights Reserved.</p>
			<div class="footer_sns">
				<span><a href="#"><img src="/AgencyBgencyy/images/main/ico_insta.png" alt="인스타그램"></a></span>
				<span><a href="#"><img src="/AgencyBgencyy/images/main/ico_fb.png" alt="페이스북"></a></span>
				<span><a href="#"><img src="/AgencyBgencyy/images/main/ico_blog.png" alt="네이버블로그"></a></span>
				<span><a href="#"><img src="/AgencyBgencyy/images/main/ico_naverpost.png" alt="네이버포스트"></a></span>
				<span><a href="#"><img src="/AgencyBgencyy/images/main/ico_youtube.png" alt="유튜브"></a></span>				
			</div>
		</div><!-- //inner -->
	</div><!-- //footer -->
</div><!-- //wrap -->

</body>
</html>