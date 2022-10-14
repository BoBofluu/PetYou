<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="navContent" id="website" style="">
			<a href="<c:url value='/ShowAllPet' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/dating-website.png" />
				<span style="margin-left: 6%;" class="link">前往網站</span></a>
		</div>
		<div class="navContent" id="authorize" style="">
			<a href="<c:url value='/authorizePost' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/check-all.png" /> <span
				style="margin-left: 6%;" class="link">文章審核</span></a>
		</div>
		<div class="navContent" id="deleted" style="">
			<a href="<c:url value='/authorizeDelete' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/delete-file.png" /> <span
				style="margin-left: 6%;" class="link">已刪除文章</span></a>
		</div>
		
		<div class="navContentA" id="analyze" style="margin-bottom: 20px">
			<img src="https://img.icons8.com/wired/30/000000/statistics.png" />
			<span style="margin-left: 6%;" class="link linkA" onclick="analysis()">整體分析</span>

			<div id="posts" class="hide" style="display: none;">
				<a class="posts" href="<c:url value='/analysisAdopt' />"
					style="text-decoration: none; color: black"
					onmouseover="this.style.color='#E22B2F';"
					onmouseout="this.style.color='black';"><img width="30px"
					src='<c:url value="/img/icons8_dog_paw_print_20px_3.png" />'><span
					style="margin-left: 10px; font-size: 13pt">貼文分析</span></a>
			</div>
			<div id="rate" class="hide" style="display: none;">
				<a class="posts" href="<c:url value='/rateForAdmin' />"
					style="text-decoration: none; color: black"
					onmouseover="this.style.color='#E22B2F';"
					onmouseout="this.style.color='black';"><img width="40px"
					src='<c:url value="/img/dog_tag_50px.png" />'><span
					style="font-size: 13pt">領養率</span></a>
			</div>
		</div>
		<div class="pink" id="pink" style="display: none;"></div>
	</div>
	<script type="text/javascript">
		function hide() {
			$("#pic1").attr("src",
					"https://img.icons8.com/wired/40/000000/close-sign.png")
			document.getElementById("website").style.display = "none";
			document.getElementById("authorize").style.display = "none";
			document.getElementById("deleted").style.display = "none";
			document.getElementById("analyze").style.display = "none";
			document.getElementById("pink").style.display = "none";
			document.getElementById("pic1").setAttribute("onClick",
					"javascript: Boo();");
		}

		var Boo = function() {
			$("#pic1").attr("src",
					"https://img.icons8.com/ios/40/000000/outdent.png");
			document.getElementById("authorize").style.display = "";
			document.getElementById("deleted").style.display = "";
			document.getElementById("analyze").style.display = "";
			document.getElementById("pink").style.display = "";
			document.getElementById("website").style.display = "";
			document.getElementById("pic1").setAttribute("onClick",
					"javascript: hide();");
		}

		function analysis() {
			document.getElementById("posts").style.display = "";
			document.getElementById("rate").style.display = "";
			$('.linkA').attr('onclick', 'newAnalysis()')
		}
		function newAnalysis() {
			document.getElementById("posts").style.display = "none";
			document.getElementById("rate").style.display = "none";
			$('.linkA').attr('onclick', 'analysis()')
		}
	</script>
</body>
</html>