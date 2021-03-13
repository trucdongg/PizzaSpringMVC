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
<link href="../resources/newtrangchu/css/xemdaduyet.css" rel="stylesheet">
  <!-- Custom styles for this template -->

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
 <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
     <div class="card">
         <div class="card-header p-4">
             <a class="pt-2 d-inline-block" href="#" data-abc="true"><img src="../resources/trangchu/img/logo2.jpg" width="32px"/><span style="font-size:30px;">Pizza Delicious</span></a>
             <div class="float-right">
                 <h3 class="mb-0">Hóa Đơn Số</h3>
                <p>Ngày:</p> 
                <button onclick="window.print()" class="btn btn-success">In Trang Này </button>
             </div>
         </div>
         <div class="card-body">
             <div class="row mb-4">
                 <div class="col-sm-6">
                     <h5 class="mb-3">From</h5>
                     <h3 class="text-dark mb-1">Pizza Delicious</h3>
                     <div>Trực Đông</div>
                     <div>Địa Chỉ: Nha Trang</div>
                     <div>Email: abmskcnd@gmail.com</div>
                     <div>Số Điện Thoại : 0378489364</div>
                 </div>
                 <div class="col-sm-6 ">
                     <h5 class="mb-3">To:</h5>
                     <h3 class="text-dark mb-1">Khách Hàng</h3>
                     <div>Tên : ${tk.hoten } </div>
                     <div>Địa Chỉ: <strong class="text-primary"> ${giaohang.diachi } </strong></div>
                     <div>Email: ${tk.email}</div>
                    <div>Số Điện Thoại: <strong class="text-primary"> ${giaohang.sdt} </strong></div>
                 </div>
             </div>
             <div class="table-responsive-sm">
                 <table class="table table-striped">
			       <thead>
			        <tr>
			        <th>Mã Chi Tiết</th>
			        <th>Tên Sản Phẩm</th>
			        <th>Số Lượng</th>
			        <th>Đơn Giá</th>
			        <th>Kích Thước</th>
			        
			     
			      </tr>
			    </thead>
     <tbody>
    	<c:forEach var="l" items="${list}">
      <tr>
        <td>${l.id_ctgh}</td>
        <c:if test="${l.monanct==null }">
        <td>${l.pizza.name}</td>
        <td>${l.sl }</td>
         <td>${l.giapizza}</td>
         <td>${l.kt.tenkc }</td>
         
        </c:if>   
         <c:if test="${l.kt==null && l.pizza==null }">
        <td>${l.monanct.tenmonan}</td>
        <td>${l.soluongmonan }</td>
          <td>${l.giamonan }</td>
        </c:if> 
     
        
              
        
      
        
      </tr>
      </c:forEach>
    </tbody>
                 </table>
             </div>
             <div class="row">
                 <div class="col-lg-4 col-sm-5">
                 </div>
                 <div class="col-lg-4 col-sm-5 ml-auto">
                     <table class="table table-clear">
                         <tbody>
                          
                             <tr>
                                 <td class="left">
                                     <strong class="text-dark">Tổng Tiền</strong> </td>
                                 <td class="right">
                                     <strong class="text-dark">${total }</strong>
                                 </td>
                             </tr>
                         </tbody>
                     </table>
                 </div>
             </div>
         </div>
         <div class="card-footer bg-white">
             <p class="mb-0">Trực Đông Pizza, abmskcnd@gmail.com, Chúc Ngon Miệng</p>
         </div>
     </div>
 </div>

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/trangchu/js/jquery.min.js"></script>
  <script src="../resources/trangchu/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/trangchu/js/test.js"></script>
</body>

</html>