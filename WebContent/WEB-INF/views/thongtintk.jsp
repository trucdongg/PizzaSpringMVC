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

  <title>My Pizza</title>
<link rel="shortcut icon" href="../resources/trangchu/img/logo2.jpg">
  <!-- Bootstrap core CSS -->
  <link href="../resources/trangchu/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/newtrangchu/css/pizza.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../resources/trangchu/css/dangnhap.css" rel="stylesheet">
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
</style>
</head>

<body>
<%@include file="../../common/trangchu/header.jsp"%>
   <div class="container mt-0 h-100">
   <div class=main> 
  <div style="color:red;font-size:20px;margin-top:55px;">
 	${mess}
	</div>

    <h2>Thông Tin Tài Khoản</h2>
    
  <form:form method="POST" action="" class="mb-2">
 
    <div class="form-group">
      <label for="taikhoan">Tài Khoản : </label>
     <label for="taikhoan">${taikhoan }</label>
   
    </div>
    <div class="form-group">
      <label for="ten">Tên</label>
      <input type="text" class="form-control" name="ten" required value="${hoten}">
     
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <div class="d-flex align-items-center">
      <input type="email" class="form-control" name="email" required value="${email}" disabled>
     
  	<button type="button" role="email" class="btn btn-primary m-2 " data-toggle="modal" data-target="#e${id}">
 Sửa
	</button>
      <!-- Modal -->
<div class="modal fade" id="e${id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">  ${taikhoan}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<p class="d-none error alert alert-danger"></p>
          <div class="form-group">
        <label for="p" class="text-primary">Mã Bảo Mật Được Gửi Trong Gmail Của Bạn</label>  <br>
     
      <input type="text" class="form-control" name="code" required>
     
    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        <button type="button" role="saveemail" class="btn btn-primary">Lưu</button>
      </div>
    </div>
  </div>
</div>
      
      
   
    </div>
    </div>
	<div class="form-group">
      <label for="sdt">Số Điện Thoại</label>
      <div class="d-flex align-items-center">
      <input type="text" class="form-control" name="sdt" required value="${sdt }" disabled>
       	<button type="button" role="sdt" class="btn btn-primary m-2 " data-toggle="modal" data-target="#e${idsdt }">
 			Sửa
	</button>
      <!-- Modal -->
<div class="modal fade" id="e${idsdt }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Số Điện Thoại</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <p class="d-none error alert alert-danger"></p>
           <div class="form-group">
        <label for="p" class="text-primary">Mã Bảo Mật Được Gửi Trong Gmail Của Bạn</label>  <br>
     
      <input type="text" class="form-control" name="codesdt" required>
     
    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng </button>
        <button type="button"role="savesdt" class="btn btn-primary">Lưu</button>
      </div>
    </div>
  </div>
</div>
      




      </div>
    </div>
    <div class="form-group">
      <label for="ngaysinh">Ngày Sinh</label>
      <input class="form-control" type="date" value="${ns }" id="example-date-input" name="ngaysinh">
    </div>

    <button type="submit" class="btn btn-primary">Xác Nhận</button>
  </form:form>
   
  </div>

	</div>
  <!-- Footer -->
<%@include file="../../common/trangchu/footer.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/trangchu/js/jquery.min.js"></script>
  <script src="../resources/trangchu/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/trangchu/js/test.js"></script>
  <script>
  		var invald = [];
  		$('input[name="ten"]').on('change',function(e){
  			if(!e.target.value.match("^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ" +
  		            "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ" +
  		            "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$"))
  				{
  				alert('Họ và tên không hợp lệ vui lòng nhập lại	');
  				$('button[type="submit"]').hide();
  				}
  			else{
  				$('button[type="submit"]').show();
  			}
  		})
  		$('input[name="sdt"]').on('change',function(e){
  			if(!e.target.value.match("0[0-9]{9}") && e.target.value.length != 10)
  				{
  				alert('SĐT không hợp lệ vui lòng nhập lại');
  				$('button[type="submit"]').hide();
  				}
  			else{
  				$('button[type="submit"]').show();
  			}
  		})
  		console.log(invald?true:false);
  		console.log(invald);
  		if(invald.length > 0)
  			console.log('test');
  		else
  			$('button[type="submit"]').show();
  		
  		$('button[role="email"]').on('click',function(){
  			$.ajax({
  		      	type:"POST",
  		      	url:"../test/fixemail.htm",
  		      	success: function(d){
  		      		console.log(d);
  		      	},
  				error: function(e){
  					console.log(e);
  				}
  		      })	
  		})
  		 $('button[role="saveemail"]').on('click',function(){
  			$.ajax({
  	      	type:"POST",
  	      	url:"../test/emaillater.htm",
  	      	success: function(d){
  	      	
  	      		if( d == $('input[name="code"]').val()){
  	      			location.href = "./doiemail.htm";
  	      		}else{
  	      			$('.error').removeClass('d-none');
  	      			$('.error').text("Sai Mã Code");
  	      		}
  	      	},error: function(e){
					console.log("Sai Ma Code");
				}
  	      })  
  	  })
     
  	  		$('button[role="sdt"]').on('click',function(){
  			$.ajax({
  		      	type:"POST",
  		      	url:"../test/fixsdt.htm",
  		      	success: function(d){
  		      		console.log(d);
  		      	},
  				error: function(e){
  					console.log(e);
  				}
  		      })	
  		})
     
  		  		 $('button[role="savesdt"]').on('click',function(){
  			$.ajax({
  	      	type:"POST",
  	      	url:"../test/sdtlater.htm",
  	      	success: function(d){
  	      	
  	      		if( d == $('input[name="codesdt"]').val()){
  	      			location.href = "./doisdt.htm";
  	      		}else{
  	      		$('.error').removeClass('d-none');
	      			$('.error').text("Sai Mã Code");
  	      		}
  	      	}
  	      })  
  	  })
     
  		
  </script>
</body>

</html>