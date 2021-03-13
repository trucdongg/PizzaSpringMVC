<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>ThemePizza</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../resources/newtrangchu/img/logo2.jpg">
     <link href="../resources/newtrangchu/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/newtrangchu/css/newpizza.css" rel="stylesheet">
    <link href="../resources/newtrangchu/css/pizza.css" rel="stylesheet">
    
</head>

<body>
 
<%@include file="../../common/newtrangchu/header.jsp"%>
 <main class="black m-0 p-0">
        <div class="container-fluid">
            <!-- Pizza row quy định  -->
            <div class="pizzas1 py-5 text-white row align-items-center">
                <!-- Phần tử pizza -->
                <div class="pizza1 bg-dark text-left">
                    <div class="pizza1-img">
                        <img src="../resources/newtrangchu/img/C19.png" alt="pizza" width="100%">
                    </div>

                    <div class="pizza1-name h4">Pizza Name</div>
                    <div class="pizza1-price">$ 581</div>
                    <div class="pizza1-des text-white">Hấp dẫn</div>
                    <div class="pizza1-foot">
                        <select name="" id="" class="custom-select">
                        <option value="1">small</option>
                        <option value="2">medium</option>
                        <option value="3">big</option>
                    </select>
                        <button class="btn btn-danger">Add to Cart</button>
                    </div>
                </div>
                <!-- Phần tử pizza -->

            </div>

        </div>
    </main>

        <!-- Phần giởi thiệu kết thúc -->
<%@include file="../../common/newtrangchu/footer.jsp"%>

   
  <script src="../resources/newtrangchu/js/bootstrap.min.js"></script>
   <script src="../resources/newtrangchu/js/jquery.js"></script> 
  <script src="../resources/newtrangchu/js/bootstrap.bundle.min.js"></script> 
     <script src="../resources/newtrangchu/js/test.js "></script> 
    <script>
        $('.pizza').on('click', function() {
            $('.pizza').removeClass('active');
            $(this).addClass('active');
        })
        $('nav ul a').on('click', function(e) {
            e.preventDefault();
            $('nav ul a').removeClass('active');
            $(this).addClass('active');
        })
    </script>
</body>

</html>