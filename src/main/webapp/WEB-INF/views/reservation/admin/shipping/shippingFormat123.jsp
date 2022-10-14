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

</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/reservation/admin/functionNav.jsp"></jsp:include>
<div class="main">
	<form:form method="POST" modelAttribute="rsb">
	<div class="title-ship"><img src="<c:url value='/image/ship/icons8_rocket_1.ico' />" />出貨申請單</div>
	<table class="memberTable">
	<tr>
		<td>留言ID</td>
		<td>${contactId}</td>
	</tr>
	
	<tr>
		<td>店家名稱</td>
		<td><form:input path="shopNameForShipping" value="${shop.shopName}" /></td>
	</tr>
	<tr>
		<td>地址</td>
		<td><form:input path="shopAddressForShipping" value="${shop.address}" /></td>
	</tr>
	<tr>
	<td>商品</td>
		<td>	
				<form:checkbox style="width: 17px;" class="checkbox-choice" path="shippingItems" value="玩具"></form:checkbox>
				<form:label path="shippingItems">玩具</form:label>
				<form:checkbox style="width: 17px;" class="checkbox-choice" path="shippingItems" value="零食" ></form:checkbox>
				<form:label class="lbl" path="shippingItems">零食</form:label>
				<form:checkbox style="width: 17px;" class="checkbox-choice" path="shippingItems" value="飼料"></form:checkbox>
				<form:label path="shippingItems">飼料</form:label>
				<form:checkbox style="width: 17px;" class="checkbox-choice" path="shippingItems" value="罐頭"></form:checkbox>
				<form:label path="shippingItems">罐頭</form:label>
		</td>
	</tr>
	<tr>
		<td>出貨備註</td>
		<td><form:textarea path="shippingRemark" type="text" /></td>
	</tr>
	</table>
	<div class="btn-div">
		<button id="ship-submit" type="submit"><img style="width: 40px;" src="<c:url value='/image/ship/icons8_walking_50px.png' />" />安排出貨</button>
	</div>
	</form:form>
	
</div>

</body>
</html>