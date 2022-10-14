<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<jsp:include page="../petHomepage.jsp"></jsp:include>
 
    
	<h1 style="text-align: center">onlineStore</h1>
	<hr>
	<jsp:include page="search.jsp"></jsp:include>
	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="center" /> 
				<a href='welcome'>Hello	Spring MVC</a><BR>
			</td>
			<td width="350"><p align="center" /> 
				<c:forEach var='category' items='${categorylist}' >
				<a href='commoditys/${category}'>${category}</a>
				</c:forEach>
			</td>
			<td width="350"><p align="center" /> 
				<a href='commoditys'>查詢產品資料</a><BR>
			</td>
			<td width="350"><p align="center" /> 
				<a href='update/stock'>更新多筆產品的庫存數量</a><BR>
			</td>
			<td width="350"><p align="center" /> 
				<a href='commoditys/${category}貓'>愛貓園地</a>
				<a href='commoditys/${category}狗'>汪汪城堡</a>
				<a href='commoditys/${category}貓/${theme}食'>貓咪飼料</a>
				<a href='commoditys/${category}狗/${theme}食'>狗狗飼料</a>
				
				
			</td>
			<td width="350"><p align="center" /> 
				<a href='commoditys/add'>新增產品資料</a><BR>
			</td>
			<td width="350"><a href=''>&nbsp;</a><BR><BR>
			</td>
		</tr>
	</table>

</body>
</html>