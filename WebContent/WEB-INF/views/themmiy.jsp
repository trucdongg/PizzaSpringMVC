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
	<style>
		li{
			list-style: none;
		}
	</style>
</head>

<body>

  <div class="d-flex" id="wrapper">

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
              <a class="nav-link" href="#">Trang Chủ <span class="sr-only">(current)</span></a>
            </li>
         
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
     		
	<div class="d-flex"> 
	<a href="../user/addmiy.htm" class="btn btn-success btn-block m-5 w-25 ">Thêm Mì Ý</a>
	<a href="../user/fixmiy.htm" class="btn btn-primary btn-block m-5 w-25 ">Sửa Mì Ý</a>
	</div>					
	    	<table id="cart" class="table table-hover table-condensed">
    			
    				<thead>
						<tr>
						<th style="width:20%">Tên Sản Phẩm</th>
						<th style="width:20%">Mô Tả</th>
						<th style="width:10%">Giá Tiền</th>
						<th style="width:10%">Số Lượng</th>
						<th style="width:20%">Trạng Thái</th>
						<th style="width:30%">Chức Năng</th>
						</tr>
					</thead>
					  
					<c:forEach var="l" items="${list}" >
					<tbody>
						<tr>
						<td>
						<p>${l.tenmonan }</p>
						<img alt="" src="../load/miy/${l.hinhanh}" style="width:100px;height:100px">
						
						</td>
						<td>${l.mota }</td>
						<td>${l.giatien }</td>
						<td>${l.soluong }</td>
						<c:if test="${l.trangthai==true}">
						<td class="text-primary">Đang Bán</td>
						</c:if>
						<c:if test="${l.trangthai==false}">
						<td class="text-danger">Chưa Bán</td>
						</c:if>
						<td>
						<button type="button" id="${l.idmonan }" role="open" class="btn btn-dark">Mở Bán/ Hết Hàng</button>
						
						</td>
						
						</tr>
					</tbody>
					</c:forEach>
					<tfoot>
						
						
					</tfoot>
				</table>
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
    var loadFile = function(event, pizzaid) {
        //var output = document.getElementById('output');
        //output.src = URL.createObjectURL(event.target.files[0]);
        console.log(pizzaid);
        console.log($(`img[pizzaid]`).attr("pizzaid"));
        //$(this).prev().attr("src", URL.createObjectURL(event.target.files[0]));
      };
      $('input[type="file"]').on('change',function(e){
    	  $(this).prev().attr('src', URL.createObjectURL(event.target.files[0]));
      })
     	$('#monan').on('click',function(e){
     		e.preventDefault();
     		$(this).next('.d-none').removeClass('d-none');
     	})
    	$('.drop button').on('click',function(){
    		$(this).parent().addClass('d-none');
    	})
    	$('button[role="open"]').on('click',function(){
    		var id=$(this).attr('id');
    		$.ajax({
            	type:"POST",
            	url:"./movadongmonan.htm",
            	data:{
            		id: id,	
            	},
            	success: function(d){
            		console.log(d);
            		location.reload(true);
            	}
            })
    	})
  
  </script>

</body>

</html>
