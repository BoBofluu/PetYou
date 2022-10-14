<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我有話要說!</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/moreFunction.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/complaintFormat.css'/>">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
				<a class="functionName"
					href="<c:url value='/searchAllReservation' />"> <img
					src="<c:url value='/image/reservation/預約查詢(咖啡色字體).png' />" />
				</a>
			</c:when>
			<c:otherwise>
				<a class="functionName" href="<c:url value='/signinCheckcc' />">
					<img src="<c:url value='/image/reservation/預約查詢(咖啡色字體).png' />" />
				</a>
			</c:otherwise>
		</c:choose>
		<a class="functionName" href="<c:url value='/shop/salonList' />"><img
			src="<c:url value='/image/reservation/預約美容(咖啡色字體).png' />" /></a> <a
			class="functionName" href="<c:url value='/shop/hospitalList' />"><img
			src="<c:url value='/image/reservation/預約診所(咖啡色字體).png' />" /></a> <a
			class="functionName" href="<c:url value='/complaint' />"><img
			src="<c:url value='/image/reservation/我要回饋(咖啡色字體).png' />" /></a>
	</div>
	<span class="moreFunction" onclick="openNav()"><img alt=""
		src="<c:url value='/image/reservation/更多功能(咖啡色字體).png' />"></span>

	<form:form id="myForm" method="POST" modelAttribute="rccb">
		<div id="main">
			<span class="contact-title"></span> <span class="contact-title">訂單編號</span>
			<form:input value="" path="complaintReservationId" type="text"
				class="complaintReservationId" />
			<span class="contact-title" style="margin-left: 255px;">會員ID</span>
			<form:input readonly="true" value="${memberId}" path="complaintMemberId" type="text"
				class="complaintReservationId complaintMemberId" />
			<br> <span class="contact-title">回饋種類</span>
			
			<div style="display: inline-block" >
				<form:select path="complaintType" id="complaintType">
					<form:option selected="true" value="我要獎勵"></form:option>
					<form:option value="我要客訴"></form:option>
				</form:select>
			</div>

			<span class="contact-title">原因</span>
			<div id="good" style="display: inline-block">
				<form:select path="complaintItems">
					<form:option value="服務態度良好" />
					<form:option value="友善對待寵物" />
					<form:option value="環境整潔" />
					<form:option value="其他" />
				</form:select>
			</div>
			<div id="bad" style="display: inline-block" hidden="true">
				<form:select path="complaintItems">
					<form:option value="服務態度不佳" />
					<form:option value="不友善對待寵物" />
					<form:option value="環境髒亂" />
					<form:option value="不準時" />
					<form:option value="其他" />
				</form:select>
			</div>

			<div class="contact-subtitle">主旨：</div>
			<form:input path="complaintTitle" type="text" id="context-title" />

			<div class="contact-subtitle">內容：</div>
			<form:textarea path="complaintText" id="context" class="context" rows="8" cols="85" />

			<button id="submit" type="submit"
				class="btn btn-outline-light btn-sm"
				style="float: right; margin-top: 5px;">確認</button>
		</div>
	</form:form>
	<script>
		$("#complaintType").change(function(){
			if($("#complaintType").val() == "我要獎勵"){
				$("#good").attr("hidden", false);
				$("#bad").attr("hidden", true);
			}else{
				$("#bad").attr("hidden", false);
				$("#good").attr("hidden", true);
			}
		})
	</script>
</body>
</html>