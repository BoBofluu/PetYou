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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/updateReservation.css'/>">

</head>
<body>
<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
<form id="form1" method="POST" action="<c:url value='/insertUpdateReservation/${rib.reservation.reservationID}' />">
<div id="main">
<div class="title">
	<img  class="img1" src="<c:url value='/image/searchForReservation/6kc.gif' />" />
	<img class="img2"  src="<c:url value='/image/searchForReservation/預約資訊(咖啡色字體).png' />" />
	<img  class="img3" src="<c:url value='/image/searchForReservation/6kc.gif' />" />
</div>
	<div class="shopInfo">
	<img  class="titlePic" src="<c:url value='/image/searchForReservation/店家資訊-(白色字體透明背景).png' />" />
	<br>
	<label class="infoName">店家ID</label>
		<input class="short" type="text" value="${rib.shopForReservation.shopID}" disabled><br>
	<label class="infoName">店家名稱</label>
		<input class="short" type="text" value="${rib.shopForReservation.shopName}" disabled><br>
	<label class="infoName">店家電話</label>
		<input class="short" type="text" value="${rib.shopForReservation.phone}" disabled><br>
	<label class="infoName">店家地址</label>
		<input class="short" type="text" value="${rib.shopForReservation.address}" disabled><br>
	</div>
	
	<div class="contactInfo">
	<img  class="titlePic" src="<c:url value='/image/searchForReservation/聯絡資訊-(白色字體透明背景).png' />" />
	<br>
	<label class="infoName">會員ID</label>
		<input class="short" type="text" value="${rib.memberForReservation.memberID}" disabled><br>
	<label class="infoName">聯絡人名稱</label>
		<input class="short" type="text" name="contactPerson" value="${rib.reservation.contactPerson}"><br>
	<label class="infoName">聯絡人電話</label>
		<input class="short" type="text" name="contactPhone" value="${rib.reservation.contactPhone}"><br>
	</div>
	
	<div class="reservationInfo">
	<img  class="titlePic" src="<c:url value='/image/searchForReservation/預約資訊-(白色字體透明背景).png' />" />
	<br>
	<label class="infoName">醫療/美容</label>
		<input name="type" class="short" type="text" value="${rib.shopForReservation.type}" disabled><br>
	<label class="infoName">預約日期</label>
		<input name="reservationDate" class="short" id="reservationDate" type="Date" value="${rib.reservation.reservationDate}">
		<input id="week" hidden> <br>
	<label class="infoName">預約時段</label>
		<input value="${rib.reservation.reservationTime}" id="getTime" hidden />
			<select class="short" name="reservationTime" id="0" hidden onchange="return chosenTime(this.id)">
					<option value="0">請選擇</option>
				<c:forTokens var="time" delims="," items="${rib.shopForReservation.sun}">
					<option>${time}</option>
				</c:forTokens>
			</select>
			<select class="short" name="reservationTime" id="1" hidden onchange="return chosenTime(this.id)">
					<option value="0">請選擇</option>
				<c:forTokens var="time" delims="," items="${rib.shopForReservation.mon}">
					<option>${time}</option>
				</c:forTokens>
			</select>
			<select class="short" name="reservationTime" id="2" hidden onchange="return chosenTime(this.id)">
					<option value="0">請選擇</option>
				<c:forTokens var="time" delims="," items="${rib.shopForReservation.tue}">
					<option>${time}</option>
				</c:forTokens>
			</select>
			<select class="short" name="reservationTime" id="3" hidden onchange="return chosenTime(this.id)">
					<option value="0">請選擇</option>					
				<c:forTokens var="time" delims="," items="${rib.shopForReservation.wed}">					
					<option>${time}</option>
				</c:forTokens>
			</select>
			<select class="short" name="reservationTime" id="4" hidden onchange="return chosenTime(this.id)">
					<option value="0">請選擇</option>					
				<c:forTokens var="time" delims="," items="${rib.shopForReservation.thu}">						
					<option>${time}</option>
				</c:forTokens>
			</select>
			<select class="short" name="reservationTime" id="5" hidden onchange="return chosenTime(this.id)">
					<option value="0">請選擇</option>
				<c:forTokens var="time" delims="," items="${rib.shopForReservation.fri}">					
					<option>${time}</option>
				</c:forTokens>
			</select>
			<select class="short" name="reservationTime" id="6" hidden onchange="return chosenTime(this.id)">
						<option value="0">請選擇</option>	
					<c:forTokens var="time" delims="," items="${rib.shopForReservation.sat}">
						<option>${time}</option>
					</c:forTokens>
			</select>
	<br><label class="infoName">服務種類</label>
		<div class="custom-control custom-radio" style="display: inline-block;">
			<input type="radio" id="personService" name="serviceType" value="personService" class="custom-control-input" 
											style="background-color: lightpink;border-radius: 15px;">
		<label class="custom-control-label radioClass" for="personService">親自接送</label>
		</div>
		<div class="custom-control custom-radio" style="display: inline-block;">
				<input type="radio" id="shopService" name="serviceType" value="shopService" class="custom-control-input" >
				<label class="custom-control-label radioClass" for="shopService">店家接送</label>
		</div>
		<div class="custom-control custom-radio" style="display: inline-block;">
				<input type="radio" id="homeService" value="homeService" name="serviceType" class="custom-control-input">
				<label class="custom-control-label radioClass" for="homeService">到府服務</label>
		</div>
		<input id="service" hidden value="${rib.reservation.serviceType }" />
	<br>
	<c:choose>
	<c:when test="${rib.shopForReservation.type == '醫療'}">
	<label class="infoName">醫生名稱</label>
		<select class="short" name="doctorName" id="doctor">
				<option selected>請選擇</option>
			<c:forTokens var="doctor" delims="," items="${rib.shopForReservation.typeHospital.hospitalDoctors}">					
				<option>${doctor}</option>
			</c:forTokens>
		</select>
		<input id="doctorNameInput" hidden class="short" type="text" value="${rib.hospital.doctorName}"><br>
	<label class="infoName">診療項目</label>
	<select class="short" name="hItems"  id="project">
			<option>請選擇</option>
		<c:forTokens var="project" delims="," items="${rib.shopForReservation.typeHospital.hospitalProject}">					
			<option>${project}</option>
		</c:forTokens>
	</select>
		<input id="projectValue" hidden class="short" type="text" value="${rib.hospital.hItems}"><br>
	</c:when>
	<c:when test="${rib.shopForReservation.type == '美容'}">
	<label class="infoName">美容項目</label>
	<select name="sItems" class="short" id="project">
		<c:forTokens var="project" delims="," items="${rib.shopForReservation.typeBeauty.beautyBasicProject}">						
			<option>${project}</option>
		</c:forTokens>
		<c:forTokens var="project" delims="," items="${rib.shopForReservation.typeBeauty.beautySpecialProject}">					
			<option>${project}</option>
		</c:forTokens>
	</select><br>
	<input hidden id="projectValue" class="short" type="text" value="${rib.salon.sItems}">
	</c:when>
	</c:choose>
	
	<label class="infoName">抽獎結果</label>
		<input class="short" type="text" value="${rib.reservation.jackpot}*1" disabled><br>
	<label class="infoName">預約備註</label>
		<input name="remark" class="short" type="text" value="${rib.reservation.remark}"><br>
	</div>
	
	<div class="petInfo">
	<img  class="titlePic" src="<c:url value='/image/searchForReservation/寵物資訊-(白色字體透明背景).png' />" />
	<br>
	<label class="infoName">名稱</label>
		<input class="short" type="text" value="${rib.petForReservation.petName}" disabled>
		<input name="petID" type="text" id="petID" hidden><br>
	<label class="infoName">類型</label>
		<input class="short" type="text" value="${rib.petForReservation.type}" disabled><br>
	<label class="infoName">品種</label>
		<input class="short" type="text" value="${rib.petForReservation.variety}" disabled><br>
	<label class="infoName">體型</label>
		<input class="short" type="text" value="${rib.petForReservation.size}" disabled><br>
	<label class="infoName">年齡</label>
		<input class="short" type="text" value="${rib.petForReservation.age}" disabled><br>
	<label class="infoName">性別</label>
		<input class="short" type="text" value="${rib.petForReservation.gender}" disabled><br>
	
	<c:choose>
	<c:when test="${rib.shopForReservation.type == '醫療'}">
	<label class="infoName">開刀紀錄</label>
		<input name="operated" class="short" type="text" value="${rib.petForReservation.operated}"><br>
	<label class="infoName">驅蟲藥</label>
		<input name="deworming" class="short" type="text" value="${rib.petForReservation.deworming}"><br>
	<label class="infoName">結紮</label>
		<select name="ligation" class="short" id="ligation">
			<option value="0">否
			<option value="1">是
			<option value="2">不清楚
		</select><br>
	<label class="infoName">特殊狀況</label>
	<input name="hDescription" class="short" type="text" value="${rib.hospital.hDescription}" /><br>
	</c:when>
	<c:when test="${rib.shopForReservation.type == '美容'}">
	<label class="infoName">特殊狀況</label>
		<input name="sDescription" class="short" type="text" value="${rib.salon.sDescription}"><br>
	</c:when>
	</c:choose>
	</div>
	<div id="comfirmBut" class="confirmDiv"><img class="confirmimg" src="<c:url value='/image/searchForReservation/修改-(黑色字體透明背景).png' />" /></div>
