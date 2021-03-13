 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="col-lg-12 h-100">
        <div class=" mt-5 row bg-dark">
        
          <a href="../user/combo.htm" class="bg-dark text-white  col ">Thực Đơn Đặc Biệt</a>
          <a href="../user/khuyenmai.htm" class="bg-dark text-white  col " >Ưu Đãi</a>
          <c:if test="${sessionScope.kt!='yes'}">
          <a href="../user/thucdon.htm" class="bg-dark text-white  col " >Pizza</a>
          </c:if>
           <c:if test="${sessionScope.kt=='yes'}">
          <a href="../user/pizza.htm" class="bg-dark text-white  col " >Pizza</a>
          </c:if>
           <c:if test="${sessionScope.kt!='yes'}">
          <a href="../user/thucdonmiy.htm" class="bg-dark text-white col" >Mì Ý </a>
          </c:if>
           <c:if test="${sessionScope.kt=='yes'}">
          <a href="../user/miy.htm" class="bg-dark text-white col" >Mì Ý </a>
          </c:if>
           <c:if test="${sessionScope.kt!='yes'}">
          <a href="../user/thucdonkhaivi.htm" class="bg-dark text-white  col " >Khai Vị</a>
          </c:if>
           <c:if test="${sessionScope.kt=='yes'}">
          <a href="../user/khaivi.htm" class="bg-dark text-white col" >Khai Vị </a>
          </c:if>
           <c:if test="${sessionScope.kt!='yes'}">
          <a href="../user/thucdonthucuong.htm" class="bg-dark text-white col ">Thức Uống</a>
          </c:if>
 		<c:if test="${sessionScope.kt=='yes'}">
          <a href="../user/thucuong.htm" class="bg-dark text-white col" >Thức Uống </a>
          </c:if>
        </div>

      </div>