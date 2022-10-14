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
		<div class="change-menu">
			<c:forEach var="goods" items="${list}" varStatus="sta">
				<div class="change-goods" style="width: 889px;">
				<div class="custom-control custom-checkbox" style="display: inline-block;float: right;transform: scale(1.3);right: 20px">
					<input type="checkbox" class="custom-control-input"
						id="itmes${sta.index}" value="${goods.uuid}" > <label class="custom-control-label"
						for="itmes${sta.index}" style="font-size: larger;font-size: 19px;margin-top: 20px;" >我要出貨</label>
				</div>
					<img class="goods-imgs"
						src="<spring:url value='${goods.goodsTitle.goodsImg}'/>">
					<p class="goods-title" id="title-${goods.uuid}">${goods.goodsTitle.goodsTitle}</p>
					<p class="goods-quantity" style="font-size: 20px;"
						id="amount-${goods.uuid}">${goods.goodsTitle.goodsInfo}</p>
					<p class="goods-quantity" style="font-size: 20px;"
						id="amount-${goods.uuid}">兌換日期: ${goods.showDate}</p>
				</div>
				<c:set var="index" value="${sta.count}"></c:set>
			</c:forEach>
		</div>
	<div style="position: relative;width: 330px;float: right;">
		<div class="change-point change-point-height">
			<p class="change-member-point-title">會員持有金幣</p>
			<p class="change-member-point" id="member-coin">${mber.coin}</p>
			<p class="change-member-point-title">枚</p>
		</div>
		<div class="change-point change-point-height">
			<p class="change-member-point-title">會員持有紅利</p>
			<p class="change-member-point" id="member-bonus">${mber.bonus}</p>
			<p class="change-member-point-title">點</p>
		</div>
		<div class="change-point">
			<p class="change-member-point-title" >我要出貨</p>
			<p class="change-member-bonus-info">
				<span>確認完商品了嗎</span><img
					src="https://img.icons8.com/bubbles/55/000000/ask-question.png" />
			</p>
			<p class="change-member-bonus-input-p">
				<button class="change-member-button" id="return-btn">再去換一點</button>
				<button class="change-member-button" id="shipping-btn">我要出貨</button>
			</p>
		</div>
	</div>
	<input hidden="true" id="count-index-enough" value="${index}" />
	</article>
	<script type="text/javascript">
	$("#return-btn").click(function(){
		location.href= "<c:url value='/bonusShop' />"
	})
	
	$("#shipping-btn").click(function(){
		var shipItems = [];
		var count = 0;
		if($("#count-index-enough").val()== null){
			count = 0
		}else{
			count = $("#count-index-enough").val()
		}
		
		for(let i = 0; i < count; i++){
					var checkboxId = '#itmes' + i;
						if($(checkboxId).is(":checked")){
							var weekValue= $('#itmes' + i).val();
							shipItems.push(weekValue);
						}
					}
			if(shipItems.length == 0){
				//0代表都沒選
				alert("尚未選擇商品喔")
			}else{
			swal.fire({
				title : '確定要出貨嗎？',
				text : '大概需要7個工作天，且出貨後無法取消喔!',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '出貨',
				cancelButtonText : '再想想'
			}).then((result) => {
				if (result.isConfirmed){
					
				swal.fire({
					title:'已成功申請出貨！', 
					text:'已申請成功，請確認有收到出貨申請的email，若沒有請盡速聯絡管理員', 
					icon:'success',
					allowOutsideClick: false
					}).then(function(){
						$.ajax({
							type: "post",
							traditional: true,
					    	data: {"shipping":shipItems},
					    	url: "<c:url value='/changeStatusForDeliver'/>",
					    	success:function(data){
					    		window.location.href="<c:url value='/selectBonus' />";
					    	}
						});
						//ajax結尾
				})
				//裡面的if
			}
			//then
		})	
	}
})
	//兌換紅利的click結尾
			
	
	</script>
</body>
</html>