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
 	${message}
	</div>
    <table class="table table-hover">
    <thead>
      <tr>
        <th>Mã Đơn Hàng</th>
        <th>Tổng Tiền</th>
        <th>Trạng Thái</th>
         <th>Ngày</th>
          <th>Địa Chỉ</th>
         <th>Số Điện Thoại</th>
     
      </tr>
    </thead>
    <tbody>
    	<c:forEach var="l" items="${list}">
      <tr>
        <td>${l.id_giohang}</td>
        <td>${l.total}</td>
        <c:if test="${l.tt==false && l.tuchoi==false}">
        <td class="text-info">Đang Xử Lý</td>
        </c:if>
        <c:if test="${l.tt==false && l.tuchoi==true}">
        <td class="text-danger">Bị Hủy</td>
        </c:if>
        <c:if test="${l.tt==true}">
        <td class="text-primary">Đã Giao</td>
        </c:if>
        <td>${l.day }</td>
        <td>${l.diachi }</td>
        <td>${l.sdt }</td>
        <td><a href="../test/xemdonhang.htm?id=${l.id_giohang }">Chi Tiết</a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
   
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