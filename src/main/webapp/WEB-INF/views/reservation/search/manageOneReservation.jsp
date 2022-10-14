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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/searchOneReservation.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/moreFunction.css'/>">
	
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
<style>

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a class="functionName" href="<c:url value='/searchAllReservation' />"><img
			src="<c:url value='/image/reservation/預約查詢(咖啡色字體).png' />"></a> 
		<a class="functionName" href="<c:url value='/allNotification' />"><img
			src="<c:url value='/image/manageHompage/通知中心(咖啡色字體).png' />"></a>
<!-- 		<a href="#">Clients</a>  -->
<!-- 		<a href="#">Contact</a> -->
	</div>
	<span class="moreFunction" onclick="openNav()"><img alt=""
		src="<c:url value='/image/reservation/更多功能(咖啡色字體).png' />"></span>

	<div id="main">
		<div class="number">預約單號 ${rib.reservation.reservationID}</div>
		<div class="manage-info">
			<span class="title">會員資訊</span> <img class="icon2"
				src="<c:url value='/image/searchForReservation/icons8-couple-icloud-100.png' />" />
			<hr>
			<table class="memberTable">
				<tr>
					<td>會員ID</td>
					<td>${rib.memberForReservation.memberID}</td>
				</tr>
				<tr>
					<td>聯絡人姓名</td>
					<td>${rib.reservation.contactPerson}</td>
				</tr>
				<tr>
					<td>聯絡人電話</td>
					<td>${rib.reservation.contactPhone}</td>
				</tr>
			</table>
			<span style="font-size: 15px;color: darkred;margin-left: 35px;">提示: 因聯絡人不一定是會員本人，若聯絡不上聯絡人，請盡速通知管理員處理，謝謝</span> <br>
		</div>

		<div class="manage-info">
			<span class="title">預約資訊</span> <img class="icon2"
				src="<c:url value='/image/searchForReservation/icons8-romantic-document-100.png' />" />
			<hr>
			<table class="memberTable">
				<tr>
					<td>預約日期</td>
					<td> ${rib.reservation.reservationDate}</td>
				</tr>
				<tr>
					<td>預約時段</td>
					<td>${rib.reservation.reservationTime}</td>
				</tr>
				<tr>
					<td>服務種類</td>
					<td>${rib.reservation.serviceType}</td>
				</tr>
			<c:choose>
				<c:when test="${rib.shopForReservation.type == '醫療'}">
				<tr>
					<td>醫生</td>
					<td>${rib.hospital.doctorName}</td>
				</tr>
				<tr>
					<td>診療項目</td>
					<td>${rib.hospital.hItems}</td>
				</tr>>
				</c:when>
				<c:when test="${rib.shopForReservation.type == '美容'}">
				<tr>
					<td>美容項目</td>
					<td>${rib.salon.sItems}</td>
				</tr>
				</c:when>
			</c:choose>
			<c:if test="${rib.reservation.jackpot != '銘謝惠顧'}">
				<tr>
					<td>抽獎結果</td>
					<td>${rib.reservation.jackpot}*1</td>
					
				</tr>
			</c:if>
			</table>
			<c:if test="${rib.reservation.jackpot != '銘謝惠顧'}">
			<span style="font-size: 15px;color: darkred;margin-left: 35px;">提示: 請記得提供獎品給客戶，若網站提供之商品已無庫存，請通知管理員處理</span>
			</c:if>
			<c:if test="${rib.reservation.jackpot == '銘謝惠顧'}">
			<br>
			</c:if>
			
		</div>


		<div class="manage-info">
			<span class="title">寵物資訊</span> <img class="icon2"
				src="<c:url value='/image/searchForReservation/icons8-animal-shelter-150.png' />" />
			<hr>
			<table class="memberTable">
				<tr>
					<td>名稱</td>
					<td> ${rib.petForReservation.petName}</td>
				</tr>
				<tr>
					<td>類型</td>
					<td>${rib.petForReservation.type}</td>
				</tr>
				<tr>
					<td>體型</td>
					<td>${rib.petForReservation.size}</td>
				</tr>
				<tr>
					<td>年紀</td>
					<td>${rib.petForReservation.age}</td>
				</tr>
				<tr>
					<td>性別</td>
					<td>${rib.petForReservation.gender}</td>
				</tr>
			<c:choose>
				<c:when test="${rib.shopForReservation.type == '醫療'}">
				<tr>
					<td>驅蟲藥</td>
					<td>${rib.petForReservation.deworming}</td>
				</tr>
				<tr>
					<td>開刀紀錄</td>
					<td>${rib.petForReservation.operated}</td>
				</tr>
				<tr>
					<td>結紮</td>
					<c:if test="${rib.petForReservation.ligation == 0}" >
					<td>無</td>
					</c:if>
					<c:if test="${rib.petForReservation.ligation == 1}" >
					<td>有</td>
					</c:if>
					<c:if test="${rib.petForReservation.ligation == 2}" >
					<td>不清楚</td>
					</c:if>
				</tr>
				<tr>
					<td>特殊狀況</td>
					<td>${rib.hospital.hDescription}</td>
				</tr>
				</c:when>
				<c:when test="${rib.shopForReservation.type == '美容'}">
				<tr>
					<td>特殊狀況</td>
					<td>${rib.salon.sDescription}</td>
				</tr>
				</c:when>
			</c:choose>
			</table>
			<br>
		</div>


		<div class="returnDiv">
		<!-- javascript:self.location=document.referrer; 返回上一頁，並重新整理 -->
			<a href="javascript:self.location=document.referrer;"><img
				src="<c:url value='/image/searchForReservation/返回(咖啡色字體).png' />" /></a>
		</div>
		<div class="contactManagerDiv">
			<a href="<c:url value='/contactManager?memberId=${rib.memberForReservation.memberID}' />">
			<img src="<c:url value='/image/searchForReservation/聯絡管理員_(咖啡色字體).png' />" />
			</a>
		</div>
	</div>
	<!-- main -->
	<script>
		
	
	</script>
</body>
</html>