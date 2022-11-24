<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <%@include file="../header.jsp" %> --%>
<title>상품등록</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>


<script type="text/javascript">
$(document).ready(function() {
	var errorMessage = "${errorMessage}";
	if(errorMessage != null) {
		alert(errorMessage);
	}
	bindDomEvent();
});

function bindDomEvent() {
	$(".custom-file-input").on("change", function() {
		var fileName = $(this).val().split("\\").pop();  //이미지 파일명
		var fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
		fileExt = fileExt.toLowerCase();
		
		if(fileExt != "jpg" && fileExt != "jpeg" && fileExt != "gif" && fileExt != "png" && fileExt != "bmp") {
		alert("이미지 파일만 등록이 가능합니다.");
		return;
		}
		$(this).siblings(".custom-file-label").html(fileName);
	});
}
</script>
<!-- 사용자 css 추가 -->
<style type="text/css">
.input-group {
	margin-bottom: 15px
}
.img-div {
	margin-bottom : 10px
}
.fieldError {
	color : #bd2130;
}
</style>
<body>

<form:form method="post" enctype="multipart/form-data" modelAttribute="itemFormDto">
<c:choose>
<c:when test="${empty itemFormDto.id }">
<p class="h2" action="/admin/item/new">
상품 등록
</p>
</c:when>
<c:otherwise>
<p class="h2" action="/admin/item/${itemFormDto.id }">
상품 수정
</p>
</c:otherwise>
</c:choose>

<!-- <div style="text-align:center"> -->
<%-- <c:choose> --%>
<%-- <c:when test="${empty itemFormDto.id}"> --%>
<%--  <formaction="/admin/item/new" type="submit" class="btn btn-primary">저장</formaction> --%>
<%-- </c:when> --%>
<%-- <c:otherwise> --%>
<%-- <button formaction="/admin/item/${itemFormDto.id}" type="submit" class="btn btn-primary">수정</button> --%>
<%-- </c:otherwise> --%>
<%-- </c:choose> --%>
<!-- </div> -->
<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> --%>
<%-- </form:form> --%>



<input type="hidden" name="id">
<div class="form-group">
	<form:select path="itemSellStatus" class="form-control-lg" >
		<form:option value="SELL">판매중</form:option>
		<form:option value="SOLD_OUT">품절</form:option>
	</form:select>

</div>

<div class="input-group">

	<span class="input-group-text">카테고리</span>
	<form:select path="categoryId" class="form-control-lg" >
		<form:option value="1">열대어</form:option>
		<form:option value="2">어항</form:option>
		<form:option value="3">먹이</form:option>
		<form:option value="4">조명/히터</form:option>
		<form:option value="5">기타</form:option>
	</form:select>

</div>
 

<div class="input-group">
	<div class="input-group-prepend">
		<span class="input-group-text">상품명</span>
	</div>
	<form:input path="itemNm" class="form-control" placeholder="상품명을 입력해주세요"/>
	<form:errors path="itemNm" class="fieldError" />
</div>
<form:errors path="itemNm" />

<div class="input-group">
	<div class="input-group-prepend">
		<span class="input-group-text">가격</span>
	</div>
	<form:input path="price" class="form-control" placeholder="상품의 가격을 입력해주세요"/>
	<form:errors path="price" class="fieldError" />
</div>

<div class="input-group">
	<div class="input-group-prepend">
		<span class="input-group-text">재고</span>
	</div>
	<form:input path="stockNumber" class="form-control" placeholder="상품의 재고를 입력해주세요"/>
	<form:errors path="stockNumber" class="fieldError" />
</div>

<div class="input-group">
	<div class="input-group-prepend">
		<span class="input-group-text">상품 상세 내용</span>
	</div>
	<form:textarea path="itemDetail" class="form-control" aria-label="With textarea"/>
	<form:errors path="itemDetail" class="fieldError" />
</div>

<%-- <c:if test="${empty itemFormDto.itemImgDtoList}">
<div class="form-group">
<c:forEach var="num" begin="1" end="5" >
<div class="custom-file img-div">
<input type="file" class="custom-file-input" name="itemImgFile">
<label class="custom-file-label">상품이미지${num}</label>
</div>
</c:forEach>
<form:hidden path="itemImgIds"/>
</div>
</c:if> --%>
<c:if test="${empty itemFormDto.itemImgDtoList}">
<div class="form-group">
<div class="custom-file img-div">
<input type="file" class="custom-file-input" name="itemImgFile">
<form:hidden path="itemImgIds"/>
<label class="custom-file-label">상품이미지</label>
</div>
</div>
</c:if>


<c:if test="${!empty itemFormDto.itemImgDtoList}">
<div class="form-group">
<c:forEach var="itemImgDto" items="${itemFormDto.itemImgDtoList}" varStatus="status">
<div class="custom-file img-div">
<input type="file" class="custom-file-input" name="itemImgFile">
<input type="hidden" name="itemImgIds" value="${itemImgDto.id}">
<label class="custom-file-label">
<c:choose>
<c:when test="${!empty itemImgDto.oriImgName}">
<p>${itemImgDto.oriImgName} </p>
</c:when>
<c:otherwise>
<p>상품이미지 ${status.index+1} </p>
</c:otherwise>
</c:choose>
</label>
</div>
</c:forEach>
</div>
</c:if>

<div style="text-align:center">
<c:choose>
<c:when test="${empty itemFormDto.id}">
<button formaction="/admin/item/new" type="submit" class="btn btn-primary">저장</button>
</c:when>
<c:otherwise>
<button formaction="/admin/item/${itemFormDto.id}" type="submit" class="btn btn-primary">수정</button>
</c:otherwise>
</c:choose>
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
</form:form>

</body>
</html>