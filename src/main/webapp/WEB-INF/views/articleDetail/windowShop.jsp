<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link type="text/css" href="<spring:url value='/css/windowShop.css'/>"
	rel="stylesheet">
<style type="text/css">
.carousel-control-next-icon-self {
	background-image:
		url("<spring:url value='/images/article/icons8-右-100.png'/>");
	width: 100px;
	height: 100px;
}

.carousel-control-prev-icon-self {
	background-image:
		url("<spring:url value='/images/article/icons8-左-100.png'/>");
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	<article class="change-article">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<div style="width: 1250px; height: 475px;" class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" style="height: 475px;"
						src="<spring:url value='/images/windowShop_Img/window_ad_2.jpg'/>"
						alt="First slide">
<!-- 					<div class="carousel-caption d-none d-md-block"> -->
<!-- 						<h2>商品</h2> -->
<!-- 					</div> -->
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="<spring:url value='/images/windowShop_Img/window_ad_1.jpg'/>"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="<spring:url value='/images/windowShop_Img/window_ad_3.jpg'/>"
						alt="Third slide">
				</div>
			</div>
			<a style="width: 100px; opacity: 1;" class="carousel-control-prev"
				href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon-self" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a style="width: 100px; opacity: 1;" class="carousel-control-next"
				href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon-self" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div class="change-menu">
			<c:forEach var="goods" items="${wsb}">
				<div class="change-goods">
					<img class="goods-imgs"
						src="<spring:url value='${goods.goodsImg}'/>">
					<p class="goods-title" id="title-${goods.uuid}">${goods.goodsTitle}</p>
					<p class="goods-quantity" id="amount-${goods.uuid}">商品數量：${goods.goodsAmount}
						&nbsp&nbsp&nbsp&nbsp ${goods.goodsMoney}金幣/抽</p>
					<input type="text" id="input-amount-${goods.uuid}"
						value="${goods.goodsAmount}" hidden="true">
					<p class="goods-time">活動時間：${goods.showEndTime} ~
						${goods.showStartTime}</p>
					<span class="goods-status">抽抽樂</span>
					<jsp:useBean id="now" class="java.util.Date" scope="page" />
					<input type="text"
						value='<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="nowDate"/>'
						hidden="true">
					<c:choose>
						<c:when test="${goods.goodsAmount == 0}">
							<span class="goods-ending-empty">已無存貨</span>
						</c:when>
						<c:when test="${nowDate>goods.showStartTime}">
							<span class="goods-ending-empty">商品截止</span>
						</c:when>
						<c:otherwise>
							<span class="goods-ending" id="goods-${goods.uuid}">參加抽獎</span>
							<input type="text" id="money-${goods.uuid}"
								value="${goods.goodsMoney}" hidden="true">
						</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>

		</div>
	<div style="position: relative;width: 330px;float: right;">
		<input type="text" id="input-id" value="${mber.memberID}"
			hidden="true">
		<div class="change-point change-point-height">
			<p class="change-member-point-title">會員持有金幣</p>
			<p class="change-member-point" id="member-coin">${mber.coin}</p>
			<p class="change-member-point-title">枚</p>
		</div>
		<div class="change-point change-point-height">
			<p class="change-member-point-title">會員持有紅利</p>
			<p class="change-member-point">${mber.bonus}</p>
			<p class="change-member-point-title">點</p>
		</div>
		<div class="change-point">
			<p class="change-member-point-title">紅利商城</p>
			<p class="change-member-bonus-info">不想抽獎嗎</p>
			<p class="change-member-bonus-info">
				<span>那就來紅利商城吧！</span>
			</p>
			<p class="change-member-bonus-input-p">
				<button class="change-member-button" id="to-go-bonus">前往紅利商城</button>
			</p>
		</div>
		<div class="change-point">
			<p class="change-member-point-title">已送達的商品</p>
			<p class="change-member-bonus-info">送達商品後預計保留3個月</p>
			<p class="change-member-bonus-info">已送達卻未收到請聯絡客服</p>
			<p class="change-member-bonus-info" id="bingo-next-p"></p>
		</div>
		<div class="change-point">
			<p class="change-member-point-title">中獎項目</p>
			<p class="change-member-bonus-info">商品會寄送到會員資訊的地址</p>
			<p class="change-member-bonus-info">出貨日預計7-14天</p>
			<p class="change-member-bonus-info" id="bingo-p">
				<br>
				<button class="change-member-button"
					id="change-member-delivery-button">出貨</button>
			</p>
		</div>
		</div>
	</article>
	<script type="text/javascript">
	var bingo = $("#bingo-p");
	var already = $("#bingo-next-p");
	$.ajax({
		type : "GET",
		url : "<c:url value='/AjaxToBingo'/>",
		dataType : "json",
		success : function(data) {
			for(var i = 0 ; i<data.length ; i++){
			if(data[i].diliveryStatus == '未寄送')
				bingo.prepend(data[i].goodsTitle+"&nbsp<span style='color:red;' id='data-"+data[i].uuid+"'>"+data[i].diliveryStatus+"</span><br>");
			
			if(data[i].diliveryStatus == '出貨中')
				bingo.prepend(data[i].goodsTitle+"&nbsp<span style='color:green;'>"+data[i].diliveryStatus+"</span><br>");
			
			if(data[i].diliveryStatus == '已送達')
				already.prepend(data[i].goodsTitle+"&nbsp<span style='color:gray;'>"+data[i].diliveryStatus+"</span><br>");
			
			}
		}
	});
	function getRandom(min,max){
	    return Math.floor(Math.random()*(max-min+1))+min;
	};
	
	$(".goods-ending").click(function(e){
		var id_index = e.target.id.split("-").pop();
		var btn_id = "#"+e.target.id;
		var money_id = "#money-"+id_index;
		var title_id = "#title-"+id_index;
		var amonut_id = "#input-amount-"+id_index;
		var amount_p_id = "#amount-"+id_index;
		var coin = $("#member-coin").text();
		var money = $(money_id).val();
		var title = $(title_id).text();

		if(parseInt(coin) < parseInt(money)){
			swal.fire({
				  title: "金幣不夠哦！",
				  confirmButtonText: "去賺金幣"
				});
		}else{
			swal.fire({
				title : '確定要抽獎嗎？',
				text : '此商品抽一次需'+money+'枚金幣',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '抽！',
				cancelButtonText : '不抽好了'
			}).then((result) => {
				if (result.isConfirmed){
					$.ajax({
			            type: "post",
			            data: {"money":parseInt(money),"goodsId":parseInt(id_index)},
			            url: "<c:url value='/AjaxToChange'/>",
			            success: function(data) {
			            	$("#member-coin").text(parseInt(coin)-parseInt(money));
			            	$(".change-member-bonus").text(parseInt((parseInt(coin)-parseInt(money))/100));
						}
					});
					var posb = getRandom(1,100);
					switch(money){
					case'10':
					case'50':
						swal.fire({
							title:'恭喜！', 
							text:'獲得了'+title+'乙份', 
							icon:'success',
							allowOutsideClick: false
							}).then(function(){
								$.ajax({
						            type: "post",
						            data: {"title":title},
						            url: "<c:url value='/AjaxAfterChange'/>",
						            success: function(data) {
										bingo.prepend(data.goodsTitle+"&nbsp<span style='color:red;' id='data-"+data.uuid+"'>"+data.diliveryStatus+"</span><br>");
										var amount = $(amonut_id).val(parseInt($(amonut_id).val())-1);
										console.log(amount.val());
										$(amount_p_id).html("商品數量："+amount.val()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+money+"金幣/抽");
						            	if(amount.val() == 0){
						            		$(btn_id).removeClass("goods-ending").addClass("goods-ending-empty").off("click");
						            		$(btn_id).text("已無存貨");
						            	}
						            }
								});
							});
						break;
					case'100':
						if (posb > 70){
							swal.fire({
								title:'恭喜！', 
								text:'獲得了'+title+'乙份', 
								icon:'success',
								allowOutsideClick: false
								}).then(function(){
									$.ajax({
							            type: "post",
							            data: {"title":title},
							            url: "<c:url value='/AjaxAfterChange'/>",
							            success: function(data) {
											bingo.prepend(data.goodsTitle+"&nbsp<span style='color:red;' id='data-"+data.uuid+"'>"+data.diliveryStatus+"</span><br>");
											var amount = $(amonut_id).val(parseInt($(amonut_id).val())-1);
											console.log(amount.val());
											$(amount_p_id).html("商品數量："+amount.val()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+money+"金幣/抽");
							            	if(amount.val() == 0){
							            		$(btn_id).removeClass("goods-ending").addClass("goods-ending-empty").off("click");
							            		$(btn_id).text("已無存貨");
							            	}
							            }
									});
								});
						}else{
							console.log(posb);
							swal.fire({
								  title: "殘念！",
								  text:'下次一定會抽到！', 
								  confirmButtonText: "關閉"
								});
						}
						break;
					case'300':
						if (posb > 90){
							swal.fire({
								title:'恭喜！', 
								text:'獲得了'+title+'乙份', 
								icon:'success',
								allowOutsideClick: false
								}).then(function(){
									$.ajax({
							            type: "post",
							            data: {"title":title},
							            url: "<c:url value='/AjaxAfterChange'/>",
							            success: function(data) {
											bingo.prepend(data.goodsTitle+"&nbsp<span style='color:red;' id='data-"+data.uuid+"'>"+data.diliveryStatus+"</span><br>");
											var amount = $(amonut_id).val(parseInt($(amonut_id).val())-1);
											console.log(amount.val());
											$(amount_p_id).html("商品數量："+amount.val()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+money+"金幣/抽");
							            	if(amount.val() == 0){
							            		$(btn_id).removeClass("goods-ending").addClass("goods-ending-empty").off("click");
							            		$(btn_id).text("已無存貨");
							            	}
							            }
									});
								});
						}else{
							console.log(posb);
							swal.fire({
								  title: "殘念！",
								  text:'下次一定會抽到！', 
								  confirmButtonText: "關閉"
								});
						}
						break;
					}
				}
			})			
		}
	})
	$("#change-member-delivery-button").click(function() {
		swal.fire({
			title : '確定要出貨嗎？',
			showCancelButton : true,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
			confirmButtonText : '出貨',
			cancelButtonText : '再想想'
		}).then((result) => {
			if (result.isConfirmed){
			swal.fire({
				title:'商品狀態已更新！', 
				text:'送貨當天會以電話通知，再請注意來電(白貓物流公司)', 
				icon:'success',
				allowOutsideClick: false
				}).then(function(){
					$.ajax({
			            type: "post",
			            url: "<c:url value='/AjaxToBingo'/>",
			            success: function(data) {
							for(var i = 0 ; i<data.length ; i++){
								if(data[i].diliveryStatus == '出貨中'){
									var span_id = "#data-"+data[i].uuid;
									$(span_id).text("出貨中");
									$(span_id).css("color","green");
								}
							}
						}
					});
				});
			}
		})
	})
	
	$("#to-go-bonus").click(function(){
		window.location.href = "<spring:url value='/bonusShop' />";
	})
	</script>
</body>
</html>