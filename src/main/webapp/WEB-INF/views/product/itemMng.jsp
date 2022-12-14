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
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#searchBtn").on("click", function(e) {
		e.preventDefault();
		page(0);
	});
});

function page(page) {
	var searchDateType = $("#searchDateType").val();
	var searchSellStatus = $("#searchSellStatus").val();
	var searchBy = $("#searchBy").val();
	var searchQuery = $("#searchQuery").val();
	
	location.href="/admin/items/" + page + "?searchDateType=" + searchDateType
	+ "&searchSellStatus=" + searchSellStatus
	+ "&searchBy=" + searchBy
	+ "&searchQuery=" + searchQuery;
}
</script>

<style type="text/css">
select {
	margin-right:10px;
}
</style>

<body>
	<header>
		<div id="header-first">
			<div id="header-logo">
				<a href="/"><img src="/resources/img/aqualogo.jpg" id="header-logo-img" /></a>
			</div>
			<form id="headerSearchForm" method="POST" action="#"> 
				<button class="headerSearchForm-btn">
					<i class="tiny material-icons">search</i>
				</button>
				<input name="keyword" placeholder="????????? ?????? ?????????????????? ??????"
					class="headerSearchForm-input" />
			</form>
			
					
					<div id="header-main-menu">
						<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
						<a href="/admin/item/new" class="header-sub-menu">????????????</a>
						</sec:authorize>
						<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
						<a href="/admin/items" class="header-sub-menu">????????????</a>
						</sec:authorize>
						<sec:authorize access="hasAnyAuthority('ROLE_USER')">
						<a href="#" class="header-sub-menu">????????????</a>
						</sec:authorize>
						<sec:authorize access="hasAnyAuthority('ROLE_USER')">
						<a href="#" class="header-sub-menu">????????????</a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
						<a href="/user/login" class="header-sub-menu">?????????</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
						<a href="/user/logout" class="header-sub-menu">????????????</a>
						</sec:authorize>
						<a href="/members/new" class="header-sub-menu">????????????</a>
					</div> 
					
				
							
							
		</div>
		</header>
<form:form action="/admin/items" method="get" modelAttribute="items">

<table class="table">

<thead>
<tr>
	<td>???????????????</td>
	<td>?????????</td>
	<td>??????</td>
	<td>?????????</td>
	<td>?????????</td>
</tr>
</thead>
<tbody>
	<c:forEach var="item" items="${items.getContent()}" varStatus="status">
	<tr>
		<td> ${item.id} </td>
		<td><a href="/admin/item/${item.id}">${item.itemNm}</a></td>
	    <td>${item.itemSellStatus eq ItemSellStatus.SELL ? '?????????' : '??????' }</td> 
		<%-- <td><c:if test="${item.itemSellStatus eq ItemSellStatus.SELL }"> ????????? </c:if>
			<c:if test="${item.itemSellStatus ne ItemSellStatus.SELL}"> ?????? </c:if>
		</td> --%>
		<td> ${item.createdBy } </td>
		<td> ${item.regTime} </td>
	</tr>
	</c:forEach>
</tbody>
</table>

<!-- ????????? -->
<%-- <c:set var="start" value="${(items.number/maxPage)*maxPage+1}"/>
<c:set var="end" value="${(items.totalPages == 0) ? 1 : (start + (maxPage-1) < items.totalPages ?
start + (maxPage-1) : items.totalPages)}"/>
<ul class="pagination justify-content-center">
	<li class="page-item"> 
	<a href="javascript:page(' + ${items.number-1} +')" aria-label="Previous" class="page-link">
	<span aria-hidden="true"></span>
	</a>
	</li>
</ul>
 --%>





</form:form>

</body>
</html>