<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>ADMIN</title>

  <!-- Bootstrap core CSS -->
  <link href="../resources/admin/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Custom styles for this template -->
  <link href="../resources/admin/css/simple-sidebar.css" rel="stylesheet">
  <link rel="shortcut icon" href="../resources/admin/img/admin.png">

</head>

<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <!-- Sidebar -->
    <%@include file="../../common/admin/slider.jsp"%>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">Ẩn - Hiện</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
            <button class="btn btn-info mx-2" style="padding:2px 10px;"> <a class="nav-link text-white" href="../user/pizza.htm">Thực Đơn</a> </button>
             
            </li>
         
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle " style="padding:10px 10px;border:1px solid black;border-radius: 10px;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                ${sessionScope.dangnhap}
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Quản Lí</a>
                <a class="dropdown-item" href="#">Hoạt Động Khác</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../test/dangxuat.htm">Đăng Xuất</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>

      <div class="container-fluid">
    <table class="table table-hover">
    <thead>
      <tr>
      <th>ID</th>
        <th>Người Dùng</th>
        <th>Tổng Tiền</th>
        <th>Trạng Thái</th>
        <th>Ngày</th>
        <th>Địa Chỉ</th>
        <th>Số Điện Thoại</th>
       
      </tr>
    </thead>
    <c:forEach var="l" items="${list}" >
    <tbody>
      <tr>
      	<td>${l.id_giohang }</td>
        <td>${l.user.hoten }</td>
        <td>${ l.total}</td>
        <c:if test="${l.tuchoi==true}">
        <td class="text-danger">Đã Hủy</td>
        </c:if>
       
        <td>${l.day }</td>
        <td>${l.diachi }</td>
        <td>${l.sdt }</td>
  
		
      </tr>
      
    </tbody>
    </c:forEach>
  </table>    
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/admin/js/jquery.min.js"></script>
  <script src="../resources/admin/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  	$('#monan').on('click',function(e){
 		e.preventDefault();
 		$(this).next('.d-none').removeClass('d-none');
 	})
	$('.drop button').on('click',function(){
		$(this).parent().addClass('d-none');
	})
	$('button[role="accept"]').on('click',function(){
		 $.ajax({
         	type:"POST",
         	url:"./admin.htm",
         	data:{
         		id: $(this).attr('id'),
         		accept: true
         	},
         	success: function(d){
         		console.log(d);
         		location.reload(true);
         	}
         })
	})
	$('button[role="deny"]').on('click',function(){
		 $.ajax({
	         	type:"POST",
	         	url:"./admin.htm",
	         	data:{
	         		id: $(this).attr('id'),
	         		accept: false
	         	},
	         	success: function(d){
	         		console.log(d);
	         		
	         		location.reload(true);
	         	},error: function(e){
	         		console.log(e);
	         	}
	         })
	})
  </script>

</body>

</html>
