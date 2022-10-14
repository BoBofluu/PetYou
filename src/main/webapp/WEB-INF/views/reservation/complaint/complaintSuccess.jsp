<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style>
.main {
	position: relative;
	width: 700px;
	height: 295px;
	margin: auto;
	background: pink;
	border-radius: 15px;
	padding: 10px;
	box-shadow: 6px 7px 2px 2px lightgrey;
}

.pic {
	position: absolute;
	top: 21px;
	right: 24px;
	width: 200px;
	border-radius: 20px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	<div class="main">
		<p style="font-size: 2.5em; margin-left: 96px;">已成功送出!</p>
		<p style="font-size: 1.5em; margin-left: 48px;">管理員將通知店家回饋結果</p>
		<p style="font-size: 1.5em; margin-left: 20px;">感謝您的填寫，期待您再次預約</p>
		<img class="pic" src="<c:url value='/image/reservation/kRf.gif' />" />
		<p style="margin-left: 150px;color: white">三秒後將自動跳轉</p>
	</div>
	<script>
		$(function() {
			setInterval(ChangeTime, 3000);
		});
		function ChangeTime() {
			window.location.href = "<c:url value='/reservation' />";
		}
	</script>
</body>
</html>