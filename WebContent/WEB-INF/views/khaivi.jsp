<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
<link href="../resources/newtrangchu/css/pizza.css" rel="stylesheet">

<link href="../resources/newtrangchu/css/newpizza.css" rel="stylesheet">
  <title>My Pizza</title>
	<link rel="shortcut icon" href="../resources/trangchu/img/logo2.jpg">
  <!-- Bootstrap core CSS -->
  <link href="../resources/trangchu/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/trangchu/css/bootstrap.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../resources/trangchu/css/dathang.css" rel="stylesheet">
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

	a.col{
	text-decoration: none;
	transition: 0.2s;
		color: black;
	border: 1px solid white;
	border-bottom: none;
	background: black;	
	text-transform: uppercase;
	font-weight: bold;
	padding: 30px 10px;
	display:flex;
	align-items-center;
	justify-content:center;
	} 	
	a.col:first-child{

		border-left: none;
		
	}
	a.col:last-child{
		border-right: none;
	}
	a.bg-dark:hover{
	color:white;
	border-bottom: 2px solid red !important;
	}
	.custom-number{
	border: none;
	border-radius: 6px;
    margin: 0 10px;
    padding: 7px 10px;
	}
	.product{
		transition: 0.2s;
	}
	.product:hover{
		transform: scale(1.1);
	}
	button[role="order"]{
		transition: 0.3s;
		font-weight: bold;
	}
	button[role="order"]:hover{
		background-color: white;
		color: black;
	}
</style>
</head>

<body>
<%@include file="../../common/trangchu/header.jsp"%>
 <div class="container">

    <div class="row">

    <%@include file="../../common/trangchu/navmenu.jsp"%>
    
    
      <!-- /.col-lg-3 -->
		<div class="col-12 w-100 mt-5">
			<img src="../resources/trangchu/img/header-starter.jpg" alt="banner" width="100%">
		</div>
      <div class="col-lg-12">
        <div class="row mt-5">
        <div class="d-none bg-primary pop" style="width:100px;height:100px;">a</div>
		<c:forEach var="l" items="${list}">
		<div class="product col-lg-6 col-md-6 mb-5 ">
            <div class="d-flex black h-100">
              <a href="#" class="col-6" style="width: 180px;height:180px;"><img class="card-img-top" src="../load/khaivi/${l.hinhanh}" width="100%" height="100%"></a>
              <div class="col-6 card-body text-white">
                <h4 class="card-title markshow">
                  <p style="height:100px;"><b>${l.tenmonan}</b></p>   	
                </h4>
                <h5 class="d-flex">
                   <div class="px-0 col-6" id="${l.idmonan}price">
                   $	${l.giatien}
                   </div>
					
				</h5>
                <p class="card-text" style="height:100px">${l.mota}</p>
                  <p class="card-text d-none">${l.soluong}</p>
                 <!-- Các div chức năng -->
                 <div class="flex flex-column">
                <div class="my-3 d-flex align-items-center">
                <!-- Input số lượng -->
                <input class="col-4 custom-number" role="cnt" id="${l.idmonan}" type="number" value="1" placeholder="1"/>
 				<!-- Select kích thước -->
             
    			
    			
            </div>
              </div>
             
            <button role="order" class="btn btn-danger w-100 " monan-id="${l.idmonan}">Đặt Hàng</button>
            
              </div>
            </div>
         
 			</div>
          </c:forEach> 
     
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  <!-- Footer -->
<%@include file="../../common/trangchu/footer.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/trangchu/js/jquery.min.js"></script>
  <script src="../resources/trangchu/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/trangchu/js/test.js"></script>
     <script>
 	$('input[role="cnt"]').on('change',function(e){
			var max = parseInt($(this).parent().parent().prev().text())
			if(e.target.value < 1)
				$(this).val(1);
			if(e.target.value >= max)
				$(this).val(max);
		})
                $(function(){
                  $('select').on('click', function() {
                    var id = $(this).prop('id');
                    var val = $(this).val();
                    var gia = $('#' + val).text();
                    console.log(val)
                    $('#' + id + 'price').text("$ "+gia);
                })
                let soluong = $("#soluonghang").text();
   				
                 $("button[role='order']").click(function(){
                	 if( $('#navbarDropdown').text()){
                    let idMonan = $(this).attr("monan-id");
                    let giatien = $(this).parent().children('h5').children().text().trim().split('$')[1].trim();
                    console.log(idMonan);
                    
                   // let size = $(this).prev().children().children('select[name="kichthuoc"]').val() %10;
                   // console.log(size);
                   // console.log($('#'+idPizza+'[role="cnt"]').val());
                    $.ajax({
                    	type:"POST",
                    	url:"./miy.htm",
                    	data:{
                    		idMonan: idMonan,
                    		//size: size,
                    		soluong: $('#'+idMonan+'[role="cnt"]').val(),
                    		giatien: giatien,
                    	},
                    	success: function(d){
                    		console.log(d);
                    		$("#soluonghang").text(soluong);
                    		location.reload(true);
                    	}
                    })

                	 }else{
                		 alert("Bạn Phải Đăng Nhập Trước Khi Đặt Hàng");
                		 location.href = "../test/dangnhap.htm"
                	 }
                  })
                })
            
      </script>
       
</body>

</html>