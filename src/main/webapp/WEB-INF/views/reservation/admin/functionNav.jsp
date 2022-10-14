<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

.navBar {
	width: 250px;
	height: auto;
	background-color: white;
	border-radius: 8px;
	margin-left: 3%;
	/* 	padding-bottom:20px; */
	box-shadow: 12px 12px 7px #dfe3e8;
	display: inline-block;
	position: absolute;
}

.navTitle {
	background-color: #FDDAD8;
	padding: 20px;
	font-weight: 600;
	color: #642018;
	font-size: 20pt;
}

.navContent {
	padding: 20px;
	padding-bottom: 0px;
	font-weight: 600;
}

.navContentA {
	padding: 20px;
	padding-bottom: 0px;
	font-weight: 600;
}

.navContent:hover {
	color: #E22B2F;
}

#pic1 {
	float: right;
}

.pink {
	padding: 10px;
	margin-top: 10px
}

.link:hover {
	color: #E22B2F;
}

.hide {
	padding-left: 45px;
	font-weight: 600;
}
</style>
</head>
<body>
	<jsp:include page="../../petHomepage.jsp"></jsp:include>
	<div class="navBar">
		<div class="navTitle">
			後臺管理<img onclick="hide()" id="pic1"
				src="https://img.icons8.com/ios/40/000000/outdent.png" />
		</div>
		<div class="navContent" id="website">
			<a href="<c:url value='/reservation' />"
				style="color: black; text-decoration: none"><img
				src="https://img.icons8.com/wired/32/000000/domain.png" /> <span
				style="margin-left: 6%;" class="link">前往網站</span></a>
		</div>
		<div class="navContent" id="authorize">
			<a href="<c:url value='/adminAllReply' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/wired/32/000000/google-alerts.png" /> <span
				style="margin-left: 6%;" class="link">通知中心</span></a>
		</div>
		<div class="navContent" id="deleted">
			<a href="<c:url value='/shippingHomepage' />"
				style="color: black; text-decoration: none"><img
				src="https://img.icons8.com/wired/32/000000/cargo-ship.png" /> <span
				style="margin-left: 6%;" class="link">出貨管理</span></a>
		</div>
		<div class="navContent" id="analyze" style="margin-bottom: 20px;">
		<a href="<c:url value='/reservationReport' />"
				style="color: black; text-decoration: none">
			<img src="https://img.icons8.com/wired/32/000000/statistics.png" />
			<span style="margin-left: 6%;" class="link linkA"
				onclick="analysis()">報表分析</span></a>


		</div>
		<div class="pink" id="pink" style="display: none;"></div>
	</div>
	<script type="text/javascript">
		function hide() {
			$("#pic1").attr("src",
					"https://img.icons8.com/wired/40/000000/close-sign.png")
			document.getElementById("authorize").style.display = "none";
			document.getElementById("deleted").style.display = "none";
			document.getElementById("analyze").style.display = "none";
			document.getElementById("pink").style.display = "none";
			document.getElementById("website").style.display = "none";
			document.getElementById("pic1").setAttribute("onClick",
					"javascript: Boo();");
		}

		var Boo = function() {
			$("#pic1").attr("src",
					"https://img.icons8.com/ios/40/000000/outdent.png");
			document.getElementById("website").style.display = "";
			document.getElementById("authorize").style.display = "";
			document.getElementById("deleted").style.display = "";
			document.getElementById("analyze").style.display = "";
			document.getElementById("pink").style.display = "";
			document.getElementById("pic1").setAttribute("onClick",
					"javascript: hide();");
		}

	</script>
</body>
</html>