</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
window.onload = function(){
	var getTime = $("#getTime").val();
	var date = $("#reservationDate").val();
	var array = date.split("-");
	var week = new Date(array[0], array[1] - 1, array[2]);
	var weekday = week.getDay();
	var get_id = "#"+weekday;
	$("#week").attr('value', weekday);
	getWeekday(weekday);
	//將與資料庫對應的選取時間selected
	$(get_id).val(getTime).attr("selected","true");
	//寵物在資料庫的預設選項
	$("#ligation").val(${rib.petForReservation.ligation}).attr("selected","true");
	
	var service = $("#service").val();
	if(service == "親自接送"){
		$("#personService").attr("checked", true);
	}else if(service == "店家接送"){
		$("#shopService").attr("checked", true);
	}else if(service == "到府服務"){
		$("#homeService").attr("checked", true);
	}
	
	var projectValue= $("#projectValue").val();
	$("#project").val(projectValue).attr("selected","true");
	
	var doctor = $("#doctorNameInput").val()
	$("#doctor").val(doctor).attr("selected","true");
	
	
}

$("#reservationDate").change(function() {
	var date = $(this).val();
// 	console.log("reservationDate==>" + date);
	var array = date.split("-");
	var week = new Date(array[0], array[1] - 1, array[2]);
	var weekday = week.getDay();
	$("#week").attr('value', weekday);
	getWeekday(weekday);
})


