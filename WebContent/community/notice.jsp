<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<div id="myReserve">	
	<p><label><input type="checkbox" class="mr10">모두 선택</label></p>
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
	
</div><!-- //myReserve -->
<%@include file ="../include/footer.jsp" %>		