<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link
	href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
* {
	margin: 0
}

.all {
	width: 1150px;
	display: inline-block;
}

.containerr {
	width: 340px;
	display: inline-block;
	margin-left: 30px;
	margin-bottom: 30px;
	line-height: 1.5;
	background-color: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 5px 5px 10px gray;
}

.divi {
	/* 	border: 1px groove red; */
	/* 	width: 200px; */
	border: 1px groove red;
	width: 340px;
}

.divii2 {
	width: 280px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-bottom: 10px;
	text-align: center;
	padding-top: 10px;
}

i {
	color: #F4ACB7;
	/* 	size: 2px; */
}

i.fa.fa-map-marker.zz {
	font-size: large;
}

.name2 {
	font-family: 'Staatliches', cursive;
	font-size: 30px;
}

.title, .title2 {
	margin-left: 10px;
}

.lighter2 {
	font-size: 20px;
	margin-left: 10px;
}

.img {
	height: 210px;
	text-align: center;
	border-style: none;
	overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
}

.pagenum {
	display: inline-block;
}

.pagebar {
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

.pagenum2 {
	margin: 0 5px 5px 5px;
	display: block;
	width: 48px;
	height: 48px;
	line-height: 48px;
	font-family: "Poppins", sans-serif;
	font-size: 20px;
	line-height: 48px;
	text-align: center;
	background-color: #fff;
	border-radius: 50%;
	font-family: "Microsoft JhengHei", Arial, Tahoma, sans-serif;
}

.go-top.show {
	bottom: 20px;
}

.go-top, .go-list {
	display: block;
	width: 40px;
	line-height: 35px;
	text-align: center;
	font-size: 30px;
	position: fixed;
	bottom: -50px;
	right: 30px;
	transition: all 1s ease;
	background-color: #404040;
	color: #FFFFFF;
	text-decoration: none;
	border-radius: 5px;
}

.go-top.show {
	bottom: 50px;
}

.mt-20 {
	margin-top: 20px;
}

.mb-20 {
	margin-bottom: 20px;
}

.tag {
	size: 10px;
	border-top: 1px solid black;
	padding-top: 5px;
	margin-left: 10px;
}

.overflow{
  overflow : hidden;
  text-overflow : ellipsis;
  white-space : nowrap;
}
</style>
</head>
<jsp:include page="../HomePage.jsp"></jsp:include>
<body>
	<jsp:useBean id="now" class="java.util.Date" scope="page" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowtime" />
	<fmt:formatDate value="${activitys.value.startDate}" type="both"
		dateStyle="long" pattern="yyyy-MM-dd" var="time" />
	<div
		style="display: inline-block; width: 20%; overflow: hidden; position: absolute; margin-left: 77.5%">
		<img alt="aa"
			src="${pageContext.request.contextPath}/img/電視台相關廣告圖.png"> 
			
			<img style="margin-top: 10px" 
			alt="aa" src="${pageContext.request.contextPath}/img/寵物展覽廣告圖.png">
	</div>

	<section class='all'>
		<c:forEach var='activitys' items='${activitys}'>
			<div class="containerr">
				<div class="divi2">
					<div class="img">
						<a href="<c:url value='/activitys/in?id=${activitys.value.ID}' />">
							<img class="img"
							src="<c:url value='/activitys/${activitys.value.ID}' />" />
						</a>
					</div>
					<div class="divii2">
						<span class='name2'>${activitys.value.name}</span><br> <span
							class='title'>${activitys.value.title}</span><br>
						<div class="overflow">
							<span class='lighter2'> <i class="fa fa-map-marker zz"
								aria-hidden="true"></i>&ensp;&nbsp;${activitys.value.city}${activitys.value.area}${activitys.value.address}
							</span><br> <span class='lighter2'> <i
								class='fas fa-phone-alt' aria-hidden="true"></i>&ensp;${activitys.value.phone}
							</span><br> <span class='title2'><i
								class='far fa-calendar-alt'></i>&ensp;活動起日：<fmt:formatDate
									value="${activitys.value.startDate}" pattern="yyyy-MM-dd" /></span><br>
							<span class='title2'><i class='fas fa-calendar-alt'></i>&ensp;活動訖日：<fmt:formatDate
									value="${activitys.value.endDate}" pattern="yyyy-MM-dd" /></span><br>
						</div>
						<div class='tag'>
							<i class="fa fa-hashtag" aria-hidden="true"></i>&ensp;活動
							<c:if test="${activitys.value.endDate > nowtime}" var="aa"
								scope="page">
								<span
									style="margin-bottom: 5px; padding: 5px; border: 1px solid; font-weight: bold;; color: green; float: right; margin-right: 20px;">進行中</span>
							</c:if>
							<c:if test="${!aa}">
								<span
									style="margin-bottom: 5px; padding: 5px; border: 1px solid; font-weight: bold; : blod; color: red; float: right; margin-right: 20px;">已截止</span>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

		<nav class="mt-20 mb-20">
			<ul class="pagebar">
				<c:set var="pageNo" value="${pageNo}" />
				<c:forEach var="page" begin="1" end="${totalPages}" varStatus="aa">
					<li class="pagenum"><c:choose>
							<c:when test="${type == '活動'}">
								<c:choose>
									<c:when test="${page == pageNo}">
										<span class="pagenum2" id="page${page}">${page}</span>
									</c:when>
									<c:otherwise>
										<a
											href="<c:url value='/activitys/searchPages?pageNo=${page}&type=活動&search=${search}' />"
											class="pagenum2"> <span id="page${page}">${page}</span>
										</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${page == pageNo}">
										<span class="pagenum2" id="page${page}">${page}</span>
									</c:when>
									<c:otherwise>
										<a
											href="<c:url value='/activitys/pages?pageNo=${page}&type=活動' />"
											class="pagenum2"> <span id="page${page}">${page}</span>
										</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
			</ul>
		</nav>
	</section>

	<a class="go-top show"> <i class="fa fa-angle-up"></i>
	</a>

	<script>
		$(window).scroll(function(event) {
			var scroll = $(window).scrollTop();
			if (scroll >= 400) {
				$(".go-top").addClass("show");
			} else {
				$(".go-top").removeClass("show");
			}
		});

		$(function() {
			$('.go-top').on('click', function(e) {
				e.preventDefault();
				$('html,body').animate({
					scrollTop : 0
				}, 500);
			});
		});
	</script>
</body>
</html>