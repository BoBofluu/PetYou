<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style type="text/css">
.wrapper {
	background: white;
	width: 82%;
	height: auto;
	box-shadow: 12px 12px 7px #dfe3e8;
	margin-left: 10%;
	border-radius: 10px;
	text-align: center;
	color: black;
}

#head {
	color: #5D001E;
	font-weight: bolder;
	margin-left: 46%
}

.choose {
	display: inline-block;
	background: white;
	margin-left: 10%;
	margin-bottom: 2px;
	width: 8%;
	border-radius: 5px;
	text-align: center;
	line-height: 45px;
	font-size: 12pt;
	font-weight: 600;
}

.save {
	margin-left: 5px;
	background-color: #DDDEE2;
}

.myLang {
	height: 30px;
	width: 18%;
	display: inline-block;
	text-align: center;
	margin-top: 2%;
	font-size: 18pt;
}

#notPass {
	/* 	float: left; */
	margin-top: 0;
	margin-left: 66%;
	padding-bottom: 2%;
	font-weight: 600;
	font-size: 14pt;
	color: red;
}

.title {
	color: #7E3B31;
	font-weight: 600;
}

.posts {
	background-color: white;
	font-size: 13.5pt;
}

.clickSingle {
	color: #C02E4C;
	font-weight: 600;
}

.clickSingle:hover {
	color: black;
	font-weight: 600;
}

.btn {
	margin-left: 11%;
}
</style>
</head>
<body>
	<jsp:include page="../HomePage.jsp"></jsp:include>
	<h2 id="head">我的浪浪</h2>
	<div class="choose posts">刊登列表</div>
	<a style="text-decoration: none; color: black"
		href='<c:url value="/myFavoriteLang" />'>
		<div class="choose save">收藏列表</div>
	</a>
	<div class="wrapper">

		<div class="myLang title">浪浪名稱</div>
		<div class="myLang title">浪浪類型</div>
		<div class="myLang title">浪浪品種</div>
		<div class="myLang title">拾獲日期</div>
		<div class="myLang title">審核狀態</div>
		<hr style="width: 95%; margin-left: 2%">
		<div id="wrapper"></div>
		<hr
			style="width: 95%; margin-left: 2%; margin-bottom: 1.5%; margin-top: 2%">
		<div id="notPass">
			<img
				src="https://img.icons8.com/emoji/30/000000/rabbit-face-emoji.png" />
			<img
				src="https://img.icons8.com/emoji/30/000000/rabbit-face-emoji.png" />
			<img
				src="https://img.icons8.com/emoji/30/000000/rabbit-face-emoji.png" />
			<img
				src="https://img.icons8.com/emoji/30/000000/rabbit-face-emoji.png" />
		</div>
	</div>
	<div style="height: 100px"></div>

	<script>
		var petName = document.getElementById("petName");
		var xhr = new XMLHttpRequest();
		//修改路徑
		xhr.open("GET", "<c:url value='/authorize/" + ${userId} + "' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				petArticle = JSON.parse(xhr.responseText);
				for (var i = 0; i < petArticle.length; i++) {
					console.log(petArticle[i].petName)
					var wrapper = document.getElementById("wrapper");
					var reason;
					switch (petArticle[i].statusAdoption) {
					case 0:
						var reason = '<button type="button" class="btn btn-warning" style="color:white;font-weight:600">正在審核</button>'
						break;
					case 1:
						var reason = '<button type="button" class="btn btn-success" style="color:white;font-weight:600">審核成功</button>'
						break;
					case 2:
						var reason = '<button type="button" class="btn btn-warning" style="color:white;font-weight:600">正在審核</button>'
						break;
					case 4:
						var reason = '<button onmouseover="myFunction()" onmouseleave="myFunction2()" type="button" class="btn btn-danger"  style="color:white;font-weight:600">審核失敗</button>'

						break;
					}

					var link = "<c:url value='/showSinglePet/"+petArticle[i].adoptionInfoID+"' />";

					wrapper.innerHTML += '<a href='+link+' class="clickSingle"><div class="myLang">'
							+ petArticle[i].petName
							+ '</div></a><div class="myLang">'
							+ petArticle[i].petType
							+ '</div><div class="myLang">'
							+ petArticle[i].breed
							+ '</div><div class="myLang">'
							+ petArticle[i].foundDate
							+ '</div><a href='+link+' class="clickSingle"><div class="myLang">'
							+ reason + '</div></a>'
				}
				if (petArticle.length == 0) {
					var wrapper = document.getElementById("wrapper");
					wrapper.innerHTML = '<img src="https://img.icons8.com/ios-filled/35/000000/empty-dog-bowl.png"/>目前無資料，或查無資料'
				}
			}
		}
		function myFunction() {
			var notPass = document.getElementById("notPass");
			notPass.innerHTML = '無附圖、無聯絡人資訊或貼文內容有誤<img src="https://img.icons8.com/fluent/30/000000/hedgehog.png" />'
		}
		function myFunction2() {
			var notPass = document.getElementById("notPass");
			notPass.innerHTML = '<img src="https://img.icons8.com/emoji/30/000000/rabbit-face-emoji.png"/><img src="https://img.icons8.com/emoji/30/000000/rabbit-face-emoji.png"/><img src="https://img.icons8.com/emoji/30/000000/rabbit-face-emoji.png"/><img src="https://img.icons8.com/emoji/30/000000/rabbit-face-emoji.png"/>'
		}
	</script>
</body>
</html>