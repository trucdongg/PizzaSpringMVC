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
     <div class="row mx-2">
      <div class="container-fluid col-6">
 	<div class="form-group text-primary mt-3" style="font-size:25px;">
 	${message}
 	</div>
         <h2 class="mt-2">Sửa Kích Thước Và Số Lượng</h2>
 	
  <div class="form-group">
      <label for="ten">Tên Pizza</label>
      <br>
         <select class="browser-default custom-select w-50" name="ten">
         <c:forEach var="l" items="${list}">
            <option value="${l.id_pizza}">${l.name }</option>
         </c:forEach>
   	 </select>
    </div>
    <div class="form-group">
      <label for="kichthuoc">Kích Thước</label>
      <br>
      <select class="browser-default custom-select w-50" name="kichthuoc">
            <option value="0">Nhỏ</option>
            <option value="1">Vừa</option> 
            <option value="2">Lớn</option> 
   	 </select>
    </div>
   
 <div class="form-group">
      <label for="giatien">Giá Tiền</label>
      <input type="text" class="form-control w-50" name="giatien" required>
    	<div class="err text-danger d-none"></div>
    </div>
     <div class="form-group">
      <label for="soluong">Số Lượng</label>
      <input type="text" class="form-control w-50" name="soluong" required>
    	<div class="erro text-danger d-none"></div>
    </div>
    <div class="form-group">
    <button type="submit" role="xacnhan" class="btn btn-primary w-25">Xác Nhận</button>
    <button type="submit" role="sua" class="btn btn-dark w-25">Sửa</button>
    </div>
      
         <!-- /#page-container-wrapper -->
    </div>
	    <!-- /#page-content-wrapper -->
	     
	    <!-- /#page-content-wrapper -->
	</div>
</div>
  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/admin/js/jquery.min.js"></script>
  <script src="../resources/admin/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
  var giacu = 0;
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
	 $('input[type="file"]').on('change',function(e){
    	  $(this).prev().attr('src', URL.createObjectURL(event.target.files[0]));
      })
     
  </script>

</body>

</html>
