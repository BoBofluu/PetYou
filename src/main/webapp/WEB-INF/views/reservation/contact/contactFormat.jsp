<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/moreFunction.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/contactFormat.css'/>">
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

	<form:form id="myForm" method="POST" modelAttribute="rcb">
	<div id="main">
		<span class="contact-title">請留言，管理員會盡快回復!</span>
		<span class="shopId-span">店家ID:</span>
		<form:input path="contactShop" type="text" style="width: 40px;padding: 1px;float:right;border: 1px solid brown;border-radius: 10px;margin-top: 5px;text-align: center;" value="${shopId}"/>
		<br>
		<div class="contact-subtitle" >主旨：</div>
			
		<form:input path="contextTitle" type="text" id="context-title" />
		<div class="contact-subtitle" >內容：</div>
		
		<form:textarea path="context" id="context" class="context" rows="8" cols="85" />
		<button id="btn-noItems" type="button" class="btn btn-secondary">中獎商品已無庫存</button>
		<button id="btn-cantContact" type="button" class="btn btn-secondary">聯繫不上聯絡人</button>
		<button id="submit" type="submit" class="btn btn-outline-light btn-sm" style="float: right;margin-top: 5px;">確認</button>
	</div>
	</form:form>

	
		
<script>
	/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
	}

	/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
	}
	$("#btn-noItems").click(function(){
		$("#context-title").attr("style", "background:#fff;").val(" 中獎商品已無庫存");
		$("#context").attr("style", "background:#fff;").val(" 轉盤獎勵商品：玩具、飼料 已無庫存，請協助提供。\n (底線處請填寫:1.玩具 2.零食 3.飼料 4.罐頭)");
	})
	$("#btn-cantContact").click(function(){
		var memberId = ${memberId}
		$("#context-title").attr("style", "background:#fff;").val(" 請協助聯繫會員");
		$("#context").attr("style", "background:#fff;").val("請協助聯繫會員ID:" + memberId + "之會員。\n 狀況說明：\n  (提醒:若未註明原由，管理員將不主動聯繫會員，若有急需，請務必提供說明) \n");
	})

</script>
</body>
</html>