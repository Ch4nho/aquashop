<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp" %>
<title>AQUA MAIN</title>
</head>

<body>
	<!-- Start of Container -->
	<div id="container">
	<!-- Start of Carousel -->
	<div id="demo" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ul class="carousel-indicators">
		  <li data-target="#demo" data-slide-to="0" class="active"></li>
		  <li data-target="#demo" data-slide-to="1"></li>
		  <li data-target="#demo" data-slide-to="2"></li>
		</ul>
        
		<!-- The slideshow -->
		<div class="carousel-inner">
		  <div class="carousel-item active">
		    <img src="resources/img/banner/banner01.jpg" alt="ban-img-0" width="1100" height="500">
		  </div>
		  <div class="carousel-item">
		    <img src="resources/img/banner/banner02.jpg" alt="ban-img-1" width="1100" height="500">
		  </div>
		  <div class="carousel-item">
		    <img src="resources/img/banner/banner03.jpg" alt="ban-img-2" width="1100" height="500">
		  </div>
		</div>
        
	     <!-- Left and right controls -->
	     <a class="carousel-control-prev" href="#demo" data-slide="prev">
	       <span class="carousel-control-prev-icon"></span>
	     </a>
	     <a class="carousel-control-next" href="#demo" data-slide="next">
	       <span class="carousel-control-next-icon"></span>
	     </a>
     </div>
     <!-- End of Carousel -->

	<!-- Start of main-prd -->
	<main id="main-prd" class="frame">
		<div class="main-pagetitle">
			<h1 class="main-pagetitle-word">
			상품 리스트
			</h1>
		</div>

<!-- 	<div class="main-item-box"> -->
<!-- 			<div class="main-prd-list"> -->
<%-- 		<c:forEach var="item" items="${items.getContent()}" varStatus="status"> --%>
<!-- 					<div class="main-prd-box"> -->
<!-- 					<a class="link-prod" href="#"></a> -->
<%-- 						<img src="${item.imgUrl }" class="main-prd-item-img"alt="${item.itemNm}" /> <!-- 상품이미지 --> --%>
<!-- 						<ul class="main-prd-item"> -->
<!-- 							<li class="prd-item-company">제조사</li> 제조사 -->
<%-- 							<li class="prd-item-name">${item.itemNm}</li> <!-- 상품명 --> --%>
<%-- 							<li class="prd-item-price">${item.price}원</li> <!-- 가격 --> --%>
<!-- 						</ul> -->
<!-- 					</div>	 -->
<%-- 				</c:forEach>	 --%>
<!-- 			</div> -->
<!-- 		</div> -->
	
		
		
		<div class="row">
		<c:forEach var="item" items="${items.getContent()}" varStatus="status">
			<div class="col-md-4 margin">
				     <div class="card">
				     	<a href="/item/${item.id }" class="text-dark">
				     	<img src="${item.imgUrl }"  class="card-img-top" alt="${item.itemNm}" height="300">
				                             <div class="card-body">
                            <h4 class="card-title">${item.itemNm}</h4>
                            <p class="card-text">${item.itemDetail}</p>
                            <h3 class="card-title text-danger">${item.price}원</h3>
				     </div>
				</a>
			</div>
		</div>
	
		</c:forEach>
	</div>



	
	
	
	
	
	</main>
	<!-- End of main-prd -->
	</div>
	<!-- End of Container -->
<%@include file="footer.jsp" %>	

</body>
</html>