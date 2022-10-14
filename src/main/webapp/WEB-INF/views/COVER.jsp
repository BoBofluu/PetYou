<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<!--
	Autonomy by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>寵你 只寵愛你</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<jsp:include page="petHomepage.jsp"></jsp:include>
<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script src="<c:url value='/jsCover/skel.min.js' />"></script>
<script src="<c:url value='/jsCover/skel-panels.min.js' />"></script>
<script src="<c:url value='/jsCover/init.js' />"></script>
<!-- <noscript> -->

<link rel="stylesheet"
	href="<c:url value='/cssCover/skel-noscript.css' />" />
<link rel="stylesheet" href="<c:url value='/cssCover/style.css' />" />
<link rel="stylesheet"
	href="<c:url value='/cssCover/style-desktop.css' />" />
<!-- </noscript> -->
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
<style type="text/css">
.navu {
	padding: 0px;
}

.menu li {
	line-height: 3.5;
}

.menu li a {
	display: block;
	text-align: center;
	font-size: 20px;
	color: #8D5433;
}

.navu {
	padding-top: 0px;
	height: 40px;
 	margin-bottom: 10px 
}

.navu li a {
	padding-top: 8px;
}

.navu li a:hover {
	height: 40px;
	padding-top: 8px;
}

.Socketnav {
	height: 600px;
	width: 0;
	position: fixed;
	z-index: 2;
	top: 0;
	left: 0;
	background-color: #f4a9b8;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 43px;
	margin-top: 125px;
	line-height: normal;
	font-size: 20px;
	box-shadow: 6px 9px 10px #908285;  
	border-radius: 15px;
}

#input {
	height: 32px;
	padding-top:3px;
}

#textarea { 
 	height: 346px; 
 	width: 400px; 
 } 

