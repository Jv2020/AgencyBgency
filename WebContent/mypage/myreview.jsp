<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<div id="myReserve">	
	<table class="reservetbl">
		<colgroup>
			<col style="width:34%">
			<col style="width:34%">
			<col style="width:12%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>전시명</th>
				<th>리뷰내용</th>
				<th>상세보기</th>
				<th>수정</th>
				<th>삭제</th>
			<tr>
		</thead>
		<tbody>
			<tr>
				<td><span>2020 인상주의 회화 전시</span></td>
				<td><span>리뷰 내용을 입력해주세요</span></td>
				<td>
					<a href="#none">상세보기</a>
				</td>
				<td>
					<a href="#none">수정</a>
				</td>
				<td>
					<a href="#none">삭제</a>
				</td>
			</tr>				
		</tbody>		
	</table>	
	
	<div class="pagingWrap">
	
			<span class="on">1</span>
			
			<span >2</span>
			
	%>
	</div>
</div><!-- //myReserve -->



<%@include file ="../include/footer.jsp" %>		