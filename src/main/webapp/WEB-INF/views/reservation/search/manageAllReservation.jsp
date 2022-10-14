<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/manageAllReservation.css'/>">
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/moreFunction.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a class="functionName" href="<c:url value='/manageAllReservation' />"><img
			src="<c:url value='/image/manageHompage/全部訂單(咖啡色字體).png' />"></a>
		<a class="functionName" href="<c:url value='/allNotification' />"><img
			src="<c:url value='/image/manageHompage/通知中心(咖啡色字體).png' />"></a>
		<!--   		<a href="#">Clients</a> -->
		<!--   		<a href="#">Contact</a> -->
	</div>
	<!-- Use any element to open the sidenav -->
	<span class="moreFunction" onclick="openNav()"><img alt=""
		src="<c:url value='/image/reservation/更多功能(咖啡色字體).png' />"></span>

	<div class="container" style="margin-left: 280px;">
		<h3 class="title">全部訂單</h3>

		<table class="table" id="mainTable">
			<thead>
				<tr>
					<th>訂單編號</th>
					<th>訂單日期</th>
					<th>聯絡人</th>
					<th>聯絡人電話</th>
					<th>預約日期</th>
					<th>預約時間</th>
					<th>服務種類</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="r" items="${rib}" varStatus="sta">
					<tr>
						<td>${r.reservation.reservationID}
						<td>${r.reservation.createDate}
						<td>${r.reservation.contactPerson}
						<td>${r.reservation.contactPhone}
						<td>${r.reservation.reservationDate}
						<td>${r.reservation.reservationTime}
						<td>${r.reservation.serviceType}
						<c:if test="${r.reservation.status == 1}">
						<td><button class="check-btn-exsist" id="check-btn" onclick="getId(${sta.index})">
						<img class="check-btn-pic" src="<c:url value='/image/manageHompage/icons8-detective-64.png' />" />
						查看</button> 
						</c:if>
						<c:if test="${r.reservation.status == 0}">
						<td><span style="width: 50px"><img class="check-btn-pic" src="<c:url value='/image/manageHompage/icons8-crying-64.png' />" />
						客戶取消</span> 
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
	function getId(index){
		var table = document.getElementById("mainTable")
		for(let i = 0 ; i <= index; i++){
			if(i == index){
			var reservationId = table.rows[i+1].cells[0].innerHTML
				window.location.href = "<c:url value='/manageOneReservation/" + reservationId + "' />" 
			}
		}
	}
	/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
	}

	/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
	}
	</script>
</body>
</html>