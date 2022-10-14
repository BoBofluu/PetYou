<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link type="text/css" href="<spring:url value='/css/adminArticle.css'/>" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	<div class="navBar">
		<div class="navTitle">
			後臺管理<img onclick="hide()" id="pic1" style="cursor: pointer;"
				src="https://img.icons8.com/ios/40/000000/outdent.png" />
		</div>
		<div class="navContent" id="website" style="display: none;">
			<a href="<c:url value='/selectAllArticle?page=1' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/dating-website.png" />
				<span style="margin-left: 6%;" class="link">前往網站</span></a>
		</div>
		<div class="navContent" id="authorize" style="display: none;">
			<a href="<c:url value='/article/admin/administration' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/check-all.png" /> <span
				style="margin-left: 6%;" class="link">文章審核</span></a>
		</div>
		<div class="navContent" id="deleted" style="display: none;">
			<a href="<c:url value='/article/admin/openMouth' />" 
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/delete-file.png" /> <span
				style="margin-left: 6%;" class="link">開口中分析</span></a>
		</div>
		<div class="navContent" id="analyze" style="display: none;">
			<a href="<c:url value='/article/admin/goods' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/wired/30/000000/statistics.png" /> <span
				style="margin-left: 6%;" class="link">商品分析</span></a>
		</div>
		<div class="pink" id="pink" style="display: none;"></div>
	</div>
	<script type="text/javascript">
		function hide() {
			$("#pic1").attr("src",
					"https://img.icons8.com/wired/40/000000/close-sign.png")
			document.getElementById("website").style.display = "";
			document.getElementById("authorize").style.display = "";
			document.getElementById("deleted").style.display = "";
			document.getElementById("analyze").style.display = "";
			document.getElementById("pink").style.display = "";
			document.getElementById("pic1").setAttribute("onClick",
					"javascript: Boo();");
		}

		var Boo = function() {
			$("#pic1").attr("src",
					"https://img.icons8.com/ios/40/000000/outdent.png");
			document.getElementById("authorize").style.display = "none";
			document.getElementById("deleted").style.display = "none";
			document.getElementById("analyze").style.display = "none";
			document.getElementById("pink").style.display = "none";
			document.getElementById("website").style.display = "none";
			document.getElementById("pic1").setAttribute("onClick",
					"javascript: hide();");
		}
	</script>
</body>
</html>