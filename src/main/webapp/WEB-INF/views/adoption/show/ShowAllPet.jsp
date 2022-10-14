<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">

<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

.wrapper {
	width: auto;
	height: auto;
	float: right;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	border-radius: 5px;
	padding: 15px;
	margin-bottom: 2%;
	margin-right: 5%
}

.source {
	border: 0px;
	background: #C6FFDD;
	background: -webkit-linear-gradient(to right, #AF2E41, #FBD786, #C6FFDD);
	background: linear-gradient(to right, #AF2E41, #FBD786, #C6FFDD);
	color: white;
	text-align: left;
	font-weight: bold;
	padding: 5px;
	border-radius: 5px;
	width: 250px;
	height: 40px;
	margin-bottom: 10px;
	background: linear-gradient(to right, #AF2E41, #FBD786, #C6FFDD);
}

img {
	border-radius: 5px;
}

.image {
	display: inline-block;
	overflow: hidden;
	height: 270px;
	line-height: 270px
}

.content {
	border: 2px solid darkgray;
	height: 270px;
	width: 580px;
	display: inline-block;
	border-radius: 5px;
	text-align: top;
	vertical-align: top;
	padding: 10px
}

.introduce {
	font-size: 14pt;
}

.warning {
	border-radius: 10px;
	padding: 10px;
	margin-top: 10px;
	font-size: 10pt;
	background-color: #EDC7B7;
	opacity: 0.8;
	width: 550px
}

.sweet {
	font-weight: bold;
	color: #753613
}

.details {
	display: inline-block;
	border-radius: 5px;
	text-align: top;
	vertical-align: top;
	border: 2px solid darkgray;
	padding: 10px;
	width: 160px;
	height: 270px;
	margin-left: 10px
}

.title {
	font-size: 10pt;
	color: gray;
	padding: 0px;
	margin: 0px;
	text-align: center
}

.describe {
	text-align: center
}

.click {
	text-align: center;
	border: 1px solid black;
	width: 120px;
	border-radius: 30px;
	margin: 0 auto;
	text-weight: bold;
	box-shadow: 3px 3px 5px #49494b;
	font-weight: bold;
	text-decoration: none;
}

.click :hover {
	text-decoration: none;
}

.cut {
	overflow: hidden;
	width: 400px;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: inline-block;
}

.clickHere {
	text-decoration: none;
	color: black;
}

.clickHere :hover {
	background-color: #bd8c7d;
	color: white;
	text-decoration: none;
}

.findHome {
	color: black;
}

.findHome :hover {
	color: white;
	text-decoration: none;
	text-shadow: 0 0 0.2em black, 0 0 0.2em black;
}

.searchBar {
	display: inline-block;
	height: auto;
	float: left;
	width: 300px;
	margin-left: 4.5%;
	border-radius: 3px;
	color: #3A3B3c;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	position: absolute;
	margin-bottom: 50px
}

.glass {
	margin-top: 23px;
	margin-bottom: 10px;
	text-align: center;
}

.hr {
	background: linear-gradient(to right, #AC3B61, pink);
	height: 2px;
	width: 90%;
	margin: 5% auto;
	margin-top: 5px;
}

.petType {
	background-color: #F8A39E;
	height: 85px;
	text-align: center;
	line-height: 85px;
	width: 85%;
	margin: 10px auto;
	border-radius: 5px;
	font-weight: 600;
}

.petAge {
	background-color: #F8A39E;
	height: 85px;
	text-align: center;
	line-height: 85px;
	width: 85%;
	margin: 10px auto;
	border-radius: 5px;
	font-weight: 600
}

input[type=radio] {
	transform: scale(1.6);
	margin-right: 2px;
	margin-left: 2px;
}

.year {
	width: 50px;
	border-radius: 5px;
	height: 50%;
	margin-right: 10px;
}

.btn-block {
	margin: 10px auto;
}

.image :hover {
	-webkit-filter: brightness(.9);
}

.allData {
	position: absolute;
	margin-left: 21%;
	width: 1200px;
}

.searchData {
	margin-left: 21%;
	width: 1200px;
}

.pages {
	margin-bottom: 10px;
	float: right;
	margin-right: 39%;
}

#conditionPages {
	margin-bottom: 10px;
	float: right;
	margin-right: 35%;
	margin-top:
}

.page-item {
	cursor: pointer;
}

.disabled {
	cursor: default;
}
</style>
</head>

<body>
	<jsp:include page="../HomePage.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

	<div class="searchBar">
		<div class="glass">
			<img
				src="https://img.icons8.com/plasticine/55/000000/search-more.png" />
			<span style="font-size: 22pt;">條件篩選</span>
		</div>
		<div style="font-size: 14pt; margin-left: 5%; font-weight: bold">選擇條件</div>
		<hr class="hr">
		<div class="petType">
			<input name="petType" type="radio" value="C" id="chooseCat">
			<label for="chooseCat">貓</label> <input name="petType" type="radio"
				value="D" id="chooseDog"> <label for="chooseDog">狗</label> <input
				name="petType" type="radio" value="R" id="chooseRabbit"> <label
				for="chooseRabbit">兔子</label> <input type="radio" name="petType"
				value="O" id="chooseOther"> <label for="chooseOther">其他</label>
			<input type="radio" id="noneType" name="petType" value="none"
				checked="checked" hidden="">
		</div>
		<div class="petAge">
			<select class="year" id="petYearMin" onclick="reasonable()">
				<option value="0" label="0" selected="selected">
			</select>歲 — <select class="year" id="petYearMax">
				<option value="25" label="25" selected="selected">
			</select>歲
		</div>

		<div class="petType">
			<input type="radio" value="M" name="petSex" id="male"> <label
				for="male"> 公</label> <input type="radio" value="F" name="petSex"
				id="female"> <label for="female"> 母 </label> <input
				type="radio" value="N" name="petSex" id="unknown"> <label
				for="unknown"> 性別未知 </label> <input type="radio" name="petSex"
				id="noneSex" value="none" checked="checked" hidden="">
		</div>

		<div class="petType">
			<input type="radio" value="L" name="size" id="Lsize"> <label
				for="Lsize"> 大型</label> <input type="radio" value="M" name="size"
				id="Msize"> <label for="Msize">中型</label> <input
				type="radio" value="S" name="size" id="Ssize"> <label
				for="Ssize">小型</label><input type="radio" name="size" value="none"
				id="noneSize" checked="checked" hidden="">
		</div>
		<button type="button" onclick="submit()" id="submit"
			class="btn btn-outline-danger btn-lg btn-block" style="width: 90%">搜尋</button>
		<button type="button" id="clear"
			class="btn btn-outline-secondary btn-lg btn-block" style="width: 90%">清除條件</button>
		<button type="button" onclick="showAll()"
			class="btn btn-outline-info btn-lg btn-block"
			style="width: 90%; margin-bottom: 20px">查詢全部</button>
	</div>

	<div class="searchData"></div>
	<div id="conditionPages">
		<nav aria-label="...">
			<ul class="pagination pagination-lg"
				style="box-shadow: 12px 12px 7px #dfe3e8;"></ul>
		</nav>
	</div>

	<div class="allData">
		<c:forEach var="pet" items="${pets}" varStatus="fav">
			<div class="wrapper">
				<div class="source">品種：${pet.value.petType}</div>
				<div class="image">
					<a style="text-decoration: none" class="clickHere"
						href='showSinglePet/${pet.value.adoptionInfoID}'> <img
						alt="dog" width="250px"
						src="<c:url value='/adoption/getPicture/${pet.value.adoptionInfoID}' />" /></a>
				</div>

				<div class="content">


					<a style="text-decoration: none" class="findHome"
						href='showSinglePet/${pet.value.adoptionInfoID}'><h5
							style="text-align: top;">
							<img src="https://img.icons8.com/cute-clipart/50/000000/dog.png" />可愛浪浪
							《${pet.value.petName}》 找一個溫暖的家
						</h5></a>

					<!-- 我的最愛功能 -->
					<c:if test="${login==true}">
						<span class="savePic${pet.value.adoptionInfoID}"> <img
							style="float: right"
							class="changeIcon${pet.value.adoptionInfoID}"
							onclick="unsave(${pet.value.adoptionInfoID})"
							src="https://img.icons8.com/wired/40/000000/hearts.png" /></span>
					</c:if>
					<!-- 我的最愛功能 -->

					<span class="cut introduce">浪浪個性：${pet.value.petCondition}</span> <br>
					<span class="introduce">領養地點：${pet.value.adoptCity}${pet.value.adoptDistrict}</span>

					<div class="warning">

						<span class="sweet">貼心小提醒：</span><br>
						狗狗與貓貓都擁有豐富的情感，您的照顧及愛護會讓牠們感到幸福而變漂亮，但您的遺棄則會造成牠們一輩子的陰影；當您決定飼養寵物時，一定要做好照顧牠一輩子的準備，不要因為生病或不想負責任的時候就隨意拋棄喔！
					</div>
				</div>
				<div class="details">
					<p class="title">拾獲日期</p>
					<p class="describe">${pet.value.foundDate}</p>
					<p class="title">性別</p>
					<p class="describe">${pet.value.petSex}</p>
					<p class="title">年齡</p>
					<p class="describe">${pet.value.ageYear}歲${pet.value.ageMonth}個月</p>
					<a style="text-decoration: none" class="clickHere"
						href='showSinglePet/${pet.value.adoptionInfoID}'><div
							class="click">詳細資料</div></a>
				</div>

			</div>
		</c:forEach>

		<!-- 		TEST -->
		<input type="hidden" class="first" value="${result[0]}"> <input
			type="hidden" class="second" value="${result[1]}"> <input
			type="hidden" class="third" value="${result[2]}">
		<!-- 		TEST -->

		<div class="pages" id="allPages">
			<nav aria-label="...">
				<ul class="pagination pagination-lg"
					style="box-shadow: 12px 12px 7px #dfe3e8;">
					<c:forEach var="page" begin="1" end="${totalPages}" varStatus="aa">
						<c:set var="pageNo" value="${pageNo}" />
						<c:choose>
							<c:when test="${page == pageNo}">
								<li class="page-item disabled"><a class="page-link"
									href="javascript:" tabindex="-1"><span
										style="font-weight: 600; color: #6A7287" id="page${page}">${page}</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="<c:url value='/ShowAllPet?pageNo=${page}' />"><span
										id="page${page}" style="font-weight: 600; color: #B11429">${page}</span></a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</nav>
		</div>
		<input class="userID" value="${userId}" type="hidden">
	</div>

	<script type="text/javascript">
	
	var userID = $('.userID').val()
	function saveLang(id) {
		console.log("取消儲存")
		Swal.fire({
  			title: '您要將浪浪移出我的最愛嗎?',
 			showCancelButton: true,
  			confirmButtonText: "是的",
 			cancelButtonText: '取消',
  			allowOutsideClick: false
		}).then((result) => {
 			 if (result.isConfirmed) {
	 		 	console.log(id)
				location.href='<c:url value="/deleteFavoriteFromHome/'+id+'/'+${pageNo}+'" />'
   		 		$('.changeIcon'+id).attr("src","https://img.icons8.com/wired/40/000000/hearts.png");
				$('.changeIcon'+id).attr("onclick","unsave("+id+")");
  			} 
		})
	}
	
	function unsave(id) {
		console.log("儲存最愛")
		console.log(id)
		 console.log(userID)
		Swal.fire({
  			title: '您要將浪浪加入我的最愛嗎?',
 			showCancelButton: true,
  			confirmButtonText: "是的",
 			cancelButtonText: '取消',
  			allowOutsideClick: false
		}).then((result) => {
 			 if (result.isConfirmed) {
	 			
				location.href='<c:url value="/addFavoriteLang/'+id+'/'+userID+'" />'
				$('.changeIcon'+id).attr("src","https://img.icons8.com/dusk/40/000000/hearts.png");
				$('.changeIcon'+id).attr("onclick","saveLang("+id+")");
 			 } 
		})
	}
	
	var favList = []
	
	if (${login==true}) {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/myFavoriteLang/" + ${userId} + "' />",
				true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
// 				alert('換愛心')
				var first = $('.first').val()
				var second = $('.second').val()
				var third = $('.third').val()
				petFavorite = JSON.parse(xhr.responseText);
				for (var i = 0; i < petFavorite.length; i++) {
					favList.push(petFavorite[i].adoption.adoptionInfoID)
						if (petFavorite[i].adoption.adoptionInfoID == first || petFavorite[i].adoption.adoptionInfoID == second || petFavorite[i].adoption.adoptionInfoID == third) {
							$('.savePic'+petFavorite[i].adoption.adoptionInfoID).html('<img style="float: right" class="changeIcon'+petFavorite[i].adoption.adoptionInfoID+'" onclick="saveLang('+petFavorite[i].adoption.adoptionInfoID+')" src="https://img.icons8.com/dusk/40/000000/hearts.png" />')
						}
					}
				}
			}
		}
	
		for (var i = 0; i <= 25; i++) { //搜尋欄之最小年歲
			$("#petYearMin").append('<option value="'+i+'">' + i + '</option>');
		}

		for (var i = 0; i <= 25; i++) { //搜尋欄之最大年歲
			$("#petYearMax").append('<option value="'+i+'">' + i + '</option>');
		}

		function reasonable() { //最大年歲隨最小年歲修改
			$('#petYearMax').find(
					"option[value=" + $("#petYearMin").val() + "]").attr(
					"selected", "selected");
		}

		$("#clear").click(function() { //清除篩選條件
			$("#noneType").prop("checked", true);
			$("#noneSex").prop("checked", true);
			$("#noneSize").prop("checked", true);
			$('#petYearMin').find("option[value=0]").prop('selected', true);
			$('#petYearMax').find("option[value=25]").prop('selected', true);
		})

		function submit() { //送出篩選條件 取得Json檔案
			
			var petType = $('input[name=petType]:checked').val();
			var petSex = $('input[name=petSex]:checked').val();
			var size = $('input[name=size]:checked').val();
			var petYearMin = $("#petYearMin").val();
			var petYearMax = $("#petYearMax").val();

			var xhr2 = new XMLHttpRequest();
			xhr2
					.open(
							"GET",
							"<c:url value='/searchPet/" + petType + "/"
					+ petYearMin + "/" + petYearMax
					+ "/" + petSex + "/" + size + "' />",
							true);
			xhr2.send();
			xhr2.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr2.readyState == 4 && xhr2.status == 200) {
					$(".allData").remove();
					$(".searchData div").remove();
					test = JSON.parse(xhr2.responseText);
	
					var count = 0;
for ( var e in test) {
	console.log(test[e])
		for ( var a in test[e]) {
			console.log(test[e][a].adoptionInfoID)
		}
		count++;
	}
// 	console.log(count)
					var postsCount = count;
					$("<div/>").attr('class', 'searchResult' + postsCount)
							.appendTo($(".searchData"));

					for ( var i in test) {
						for ( var b in test[i]) {
// 							console.log(test[i][b].adoptionInfoID)
							var a = '<c:url value="/adoption/getPicture/'+test[i][b].adoptionInfoID+'" />';
							$(".searchResult" + postsCount)
									.append(
											'<div class="wrapper wrapper'+test[i][b].adoptionInfoID+'" ><div class="source">品種：'
													+ test[i][b].petType
													+ '</div><div class="image"><img alt="dog" width="260px" style="margin-right:10px" src="'+a+'" /></div><div class="content" id="second'+test[i][b].adoptionInfoID+'" ><a style="text-decoration: none" class="findHome" href="showSinglePet/'+test[i][b].adoptionInfoID+'"><h5 style="text-align: top;"><img src="https://img.icons8.com/cute-clipart/50/000000/dog.png" />可愛浪浪 《 '
													+ test[i][b].petName
													+ '》 找一個溫暖的家</h5></a>')
													
								if (${login==true}) {
									$("#second"+test[i][b].adoptionInfoID).append('<span class="savePic'+test[i][b].adoptionInfoID+'"> <img style="float: right" class="changeIcon'+test[i][b].adoptionInfoID+'" onclick="unsave('+test[i][b].adoptionInfoID+')" src="https://img.icons8.com/wired/40/000000/hearts.png" /></span>')
								}
							
							for (var a = 0; a < favList.length; a++) {
								if (test[i][b].adoptionInfoID == favList[a]) {
									$('.savePic'+test[i][b].adoptionInfoID).html('<img style="float: right" class="changeIcon'+test[i][b].adoptionInfoID+'" onclick="saveLang('+test[i][b].adoptionInfoID+')" src="https://img.icons8.com/dusk/40/000000/hearts.png" />')
								}
							}
							
													
					$("#second"+test[i][b].adoptionInfoID).append('<span class="cut introduce">浪浪個性：'
													+ test[i][b].petCondition
													+ '</span> <br> <spanclass="introduce">領養地點：'
													+ test[i][b].adoptCity
													+ test[i][b].adoptDistrict
													+ '</span><div class="warning"><span class="sweet">貼心小提醒：</span><br>狗狗與貓貓都擁有豐富的情感，您的照顧及愛護會讓牠們感到幸福而變漂亮，但您的遺棄則會造成牠們一輩子的陰影；當您決定飼養寵物時，一定要做好照顧牠一輩子的準備，不要因為生病或不想負責任的時候就隨意拋棄喔！</div></div>');
					
					$(".wrapper"+test[i][b].adoptionInfoID).append('<div class="details" style="disply:inline-block"><p class="title">拾獲日期</p><p class="describe">'
							+ test[i][b].foundDate
							+ '</p><p class="title">性別</p><p class="describe">'
							+ test[i][b].petSex
							+ '</p><p class="title">年齡</p><p class="describe">'
							+ test[i][b].ageYear
							+ '歲'
							+ test[i][b].ageMonth
							+ '個月</p><a style="text-decoration: none" class="clickHere"	href="showSinglePet/'
						+ test[i][b].adoptionInfoID
						+'"><div class="click">詳細資料</div></a></div></div>')
						}
						
						postsCount = postsCount - 1;
						$("<div/>").attr('class', 'searchResult' + postsCount)
								.appendTo($(".searchData"));

						for (var i = 0; i < test.totalPages; i++) {
							if (test.pageNo == (i + 1)) {
								$(".pagination-lg")
										.html(
												'<li class="page-item disabled"><a class="page-link" href="javascript:" tabindex="-1"><span style="font-weight: 600; color: #6A7287" id="page'
														+ (i + 1)
														+ '">'
														+ (i + 1)
														+ '</span></a></li>')
							} else {
								$('.pagination-lg')
										.append(
												'<li  onclick="getNextPage('
														+ (i + 1)
														+ ')" class="page-item"><a class="page-link" ><span id="page'
														+ (i + 1)
														+ '" style="font-weight: 600; color: #B11429">'
														+ (i + 1)
														+ '</span></a></li>')
							}
						}
						if (test.totalPages == 0) {
							$(".searchData")
									.html(
											'<div style="float: right;width: 75%;height: 500px;background-color: white;text-align: center;border-radius: 10px;line-height: 500px;color: #c74c6b;font-size: 22pt;box-shadow: 12px 12px 7px #dfe3e8;margin-right: 10%;font-weight: 700;margin-bottom:10px"><a  href="http://localhost:8080/PetYou/freePost" ><buttontype="button" class="btn btn-outline-danger">我要幫忙刊登</button></a><img src="https://img.icons8.com/doodle/48/000000/rabbit-in-hat.png" />Oops... 目前無資料，或查無資料！</div>');
							$('.pagination-lg').html("")
						}
					}
				}
			}
		}

		function showAll() {
			location.href = "<c:url value='/ShowAllPet'  /> ";
		}

		function getNextPage(result) {
			$(".allData").remove();
			$(".searchData div").remove();
			var petType = $('input[name=petType]:checked').val();
			var petSex = $('input[name=petSex]:checked').val();
			var size = $('input[name=size]:checked').val();
			var petYearMin = $("#petYearMin").val();
			var petYearMax = $("#petYearMax").val();

			var xhr4 = new XMLHttpRequest();
			xhr4.open("GET", "<c:url value='/searchPet/" + petType + "/"
					+ petYearMin + "/" + petYearMax + "/" + petSex + "/" + size
					+ "?pageNo=" + result + "' />", true);
			xhr4.send();
			xhr4.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr4.readyState == 4 && xhr4.status == 200) {
					test = JSON.parse(xhr4.responseText);
					var count = 0;
					for ( var e in test) {
							for ( var a in test[e]) {
								console.log(test[e][a].adoptionInfoID)
							}
							count++;
						}

					var postsCount = count - 2;
					$("<div/>").attr('class', 'searchResult' + postsCount)
							.appendTo($(".searchData"));

					for ( var i in test) {
						for ( var b in test[i]) {
							
							var a = '<c:url value="/adoption/getPicture/'+test[i][b].adoptionInfoID+'" />';
							$(".searchResult" + postsCount)
									.append(
											'<div class="wrapper wrapper'+test[i][b].adoptionInfoID+'" ><div class="source">品種：'
													+ test[i][b].petType
													+ '</div><div class="image"><img alt="dog" width="260px" style="margin-right:10px" src="'+a+'" /></div><div class="content" id="second'+test[i][b].adoptionInfoID+'" ><a style="text-decoration: none" class="findHome" href="showSinglePet/'+test[i][b].adoptionInfoID+'"><h5 style="text-align: top;"><img src="https://img.icons8.com/cute-clipart/50/000000/dog.png" />可愛浪浪 《 '
													+ test[i][b].petName
													+ '》 找一個溫暖的家</h5></a>')
													
								if (${login==true}) {
									$("#second"+test[i][b].adoptionInfoID).append('<span class="savePic'+test[i][b].adoptionInfoID+'"> <img style="float: right" class="changeIcon'+test[i][b].adoptionInfoID+'" onclick="unsave('+test[i][b].adoptionInfoID+')" src="https://img.icons8.com/wired/40/000000/hearts.png" /></span>')
								}
							
							for (var a = 0; a < favList.length; a++) {
								if (test[i][b].adoptionInfoID == favList[a]) {
									$('.savePic'+test[i][b].adoptionInfoID).html('<img style="float: right" class="changeIcon'+test[i][b].adoptionInfoID+'" onclick="saveLang('+test[i][b].adoptionInfoID+')" src="https://img.icons8.com/dusk/40/000000/hearts.png" />')
								}
							}
													
					$("#second"+test[i][b].adoptionInfoID).append('<span class="cut introduce">浪浪個性：'
													+ test[i][b].petCondition
													+ '</span> <br> <spanclass="introduce">領養地點：'
													+ test[i][b].adoptCity
													+ test[i][b].adoptDistrict
													+ '</span><div class="warning"><span class="sweet">貼心小提醒：</span><br>狗狗與貓貓都擁有豐富的情感，您的照顧及愛護會讓牠們感到幸福而變漂亮，但您的遺棄則會造成牠們一輩子的陰影；當您決定飼養寵物時，一定要做好照顧牠一輩子的準備，不要因為生病或不想負責任的時候就隨意拋棄喔！</div></div>');
					
					$(".wrapper"+test[i][b].adoptionInfoID).append('<div class="details" style="disply:inline-block"><p class="title">拾獲日期</p><p class="describe">'
							+ test[i][b].foundDate
							+ '</p><p class="title">性別</p><p class="describe">'
							+ test[i][b].petSex
							+ '</p><p class="title">年齡</p><p class="describe">'
							+ test[i][b].ageYear
							+ '歲'
							+ test[i][b].ageMonth
							+ '個月</p><a style="text-decoration: none" class="clickHere"	href="showSinglePet/'
						+ test[i][b].adoptionInfoID
						+'"><div class="click">詳細資料</div></a></div></div>')

						}
						
						postsCount = postsCount - 1;
						$("<div/>").attr('class', 'searchResult' + postsCount)
								.appendTo($(".searchData"));

						if (result == 1) {
							$('.pagination-lg')
									.html(
											'<li class="page-item disabled" ><a class="page-link" ><span onclick="" id="page'
											+ 1
											+ '" style="font-weight: 600; color: #6A7287">'
													+ 1 + '</span></a></li>');
						} else {
							$('.pagination-lg')
									.html(
											'<li  onclick="getNextPage('
													+ 1
													+ ')" class="page-item"><a class="page-link" ><span id="page'
													+ 1
													+ '" style="font-weight: 600; color: #B11429">'
													+ 1 + '</span></a></li>');
						}

						for (var i = 1; i < test.totalPages; i++) {
							if (result == (i + 1)) {
								$('.pagination-lg')
										.append(
												'<li  onclick="getNextPage('
														+ (i + 1)
														+ ')" class="page-item disabled"><a class="page-link" ><span id="page'
														+ (i + 1)
														+ '" style="font-weight: 600; color: #6A7287">'
														+ (i + 1)
														+ '</span></a></li>')
							} else {
								$('.pagination-lg')
										.append(
												'<li onclick="getNextPage('
														+ (i + 1)
														+ ')" class="page-item"><a class="page-link" ><span  id="page'
														+ (i + 1)
														+ '" style="font-weight: 600; color: #B11429">'
														+ (i + 1)
														+ '</span></a></li>')

							}
						}

						if (test.totalPages == 0) {
							$(".searchData")
									.html(
											'<div style="float: right;width: 75%;height: 500px;background-color: white;text-align: center;border-radius: 10px;line-height: 500px;color: #c74c6b;font-size: 22pt;box-shadow: 12px 12px 7px #dfe3e8;margin-right: 10%;font-weight: 700;margin-bottom:10px"><a  href="http://localhost:8080/PetYou/freePost" ><buttontype="button" class="btn btn-outline-danger">我要幫忙刊登</button></a><img src="https://img.icons8.com/doodle/48/000000/rabbit-in-hat.png" />Oops... 目前無資料，或查無資料！</div>');
							$('.pagination-lg').html("")
						}
					}
				}
			}
		}
		
		
	</script>
</body>
</html>