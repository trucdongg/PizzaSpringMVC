<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
<link href="../resources/newtrangchu/css/pizza.css" rel="stylesheet">

<link href="../resources/newtrangchu/css/newpizza.css" rel="stylesheet">
  <title>My Pizza</title>
	<link rel="shortcut icon" href="../resources/trangchu/img/logo2.jpg">
  <!-- Bootstrap core CSS -->
  <link href="../resources/trangchu/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/trangchu/css/bootstrap.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../resources/trangchu/css/dathang.css" rel="stylesheet">
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
	.tag::before{
		content: 'Hết hàng';
		position: absolute;
		top: 0;
		left: 0;
		padding: 10px;
		color: white;
		font-weight: bold;
		background-color: #ff4d4d;
	}
	a.col{
	text-decoration: none;
	transition: 0.2s;
		color: black;
	border: 1px solid white;
	border-bottom: none;
	background: black;	
	text-transform: uppercase;
	font-weight: bold;
	padding: 30px 10px;
	display:flex;
	align-items-center;
	justify-content:center;
	} 	
	a.col:first-child{

		border-left: none;
		
	}
	a.col:last-child{
		border-right: none;
	}
	a.bg-dark:hover{
	color:white;
	border-bottom: 2px solid red !important;
	}
	.custom-number{
	border: none;
	border-radius: 6px;
    margin: 0 10px;
    padding: 7px 10px;
	}
	.product{
		transition: 0.2s;
	}
	.product:hover{
		transform: scale(1.1);
	}
	button[role="order"]{
		transition: 0.3s;
		font-weight: bold;
	}
	button[role="order"]:hover{
		background-color: white;
		color: black;
	}
</style>
</head>

<body>
<%@include file="../../common/trangchu/header.jsp"%>
 <div class="container">

    <div class="row">

  <%@include file="../../common/trangchu/navmenu.jsp"%>
      <!-- /.col-lg-3 -->
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

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  <!-- Footer -->
<%@include file="../../common/trangchu/footer.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/trangchu/js/jquery.min.js"></script>
  <script src="../resources/trangchu/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/trangchu/js/test.js"></script>
     <script>
     	
            
      </script>
       
</body>

</html>