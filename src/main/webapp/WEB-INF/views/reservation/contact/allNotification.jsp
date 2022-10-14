<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/moreFunction.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/allNotification.css'/>">
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
		<h3 class="title">通知中心</h3>
		<img src="<c:url value='/image/contact/icons8-important-mail-100.png' />" style="position: absolute;margin: inherit;top: 141px;right:500px;" />
		<table class="table" id="mainTable">
			<thead>
				<tr>
					<th style="width: 53px">編號</th>
					<th style="width: 150px">主旨</th>
					<th style="width: 300px">內容</th>
					<th style="width: 100px">聯絡日期</th>
					<th style="width: 100px">更新日期</th>
					<th style="width: 10px"></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${rcb}" var="r" varStatus="sta">
			<tr>
				<td>${r.contactID}</td>
				<td>${r.contextTitle}</td>
				<td class="test">${r.context}</td>
				<td>${r.showDate}</td>
				<td>${r.lastUPdateDate}</td>
				<c:if test="${r.lastUPdateDate == null}">
				<td><button class="check-btn-exsist" id="check-btn" onclick="getId(${sta.index})">
						<img class="check-btn-pic" src="<c:url value='/image/manageHompage/icons8-detective-64.png' />" />
						修改</button>
				</c:if>
				<c:if test="${r.lastUPdateDate != null}">
				<td><button class="check-btn-exsist" id="check-btn" onclick="getIdForReply(${sta.index})">已回覆</button></td>
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
			var contactId = table.rows[i+1].cells[0].innerHTML
				window.location.href = "<c:url value='/searchOneContact/" + contactId + "' />" 
			}
		}
	}
	function getIdForReply(index){
		var table = document.getElementById("mainTable")
		for(let i = 0 ; i <= index; i++){
			if(i == index){
			var contactId = table.rows[i+1].cells[0].innerHTML
				window.location.href = "<c:url value='/showReply/" + contactId + "' />" 
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