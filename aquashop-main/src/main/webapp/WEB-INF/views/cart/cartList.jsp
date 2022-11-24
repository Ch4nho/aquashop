<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../header.jsp" %>
<title>AQUA MAIN</title>
</head>

<script type="text/javascript">

        $(document).ready(function(){
            $("input[name=cartChkBox]").change( function(){
                getOrderTotalPrice();
            });
        });

        function getOrderTotalPrice(){
            var orderTotalPrice = 0;
            $("input[name=cartChkBox]:checked").each(function() {
                var cartItemId = $(this).val();
                var price = $("#price_" + cartItemId).attr("data-price");
                var count = $("#count_" + cartItemId).val();
                orderTotalPrice += price*count;
            });

            $("#orderTotalPrice").html(orderTotalPrice+'원');
        }

        function changeCount(obj){
            var count = obj.value;
            var cartItemId = obj.id.split('_')[1];
            var price = $("#price_" + cartItemId).data("price");
            var totalPrice = count*price;
            $("#totalPrice_" + cartItemId).html(totalPrice+"원");
            getOrderTotalPrice();
            updateCartItemCount(cartItemId, count);
        }

        function checkAll(){
            if($("#checkall").prop("checked")){
                $("input[name=cartChkBox]").prop("checked",true);
            }else{
                $("input[name=cartChkBox]").prop("checked",false);
            }
            getOrderTotalPrice();
        }

        function updateCartItemCount(cartItemId, count){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var url = "/cartItem/" + cartItemId+"?count=" + count;

            $.ajax({
                url      : url,
                type     : "PATCH",
                beforeSend : function(xhr){
                    /* 데이터를 전송하기 전에 헤더에 csrf값을 설정 */
                    xhr.setRequestHeader(header, token);
                },
                dataType : "json",
                cache   : false,
                success  : function(result, status){
                    console.log("cartItem count update success");
                },
                error : function(jqXHR, status, error){

                    if(jqXHR.status == '401'){
                        alert('로그인 후 이용해주세요');
                        location.href='/members/login';
                    } else{
                        alert(jqXHR.responseJSON.message);
                    }

                }
            });
        }

        function deleteCartItem(obj){
            var cartItemId = obj.dataset.id;
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var url = "/cartItem/" + cartItemId;

            $.ajax({
                url      : url,
                type     : "DELETE",
                beforeSend : function(xhr){
                    /* 데이터를 전송하기 전에 헤더에 csrf값을 설정 */
                    xhr.setRequestHeader(header, token);
                },
                dataType : "json",
                cache   : false,
                success  : function(result, status){
                    location.href='/cart';
                },
                error : function(jqXHR, status, error){

                    if(jqXHR.status == '401'){
                        alert('로그인 후 이용해주세요');
                        location.href='/members/login';
                    } else{
                        alert(jqXHR.responseJSON.message);
                    }

                }
            });
        }

        function orders(){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var url = "/cart/orders";

            var dataList = new Array();
            var paramData = new Object();

            $("input[name=cartChkBox]:checked").each(function() {
                var cartItemId = $(this).val();
                var data = new Object();
                data["cartItemId"] = cartItemId;
                dataList.push(data);
            });

            paramData['cartOrderDtoList'] = dataList;

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
                    location.href='/orders';
                },
                error : function(jqXHR, status, error){

                    if(jqXHR.status == '401'){
                        alert('로그인 후 이용해주세요');
                        location.href='/members/login';
                    } else{
                        alert(jqXHR.responseJSON.message);
                    }

                }
            });
        }

        

    </script>
    
    
    

<body>



	
	
	
	
	
	
	</main>
	<!-- End of main-prd -->
	</div>
	<!-- End of Container -->
<%@include file="../footer.jsp" %>	

</body>
</html>