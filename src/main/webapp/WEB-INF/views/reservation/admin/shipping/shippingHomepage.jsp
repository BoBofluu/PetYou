<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>出貨管理</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/shippingHompage.css'/>">
</head>
<body>
<jsp:include page="/WEB-INF/views/reservation/admin/functionNav.jsp"></jsp:include>
<div class="main">
	<div class="title"><img src="https://img.icons8.com/bubbles/50/000000/truck.png"/>出貨紀錄
	<img style="transform: rotateY(180deg)" src="https://img.icons8.com/bubbles/50/000000/truck.png"/></div>
		<table class="table" id="mainTable">
			<thead>
				<tr>
					<th style="width: 80px;text-align: center;">編號</th>
					<th style="width: 150px;text-align: center;">建立日期</th>
					<th style="width: 150px;text-align: center;">店家</th>
					<th style="width: 150px;text-align: center;">地址</th>
					<th style="width: 150px;text-align: center;">出貨內容</th>
					<th style="width: 150px;text-align: center;">備註</th>
					<th style="width: 150px;text-align: center;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="r" items="${list}" varStatus="sta">
					<tr>
						<td style="text-align: center;">${r.shipSerialNumber}
						<td style="text-align: center;">${r.showShippingCreateDate}
						<td style="text-align: center;">${r.shopNameForShipping}
						<td>${r.shopAddressForShipping}
						<td>${r.shippingItems}
						<td style="text-align:center">${r.shippingRemark}
						<td><button class="check-btn-exsist" id="check-btn" onclick="getId(${sta.index})">
						<img src="https://img.icons8.com/color/32/000000/search-folder.png"/>
						查看</button> 
			
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
			var shippingId = table.rows[i+1].cells[0].innerHTML
				window.location.href = "<c:url value='/shipping/" + shippingId + "' />" 
			}
		}
	}
	</script>
</body>
</html>