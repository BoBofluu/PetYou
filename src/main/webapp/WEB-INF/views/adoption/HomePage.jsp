<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style type="text/css">
#mine {
	height: 75px;
	width: 800px;
	margin-left: 5%;
}

.incool {
	padding: 8px;
	border: 0px;
	font-size: large;
	border-radius: 5px;
	margin-left: 4%;
	background-color: #F5AAAF;
	font-weight: bold;
	opacity: 0.8;
	color: #2F2F2F;
	outline: none;
	letter-spacing: 2px;
	width: 100px
}

.incool:hover {
	background-color: #F07A7A;
	font-weight: bold;
	opacity: 0.8
}
</style>
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
</head>
<jsp:include page="../petHomepage.jsp"></jsp:include>
<body style="background-color: transparent;">

	<div id="mine">

		<c:choose>
			<c:when test="${ userType == 'isAdmin'}">
				<a href='<c:url value="/ShowAllPet" />'><input class="incool"
					type="button" value="檢視貼文" id="adopt"></a>
				<a href='<c:url value="/authorizePost" />'><input type="button"
					class="incool" value="文章審核" id="org"></a>
				<a href='<c:url value="/authorizeDelete" />'><input
					type="button" class="incool" value="審核刪除" id="org"></a>
			</c:when>
			<c:when test="${login==true}">
				<a href='<c:url value="/freePost" />'><input class="incool"
					type="button" value="免費刊登" id="post"></a>

				<a href='<c:url value="/ShowAllPet" />'><input class="incool"
					type="button" value="我要認養" id="adopt"></a>

				<a href='<c:url value="/langMap" />'><input type="button"
					class="incool" value="地圖搜尋" id="donate"></a>

				<a href='<c:url value="/authorize" />'><input type="button"
					class="incool" value="會員管理" id="org"></a>

				<a href='<c:url value="/javaMailJSP" />'><input type="button"
					class="incool" value="浪浪配對" id="pair"></a>

			</c:when>
			<c:otherwise>
				<a href='<c:url value="/freePost" />'><input class="incool"
					type="button" value="免費刊登" id="post"></a>

				<a href='<c:url value="/ShowAllPet" />'><input class="incool"
					type="button" value="我要認養" id="adopt"></a>

				<a href='<c:url value="/langMap" />'><input type="button"
					class="incool" value="地圖搜尋" id="donate"></a>

			</c:otherwise>

		</c:choose>


	</div>
</body>
</html>