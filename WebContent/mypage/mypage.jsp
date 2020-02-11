<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<style>
.memEdit ul li a.memUpdate {border:1px solid #5f0080; background:#5f0080; color:#fff; font-size:18px; width:100px; height:50px;  padding:0 10px; display:inline-block}
.memEdit ul li a.memDelete {border:1px solid #5f0080; background:#fff; color:#5f0080; font-size:18px; width:100px; height:50px;  padding:0 10px; display:inline-block}

</style>


<h1>마이페이지</h1>
<div class="memEdit">
	<form>
		<ul>
			<li>
				<a href="memupdate.jsp" class="memUpdate">회원수정</a>
				<a href="memdelete.jsp" class="memDelete">회원탈퇴</a>
			</li>
		</ul>
	</form>
</div>
<%@include file ="../include/footer.jsp" %>		