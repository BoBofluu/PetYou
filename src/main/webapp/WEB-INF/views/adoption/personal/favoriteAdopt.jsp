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
	padding-bottom: 20px
}

#head {
	color: #5D001E;
	font-weight: bolder;
	margin-left: 46%
}

.choose {
	display: inline-block;
	background: white;
	margin-bottom: 2px;
	width: 8%;
	border-radius: 5px;
	text-align: center;
	line-height: 45px;
	font-size: 12pt;
	font-weight: 600;
}

.save {
	margin-left: 10%;
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
	font-size: 13.5pt;
	background-color: white;
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<h2 id="head">我的浪浪</h2>

	<a style="text-decoration: none; color: black"
		href='<c:url value="/authorize" />'>
		<div class="choose save">刊登列表</div>
	</a>
	<div class="choose posts">收藏列表</div>
	<div class="wrapper">

		<div class="myLang title">浪浪名稱</div>
		<div class="myLang title">浪浪類型</div>
		<div class="myLang title">浪浪年齡</div>
		<div class="myLang title">浪浪位置</div>
		<div class="myLang title">取消收藏</div>
		<hr style="width: 95%; margin-left: 2%">
		<div id="wrapper"></div>
		<hr
			style="width: 95%; margin-left: 2%; margin-bottom: 1.5%; margin-top: 2%">
	</div>

	<script>
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/myFavoriteLang/" + ${userId} + "' />",
				true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				petFavorite = JSON.parse(xhr.responseText);
				console.log(xhr.responseText)
				for (var i = 0; i < petFavorite.length; i++) {
					var wrapper = document.getElementById("wrapper");
					var link = "<c:url value='showSinglePet/"+petFavorite[i].adoption.adoptionInfoID+"' />";
					wrapper.innerHTML += '<a href='+link+' class="clickSingle"><div class="myLang"><img style="float:right;" src="https://img.icons8.com/plasticine/30/000000/diamond-heart.png"/>'
							+ petFavorite[i].adoption.petName
							+ '</div></a><div class="myLang">'
							+ petFavorite[i].adoption.petType
							+ '</div><div class="myLang">'
							+ petFavorite[i].adoption.ageYear
							+ '歲'
							+ petFavorite[i].adoption.ageMonth
							+ '個月</div><div class="myLang">'
							+ petFavorite[i].adoption.adoptCity
							+ petFavorite[i].adoption.adoptDistrict
							+ '</div><div class="myLang"><button type="button" onclick="cancelFav('
							+ petFavorite[i].favoriteID
							+ ')" class="btn btn-danger">取消收藏</button></div>'
				}
				if (petFavorite.length == 0) {
					var wrapper = document.getElementById("wrapper");
					wrapper.innerHTML = '<img src="https://img.icons8.com/ios-filled/35/000000/empty-dog-bowl.png"/>目前無資料，或查無資料'
				}
			}
		}
		function cancelFav(favID) {
			Swal.fire({
				  title: '移除後無法回復哦😊',
				  icon: 'warning',
				  showCancelButton: true,
				  allowOutsideClick: false,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '我確定❕',
				  cancelButtonText: '我再想想🤔'
				}).then((result) => {
				  if (result.isConfirmed) {
				   location.href='<c:url value="/deleteFavoriteLang/'+favID+'" />';
				  }
				})
		}
		
	</script>
</body>
</html>