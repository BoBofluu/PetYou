<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/searchAllReservation.css'/>">
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
<!-- Use any element to open the sidenav -->
<span class="moreFunction"  onclick="openNav()"><img  alt="" src="<c:url value='/image/reservation/更多功能(咖啡色字體).png' />"></span>

<c:choose>
<c:when test="${listCount == 0 }">
<div>
	<div class="noResult">目前沒有預約喔<br>
	 &nbsp &nbsp趕快去預約<img src='https://i.gifer.com/4NON.gif' />
	</div>
</div>
</c:when>
<c:otherwise>
<div id="main">
	<div class="totalCount">
	<img src="<c:url value='/image/searchForReservation/紅利點數(咖啡色字體).png' />" />
	<span>${bonus}</span><br>
	<img src="<c:url value='/image/searchForReservation/總預約次數(咖啡色字體).png' />" />
	<span>${count}</span>
	<button class="bonus-btn" id="bonus-btn">兌換紅利</button>
	</div>
		<c:forEach var="r" items="${rib}">
<div class="outContainer">
<a class="linkToOne" href="<c:url value='/searchOneReservation/${r.reservation.reservationID}' />">
	<div class="reservationId">預約單號 ${r.reservation.reservationID}</div>
	<div class="shopInfo">
	<div>店家資訊</div>
		<span>名稱: ${r.shopForReservation.shopName}</span><br>
		<span>電話: ${r.shopForReservation.phone}</span>
	</div>
	<div class="reservationInfo">
		<div>預約資訊</div>
			<span>預約日期: ${r.reservation.reservationDate}, ${r.reservation.reservationTime}</span><br>
			<span>服務型態: ${r.reservation.serviceType}</span><br>
			<c:choose>
			<c:when test="${r.reservation.reservationType =='醫療' }">
			<span>診療項目: ${r.hospital.hItems}</span><br>
			</c:when>
			<c:when test="${r.reservation.reservationType =='美容' }">
			<span>診療項目: ${r.salon.sItems}</span><br>
			</c:when>
			</c:choose>
	</div>
	<div class="contactInfo">
		<div>聯絡資訊</div>
			<span>聯絡人:  ${r.reservation.contactPerson}</span><br>
			<span>聯絡電話 : ${r.reservation.contactPhone}</span><br>
			<span>寵物名稱 : ${r.petForReservation.petName}</span><br>
	</div>
	<div class="details">詳細資訊</div>
</a>
</div>
</c:forEach>
</div>
</c:otherwise></c:choose>

<script>

 $("#bonus-btn").click(function(){
	 window.location.href="<c:url value='/bonusShop' />"
 })
</script>
</body>
</html>