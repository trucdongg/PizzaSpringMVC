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
	<a href="../user/addpizza.htm" class="btn btn-success btn-block m-5 w-25 ">Thêm Pizza <i class="fa fa-angle-right"></i></a>
	<a href="../user/ktpizza.htm" class="btn btn-info btn-block m-5 w-25 ">Thêm Kích Thước Và Số Lượng <i class="fa fa-angle-right"></i></a>
	<a href="../user/fixkt.htm" class="btn btn-dark btn-block m-5 w-25 ">Sửa Kích Thước Và Số Lượng <i class="fa fa-angle-right"></i></a>										
	</div>					
	    	<table id="cart" class="table table-hover table-condensed">
    			
    				<thead>
						<tr>
						<th style="width:40%">Tên Sản Phẩm</th>
						<th style="width:10%">Kích Cỡ</th>
						<th style="width:10%">Giá Tiền</th>
						<th style="width:10%">Số Lượng</th>
						<th style="width:15%">Trạng Thái</th>
						<th style="width:20%">Chức Năng</th>
						
						</tr>
					</thead>
					  
						<c:forEach var="l" items="${list}" >
					<tbody>
						<tr>
							<td data-th="Product">
								<div class="row">
									
									<div class="col-sm-2 hidden-xs"><img src="../load/pizza/${l.hinh}" alt="..." class="img-responsive" style="width:100px;height:100px"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin">${l.getName()}</h4>
										<p>${l.getDetail()}</p>
									</div>
								</div>
							</td>
							
						<td>
							<c:forEach var="u" items="${l.getKichthuoc()}">
							<p>${u.getTenkc()}</p>
							</c:forEach>
						</td>
						
					
						
						<td>
						<c:forEach var="s" items="${l.getKichthuoc()}">
							<p>${s.getGia()}</p>
							</c:forEach>
						</td>
							<td>
						
						<c:forEach var="k" items="${l.getKichthuoc()}">
							<p>${k.getSoluong()}</p>
							</c:forEach>
						
						</td>
						
						<td>
						<c:if test="${l.isTrangthai()==true}">
						<p class="text-primary">Đang Bán</p>
						</c:if>
						<c:if test="${l.isTrangthai()!=true}">
						<p class="text-danger">Chưa Bán</p>
						</c:if>
						</td>
							<td class="actions row" data-th="">
			<button type="button" class="btn btn-info btn-sm m-2 col-4" id="edit" data-toggle="modal" data-target="#e${l.getId_pizza()}">Sửa Pizza</button>
							<div class="modal fade" id="e${l.getId_pizza()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">${l.getName() }</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							        <form method="post" enctype="multipart/form-data" action="../user/suamonan.htm">
							      <div class="modal-body">
							     	   
						  		<div class="form-group">
						  		<input type="text" name="id" value="${l.getId_pizza()}"  class="d-none"/>
						  	 <input type="text" pattern="[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ, ]+"
						  	   class="form-control mt-2" placeholder="Tên Sản Phẩm" name="tensanpham" required>
						  	 
						  		<img src="../load/pizza/${l.hinh}" pizzaid="pz${l.getId_pizza()}" id="output" alt="..." class="img-responsive" style="width:200px;height:200px"/>	
						   	
						   	 <input type="file" class="form-control-file" name="photo" accept="image/*"/>
						   	   <input type="text" pattern="[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ, ]+"
						   	   class="form-control mt-2" placeholder="Mô tả " name="mota" required>
						   	  
						  		</div>
					
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
							        <button type="submit" class="btn btn-primary">Lưu Thông Tin</button>
							       
							      </div>
							      	</form>
							    </div>
							  </div>
							</div>
							
						
							
							
							
							
							<button role="fix-mode" id="fix-3" pizza-id="${l.getId_pizza()}"   class="btn btn-warning btn-sm m-2 col-4">Mở Bán / Hết Hàng </button>
						
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
    	
    	$('button#fix-3').on('click',function(){
    		if($(this).parent().prev().prev().text().trim() == "")
    			alert("Bạn chưa thêm kích thước");
    		else{
    			let idPizza = $(this).attr("pizza-id");
    		    $.ajax({
                	type:"POST",
                	url:"./mobanvadongban.htm",
                	data:{
                		idPizza: idPizza,	
                	},
                	success: function(d){
                		console.log(d);
                		location.reload(true);
                	}
                })
    		}
    	})
    	
  </script>

</body>

</html>
