<%@page import="java.util.Date"%>
<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<link rel="stylesheet" href="./dist/mtr-datepicker.min.css">
<link rel="stylesheet" href="./dist/mtr-datepicker.default-theme.min.css">

<script src="./dist/mtr-datepicker-timezones.min.js"></script>
<script src="./dist/mtr-datepicker.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 --><!-- font awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv" crossorigin="anonymous">

<%
//시간을 취득해서 파일이름으로 넣기 
String fname = (new Date().getTime()) + "__";
System.out.println("fname:" + fname);
%>

<style>
.cont-top{
	padding-left: 80px;
}
.cont-top .title-img{
	position:relative; width:280px; height:400px;
	float:left;
}
.cont-top .title-img .imgBox{
	position:relative; width:302px; height:402px; border:1px dashed #ccc; 
	text-align: center; line-height: 400px; font-size: 40px;}
.imgBox > label {position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);}
.imgBox:hover > label {z-index:2;}
.img_wrap {width:300px; height:400px; text-align:center; vertical-align:middle;}
.img_wrap img {position:absolute; top:50%; left:50%;  z-index:1; display:block; max-width:300px; max-height:400px; transform:translate(-50%, -50%);}

.cont-top ul{
	float: right;
	width: 580px;
}
.cont-top ul li{
	width: 100%;
	position:relative;
	margin-top: 30px;
	padding-left:150px;
}
.cont-top ul li:first-child{
	margin-top: 0;
}
.cont-top ul li > span{
	position:absolute; top:50%; left:0;
	line-height:30px;
	margin-top:-15px;
	display: block;
	width: 150px;
	font-size: 20px;
}
.cont-top ul li input{
	display: block;
	width: 300px;
	height: 30px;
} 
.cont-mid {
	padding-left: 80px;
}
.cont-mid textarea{
width: 845px;
    height: 500px;
    margin-top: 50px;
	outline: none;
}
.cont-mid input{
display: block;
width: 100px;
margin: 20px auto 0;

}
.cont-btm{

display: block;
width: 100px;
margin: 20px auto 0;
}
#dist,#dist2{text-align:center;}
#dist > div:first-child {display:none;}
#dist2 > div:first-child {display:none;}
.fa-plus-circle{
	color:#bdc3c7;
	transition: all 0.2s ease-in-out;
}
.fa-plus-circle:hover{
	color:#5f0080;
	transition: all 0.2s ease-in-out;
	cursor: pointer;
}
#file{
	display: none;
}
</style>
<%
// login session
MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
if(loginuser == null){
	%>
	<script>
		alert('세션이 만료됨');
		location.href="${pageContext.request.contextPath}/main/main.jsp";
	</script>
	<%
}
%>

<%
//encoding 

request.setCharacterEncoding("UTF-8");

%>
<form id="frm" method="post" enctype="multipart/form-data" >
 
<div class="cont-top clfix">
	 <div class="title-img">
		
		<div class="imgBox title-btn">
	        <label for="titlefile">
	            	<i class="fas fa-plus-circle">
	           		</i>
	        </label>
	        <input type="file" id="titlefile" name="titlefile" style="display:none;" />
	        
	         <input type="hidden" id="filename" name="filename" value=""/> <!-- DB에 저장할 파일이름  -->
       		 <input type="hidden" id="origin_name" name="origin_name"/>	<!-- 원래 이름 -->
       		 <input type="hidden" id="file_seq" name="file_seq" value="1"/><!-- 표지는 모두 1 -->
     		 	
       
	         <div class="img_wrap">
	            <img id="imgpreview" />
	         </div>
    	</div>
		 
	</div>
	<ul class="info">
		<li>
				<span> 제목 </span>
				<input type="text" id="title" name="title" value="제목은 여기에 ">
		</li>
		<li>
				<span> 시작일 </span>
				<input type="hidden" id="begindate" name="begindate" value="">
				<div id="dist"></div>

		</li>
		<li>
				<span> 마감일 </span>
				<div id="dist2"></div>
				<input type="hidden" id="enddate" name="enddate" value="">
		</li>
		<li>
				<span> 시간 </span>
				<select id="starttime">
					<option value="0900" selected="selected">9:00</option>
					<option value="1000">10:00</option>
					<option value="1100">11:00</option>
					<option value="1200">12:00</option>
					<option value="1300">13:00</option>
					<option value="1400">14:00</option>
					<option value="1500">15:00</option>
				</select>
				&nbsp;~&nbsp;
				<select id="endtime">
					<option value="1200" selected="selected">12:00</option>
					<option value="1300">13:00</option>
					<option value="1400">14:00</option>
					<option value="1500">15:00</option>
					<option value="1600">16:00</option>
					<option value="1700">17:00</option>
					<option value="1800">18:00</option>
					<option value="1900">19:00</option>
				</select>
				<input type="hidden" id="ex_time" name="ex_time" value="">
				
		</li>
		<li>
				<span> 미술관 </span>
				<input type="text" name="place" readonly="readonly" value="<%= loginuser.getExhibit_name()%>">
		</li>
		<li>
				<span> 지역분류 </span>
				<select id="loc_info" name="loc_info">
					<option value="서울" selected="selected">서울</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="경상">경상</option>
					<option value="전라">전라</option>
					<option value="충청">충청</option>
					<option value="제주">제주</option>
				</select>
		</li>
		<li>
				<span> 가격 </span>
				<input type="text" id="price" name="price" value="1000">
		</li>
		<li>
				<span> 큐레이터번호 </span>
				<input type="text" name="certi_num" readonly="readonly" value="<%=loginuser.getCerti_num() %>" >
		</li>
		<li>
				<span> 문의 번호 </span>
				<input type="text" name="contact" >
		</li>
	</ul>
