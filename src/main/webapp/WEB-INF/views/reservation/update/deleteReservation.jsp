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
	href="<c:url value='/css/reservation/updateReservation.css'/>">

</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	<form id="form1" method="POST"
		action="<c:url value='/deleteReservation/${rib.reservation.reservationID}' />">
		<div id="main">
			<div class="title">
				<img class="img1"
					src="<c:url value='/image/searchForReservation/6kc.gif' />" /> <img
					class="img2"
					src="<c:url value='/image/searchForReservation/預約資訊(咖啡色字體).png' />" />
				<img class="img3"
					src="<c:url value='/image/searchForReservation/6kc.gif' />" />
			</div>
			<div class="shopInfo">
				<img class="titlePic"
					src="<c:url value='/image/searchForReservation/店家資訊-(白色字體透明背景).png' />" />
				<br> <label class="infoName">店家ID</label> <input class="short"
					type="text" value="${rib.shopForReservation.shopID}" readonly><br>
				<label class="infoName">店家名稱</label> <input class="short"
					type="text" value="${rib.shopForReservation.shopName}" readonly><br>
				<label class="infoName">店家電話</label> <input class="short"
					type="text" value="${rib.shopForReservation.phone}" readonly><br>
				<label class="infoName">店家地址</label> <input class="short"
					type="text" value="${rib.shopForReservation.address}" readonly><br>
			</div>

			<div class="contactInfo">
				<img class="titlePic"
					src="<c:url value='/image/searchForReservation/聯絡資訊-(白色字體透明背景).png' />" />
				<br> <label class="infoName">會員ID</label> <input class="short"
					type="text" value="${rib.memberForReservation.memberID}" readonly><br>
				<label class="infoName">聯絡人名稱</label> <input class="short"
					type="text" name="contactPerson"
					value="${rib.reservation.contactPerson}" readonly><br>
				<label class="infoName">聯絡人電話</label> <input class="short"
					type="text" name="contactPhone"
					value="${rib.reservation.contactPhone}" readonly><br>
			</div>

			<div class="reservationInfo">
				<img class="titlePic"
					src="<c:url value='/image/searchForReservation/預約資訊-(白色字體透明背景).png' />" />
				<br> <label class="infoName">醫療/美容</label> <input name="type"
					class="short" type="text" value="${rib.shopForReservation.type}"
					readonly><br> <label class="infoName">預約日期</label> <input
					name="reservationDate" class="short" id="reservationDate"
					type="Date" value="${rib.reservation.reservationDate}" readonly>
				<input id="week" hidden> <br> <label class="infoName">預約時段</label>
				<input class="short" value="${rib.reservation.reservationTime}"
					id="getTime" readonly /><br> <label class="infoName">服務種類</label>
				<input class="short" id="service"
					value="${rib.reservation.serviceType }" readonly /> <br>
				<c:choose>
					<c:when test="${rib.shopForReservation.type == '醫療'}">
						<label class="infoName">醫生名稱</label>
						<input id="doctorNameInput" readonly class="short" type="text"
							value="${rib.hospital.doctorName}">
						<br>
						<label class="infoName">診療項目</label>
						<input id="projectValue" readonly class="short" type="text"
							value="${rib.hospital.hItems}">
						<br>
					</c:when>
					<c:when test="${rib.shopForReservation.type == '美容'}">
						<label class="infoName">美容項目</label>
						<input id="projectValue" class="short" type="text"
							value="${rib.salon.sItems}" readonly>
						<br>
					</c:when>
				</c:choose>

				<label class="infoName">抽獎結果</label> <input class="short"
					type="text" value="${rib.reservation.jackpot}*1" readonly><br>
				<label class="infoName">預約備註</label> <input name="remark"
					class="short" type="text" value="${rib.reservation.remark}"
					readonly><br>
			</div>

			<div class="petInfo">
				<img class="titlePic"
					src="<c:url value='/image/searchForReservation/寵物資訊-(白色字體透明背景).png' />" />
				<br> <label class="infoName">名稱</label> <input class="short"
					type="text" value="${rib.petForReservation.petName}" readonly>
				<input name="petID" type="text" id="petID" hidden><br>
				<label class="infoName">類型</label> <input class="short" type="text"
					value="${rib.petForReservation.type}" readonly><br> <label
					class="infoName">品種</label> <input class="short" type="text"
					value="${rib.petForReservation.variety}" readonly><br>
				<label class="infoName">體型</label> <input class="short" type="text"
					value="${rib.petForReservation.size}" readonly><br> <label
					class="infoName">年齡</label> <input class="short" type="text"
					value="${rib.petForReservation.age}" readonly><br> <label
					class="infoName">性別</label> <input class="short" type="text"
					value="${rib.petForReservation.gender}" readonly><br>

				<c:choose>
					<c:when test="${rib.shopForReservation.type == '醫療'}">
						<label class="infoName">開刀紀錄</label>
						<input name="operated" class="short" type="text"
							value="${rib.petForReservation.operated}" readonly>
						<br>
						<label class="infoName">驅蟲藥</label>
						<input name="deworming" class="short" type="text"
							value="${rib.petForReservation.deworming}" readonly>
						<br>
						<label class="infoName">結紮</label>
						<input name="ligation" class="short" type="text"
							value="${rib.petForReservation.ligation}" readonly>
						<br>
						<label class="infoName">特殊狀況</label>
						<input name="hDescription" class="short" type="text"
							value="${rib.hospital.hDescription}" readonly />
						<br>
					</c:when>
					<c:when test="${rib.shopForReservation.type == '美容'}">
						<label class="infoName">特殊狀況</label>
						<input name="sDescription" class="short" type="text"
							value="${rib.salon.sDescription}">
						<br>
					</c:when>
				</c:choose>
			</div>
			<div id="comfirmBut" class="confirmDiv">
				<img class="confirmimg"
					src="<c:url value='/image/searchForReservation/取消-(黑色字體透明背景).png' />" />
			</div>
		</div>
	</form>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
		$("#comfirmBut").click(function() {
			swal.fire({
				title : '確定要取消嗎?😥',
				text : '取消就沒了喔!ಥ_ಥ',
				type : 'warning',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '取消預約',
				
			}).then((result) => {
				if (result.isConfirmed){
				swal.fire({title:'取消成功', text:'已成功取消預約，期待您下次的預約😻', icon:'success',allowOutsideClick: false} ).then(function(){
					$("#form1").submit();
				});
				}
			})
		})
	</script>
</body>
</html>