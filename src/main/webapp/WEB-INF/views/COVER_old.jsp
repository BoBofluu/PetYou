<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style>
.pic {
	position: relative;
}
.introduction {
	position: absolute;
	left: 10%;
	top: 20%;
	color: black;
	font-weight: bold;
	background-color: white;
	opacity: 0.7;
	border-radius: 30px;
	padding: 20px;
	width: 35%
}
.img{
	width:100px;
}
</style>
</head>
<body>

	<jsp:include page="petHomepage.jsp"></jsp:include>

	<div class="pic">
		<div class="introduction" style="">
			<h1>❤寵你 只寵愛你❤</h1>
			<h4>
				世界第一寵物品牌<br>全台最大寵物線上平台
			</h4>
			<p>毛小孩好熱啊～寵你提供優質的寵物美容服務，在舒適的環境下享受服務，今天就預訂。專業美容師執照、全部服務含寵物險、100%品質保證，不滿意退費。</p>
			<p>超過20年臨床經驗，中西醫合併診治，給您的寶貝全方位呵護。獸醫針灸師。美國Chi Institute
				認證。穴位雷射治療。犬貓內外科醫療。</p>
		</div>
		<img alt="dog"
			src="${pageContext.request.contextPath}/images/1601821576585.jpg" style="margin-top: -40px;">
	</div>
</body>
</html>