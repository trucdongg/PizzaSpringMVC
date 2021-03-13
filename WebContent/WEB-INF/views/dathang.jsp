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
	.tag::before{
		content: 'Hết hàng';
		position: absolute;
		top: 0;
		left: 0;
		padding: 10px;
		color: white;
		font-weight: bold;
		background-color: #ff4d4d;
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
			<img src="../resources/trangchu/img/header-pizza.jpg" alt="banner" width="100%">
		</div>
      <div class="col-lg-12">
        <div class="row mt-5">
        <div class="d-none bg-primary pop" style="width:100px;height:100px;">a</div>
		<c:forEach var="l" items="${list}">
		
		<div class="product col-lg-6 col-md-6 mb-5 ">
			
            <div class="d-flex black h-100">
              <a href="#" class="col-6" style="width: 180px;height:180px;"><img class="card-img-top" src="../load/pizza/${l.hinh}" width="100%" height="100%"></a>
              <div class="col-6 card-body text-white">
                <h4 class="card-title markshow" style="height: 60px !important;">
                  <p><b>${l.name}</b></p>   	
                </h4>
              
                <h5 class="d-flex">
                   <div class="px-0 col-6" id="${l.getId_pizza()}price"  style="height: 30px !important;">
                   $	${l.getKichthuoc().get(0).getGia()}
                   </div>
				
				</h5>
				
                <p class="card-text" style="height:100px;overflow:hidden">${l.detail}</p>
                <p class="d-none card-text soluong" ></p>
                 <!-- Các div chức năng -->
                 <div class="flex flex-column"> 
                <div class="my-3 d-flex align-items-center">
                <!-- Input số lượng -->
                <input class="col-4 custom-number" role="cnt" pid="${l.getId_pizza()}" type="number" value="1" placeholder="1"/>
 				<!-- Select kích thước -->
 				
             	<select class=" col-6 mx-2 browser-default custom-select" name="kichthuoc" id="s_${l.getId_pizza()}">
             	
          		<c:forEach var="u" items="${l.getKichthuoc()}">
          		<c:if test="${u.getSoluong()!=0 }">
          		<option pizzaSize="${s.getId_kichthuoc()}" value="${u.getId_kichthuoc()}" >${u.getTenkc()}</option> 
            	</c:if>
            	</c:forEach>
    			</select>
    			
    			<c:forEach var="s" items="${l.getKichthuoc()}">
    			 <div class="d-none text-primary sl${s.getId_kichthuoc()}">${s.getSoluong()}</div>
  				 <div class="d-none mark${s.getId_kichthuoc()}">${s.getGia()}</div>
  				</c:forEach>
  				
  				
            </div>
              </div>
             
            <button role="order" class="btn btn-danger w-100 " pizza-id="${l.getId_pizza()}">Đặt Hàng</button>
            
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
     			var max= parseInt($(this).parent().parent().prev().text());
     			if(e.target.value < 1)
     				$(this).val(1);
     			else if(e.target.value > max)
     				$(this).val(max);
     		})
     		// id kichthuoc
     		var select = [...$('select')];
     		select.map( (e) => {
     			var val = $(e).val();
     			var sl = $('.sl'+val).text();
     			console.log(sl);
     			$(e).parent().parent().prev().text(sl);
     			
     			if(val == "" || val == null) $(e).parent().parent().parent().parent().parent().addClass('tag');
     			
     		});
                
                  $('select').on('click', function() {
                    var id = $(this).prop('id').split('_')[1];
                    var val = $(this).val();
                    var gia = $('.mark' + val).text();
                    var sl = $('.sl'+val).text();
                    console.log(id);
                    console.log(val);
                    console.log(sl);
                    $('#' + id + 'price').text("$ "+gia);
                    $(this).parent().parent().prev().text(sl);
                    var max = sl;
                    if( $(this).prev().val() >= sl ) $(this).prev().val(sl);
                    
                    
                })
              
               
                let soluong = $("#soluonghang").text();
   				
                 $("button[role='order']").click(function(){
                	 if( $('#navbarDropdown').text()){
                    let idPizza = $(this).attr("pizza-id");
                    let giatien = $(this).parent().children('h5').children().text().trim().split('$')[1].trim();
                    
                    let soluong = $("#soluonghang").text();
                    console.log(idPizza);
                    console.log(giatien);
                    
                    let size = $(this).prev().children().children('select[name="kichthuoc"]').val();
                    console.log(size);
                   console.log(($('.custom-number[pid ='+idPizza+']').val()));
                   $.ajax({
                   	type:"POST",
                   	url:"./datpizza.htm",
                   	data:{
                   		idPizza: idPizza,
                   		size: size,
                   		soluong: parseInt(($('.custom-number[pid ='+idPizza+']').val())),
                   		giatien: giatien
                   	},
                   	success: function(d){
                   		console.log(d);
                   		$("#soluonghang").text(soluong);
                   		location.reload(true);
                   	},error: function(e){
                   		alert("Tạm thời hết hàng");
                   	}
                   })

               	 }else{
               		 alert("Bạn Phải Đăng Nhập Trước Khi Đặt Hàng");
               		 location.href = "../test/dangnhap.htm"
               	 }
                })
            
      </script>
       
</body>

</html>