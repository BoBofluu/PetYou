<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${id}.${shopName }</title>
<link rel="stylesheet" type="text/css"
	href="<spring:url value='/css/reservation/shopInfo.css'/>">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<script>
	window.onload = function(){
		var shopID = ${shopID};
		var xhr = new XMLHttpRequest();
// 		console.log(shopID);
		xhr.open("GET", "<c:url value='/shop/shopInfoJson/" + shopID + "' />", "true");
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var shop = JSON.parse(xhr.responseText);
// 				console.log(shop);
				$("#shopName").text(shop.shopName);
				$("#phone").text(shop.phone);
				$("#email").text(shop.email);
				$("#address").text(shop.address);
				$("#mon").text(shop.monTilde);
				$("#tue").text(shop.tueTilde);
				$("#wed").text(shop.wedTilde);
				$("#thur").text(shop.thuTilde);
				$("#fri").text(shop.friTilde);
				$("#sat").text(shop.satTilde);
				$("#sun").text(shop.sunTilde);
				if (shop.type == '醫療'){
					$("#hProject").text(shop.typeHospital.hospitalProject);
					$("#hTarget").text(shop.typeHospital.hospitalTarget);
					$("#hFacility").text(shop.typeHospital.hospitalFacility);
					$("#hDoctors").text(shop.typeHospital.hospitalDoctors);
				}else if(shop.type == '美容' ){
					$("#sBasicProject").text(shop.typeBeauty.beautyBasicProject);
					$("#sSpecialProject").text(shop.typeBeauty.beautySpecialProject);
					$("#sTarget").text(shop.typeBeauty.beautyTarget);
				}
				
				
			}
		}
	}
	</script>

</head>
<body >
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	<!-- 	<div><a href="#"><img src="" /></a></div> -->
	<div class="outContainer">
		<div class="shopName">
			<span id="shopName"></span>
		</div>

		<div class="basicInfodiv">
			<table class="basicInfo">
				<tr>
					<td colspan="2"><span class="titleSpan">基本資訊</span></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td><span class="name">電話</span><br><span class="value" id="phone"></span></td>
				</tr>
				<tr>
					<td><span class="name">郵箱</span><br><span class="value" id="email"></span></td>
				</tr>
				<tr>
					<td><span class="name">地址</span><br><span class="value" id="address"></span></td>
				</tr>
			</table>
		</div>

		<div class="picture" id="environment">
			<img id="environment" src="${pic}" />

		</div>

		<div class="timediv">
			<table class="time">
				<tr>
					<td colspan="2"><span class="titleTimeSpan">可預約時段</span>
				</tr>
					<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td style="width: 150px;"><span class="name">星期一</span></td><td style="padding-left: 1%"><span id="mon" class="value"></span></td>
				</tr>
				<tr>
					<td style="width: 150px;"><span class="name">星期二</span></td><td style="padding-left: 1%"><span id="tue" class="value"></span></td>
				</tr>
				<tr>
					<td style="width: 150px;"><span class="name">星期三</span></td><td style="padding-left: 1%"><span id="wed" class="value"></span></td>
				</tr>
				<tr>
					<td style="width: 150px;"><span class="name">星期四</span></td><td style="padding-left: 1%"><span id="thur" class="value"></span></td>
				</tr>
				<tr>
					<td style="width: 150px;"><span class="name">星期五</span></td><td style="padding-left: 1%"><span id="fri" class="value"></span></td>
				</tr>
				<tr>
					<td style="width: 150px;"><span class="name">星期六</span></td><td style="padding-left: 1%"><span id="sat" class="value"></span></td>
				</tr>
				<tr>
					<td style="width: 150px;"><span class="name">星期日</span></td><td style="padding-left: 1%"><span id="sun" class="value"></span></td>
				</tr>
			</table>
		</div>
		<div class="projectdiv">
			<div class="project">
				<table>
						<tr>
					<td colspan="2"><span class="titleSpan">服務內容</span></td>
				</tr>
					<tr>
					<td colspan="2"><hr></td>
				</tr>
				<c:choose>
					<c:when test="${type=='醫療'}">
							<tr>
								<td><span class="name">服務對象</span><br><span class="value" id="hTarget"></span></td>
							</tr>
							<tr>
								<td><span class="name">醫療項目</span><br><span class="value" id="hProject"></span></td>
							</tr>
							<tr>
								<td><span class="name">醫療設施</span><br><span class="value" id="hFacility"></span></td>
							</tr>
							<tr>
								<td><span class="name">主治醫師</span><br><span class="value" id="hDoctors"></span></td>
							</tr>
					</c:when>
					<c:when test="${type=='美容'}">
							<tr>
								<td><span class="name">服務對象</span><br><span class="value" id="sTarget"></span></td>
							</tr>
							<tr>
								<td><span class="name">一般美容</span><br><span class="value" id="sBasicProject"></span></td>
							</tr>
							<tr>
								<td><span class="name">特殊美容</span><br><span class="value" id="sSpecialProject"></span></td>
							</tr>
					</c:when>
				</c:choose>
				</table>
			</div>

		</div>

		<div class="reservatediv">
			<c:choose>
					<c:when test="${login}">
						<a href="<c:url value='/reservation/create/createReservation/${id}' />"> <img src="<c:url value='/image/reservation/我要預約(粉紅色字體).png' />"
							class="reservate" />
						</a>
					</c:when>
					<c:otherwise>
					<a href="<c:url value='/signinCheckcc' />"> <img src="<c:url value='/image/reservation/我要預約(粉紅色字體).png' />"
							class="reservate" />
						</a>
					</c:otherwise>
				</c:choose>	
					
<%-- 				<a href="<c:url value='/createReservation/${id }' />"> <img src="<c:url value='/image/reservation/我要預約(粉紅色字體).png' />" --%>
<!-- 					class="reservate" /> -->
<!-- 				</a> -->
		</div>
<!-- 		<div class="backdiv"> -->
<%-- 			<a href="#"> <img src="<c:url value='/image/reservation/回前頁(粉紅色字體)1.png' />" --%>
<!-- 				class="back" /> -->
<!-- 			</a> -->
<!-- 		</div> -->
	</div>



</body>
</html>