<%@page import="KSJ.exhibit.dto.ExhibitDto"%>
<%@page import="NWH.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
// 로그인 세션
MemberDto sdto = (MemberDto)session.getAttribute("loginuser");
String id = sdto.getId();
%>

<%
ExhibitDto dto = (ExhibitDto)request.getAttribute("dto");
//System.out.println("리뷰작성팝업창에 넘어온 전시명은 " + title);
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="starrr.css">
  <style type='text/css'>
    img.ribbon {
      position: fixed;
      z-index: 1;
      top: 0;
      right: 0;
      border: 0;
      cursor: pointer; }

    .container {
      margin-top: 60px;
      text-align: center;
      max-width: 450px; }

    input {
      width: 30px;
      margin: 10px 0;
    }
  </style>
</head>

<body>












<div class='starrr' id='star1'></div>
    <div>&nbsp;
      <span class='your-choice-was' style='display: none;'>
        Your rating was <span class='choice'></span>.
      </span>
    </div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
  <script src="starrr.js"></script>
  <script>
    $('#star1').starrr({
      change: function(e, value){
        if (value) {
          $('.your-choice-was').show();
          $('.choice').text(value);
        } else {
          $('.your-choice-was').hide();
        }
      }
    });
  </script>
  <script type="text/javascript">
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-39205841-5', 'dobtco.github.io');
    ga('send', 'pageview');
  </script>

</body>
</html>