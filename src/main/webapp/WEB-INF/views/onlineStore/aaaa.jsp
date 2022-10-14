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
<style>
.navContentA {
	padding: 20px;
	padding-bottom: 0px;
	font-weight: 600;
	width:170px;
	z-index:12000;
}
#posts{

}
</style>

</head>
<body>
	
	<div class="navBar">
		<div class="navTitle">
			後臺管理<img onclick="hide()" id="pic1" style="cursor: pointer;"
				src="https://img.icons8.com/ios/40/000000/outdent.png" />
		</div>
		<div class="navContent" id="website" >
			<a href="<c:url value='/commoditys' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/dating-website.png" />
				<span style="margin-left: 6%;" class="link">前往網站</span></a>
		</div>
		<div class="navContent" id="authorize" >
			<a href="<c:url value='/commoditys/add' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/check-all.png" /> <span
				style="margin-left: 6%;" class="link">新增商品</span></a>
		</div>
		<div class="navContent" id="deleted" >
			<a href="<c:url value='/commoditys/set' />" 
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/delete-file.png" /> <span
				style="margin-left: 6%;" class="link">修改商品</span></a>
		</div>
		
		<div class="navContent" id="analyze" style="">
			<img src="https://img.icons8.com/wired/30/000000/purchase-order.png" /> <span
				style="margin-left: 6%;"  class="linkA" onclick="analysis()">訂單管理</span>
		
		
		<div class="navContent ann" id="analyze1" class="ann" style="display:none;">
			<a href="<c:url value='/myorder' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/wired/30/000000/purchase-order.png" /> <span
				style="margin-left: 6%;"  class="lin">會員訂單</span></a>
		</div>
		
		<div class="navContent ann" id="analyze2" style="display:none;">
			<a href="<c:url value='/myorderwaitcancel' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/wired/30/000000/purchase-order.png" /> <span
				style="margin-left: 6%;"class="lin">退貨申請</span></a>
		</div>
		
		<div class="navContent ann" id="analyze3" style="display:none;">
			<a href="<c:url value='/selectcancel' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/wired/30/000000/purchase-order.png" /> <span
				style="margin-left: 6%;"class="lin">審核狀態</span></a>
		</div>
		
		</div>
		
		<div class="navContent" id="analy" style="">
			
			<img src="https://img.icons8.com/wired/30/000000/statistics.png" /> <span
				style="margin-left: 6%;"  class="linkB" onclick="analy()">報表分析</span>
				
		<div class="navContent ann" id="analy1" style="display:none;">
			<a href="<c:url value='/commodityanalysis' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/wired/30/000000/statistics.png" /> <span
				style="margin-left: 6%;"class="link">商品分析</span></a>
			</div>	
				
				<div class="navContent ann" id="analy2" style="display:none;">
			<a href="<c:url value='/reasonanalysis' />"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/wired/30/000000/statistics.png" /> <span
				style="margin-left: 6%;"class="link">退貨原因</span></a>
		
		</div>
		
		</div>
		
		<div class="pink" id="pink" style="display: none;"></div>
	</div>
	<script type="text/javascript">
	$(".navTitle").css("width","250px");
	
	$(".navContent").css("width","170px");
		function hide() {
			$("#pic1").attr("src",
					"https://img.icons8.com/wired/40/000000/close-sign.png")
			document.getElementById("website").style.display = "none";
			document.getElementById("authorize").style.display = "none";
			document.getElementById("deleted").style.display = "none";
			document.getElementById("analyze").style.display = "none";
			document.getElementById("pink").style.display = "none";
			document.getElementById("analy").style.display = "none";
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
			document.getElementById("analy").style.display = "";
			document.getElementById("pic1").setAttribute("onClick",
					"javascript: hide();");
		}
		
		
		function analysis() {
			document.getElementById("analyze1").style.display = "";
			document.getElementById("analyze2").style.display = "";
			document.getElementById("analyze3").style.display = "";
			$('.linkA').attr('onclick', 'newAnalysis()')
		}
		function newAnalysis() {
			document.getElementById("analyze1").style.display = "none";
			document.getElementById("analyze2").style.display = "none";
			document.getElementById("analyze3").style.display = "none";
			$('.linkA').attr('onclick', 'analysis()')
		}
		
		function analy() {
			document.getElementById("analy1").style.display = "";
			document.getElementById("analy2").style.display = "";
// 			document.getElementById("analy3").style.display = "";
			$('.linkB').attr('onclick', 'newAnaly()')
		}
		function newAnaly() {
			document.getElementById("analy1").style.display = "none";
			document.getElementById("analy2").style.display = "none";
// 			document.getElementById("analy3").style.display = "none";
			$('.linkB').attr('onclick', 'analy()')
		}

	</script>
</body>
</html>