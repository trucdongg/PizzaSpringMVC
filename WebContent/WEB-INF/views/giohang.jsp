<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link href="../resources/trangchu/css/giohang.css" rel="stylesheet">
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
   <div class="container  h-100" style="margin-top: 60px">
   		<table id="cart" class="table table-hover table-condensed mt-5">
    				<thead>
						<tr>
							<th style="width:50%">Thức Ăn</th>
							<th style="width:10%">Giá Tiền</th>
							<th style="width:10%">Số Lượng</th>
							
							<th style="width:12%">Kích Thước</th>
							<th style="width:22%" class="text-center">Tổng Tiền</th>
							<th style="width:10%">Chức Năng</th>
						</tr>
					</thead>
				
			
				
					<tbody id="ctgh">
					 <div class="form-group">
      	<label for="diachi"><strong>Giao Tới Địa Chỉ : </strong></label>
     	 <input type="text" class="form-control" name="diachi" id="diachi" value="${diachi }" required >
   			 </div>
   			 	 <div class="form-group">
      	<label for="sdt"><strong>Số Điện Thoại :</strong></label>
     	 <input type="tel" class="form-control" name="sdt" id="sdt" required pattern="0[0-9]{9}" value="${sdt }">
   			 </div>
					<c:forEach var="l" items="${lp}">
					<c:if test="${l.getPizza() != null }">
						<tr>
							<td data-th="Product" >
								<div class="row">
									<div class="col-3 hidden-xs"><img src="../load/pizza/${l.getPizza().getHinh()}" alt="..." class="img-responsive" style="width:200px;height:200px"/></div>
									<div class="col-7 ml-5 pl-5">
										<h4 class="nomargin ">${l.getPizza().getName()}</h4>
										<p>${l.getPizza().getDetail()}</p>
									</div>
								</div>
							</td>
							
							<td data-th="Price">${l.getKt().getGia()}</td>
							<td data-th="Quantity">
								<input type="number" price="${l.getPizza().getDetail()}" class="form-control text-center" value="${l.getSl()}" name="quantity" id="quantity" disabled>
								<p class="d-none">${l.kt.soluong }</p>
							</td>
							
							<td data-th="kt">${l.getKt().getTenkc()} </td>
							<td data-th="Subtotal" class="text-center" id="${l.getPizza().getDetail()}">${l.getKt().getGia()}</td>
							<td class="d-flex" style="padding-top: 80px;" data-th="">
								<button role="update" class="btn btn-primary btn-sm m-1" ctgh-id="${l.getId_ctgh()}">Cập Nhật</button>							
								<button role="delete" class="btn btn-danger btn-sm m-1" ctgh-id="${l.getId_ctgh()}">Xóa</button>	
								
							</td>
						</tr>
						</c:if>
						<c:if test="${l.getPizza() == null && l.getMonanct().getMonan().getIddanhmuc()==1}">
									<tr>
							<td data-th="Product" >
								<div class="row">
								
									<div class="col-3 hidden-xs"><img src="../load/miy/${l.getMonanct().getHinhanh()}" alt="..." class="img-responsive" style="width:200px;height:200px"/></div>
									
									<div class="col-7 ml-5 pl-5">
										<h4 class="nomargin ">${l.getMonanct().getTenmonan()}</h4>
										<p>${l.getMonanct().getMota()}</p>
									</div>
								</div>
							</td>
							
							<td data-th="Price">${l.getMonanct().getGiatien()}</td>
							<td data-th="Quantity">
								<input type="number" price="${l.getMonanct().getMota()}" class="form-control text-center" value="${l.getSoluongmonan()}" name="quantity" id="quantity" disabled>
								<p class="d-none">${l.getMonanct().getSoluong() }</p>
							</td>
							
							<td data-th="kt"> </td>
							<td data-th="Subtotal" class="text-center" id="${l.getMonanct().getMota()}">${l.getMonanct().getGiatien()}</td>
							<td class="d-flex" style="padding-top: 80px;" data-th="">
								<button role="update" class="btn btn-primary btn-sm m-1" ctgh-id="${l.getId_ctgh()}">Cập Nhật</button>							
								<button role="delete" class="btn btn-danger btn-sm m-1" ctgh-id="${l.getId_ctgh()}">Xóa</button>	
								
							</td>
						</tr>
						</c:if>
						<c:if test="${l.getPizza() == null && l.getMonanct().getMonan().getIddanhmuc()==2}">
									<tr>
							<td data-th="Product" >
								<div class="row">
								
									<div class="col-3 hidden-xs"><img src="../load/khaivi/${l.getMonanct().getHinhanh()}" alt="..." class="img-responsive" style="width:200px;height:200px"/></div>
									
									<div class="col-7 ml-5 pl-5">
										<h4 class="nomargin ">${l.getMonanct().getTenmonan()}</h4>
										<p>${l.getMonanct().getMota()}</p>
									</div>
								</div>
							</td>
							
							<td data-th="Price">${l.getMonanct().getGiatien()}</td>
							<td data-th="Quantity">
								<input type="number" price="${l.getMonanct().getMota()}" class="form-control text-center" value="${l.getSoluongmonan()}" name="quantity" id="quantity" disabled>
							<p class="d-none">${l.getMonanct().getSoluong() }</p>
							</td>
							
							<td data-th="kt"> </td>
							<td data-th="Subtotal" class="text-center" id="${l.getMonanct().getMota()}">${l.getMonanct().getGiatien()}</td>
							<td class="d-flex" style="padding-top: 80px;" data-th="">
								<button role="update" class="btn btn-primary btn-sm m-1" ctgh-id="${l.getId_ctgh()}">Cập Nhật</button>							
								<button role="delete" class="btn btn-danger btn-sm m-1" ctgh-id="${l.getId_ctgh()}">Xóa</button>	
								
							</td>
						</tr>
						</c:if>
						<c:if test="${l.getPizza() == null && l.getMonanct().getMonan().getIddanhmuc()==3}">
									<tr>
							<td data-th="Product" >
								<div class="row">
								
									<div class="col-3 hidden-xs"><img src="../load/thucuong/${l.getMonanct().getHinhanh()}" alt="..." class="img-responsive" style="width:200px;height:200px"/></div>
									
									<div class="col-7 ml-5 pl-5">
										<h4 class="nomargin ">${l.getMonanct().getTenmonan()}</h4>
										<p>${l.getMonanct().getMota()}</p>
									</div>
								</div>
							</td>
							
							<td data-th="Price">${l.getMonanct().getGiatien()}</td>
							<td data-th="Quantity">
								<input type="number" price="${l.getMonanct().getMota()}" class="form-control text-center" value="${l.getSoluongmonan()}" name="quantity" id="quantity" disabled>
							<p class="d-none">${l.getMonanct().getSoluong() }</p>
							</td>
							
							<td data-th="kt"> </td>
							<td data-th="Subtotal" class="text-center" id="${l.getMonanct().getMota()}">${l.getMonanct().getGiatien()}</td>
							<td class="d-flex" style="padding-top: 80px;" data-th="">
								<button role="update" class="btn btn-primary btn-sm m-1" ctgh-id="${l.getId_ctgh()}">Cập Nhật</button>							
								<button role="delete" class="btn btn-danger btn-sm m-1" ctgh-id="${l.getId_ctgh()}">Xóa</button>	
								
							</td>
						</tr>
						</c:if>
						</c:forEach>
					</tbody>
				
				
					<tfoot>
						
						<tr>
							<td><a href="../user/thucdon.htm" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp Tục Đặt Hàng</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center font-weight-bold" id="total">Tổng Tiền: <span></span></td>
							<td>
							<a href="#" class="btn btn-success btn-block" style="width:200px;" id="thanhtoan">Thanh Toán <i class="fa fa-angle-right"></i></a>
							<p>${bug}</p>
							</td>
							
						</tr>
					</tfoot>
				</table>
   	</div>
  <!-- Footer -->


  <!-- Bootstrap core JavaScript -->
  <script src="../resources/trangchu/js/jquery.min.js"></script>
  <script src="../resources/trangchu/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/trangchu/js/test.js"></script>
