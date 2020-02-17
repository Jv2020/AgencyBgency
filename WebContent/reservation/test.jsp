<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<style>
ul.tab {text-align:center;}
ul.tab li {float:left; width:120px; height:45px; line-height:43px; border:1px solid #5f0080; border-left:0; cursor:pointer;}
ul.tab li:first-child {border-left:1px solid #5f0080;}
ul.tab li.on {background:#5f0080; color:#fff;}
.tabcontWrap {margin-top:30px;}
.tabcontWrap .tab_con {}
</style>
<ul class="tab clfix">
	<li class="on">공지사항</li>
	<li>이벤트</li>
	<li>faq</li>
</ul>

<div class="tabcontWrap">
	<!-- 메뉴 1 컨텐츠 시작 -->
	<div class="tab_con">
		<table class="reservetbl">
			<colgroup>
				<col style="width:10%">
				<col style="width:52%">
				<col style="width:20%">
				<col style="width:18%">
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>상세보기</th>
				<tr>
			</thead>
			<tbody>
				
				<tr>
					<!--  체크 박스 보이게  -->
					<td><label><input type="checkbox" class="mr10">1</label></td>
					<td><span><b>[ 공지사항 ]</b> 첫번째 공지사항입니다.</span></td>
					<td>2020-02-17 15:22:42.0</td>
					<td>					
						<a href="#">더보기 +</a>					
					</td>
				</tr>	
				
				<tr>
					<!--  체크 박스 안 보이게  -->
					<td>2</td>
					<td><span><b>[ 공지사항 ]</b> 첫번째 공지사항입니다.</span></td>
					<td>2020-02-17 15:22:42.0</td>
					<td>					
						<a href="#">더보기 +</a>					
					</td>
				</tr>							
			</tbody>		
		</table>	
		
		<div class="pagingWrap">	
			<span class="on">1</span>			
			<span>2</span>
		</div>
	</div>
	
	<!-- 메뉴 2 컨텐츠 시작 -->
	<div class="tab_con">
		<table class="reservetbl">
			<colgroup>
				<col style="width:10%">
				<col style="width:52%">
				<col style="width:20%">
				<col style="width:18%">
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>상세보기</th>
				<tr>
			</thead>
			<tbody>
				
				<tr>
					<!--  체크 박스 보이게  -->
					<td><label><input type="checkbox" class="mr10">1</label></td>
					<td><span><b>[ 이벤트 ]</b> 첫번째 공지사항입니다.</span></td>
					<td>2020-02-17 15:22:42.0</td>
					<td>					
						<a href="#">더보기 +</a>					
					</td>
				</tr>	
				
				<tr>
					<!--  체크 박스 안 보이게  -->
					<td>2</td>
					<td><span><b>[ 이벤트 ]</b> 첫번째 공지사항입니다.</span></td>
					<td>2020-02-17 15:22:42.0</td>
					<td>					
						<a href="#">더보기 +</a>					
					</td>
				</tr>							
			</tbody>		
		</table>	
		
		<div class="pagingWrap">	
			<span class="on">1</span>			
			<span>2</span>
		</div>
	</div>
	
	<!-- 메뉴 3 컨텐츠 시작 -->
	<div class="tab_con">
		<table class="reservetbl">
			<colgroup>
				<col style="width:10%">
				<col style="width:52%">
				<col style="width:20%">
				<col style="width:18%">
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>상세보기</th>
				<tr>
			</thead>
			<tbody>
				
				<tr>
					<!--  체크 박스 보이게  -->
					<td><label><input type="checkbox" class="mr10">1</label></td>
					<td><span><b>[ FAQ ]</b> 첫번째 공지사항입니다.</span></td>
					<td>2020-02-17 15:22:42.0</td>
					<td>					
						<a href="#">더보기 +</a>					
					</td>
				</tr>	
				
				<tr>
					<!--  체크 박스 안 보이게  -->
					<td>2</td>
					<td><span><b>[ FAQ ]</b> 첫번째 공지사항입니다.</span></td>
					<td>2020-02-17 15:22:42.0</td>
					<td>					
						<a href="#">더보기 +</a>					
					</td>
				</tr>							
			</tbody>		
		</table>	
		
		<div class="pagingWrap">	
			<span class="on">1</span>			
			<span>2</span>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
var cnt = 0;
$('.tabcontWrap > .tab_con').hide().eq(0).show();
$('.tab li').click(function() {
   cnt = $(this).index()
   $('.tab li').removeClass('on').eq(cnt).addClass('on');
   $('.tabcontWrap .tab_con').hide().eq(cnt).fadeIn();
});
</script>

<%@include file ="../include/footer.jsp" %>	