function getWeekday(weekday){
			switch (weekday) {
			case 0:
				$("#1, #2, #3, #4, #5, #6").attr("hidden", true);
				$("#1, #2, #3, #4, #5, #6").val(0).attr("selected","true");
				$("#0").attr("hidden", false);
				break;
			case 1:
				$("#0, #2, #3, #4, #5, #6").attr("selected",false).attr("hidden", true);
				$("#0, #2, #3, #4, #5, #6").val(0).attr("selected","true");
				$("#1").attr("hidden", false);
				break;
			case 2:
				$("#0, #1, #3, #4, #5, #6").attr("selected",false).attr("hidden", true);
				$("#0, #1, #3, #4, #5, #6").val(0).attr("selected","true");
				$("#2").attr("hidden", false);
				break;
			case 3:
				$("#0, #1, #2, #4, #5, #6").attr("selected",false).attr("hidden", true);
				$("#0, #1, #2, #4, #5, #6").val(0).attr("selected","true");
				$("#3").attr("hidden", false);
				break;
			case 4:
				$("#0, #1, #2, #3, #5, #6").attr("selected",false).attr("hidden", true);
				$("#0, #1, #2, #3, #5, #6").val(0).attr("selected","true");
				$("#4").attr("hidden", false);
				break;
			case 5:
				$("#0, #1, #2, #3, #4, #6").attr("selected",false).attr("hidden", true);
				$("#0, #1, #2, #3, #4, #6").val(0).attr("selected","true");
				$("#5").attr("hidden", false);
				break;
			case 6:
				$("#0, #1, #2, #3, #4, #5").attr("selected",false).attr("hidden", true);
				$("#0, #1, #2, #3, #4, #5").val(0).attr("selected","true");
				$("#6").attr("hidden", false);
				break;
			}
		}
		
function chosenTime(time){
	var selector=document.getElementById(time);
	var reservationTime=selector.options[selector.options.selectedIndex].value;
//		console.log("reservationTime==>" + reservationTime)
	if(reservationTime == "公休"){
		$("#timeCheck").text("今天休息，請選擇別天！");
		$("#timeCheck").attr("hidden", false);
	}else if(reservationTime == 0){
		$("#timeCheck").text("忘記選時間囉!");
		$("#timeCheck").attr("hidden", false);
	}else{
		$("#timeCheck").attr("hidden", true);
	}
}

$("#comfirmBut").click(function() {
	swal.fire({
		title : '修改成功',
		text : '已成功修改預約，請準時前往，謝謝🤩',
		icon : 'success',
	}).then(function(){
			$("#form1").submit();
	})
})
</script>
</body>
</html>