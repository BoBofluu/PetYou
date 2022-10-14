<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/searchOneReservation.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/moreFunction.css'/>">

<script>
/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	
	<div id="mySidenav" class="sidenav">
  		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  		<c:choose>
			<c:when test="${login}">
				<a class="functionName" href="<c:url value='/searchAllReservation' />"> <img src="<c:url value='/image/reservation/預約查詢(咖啡色字體).png' />" />
				</a>	
			</c:when>
			<c:otherwise>
				<a class="functionName" href="<c:url value='/signinCheckcc' />"> <img src="<c:url value='/image/reservation/我的預約(咖啡色字體).png' />"/>
				</a>
			</c:otherwise>
		</c:choose>	
  		<a class="functionName" href="<c:url value='/shop/salonList' />"><img src="<c:url value='/image/reservation/預約美容(咖啡色字體).png' />"/></a>
  		<a class="functionName" href="<c:url value='/shop/hospitalList' />"><img src="<c:url value='/image/reservation/預約診所(咖啡色字體).png' />"/></a>
  		<a class="functionName" href="<c:url value='/complaint' />"><img src="<c:url value='/image/reservation/我要回饋(咖啡色字體).png' />"/></a>
  	</div>
<span class="moreFunction"  onclick="openNav()"><img  alt="" src="<c:url value='/image/reservation/更多功能(咖啡色字體).png' />"></span>

<div id="main">
	<div class="number">預約單號 ${rib.reservation.reservationID}</div>
	<div class="shopInfo">
		<span class="title">店家資訊 </span>
		<img class="icon" src="<c:url value='/image/searchForReservation/icons8-shop-local-64.png' />" />
		<hr>
			<span>店家ID: ${rib.shopForReservation.shopID}</span><br>
			<span>店家名稱: ${rib.shopForReservation.shopName}</span><br>
			<span>店家電話: ${rib.shopForReservation.phone}</span><br>
			<span>店家地址: ${rib.shopForReservation.address}</span><br>
			<img class="shopPic" src="${rib.shopForReservation.environmentalPhotos}" />
	</div>
	
	<div class="reservationInfo">
		<span class="title">預約資訊</span>
		<img class="icon2" src="<c:url value='/image/searchForReservation/icons8-romantic-document-100.png' />" />
		<hr>
			<span>時間: ${rib.reservation.reservationDate} ${rib.reservation.reservationTime}</span><br>
			<span>種類: ${rib.reservation.serviceType}</span><br>
		<c:choose>
		<c:when test="${rib.shopForReservation.type == '醫療'}">
			<span>醫生: ${rib.hospital.doctorName}</span><br>
			<span>項目: ${rib.hospital.hItems}</span><br>
		</c:when>
		<c:when test="${rib.shopForReservation.type == '美容'}">
		<span>項目: ${rib.salon.sItems}</span><br>
		</c:when>
		</c:choose>
			<span>抽獎: ${rib.reservation.jackpot}*1</span><br>
			<span>備註: ${rib.reservation.remark}</span><br>
			<br>
	</div>
	
	<div class="contactInfo">
		<span class="title">聯絡資訊</span>
		<img class="icon2" src="<c:url value='/image/searchForReservation/icons8-couple-icloud-100.png' />" />
		<hr>
			<span>姓名: ${rib.reservation.contactPerson}</span><br>
			<span>電話: ${rib.reservation.contactPhone}</span><br>
			<br>
	</div>
	<div class="contactInfo">
		<span class="title">寵物資訊</span>
		<img class="icon2" src="<c:url value='/image/searchForReservation/icons8-animal-shelter-150.png' />" />
		<hr>
			<span>名稱: ${rib.petForReservation.petName}</span><br>
		<c:choose>
			<c:when test="${rib.shopForReservation.type == '醫療'}">
			<span>備註: ${rib.hospital.hDescription}</span><br>
			</c:when>
			<c:when test="${rib.shopForReservation.type == '美容'}">
			<span>備註: ${rib.salon.sDescription}</span><br>
			</c:when>
		</c:choose>
		<br>
	</div>
	

	<div class="updateDiv"><a href="<c:url value='/showUpdateReservation/${rib.reservation.reservationID}' />"><img src="<c:url value='/image/searchForReservation/修改-(黑色字體透明背景).png' />" /></a></div>
	<div class="deleteDiv"><a href="<c:url value='/showDeleteReservation/${rib.reservation.reservationID}' />"><img src="<c:url value='/image/searchForReservation/取消-(黑色字體透明背景).png' />" /></a></div>
</div><!-- main -->
</body>
</html>