</div>
<div class="cont-mid">
<textarea rows="10" cols="80" name="content" id="content">ss</textarea>
<input type="button" value="이미지 첨부">
</div>
<div class="cont-btm">
	<input type="button" id="writeBtn"value="작성하기">
</div>
</form>




<script type="text/javascript">
 var today = new Date();
 today.setDate(today.getDate()+7);
 
 datepicker1 = new MtrDatepicker({
	  target: "dist",
	  timestamp: today.getTime()
   });
 
 datepicker2 = new MtrDatepicker({
	   target: "dist2",
	   timestamp: today.getTime()
 });
 
 // 날짜에 있는 문자열 삭제하기
 function replaceAll(str, searchStr, replaceStr) {
	 var str = str.split(searchStr);
	 var newstr = "";
	 for( var i=0; i< str.length-1; i++){
		 if(str[i] < 10) str[i] = "0"+str[i].trim();
		 newstr += str[i].trim();
	 }
 return newstr;	// 문자로 출력 
}
 // 오늘 날짜를 지정 
function getToday(){
	var y = today.getFullYear();
	var m = today.getMonth()+1;
	var d = today.getDate();
	if(m<10) m = "0"+m;
	if(d<10) d = "0"+d;
	return y+m+d;
} 
 

// 빈칸인지 확인하기
 function checkBlank( tag ){
	if(tag.trim()==""){
		return true;
	}	
	return false;
 }

 
 // 작성완료 버튼 
$("#writeBtn").click(function() {
	
	// 전시 날짜 확인 
	var start = datepicker1.toLocaleDateString();
	var end = datepicker2.toLocaleDateString();

	start = replaceAll(start,".","");
	end = replaceAll(end,".","");
	
	// 가격 
	var regexp = /^[0-9]*$/
	 v = $("#price").val();
	
	// 빈칸확인 
	 if(checkBlank($("#title").val())){
		alert("빈칸을 모두 채워주세요!");
		return false;
	} 
	 
	 if(checkBlank($("#price").val())){
		alert("빈칸을 모두 채워주세요!");
		return false;
	}
	 if(checkBlank($("#price").val())){
		alert("빈칸을 모두 채워주세요!");
		return false;
	}
	 if(checkBlank($("#content").val())){
		alert("전시 내용을 입력하세요! ");
		return false;
	}
	// 날짜 확인 
	if(start < getToday()){ alert('시작 일은 현재 날짜로부터 7일 이후로 가능합니다.'); return;}
	if(start > end){	// fail
		alert('시작 일과 종료일을 다시 설정하세요.');
		return false;
	}
	// 가격 정규화 
	 if( !regexp.test(v) ) {
	 	alert("가격은 숫자만 입력하세요");
	 	$("#price").val(v.replace(regexp,''));
	 	return false;
	 }	
	// 날짜 데이터 담기 
	 $("#begindate").val(start);
	 $("#enddate").val(end);
	
	// 시간 데이터 담기
	var ex_time =  $("#starttime").val()+$("#endtime").val();
	$("#ex_time").val(ex_time);
	//alert(ex_time);
	
	if(confirm("전시를 등록하시겠습니까?")){
		$("#frm").attr("action","${pageContext.request.contextPath}/exhibitinsert");
		$("#frm").submit();
	}
	
	
}); 
</script>





<script type="text/javascript">
// 첨부한 이미지 미리보기

var sel_file;

$(document).ready(function() {
    $("#titlefile").on("change", handleImgFileSelect);
}); 

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#imgpreview").attr("src", e.target.result);
            
            var lastIndex = $("#titlefile").val().lastIndexOf("//");
			if(lastIndex == -1){
				lastIndex = $("#titlefile").val().lastIndexOf("\\");
			}  
		 	alert($("#titlefile").val());
           var originname = $("#titlefile").val().substring(lastIndex+1);
			
           var lastIndex2 = $("#titlefile").val().lastIndexOf(".");
           var fileextension = $("#titlefile").val().substring(lastIndex2+1);
           
           $("#origin_name").val(originname);
           $("#filename").val("<%=fname%>"+originname);
           
           alert($("#origin_name").val());
           alert($("#filename").val()); 
           
        }
        reader.readAsDataURL(f);
    });
}

</script>

 



<%@include file ="../include/footer.jsp" %>		