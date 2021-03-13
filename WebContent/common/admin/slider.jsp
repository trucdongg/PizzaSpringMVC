<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">ADMIN </div>
   <div class="list-group list-group-flush">
        <a href="../user/admin.htm" class="list-group-item list-group-item-action bg-light">Đơn Hàng Xử Lý 
        	<c:if test="${sessionScope.duyet!=0}">
        	<span class="bg-danger text-white" style="border-radius: 30px;padding: 5px 10px;">${sessionScope.duyet }</span>
        	</c:if>
        </a>
        <a href="../user/inbill.htm" class="list-group-item list-group-item-action bg-light">Đơn Hàng Đã Duyệt</a>
        <a href="../user/huybill.htm" class="list-group-item list-group-item-action bg-light">Đơn Hàng Đã Hủy</a>
        <a href="../user/khachhang.htm" class="list-group-item list-group-item-action bg-light">Khách Hàng</a>
        <a href="#" class="list-group-item list-group-item-action bg-light" id="monan">Món Ăn</a>
        <div class="d-none drop px-2 ">
        	<div class="drop-content px-3 py-2">
	        	<div><a href="../user/monan.htm">Pizza </a></div>
	        	<div><a href="../user/themmiy.htm">Mỳ Ý </a></div>
	        	<div><a href="../user/themkhaivi.htm">Khai Vị</a></div>
	        	<div><a href="../user/themthucuong.htm">Thức Uống</a></div>
        	</div>
        	        	<button class="btn font-weight-bold ml-3">Hide</button>
        </div>
        <a href="../user/thongke.htm" class="list-group-item list-group-item-action bg-light">Thống Kê</a>
      
        
      </div>
    </div>