body {
	background-color: white
}
</style>
</head>
<body class="homepage">


	<div style="overflow: hidden; width: 100%; height: 480px; border: 0px;">
		<div style="border: 0px">
			<video controls loop="true" width="100%" autoplay="autoplay"
				muted="true" preload=”auto” onclick="return false" style="outline:0;">
				<source src="/file/best_buddys.mp4" type="video/mp4" >
			</video>
		</div>
	</div>

	<div id="featured">
		<div class="container">
			<div class="row">

				<div class="3u">
					<section>

						<a href="<spring:url value="/activitys" />" class="image full"><img
							src="<c:url value='/imagesCover/pics02.jpg' />" alt=""></a>
						<header>
							<h2>
								寵物聚會<img
									src="https://img.icons8.com/color/48/000000/party-baloons.png" />
							</h2>
						</header>
						<p>MissPeiPei開始提供寵物聚會的包場服務囉！狗狗聚會、寵物聚會，只要提前預約，都可以包場唷</p>
					</section>
				</div>

				<div class="3u">
					<section>
						<c:choose>
							<c:when test="${login}">
								<a href="<spring:url value='/selectAllArticle?page=1'/>"
									class="image full"><img
									src="<c:url value='/imagesCover/pics03.jpg' />" alt=""></a>
							</c:when>
							<c:otherwise>
								<a href="<spring:url value='/signin' />" class="image full"><img
									src="<c:url value='/imagesCover/pics03.jpg' />" alt=""></a>
							</c:otherwise>
						</c:choose>
						<header>
							<h2>
								寵物論壇 <img
									src="https://img.icons8.com/color/48/000000/communication.png" />
							</h2>
						</header>
						<p>這是一個寵物交流平台。歡迎大家分享資訊連結以及交流心得</p>
					</section>
				</div>

				<div class="3u">
					<section>
						<c:choose>
							<c:when test="${login}">
								<a href="<spring:url value='/commoditys'/>" class="image full"><img
									src="<c:url value='/imagesCover/pics04.jpg' />" alt=""></a>
							</c:when>
							<c:otherwise>
								<a href="<spring:url value='/signin'/>" class="image full"><img
									src="<c:url value='/imagesCover/pics04.jpg' />" alt=""></a>
							</c:otherwise>
						</c:choose>

						<header>
							<h2>
								寵物商城<img
									src="https://img.icons8.com/color/48/000000/shopping-basket.png" />
							</h2>
						</header>
						<p>寵你商城，是一個關心寵物生活為出發點的的寵物用品購物資訊商城，滿足毛孩更多的渴望</p>
					</section>
				</div>

				<div class="3u">
					<section>
						<a href="<spring:url value="/LangCover" />" class="image full"><img
							src="<c:url value='/imagesCover/pics05.jpg' />" alt=""
							width="172px"></a>
						<header>
							<h2>
								領養浪浪<img
									src="https://img.icons8.com/color/48/000000/dog-house.png" />
							</h2>
						</header>
						<p>寵你認養是一個為流浪動物找家的平台，以同等的愛與關懷，牽起流浪動物的手，協助牠們找尋幸福</p>
					</section>
				</div>

			</div>
		</div>
	</div>
	<div id="marketing">
		<div class="container">
			<div class="row">
				<div class="3u">
					<section>
						<header>
							<h2>
								<img width="36px"
									src="https://img.icons8.com/color/48/000000/queen-uk.png" />推薦診所
							</h2>
						</header>
						<ul class="style1">
							<li class="first"><img
								src="<c:url value='/image/homepage/hospital 1.jpg' />"
								width="200" height="150" alt="">
								<p>
									樂漠動物醫院<br>最優良環境
								</p></li>
							<li><img
								src="<c:url value='/image/homepage/hospital 2.jpg' />"
								width="200" height="150" alt="">
								<p>
									小島動物醫院<br>超完美戶外活動空間
								</p></li>
							<li><img
								src="<c:url value='/image/homepage/hospital 3.jpg' />"
								width="200" height="150" alt="">
								<p>
									小王子動物醫院(長安分院)<br>醫生細心第一名
								</p></li>
						</ul>
					</section>
				</div>
				<div class="3u">
					<section>
						<header>
							<h2>
								<img width="36px"
									src="https://img.icons8.com/color/48/000000/queen-uk.png" />推薦美容
							</h2>
						</header>
						<ul class="style1">
							<li class="first"><img
								src="<c:url value='/image/homepage/salon 1.jpg' />" width="200"
								height="150" alt="">
								<p>
									酷瑪寵物美容<br>造型創意第一名
								</p></li>
							<li><img src="<c:url value='/image/homepage/salon 2.jpg' />"
								width="200" height="150" alt="">
								<p>
									旺太郎寵物沙龍<br>環境優良第一名
								</p></li>
							<li><img src="<c:url value='/image/homepage/salon 3.jpg' />"
								width="200" height="150" alt="">
								<p>
									爵寵寵物沙龍<br>服務態度最友善
								</p></li>
						</ul>
					</section>
				</div>
				<div class="6u">
					<section>
						<header>
							<h2>輕鬆預約寵物服務</h2>
						</header>
						<a href="<c:url value='/reservation' />" class="image full"><img
							src="<c:url value='/image/salon/Salon_icon.png' />"
							style='width: 450px;filter: revert;' alt=""></a>
						<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp提供一般內科與家醫科的出診服務，包含預防針施打。並為行動不便的犬貓，提供友善的醫療和居家照護服務。</p>
						<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp犬貓幼年、青少年、成年與老年各階段，到府協助飼主規劃適合的飲食計畫和飼養環境。</p>
						<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp寵物美容室採透明開放式空間， 讓爸爸媽媽們清楚毛小孩的動向及狀態，以及在美容時的每一個過程，讓您更能放心。</p>
					</section>
				</div>
			</div>
		</div>
	</div>

	<div id="main">
		<div class="container">
			<div class="row">
				<div class="8u">
					<section>
						<header>
							<h2>
								<img width="40" src="https://img.icons8.com/nolan/64/hearts.png" />寵你
								只寵愛你<img width="40"
									src="https://img.icons8.com/nolan/64/hearts.png" />
							</h2>
						</header>
						<p>世界第一寵物品牌</p>
						<p>全台最大寵物線上平台</p>
						<p>毛小孩好熱啊～寵你提供優質的寵物美容服務，在舒適的環境下享受服務，今天就預訂。專業美容師執照、全部服務含寵物險、100%品質保證，不滿意退費。</p>
						<p>超過20年臨床經驗，中西醫合併診治，給您的寶貝全方位呵護。獸醫針灸師。美國Chi Institute
							認證。穴位雷射治療。犬貓內外科醫療。</p>

					</section>
				</div>
				<div class="4u">
					<section>
						<header>
							<h2>執行團隊</h2>
						</header>
						<ul class="style">
							<li><img width="30px" style="margin-right: 8px"
								src="https://img.icons8.com/dusk/64/000000/hospital.png" />柯慧青</li>
							<li><img width="30px" style="margin-right: 8px"
								src="https://img.icons8.com/dusk/64/000000/speech-bubble-with-dots.png" />李旻峰</li>
							<li><img width="30px" style="margin-right: 8px"
								src="https://img.icons8.com/dusk/64/000000/add-user-group-woman-man.png" />李欣哲</li>
							<li><img width="30px" style="margin-right: 8px"
								src="https://img.icons8.com/dusk/64/000000/maracas.png" />林信源</li>
							<li><img width="30px" style="margin-right: 8px"
								src="https://img.icons8.com/dusk/64/000000/shopping.png" />陳君豪</li>
							<li><img width="30px" style="margin-right: 8px"
								src="https://img.icons8.com/dusk/64/000000/home.png" />陳德諭</li>
						</ul>
					</section>
				</div>
			</div>
		</div>
	</div>


	<div id="copyright">
		<div class="container">
			<div>@版權所有</div>
			<hr>
			<div>製作團隊: EEIT119 寵你 只寵愛你</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>