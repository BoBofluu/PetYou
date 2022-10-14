<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/adminHomepage.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/reservation/admin/functionNav.jsp"></jsp:include>
	<div class="main">
	<div class="title"><img src="https://img.icons8.com/bubbles/50/000000/dog.png"/>新留言<img style="transform: rotateY(180deg)" src="https://img.icons8.com/bubbles/50/000000/dog.png"/></div>
		<table class="table" id="mainTable">
			<thead>
				<tr>
				<th style="width: 53px;text-align: center;">編號</th>
					<th style="width: 90px;text-align: center;">主旨</th>
					<th style="width: 150px;text-align: center;">內容</th>
					<th style="width: 53px;text-align: center;">ID</th>
					<th style="width: 68px;text-align: center;">聯絡日期</th>
					<th style="width: 68px;text-align: center;">回覆日期</th>
					<th style="width: 57px;text-align: center;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="r" items="${list}" varStatus="sta">
				<c:if test="${r.adminView == 'N'}" >
					<tr>
						<td style="text-align: center;">${r.contactID}
						<td>${r.contextTitle}
						<td>${r.context}
						<td style="text-align: center;">${r.contactShop}
						<td>${r.showDate}
						<td>${r.lastUPdateDate}
						<td><button class="check-btn-exsist" id="check-btn" onclick="getId(${sta.index})">
						<img class="check-btn-pic" src="https://img.icons8.com/ios/50/000000/favorite-chat.png"/>
						回覆</button> 
						<button id="ship-btn" type="button" class="check-btn-exsist" style="margin-top: 5px"onclick="getIdForShipping(${sta.index})">
						<img class="check-btn-pic" src="https://img.icons8.com/windows/32/000000/container-truck.png"/>出貨</button>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		var table = document.getElementById("mainTable");
	function getId(index){
		for(let i = 0 ; i <= index; i++){
			if(i == index){
				console.log(index)
				console.log(i)
			var contactId = table.rows[i+1].cells[0].innerHTML
				window.location.href = "<c:url value='/replay/" + contactId + "' />" 
			}
		}
	}
	
	function getIdForShipping(index){
		var table = document.getElementById("mainTable")
		for(let i = 0 ; i <= index; i++){
			if(i == index){
			var shopId = table.rows[i+1].cells[3].innerHTML
			var contactId = table.rows[i+1].cells[0].innerHTML
				window.location.href = "<c:url value='/shippingFormat/" + shopId + "/" + contactId + "' />" 
			}
		}
	}
	</script>
</body>
</html>