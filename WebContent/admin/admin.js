function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};
//--공지--
function searchNotice() {
	var choice = $("#noticeSearchChoice").val();
	var word = $("#noticeSearchWord").val();
	
	if(word =="" || word == null){
		alert(" 입력된 값이 없습니다 ")
		document.getElementById("noticeSearchChoice").value='sel';
		
	}else if(choice == 'sel'){
		alert("카테고리를 선택하세요")

	}
		location.href = getContextPath() +"/admin?noticeSearchWord="+word+"&noticeSearchChoice=" + choice;
}
function noticeGoPage(pageNum) {

	var choice = $("#noticeSearchChoice").val();
	var word = $("#noticeSearchWord").val();
	
	if(word == ""){
		document.getElementById("noticeSearchChoice").value='sel';
	};
	var linkStr = getContextPath() + "/admin?noticePageNumber=" + pageNum;
	
	if(choice != 'sel' && word != ""){
		linkStr = linkStr + "&noticeSearchWord=" + word + "&noticeSearchChoice=" + choice;
		console.log(linkStr);
	};
	
	location.href = linkStr;
	
};

//--전시--
function searchExhibit(){
	var choice = $("#exhibitSearchChoice").val();
	var word = $("#exhibitSearchWord").val();
	
	if(word =="" || word == null){
		document.getElementById("exhibitSearchChoice").value='sel';
		alert(" 입력된 값이 없습니다 ")
	}else if(choice == 'sel'){
		alert("카테고리를 선택하세요")

	}
	
		location.href = getContextPath() +"/admin?exhibitSearchWord="+word+"&exhibitSearchChoice=" + choice;
}

function exhibitGoPage(pageNum) {

	var choice = $("#exhibitSearchChoice").val();
	var word = $("#exhibitSearchWord").val();
	
	if(word == ""){
		document.getElementById("exhibitSearchChoice").value='sel';
	};
	var linkStr = getContextPath() + "/admin?exhibitPageNumber=" + pageNum;
	
	if(choice != 'sel' && word != ""){
		linkStr = linkStr + "&exhibitSearchWord=" + word + "&exhibitSearchChoice=" + choice;
		console.log(linkStr);
	};
	
	location.href = linkStr;
	
};

// --승인--
function searchAccess(){
	var choice = $("#accessSearchChoice").val();
	var word = $("#accessSearchWord").val();
	
	if(word =="" || word == null){
		alert(" 입력된 값이 없습니다 ")
		document.getElementById("accessSearchChoice").value='sel';
	}else if(choice == 'sel'){
		alert("카테고리를 선택하세요")

	}
	
		location.href = getContextPath() +"/admin?accessSearchWord="+word+"&accessSearchChoice=" + choice;
}
function accessGoPage(pageNum) {

	var choice = $("#accessSearchChoice").val();
	var word = $("#accessSearchWord").val();
	
	if(word == ""){
		document.getElementById("accessSearchChoice").value='sel';
	};
	var linkStr = getContextPath() + "/admin?accessPageNumber=" + pageNum;
	
	if(choice != 'sel' && word != ""){
		linkStr = linkStr + "&accessSearchWord=" + word + "&accessSearchChoice=" + choice;
		console.log(linkStr);
	};
	
	location.href = linkStr;
	
};


$(document).ready(function(){
	 

	
	 $("#chk_noticeAll").click(function(){
		 if($("#chk_noticeAll").prop("checked")){
			 $("input[name=chk_notice]").prop("checked",true);
			 
		 }else{
			 $("input[name=chk_notice]").prop("checked",false);
		 }
	 });
	 
	 $("#chk_exhibitAll").click(function(){
		 if($("#chk_exhibitAll").prop("checked")){
			 $("input[name=chk_exhibit]").prop("checked",true);
			 
		 }else{
			 $("input[name=chk_exhibit]").prop("checked",false);
		 }
	 });
	 
	 $("#chk_accessAll").click(function(){
		 if($("#chk_accessAll").prop("checked")){
			 $("input[name=chk_access]").prop("checked",true);
			 
		 }else{
			 $("input[name=chk_access]").prop("checked",false);
		 }
	 });
	 
	 	var chkNoticeCount = $('input:checkbox[id="chk_notice"]:checked').length ;
		var chkNotice_val = $('input:checkbox[id="chk_notice"]').val();
		
		
		
	 

});// ready


