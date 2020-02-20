<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

   <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
   
  <div class="container">
    <h3>Starrr</h3>

    <h5>Click to rate:</h5>
    <div class='starrr' id='star1'></div>
    <div>&nbsp;
      <span class='your-choice-was' style='display: none;'>
        Your rating was <span class='choice'></span>.
      </span>
    </div>

    <h5>Advanced:</h5>
    <div class='starrr' id='star2'></div>
    <br />
    <input type='text' name='rating' value='3' id='star2_input' />

    <h5>Why?</h5>
    <p>There are other libraries out there, but none that approach the level clarity and conciseness that I wanted. Starrr is less than 75 lines of code -- you can understand the entirety of its source code in about a minute.</p>

    <h5>Dependencies</h5>
    <p>jQuery.</p>
    <p>I'm using Bootstrap + Font Awesome to render the stars, but you're more than welcome to use something else.</p>
  </div>

  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
  <script src="dist/starrr.js"></script>
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

    var $s2input = $('#star2_input');
    $('#star2').starrr({
      max: 10,
      rating: $s2input.val(),
      change: function(e, value){
        $s2input.val(value).trigger('input');
      }
    });
  </script>


<%@include file ="../include/footer.jsp" %>	