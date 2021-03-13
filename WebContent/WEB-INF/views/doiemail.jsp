<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
  <div style="color:red;font-size:20px;">
 	${message1}
	</div>
    <h2>Đổi Email</h2>
  <form:form method="POST" action="" >
    <div class="form-group">
      <label for="emailnew">Email Mới</label>
      <input type="email" class="form-control" name="emailnew" required >
    </div>
    
    <button type="submit" class="btn btn-primary" role="xacnhan">Xác Nhận</button>
  </form:form>
   
  </div>

	</div>
  <!-- Footer -->
<%@include file="../../common/trangchu/footer.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/trangchu/js/jquery.min.js"></script>
  <script src="../resources/trangchu/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/trangchu/js/test.js"></script>
</body>

</html>
