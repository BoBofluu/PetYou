<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>寵你 只寵愛你</title>
<link type="text/css"
	href="${pageContext.request.contextPath}/css/petHomepage.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<script>
	function douserid() {
		var userid = $("#userid").val();
		$.ajax({
			type : "get",
			data : {"userid" : userid},
			url : "<c:url value='/test'/>",
			success : function(data) {
					}
		});
	}
</script>

</head>
<body>
	<header class="titlediv">
		<div>
			<a href="<c:url value='/'/> "> <img
				src="${pageContext.request.contextPath}/images/whiteTitle.png"
				class="petYou">
			</a>
		</div>
	</header>
	<nav></nav>
	<article>
		<div>
			<input type="text" id="userid" name="userid" size="7" maxlength="7">
			<button type="button" onclick="douserid()">
				<span>預覽</span>
			</button>
		</div>
	</article>
</body>
</html>