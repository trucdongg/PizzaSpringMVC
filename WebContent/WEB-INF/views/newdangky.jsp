<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>ThemePizza</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../resources/newtrangchu/img/logo2.jpg">
     <link href="../resources/newtrangchu/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/newtrangchu/css/pizza.css" rel="stylesheet">
    
</head>

<body>
 
<%@include file="../../common/newtrangchu/header.jsp"%>

  
    <!-- Top kết thúc -->

    <!-- Main chính bắt đầu -->
    <main>
ABC
         </main>
    <!-- Main chính kết thúc -->
<%@include file="../../common/newtrangchu/footer.jsp"%>

   
  <script src="../resources/newtrangchu/js/bootstrap.min.js"></script>
   <script src="../resources/newtrangchu/js/jquery.js"></script> 
  <script src="../resources/newtrangchu/js/bootstrap.bundle.min.js"></script> 
     <script src="../resources/newtrangchu/js/test.js "></script> 
    <script>
        $('.pizza').on('click', function() {
            $('.pizza').removeClass('active');
            $(this).addClass('active');
        })
        $('nav ul a').on('click', function(e) {
            e.preventDefault();
            $('nav ul a').removeClass('active');
            $(this).addClass('active');
        })
    </script>
</body>

</html>