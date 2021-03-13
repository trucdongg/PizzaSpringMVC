<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <!-- Top bắt đầu -->
    <div class="jumbotron-fluid top section">
        <!-- Nav bắt đầu -->
        <nav>
            <div class="logo">
                <div style="width: 50px;margin: 0 5px;">
                    <img src="../resources/newtrangchu/img/logo2.jpg" alt="logo" width="100%" style="border-radius: 50%;">

                </div>
                <span>Pizza</span>
            </div>

            <!-- Điều hướng bắt đầu -->
            <ul class="row">
                <a href="../new/newhome.htm" class="active">
                    <!-- Đặt hàng -->
                    <li>Trang Chủ</li>
                </a>
                <a href="../new/newmenu.htm">
                    <li>Pizza</li>
                </a>
                </a>
                <a href="">
                    <li>Mỳ Ý</li>
                </a>
                <a href="">
                    <li>Khai Vị</li>
                </a>
                  <a href="">
                    <li>Thức Uống</li>
                </a>
            </ul>
            <!-- Điều hướng kết thúc -->


            <div class="phone">
                <div class="text">Call and Order in <span class="text-white">VietNam</span></div>
                <div class="number">037 848 9364</div>
            </div>
	<c:if test="${sessionScope.kt!='yes'}">
            <div class="login text-white row justify-content-center">
                <a  class="btn text-white" href="../test/dangnhap.htm">
                    Đăng Nhập
                </a>
                <a class="btn text-white" href="../user/taotaikhoan.htm" >
                   	Đăng Ký
                </a>
	</c:if>
	<c:if test="${sessionScope.kt=='yes'}">  
	   <div class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                ${sessionScope.dangnhap}
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Thông Tin Tài Khoản</a>
                <a class="dropdown-item" href="#">Đơn Hàng Của Bạn</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../test/dangxuat.htm">Đăng Xuất</a>
              </div>
            </div>              
                 <a class="btn bg-info">
                   <img src="../resources/newtrangchu/img/smart-cart.png" alt="cart" width="20px"/>Giỏ Hàng
                </a>
                </c:if>
            </div>


        </nav>
        <c:if test="${slider}">
        <!-- Page Content -->
        <div class="container slider my-3 py-2" style="width:100%;">

            <div id="myCarousel" class="carousel slide">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li class="item1 active"></li>
                    <li class="item2"></li>
                    <li class="item3"></li>
                </ul>

                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../resources/newtrangchu/img/1.jpg" alt="" width="100%" height="500">
                    </div>
                    <div class="carousel-item">
                        <img src="../resources/newtrangchu/img/2.jpg" alt="" width="100%" height="500">
                    </div>
                    <div class="carousel-item">
                        <img src="../resources/newtrangchu/img/3.jpg" alt="" width="1000px" height="500">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#myCarousel">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#myCarousel">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>
        </c:if>
        </div>
        <!-- Nav kết thúc -->