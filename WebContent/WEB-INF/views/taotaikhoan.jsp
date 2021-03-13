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

  <!-- Bootstrap core CSS -->
  <link href="../resources/trangchu/css/bootstrap.min.css" rel="stylesheet">
 
  <!-- Custom styles for this template -->
  <link href="../resources/trangchu/css/taotaikhoan.css" rel="stylesheet">
   <link href="../resources/trangchu/css/modal.css" rel="stylesheet">
<link rel="shortcut icon" href="../resources/trangchu/img/logo2.jpg">
	<link href="../resources/newtrangchu/css/pizza.css" rel="stylesheet">
<style>
button{
  position: relative;
}

</style>
</head>

<body>
<%@include file="../../common/trangchu/header.jsp"%>

   <div class="container mt-0 mb-5">
   
   <div class="main"> 
 <c:if test="${message=='Đăng Ký Thành Công'}">
 <div class="black"></div>
    <div class="border abs">
        <h2>Đây là thông tin mà bạn đã nhập</h2>
        <div class="row">
            <div class="col-6">
            <span>Họ và tên: </span>
            <span>Tài khoản: </span>
            <span>Email: </span>
            <span>Số điện thoại: </span>
            <span>Ngày sinh: </span>
            <span>Địa Chỉ: </span>
            <span>Giới tính: </span>
            </div>
            <div class="col-6">
                <span>${taikhoan.hoten}</span>
                <span>${taikhoan.taikhoan}</span>
                <span>${taikhoan.email}</span>
                <span>${taikhoan.sdt}</span>
                <span>${taikhoan.ngaysinh}</span>
                <span>${taikhoan.diachi}</span>
                <span><c:if test="${taikhoan.gioitinh==true}">Nam</c:if></span>
                <span><c:if test="${taikhoan.gioitinh==false}">Nữ</c:if></span>
            </div>
        </div>
        <button class="btn bg-primary text-white font-weigh-bold ok">
            OK
        </button>
        
    </div>
    
    

</c:if>
 
 <div class="mess">
 	${message}
</div>

<div>
    <h2 class="mt-2">Tạo Tài Khoản</h2>
  <form:form method="POST" modelAttribute="taikhoan" action="">
 <div class="form-group row">
  <label for="example-text-input" class="col-2 col-form-label">Họ Tên</label>
  <div class="col-10">
    <form:input class="form-control" type="text" id="example-text-input" name="hoten" path="hoten"/>
       <div class="notice">
 	 <form:errors path="hoten" />
		</div>
     
  </div>
</div>
<div class="form-group row">
  <label for="example-search-input" class="col-2 col-form-label">Tài Khoản</label>
  <div class="col-10">
    <form:input class="form-control" type="text"  id="example-search-input" name="taikhoan" path="taikhoan"/>
        <div class="notice">
 	 <form:errors path="taikhoan" />
		</div>
  </div>
</div>
<div class="form-group row">
  <label for="example-email-input" class="col-2 col-form-label">Email</label>
  <div class="col-10">
    <form:input class="form-control" type="email" id="example-email-input" name="email" path="email"/>
      <div class="notice">
 	 <form:errors path="email" />
		</div>
  </div>
</div>
<div class="form-group row">
  <label for="example-tel-input" class="col-2 col-form-label">Số Điện Thoại</label>
  <div class="col-10">
    <form:input class="form-control" type="tel" id="example-tel-input" name="sdt" path="sdt"/>
      <div class="notice">
 	 <form:errors path="sdt" />
		</div>
  </div>
</div>
<div class="form-group row">
  <label for="example-password-input" class="col-2 col-form-label">Mật Khẩu</label>
  <div class="col-10">
    <form:input class="form-control" type="password" id="example-password-input" name="matkhau" path="matkhau"/>
      <div class="notice">
 	 <form:errors path="matkhau" />
		</div>
  </div>
</div>
<div class="form-group row">
  <label for="example-password-input" class="col-2 col-form-label">Nhập Lại Mật Khẩu</label>
  <div class="col-10">
    <input class="form-control" type="password" id="example-password-input" name="rematkhau" >
  </div>
</div>
<div class="form-group row">
  <label for="example-date-input" class="col-2 col-form-label">Ngày Sinh</label>
  <div class="col-10">
    <input class="form-control" type="date" value="2000-01-01" id="example-date-input" name="ngaysinh">
  </div>
</div>
<div class="form-group row">
  <label for="example-search-input" class="col-2 col-form-label">Địa Chỉ</label>
  <div class="col-10">
    <form:input class="form-control" type="text"  id="example-search-input" name="diachi" path="diachi"/>
        <div class="notice">
 	 <form:errors path="diachi" />
		</div>
  </div>
</div>
<div class="form-group row">
<label for="example-date-input" class="col-2 col-form-label">Giới Tính</label>
<div class="col-10">
	<select class="browser-default custom-select" name="gioitinh">
            <option value="true">Nam</option>
            <option value="false">Nữ</option> 
    </select>
	</div>
</div>
    <button type="submit" class="btn btn-primary taotaikhoan">Tạo Tài Khoản</button>
  </form:form>
  </div>
  </div>

	</div>
  <!-- Footer -->
<%@include file="../../common/trangchu/footer.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/trangchu/js/jquery.min.js"></script>
  <script src="../resources/trangchu/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/trangchu/js/test.js"></script>
<script>
	$('.black').removeClass('d-none');
	$('.ok').on('click',function(){	 
		 location.href ="../user/taotaikhoan.htm";
	})
    </script>
</body>

</html>