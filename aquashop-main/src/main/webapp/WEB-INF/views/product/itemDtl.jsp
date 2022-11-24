<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="com.shop.aqua.constant.*" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/style.css" >

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- joinForm icons -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- swiper-wrapper script -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- kakao script -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Iamport -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- End of Script -->
<meta charset="UTF-8">
<title>상품관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<script type="text/javascript">
        $(document).ready(function(){

            calculateToalPrice();

            $("#count").change( function(){
                calculateToalPrice();
            });
        });

        function calculateToalPrice(){
            var count = $("#count").val();
            var price = $("#price").val();
            var totalPrice = price*count;
            $("#totalPrice").html(totalPrice + '원');
        }

        function order(){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var url = "/order";
            var paramData = {
                itemId : $("#itemId").val(),
                count : $("#count").val()
            };

            var param = JSON.stringify(paramData);

            $.ajax({
                url      : url,
                type     : "POST",
                contentType : "application/json",
                data     : param,
                beforeSend : function(xhr){
                    /* 데이터를 전송하기 전에 헤더에 csrf값을 설정 */
                    xhr.setRequestHeader(header, token);
                },
                dataType : "json",
                cache   : false,
                success  : function(result, status){
                    alert("주문이 완료 되었습니다.");
                    location.href='/';
                },
                error : function(jqXHR, status, error){

                    if(jqXHR.status == '401'){
                        alert('로그인 후 이용해주세요');
                        location.href='/members/login';
                    } else{
                        alert(jqXHR.responseText);
                    }

                }
            });
        }

        function addCart(){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var url = "/cart";
            var paramData = {
                itemId : $("#itemId").val(),
                count : $("#count").val()
            };

            var param = JSON.stringify(paramData);

            $.ajax({
                url      : url,
                type     : "POST",
                contentType : "application/json",
                data     : param,
                beforeSend : function(xhr){
                    /* 데이터를 전송하기 전에 헤더에 csrf값을 설정 */
                    xhr.setRequestHeader(header, token);
                },
                dataType : "json",
                cache   : false,
                success  : function(result, status){
                    alert("상품을 장바구니에 담았습니다.");
                    location.href='/';
                },
                error : function(jqXHR, status, error){

                    if(jqXHR.status == '401'){
                        alert('로그인 후 이용해주세요');
                        location.href='/members/login';
                    } else{
                        alert(jqXHR.responseText);
                    }

                }
            });
        }

    </script>
</head>
<body>




	 <input type="hidden" id="itemId" value="${item.id}">
	 
		
		
		 <div class="d-flex">
        <div class="repImgDiv">

		  <img src="${item.itemImgDtoList[0].imgUrl}" class = "rounded repImg" alt="${item.itemNm}">
	<c:choose>	  
		<c:if test="${item.itemSellStatus == T(com.shop.constant.ItemSellStatus).SELL}">

		<span class="badge badge-primary mgb-15">
				판매중
		 </span>
		 </c:if>
		<c:otherwise>
			<span class="badge btn-danger mgb-15">품절</span>
		</c:otherwise>
		
		</c:choose>
	</div>
</div>







</body>
</html>