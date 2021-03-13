<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>My Pizza</title>
<link rel="shortcut icon" href="../resources/trangchu/img/logo2.jpg">
  <!-- Bootstrap core CSS -->
  <link href="../resources/trangchu/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/trangchu/css/bootstrap.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../resources/trangchu/css/style.css" rel="stylesheet">
  <link href="../resources/newtrangchu/css/pizza.css" rel="stylesheet">
<style>
button{
  position: relative;
}
.abs{
  position: absolute  ;
  top: -10px; 
  right: -10px;
  font-size: 13px;
  background-color: blue;
  padding: 1px 5px;
  font-weight: bold;
  /* text-align: center; */
  /* border: 1px solid */
  border-radius: 50%;
}
body{
background-color:#252525;
}
</style>
</head>

<body>
<%@include file="../../common/trangchu/header.jsp"%>

  <!-- Page Content -->
  <div class="container mt-5">
   
    <div id="myCarousel" class="carousel slide">
    
    <!-- Indicators -->
    <ul class="carousel-indicators">
      <li class="item1 active"></li>
      <li class="item2"></li>
      <li class="item3"></li>
    </ul>
    
    <!-- The slideshow -->
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="../resources/trangchu/img/1.jpg" alt="" >
      </div>
      <div class="carousel-item">
        <img src="../resources/trangchu/img/2.jpg" alt="" >
      </div>
      <div class="carousel-item">
        <img src="../resources/trangchu/img/3.jpg" alt="" >
      </div>
    </div>
    
    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#myCarousel">
      <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#myCarousel">
      <span class="carousel-control-next-icon"></span>
    </a>
  </div>
  </div>
  <!-- /.container -->
  <div class="row w-100 p-0 m-0">
  	<div class="p-0 m-1 design" style="width:49%"><img class="m-2" src="../resources/trangchu/img/4.png" width="100%" height="400px">
 		<div class="text-white center">
  		<h1>THỰC ĐƠN</h1> 
  		
  		</div>
  		 
  		 <a class="btn  text-white custom" href="../user/thucdon.htm">Xem Thêm</a>
  		
  	</div>
  	<div class=" p-0 m-1 design" style="width:49%"><img  class="m-2" src="../resources/trangchu/img/5.png" width="100%" height="400px">
  	
  		<div class="text-white center">
  		<h1>KHUYẾN MÃI</h1> 
  		</div>
  		<a class="btn  text-white custom" href="#">Xem Thêm</a>
  	</div>
  </div>
    <!-- Main chính bắt đầu -->
    <main>

        <!-- Phần tin tức bắt đầu -->
        <div class="news row">
            <div class="col-6 p-2">
                <img src="../resources/newtrangchu/img/news1.PNG" alt="news1" width="100%" height="100%">
            </div>
            <div class="col-6 col row p-0 m-0">
                <div class="col-12 h-50 row p-0 m-0">
                    <div class="col-6 p-2">
                        <img src="../resources/newtrangchu/img/news2.PNG" alt="news2" width="100%" height="100%">
                    </div>
                    <div class="col-6  p-2">
                        <img src="../resources/newtrangchu/img/news3.PNG" alt="news3" width="100%" height="100%">
                    </div>
                </div>

                <div class="col-12 h-50 p-2  col">
                    <img src="../resources/newtrangchu/img/news4.PNG" alt="news4" width="100%" height="100%">
                </div>
            </div>

        </div>
        <!-- Phần tin tức kết thúc -->

       

   
         </main>
    <!-- Main chính kết thúc -->
  <!-- Footer -->
<%@include file="../../common/trangchu/footer.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/trangchu/js/jquery.min.js"></script>
  <script src="../resources/trangchu/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/trangchu/js/test.js"></script>
</body>

</html>
