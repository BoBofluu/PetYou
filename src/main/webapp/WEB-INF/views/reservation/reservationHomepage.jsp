<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/moreFunction.css'/>">
<link rel="stylesheet" type="text/css" href="<spring:url value='/css/reservation/reservationHomepage.css'/>">
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
		<c:if test="${login}">
  		<a class="functionName" href="<c:url value='/complaint' />"><img src="<c:url value='/image/reservation/我要回饋(咖啡色字體).png' />"/></a>
  		</c:if>
	</div>

<!-- Use any element to open the sidenav -->
<span class="moreFunction"  onclick="openNav()"><img  alt="" src="<c:url value='/image/reservation/更多功能(咖啡色字體).png' />"></span>

<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
<div id="main">
  <div class="homeDiv">
		<div class="salonDiv">
			<a href="<c:url value='/shop/salonList' />"> <image
					src="<c:url value='/image/salon/shower.png' />" class="salonPic"></image></a>
		</div>
		<div class="hospitalDiv">
			<a href="<c:url value='/shop/hospitalList' />"> <image
					src="<c:url value='/image/hospital/02hospital.png' />"
					class="hospitalPic"></image></a>
		</div>
	</div>
</div>	
</body>
</html>