<script>
var total=[...$('td[data-th="Subtotal"]')];
console.log(total);
var tong=0;
var sub = [...$('td[data-th="Subtotal"]')];
sub.forEach(function(e){
	$(e).text($(e).text()*$(e).parent().children('td[data-th="Quantity"]').children('input').val());
	//e.text( e.text() * $('#quantity[price = '+e.attr('id')+']'))
})
total.forEach(function(e){
	tong+=parseInt($(e).text());
	
})
$('td[data-th="Quantity"] input').on('change',function(e){
	tong=0;
	if(e.target.value < 1)
		$(this).val(1);
	else if(e.target.value > parseInt($(this).next().text()))
		$(this).val($(this).next().text());
	var  sum=Number($(this).val())+0;
	var money=$(this).parent().prev().text();
	$(this).parent().next().next().text(sum*money);
	
	console.log(total);
	total.forEach(function(e){
		tong+=parseInt($(e).text());
		
	})
	
	$('#total span').text(tong);
	
	
})	


$('#total span').text(tong);
console.log($('#total span').text());
let soluong = $("#soluonghang").text();

$("button[role='delete']").click(function(){
    let idctgh = $(this).attr("ctgh-id");
    $.ajax({
    	type:"POST",
    	url:"./giohang.htm",
    	data:{
    		ctgh_id: idctgh
    	},
    	success: function(d){
    		console.log(d);
    		if(soluong>0) soluong--;
    		$("#soluonghang").text(soluong);
    		location.reload(true);
    	}
    })  
})




$("button[role='update']").click(function(){
    let idctgh = $(this).attr("ctgh-id");
    var input = $(this).parent().prev().prev().prev().children('input');
    input.removeAttr('disabled');
	var old = input.val();
   $(this).on('click',function(){
	   var input = $(this).parent().prev().prev().prev().children('input');
	   if(input.val() == old)
		   {input.attr('disabled','disabled');
		   location.reload(true);}
	   else
		   $.ajax({
	        	type:"POST",
	        	url:"./update.htm",
	        	data:{
	        		ctgh_id: idctgh,
	        		soluong:input.val()
	        	},
	        	success: function(d){
	        		console.log(d);
	        		location.reload(true);
	        	}
	        })	
   })
    
    
      
})


$("#thanhtoan").click(function(){
if($('#soluonghang').text() > 0){
	if($('#sdt').val() == '' || !$('#sdt').val().match('0[0-9]{9}') || $('#sdt').val().length != 10)
		alert('Vui Lòng Nhập Số Điện Thoại Chính Xác');
	else
	if($('#diachi').val()!=''){
    $.ajax({
    	type:"POST",	
    	url:"./thanhtoan.htm",
    	data:{
    		tongtien: $('#total span').text(),
    		diachi: $('#diachi').val(),
    		sdt:$('#sdt').val(),
    	},
    	success: function(d){
    		alert(d);
    		location.reload(true);
    	},

    });
}else{
	alert("Vui lòng nhập địa chỉ giao hàng");
}
	}
	else{
	alert("Vui lòng đặt hàng ");
}
})
</script>
</body>

</html>