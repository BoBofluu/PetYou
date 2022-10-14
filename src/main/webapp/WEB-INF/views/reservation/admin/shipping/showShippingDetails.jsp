<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>出貨</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/searchOneReservation.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/shippingFormat.css'/>">
<style>

	input, textarea{
		background-color: transparent;
		border:none;
	}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/reservation/admin/functionNav.jsp"></jsp:include>
<div class="main">
	<form:form method="POST" modelAttribute="rsb">
	<div class="title-ship"><img src="<c:url value='/image/ship/icons8_rocket_1.ico' />" />出貨紀錄</div>
	<table class="memberTable">
	<tr>
		<td>留言ID</td>
		<td><form:input readonly="true" path="reservationContactBean.contactID" /></td>
	</tr>
	
	<tr>
		<td>店家名稱</td>
		<td><form:input readonly="true" path="shopNameForShipping" value="${shop.shopName}" /></td>
	</tr>
	<tr>
		<td>地址</td>
		<td><form:input readonly="true" path="shopAddressForShipping" value="${shop.address}" /></td>
	</tr>
	<tr>
	<td>商品</td>
		<td><form:input readonly="true" path="shippingItems" />
		</td>
	</tr>
	<tr>
		<td>出貨備註</td>
		<td><form:textarea readonly="true" path="shippingRemark" type="text" /></td>
	</tr>
	</table>
	</form:form>
	
</div>

</body>
</html>