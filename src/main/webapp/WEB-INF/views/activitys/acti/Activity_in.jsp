<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>


<script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link
	href="https://fonts.googleapis.com/css2?family=Big+Shoulders+Stencil+Display:wght@300&display=swap"
	rel="stylesheet">
<script src="https://use.fontawesome.com/29ff66d693.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<style>


img {
	vertical-align: middle;
}

button.btn {
    font-size: 20px;
}


.active {
	background-color: #717171;
}


/* 多張上傳 */


.Cover {
	width: 440px;
	height: 350px;
	margin-top: 10px;
	margin-right: 68px;
}

.Cover2 {
	width: 50px;
	height: 50px;
}

.d1, .d2 {
	display: inline-block;
}

.d2 {
	vertical-align: middle;
	margin-left: 30px;
}

.d3 {
	border: 1px solid black;
}

.shadow2 {
	/* 	 */
	font-size: 70px;
	font-family: 'Noto Serif TC', serif;
	font-weight: 600;
	color: #C02E4C;
}

.shadow2:hover {
	text-shadow: 3px 3px 10px #EEA29A;
}

.content-box_header__xPnGx {
	border-bottom: 1px solid black;
}

.content {
	padding-left: 55px;
	padding-right: 55px;
	padding-bottom: 20px;
	background-color: white;
	border-radius: 8%;
	width: 55%;
	/* display: table-cell; */
	line-height: 170%;
	position: absolute;
	display: inline-block;
	margin-left: 550px;
	box-shadow: 5px 5px 10px gray;
	margin-bottom: 20px
}

.content1 {
	display: grid;
	vertical-align: top;
	margin-bottom: 20px;
}

.content2 {
	display: grid;
	display: table-cell;
}

.pets-rule {
	
}

.row2.row {
	margin-left: 10px;
	margin-bottom: 5px;
}

.acPic {
	text-align: center;
	border-radius: 30px;
	background-color: #A89275;
	padding: 10px;
	width: 120px;
	margin-left: 37%;
	color: white;
	font-weight: 600;
	margin-top: 10px;
	margin-left: 37%;
	color: white;
}

.photoContainer{
	background-image: url("<c:url value='/img_activity/背景圖.jpg'/>");
	padding:20px;
	background-color:white;
}

.carousel-inner{
/* 	height: 315px; */
/*     display: flex; */
/*     align-items: center; */
/*     justify-content: center; */
}

</style>


</head>
<%-- <jsp:include page="../../petHomepage.jsp"></jsp:include> --%>
<jsp:include page="../../petHomepage.jsp"></jsp:include>
<link rel="stylesheet"
	href="//cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<body style="background-color: #F0F0F0">
	<div class="containerAll"
		style="display: inline-block; margin-left: 90px; margin-right: 50px;">
		<!-- --------------------------------------------- -->
		<div class="content2"
			style="display: inline-block; position: absolute; width: 30%;">
			<div class="content1">
				<div>
					<div class="shadow2">${activity_in.name}</div>
					<div style="font-size: 30px;">${activity_in.title}</div>
				</div>

				<div class="d1" style="margin-bottom: 30px">
					<img class="Cover"
						src="<c:url value='/activitys/in/${activity_in.ID}' />"
						alt="${activity_in.name}" />
				</div>
<!-- 				<hr> -->
<c:if test="${Album_count!=0}">				
				<!--3D 凹槽-->
				<div class="photoContainer">
					<div class="acPic">
						<span style="font-weight: 600">活動照片</span>
					</div>
					<!--輪播-->
					<div id="myCarousel" class="carousel slide" style="margin-top: 5px;margin-bottom:10px">
						<!-- 轮播（Carousel）指标 -->
						<ol class="carousel-indicators">
							<c:choose>
								<c:when test="${Album_count!=0}">
									<c:forEach var="albums" begin="0" end="${Album_count-1}"
										varStatus="bb">
										<c:choose>
											<c:when test="${albums==0}">
												<li data-target="#myCarousel" data-slide-to="0"
													class="active"></li>
											</c:when>
											<c:otherwise>
												<li data-target="#myCarousel" data-slide-to="${albums}"></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<!-- 還沒想到 -->
								</c:otherwise>
							</c:choose>
						</ol>
	
						<!-- 轮播（Carousel）项目 -->
						<div class="carousel-inner">
							<c:choose>
								<c:when test="${Album_count!=0}">
									<c:forEach var="albums" begin="0" end="${Album_count-1}"
										varStatus="bb">
										<c:choose>
											<c:when test="${albums==0}">
												<div class="item active">
													<img
														src="<c:url value='/activitys/in/image${Album_ID.get(albums)}.jpg' />"
														alt="${Album_NAME.get(albums)}">
													<!-- 												style="width: 440px; height: 350px;"> -->
												</div>
											</c:when>
											<c:otherwise>
												<div class="item">
													<img
														src="<c:url value='/activitys/in/image${Album_ID.get(albums)}.jpg' />"
														alt="${Album_NAME.get(albums)}">
													<!-- 												style="width: 440px; height: 350px;"> -->
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<!-- 還沒想到 -->
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 轮播（Carousel）导航 -->
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> 
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> 
						<a class="right carousel-control" href="#myCarousel" role="button"
							data-slide="next"> 
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>			
				</div>			
