<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="../user/home.htm"><img src="../resources/trangchu/img/logo2.jpg" width="32px"/>PIZZA DELICIOUS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
	<c:if test="${sessionScope.kt=='yes'}">
                 <li class="nav-item dropdown m-1 ">
              <a class="btn bg-primary nav-link dropdown-toggle text-white m-0 pb-1" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                ${sessionScope.dangnhap}
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="../test/thongtin.htm">Thông Tin Tài Khoản</a>
                <a class="dropdown-item" href="../test/donhang.htm">Đơn Hàng Của Bạn</a>
                <a class="dropdown-item" href="../test/password.htm">Đổi Mật Khẩu</a>
                <c:if test="${sessionScope.quyen=='ok'}">
                <a class="dropdown-item" href="../user/admin.htm">Trang Quản Lí</a>
                </c:if >
              
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../test/dangxuat.htm">Đăng Xuất</a>
              </div>
            </li>
               <li class="nav-item active m-1">           
               
                <button type="button" class="btn btn-danger"><a class="text-white" href="../user/giohang.htm">Giỏ Hàng<img src="../resources/trangchu/img/smart-cart.png" alt="cart" width="20px"/></a>
                 <div id="soluonghang" class="abs text-white">${sessionScope.count}</div>
                 <div class="d-none count"> </div>
                </button>
                
              </li>	
               
     </c:if>  
       <li class="nav-item active m-1">           
                <c:if test="${sessionScope.kt!='yes'}">
                <button type="button" class="btn bg-white"/><a href="../user/thucdon.htm" class="text-dark"><img src="../resources/trangchu/img/menu1.png" width="24px"/>Thực Đơn </a></button>
                </c:if>
                <c:if test="${sessionScope.kt=='yes'}">
                <button type="button" class="btn bg-white"/><a href="../user/pizza.htm" class="text-dark"><img src="../resources/trangchu/img/menu1.png" width="24px"/>Thực Đơn </a></button>
                </c:if>
              </li>	
    <c:if test="${sessionScope.kt!='yes'}">
                    <li class="nav-item m-1">
            <button type="button" class="btn btn-secondary" ><a  class="text-white" href="../test/dangnhap.htm" >Đăng Nhập</a></button>
          </li>
          <li class="nav-item m-1">
            <button type="button" class="btn btn-secondary"><a class="text-white" href="../user/taotaikhoan.htm">Tạo Tài Khoản</a></button>
          </li>
   </c:if>
      	

                </ul>
            </div>
        </div>
    </nav>
  <!--   <div class="btn fixed-top" style="width:60px;top:10%;left:96%;background-color:#ffbf80;"><img src="../resources/trangchu/img/smart-cart.png" alt="cart" width="20px"/></div> -->