</c:if>
				<c:if test="${ userType == 'isAdmin'}">
					<button id="#create2" type="button" class="btn btn-danger"
						data-toggle="modal" data-target="#create2"
						style="height: 40px; font-size: 15pt">新增(多張照片上傳)</button>
				</c:if>
			</div>
		</div>


		<div class="content">
			<div>
				<div
					class="content-box_module__333d9 wilcity-single-listing-custom-content-box 1589270244695"
					style="margin-top: 30px">
					<header class="content-box_header__xPnGx clearfix">
						<div class="wil-float-left">
							<h2 class="content-box_title__1gBHS" style="font-size: 20pt">
								<img width="40px" src="https://img.icons8.com/clouds/100/000000/dancing-party.png"/></i> 活動詳情
							</h2>
						</div>
					</header>

					<div class="content-box_body__3tSRB d1">
						<div data-col-xs-gap="10" class=" row2 row">
							<div class="pets-rule"
								style="display: inline-block; position: absolute; line-height: 2.5;"
								width="400px" heigth="100px">
								<div>
									活動起日：
									<fmt:formatDate value="${activity_in.startDate}"
										pattern="yyyy-MM-dd" />
								</div>
								<div>
									活動訖日：
									<fmt:formatDate value="${activity_in.endDate}"
										pattern="yyyy-MM-dd" />
								</div>
								<c:choose>
									<c:when test="${activity_in.people==0 || activity_in.people==null}">
										<div>限制人數：無</div>
									</c:when>
									<c:otherwise>
										<div>限制人數：${activity_in.people}</div>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${activity_in.fee==0 || activity_in.fee==null}">
										<div>參加費用：請參考活動內容</div>
									</c:when>
									<c:otherwise>
										<div>參加費用：${activity_in.fee}</div>
									</c:otherwise>
								</c:choose>
								<div>適合寵物類型：${activity_in.petType}</div>
								<div>活動地址：
									<br>
									<img src="<c:url value='/img_activity/maker.jpg'/>" width="15" heigth="15">
									${activity_in.city}${activity_in.area}${activity_in.address}
								</div>
							</div>

							<div
								style="display: inline-block; margin-left: 135%; border: 2px solid black; width: 304px; height: 304px;">
								<!-- 								<br> -->
								<iframe class="pets-rule" id="c${activity_in.ID}" width="300"
									height="300" frameborder="0" style="border: 0"
									src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCf_NwQPpjokij66qmx93pwyr5N0irmE78&q=${activity_in.city}${activity_in.area}${activity_in.address}"
									allowfullscreen display="none"> </iframe>
							</div>
						</div>
					</div>


				</div>
			</div>
			<br>
			<div style="margin-top: 20px">
				<div
					class="content-box_module__333d9 wilcity-single-listing-custom-content-box 1589270244695">
					<header class="content-box_header__xPnGx clearfix">
						<div class="wil-float-left">
							<h2 class="content-box_title__1gBHS" style="font-size: 20pt">
								<img width="40px" src="https://img.icons8.com/clouds/100/000000/home.png"/></i> 活動內容
							</h2>
						</div>
					</header>

					<div class="content-box_body__3tSRB">
						<div data-col-xs-gap="10" class="row2 row">
							<div width="400px" heigth="100px">
								<div style="margin-top: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${activity_in.content}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="margin-top: 20px">
				<div
					class="content-box_module__333d9 wilcity-single-listing-custom-content-box 1589270244695">
					<header class="content-box_header__xPnGx clearfix">
						<div class="wil-float-left">
							<h2 class="content-box_title__1gBHS" style="font-size: 20pt">
								<img width="38px" src="https://img.icons8.com/cute-clipart/64/000000/add-phone.png"/> 聯絡資訊
							</h2>
						</div>
					</header>

					<div class="content-box_body__3tSRB" style="margin-top: 5px">
						<div data-col-xs-gap="10" class="row2 row">
							<div width="400px" heigth="100px">
								<div>諮詢電話：${activity_in.phone}</div>
								<div>E-mail：${activity_in.email}</div>
								<div>舉辦單位：${activity_in.host}</div>
								<div>網址：<a href="${activity_in.link}">${activity_in.link}</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 新增多張圖片 -->
	<div class="modal" id="create2" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form:form method='POST' modelAttribute="albumsBean"
					class='form-horizontal' enctype="multipart/form-data"
					action="/PetYou/album/add">
					<div class="modal-header">
						<font size="3" class="modal-title" id="exampleModalCenterTitle" style="line-height: 2.428571;">新增圖片
							
						</font>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" onclick="closeWin();">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class='col-lg-10'>
							<input type='hidden' name="id" value="${activity_in.ID}">
							<form:input id="filename" path="albumsImage" type='file'
								class='form:input-large' multiple="multiple" />
						</div>
					</div>
					<div class="modal-footer" style="margin-top: 1px;border-top:none;margin-right: 20px;display: block;">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal" onclick="closeWin();">關閉</button>
						<button id="dd" type="submit" class="btn btn-primary">送出</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- --------------------------------------------- -->
	<script>
		function closeWin() {
			$('#filename').val("");
		}
	</script>
</body>
</html>