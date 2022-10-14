.<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>寵你 只寵愛你</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <link type="text/css" href="<spring:url value='/css/windowShop.css'/>" rel="stylesheet">
    <style type="text/css">
        .carousel-control-next-icon-self {
            background-image: url("<spring:url value='/images/article/icons8-右-100.png'/>");
            width: 100px;
            height: 100px;
        }
        
        .carousel-control-prev-icon-self {
            background-image: url("<spring:url value='/images/article/icons8-左-100.png'/>");
            width: 100px;
            height: 100px;
        }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
    <article class="change-article">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <div style="width: 1250px; height: 475px;" class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="<spring:url value='/images/bonusShop_Img/bonus_ad_1.jpg'/>" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="<spring:url value='/images/bonusShop_Img/bonus_ad_2.jpg'/>" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="<spring:url value='/images/bonusShop_Img/bonus_ad_3.jpg'/>" alt="Third slide">
                </div>
            </div>
            <a style="width: 100px; opacity: 1;" class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon-self" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a style="width: 100px; opacity: 1;" class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon-self" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="change-menu">
            <c:forEach var="goods" items="${bsb}">
                <div class="change-goods">
                    <input type="hidden" id="money-${goods.uuid}" value="${goods.goodsMoney}">
                    <input type="hidden" id="input-amount-${goods.uuid}" value="${goods.goodsAmount}">
                    <img class="goods-imgs" src="<spring:url value='${goods.goodsImg}'/>">
                    <p class="goods-title" id="title-${goods.uuid}">${goods.goodsTitle}</p>
                    <p class="goods-quantity" style="font-size: 20px;" id="amount-${goods.uuid}">商品數量：${goods.goodsAmount}</p>
                    <p class="goods-time">${goods.goodsInfo}</p>
                    <span class="goods-status" style="font-size: 20px;">${goods.goodsMoney}點紅利</span>
                    <c:choose>
                        <c:when test="${goods.goodsAmount == 0}">
                            <span class="goods-ending-empty" style="margin-left: 40px; font-size: 17px;">已無存貨</span>
                        </c:when>
                        <c:otherwise>
                            <span class="goods-ending" style="margin-left: 40px; font-size: 17px;" id="goods-${goods.uuid}">兌換商品</span>
                        </c:otherwise>
                    </c:choose>
                </div>
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
                <p class="change-member-point-title">兌換紅利</p>
                <p class="change-member-bonus-info">每100枚金幣兌換1點紅利</p>
                <p class="change-member-bonus-info">
                    <span>目前可兌換</span> <span class="change-member-bonus" id="red-bonus"> <fmt:formatNumber
						type="number" value="${(mber.coin-mber.coin%100) / 100}"
						maxFractionDigits="0"></fmt:formatNumber></span> <span>點</span>
			</p>
			<p class="change-member-bonus-input-p">
				<input class="change-member-bonus-input" type="text"
					oninput="value=value.replace(/[^\d]/g,'')"> <br> <br>
					<button class="change-member-button" id="change-member-bonus-button">兌換</button>
					
			</p>
			
					
		</div>
		</div>
	</article>
		<div style="position: absolute;right: 13px; margin-top: 7px;"><button class="change-member-button" id="return-button"  
					onclick="reservation()">前往預約</button>
		 </div>
		 <div style="position: absolute;right: 13px; margin-top: 74px;"><button class="change-member-button" id="return-button"  
					onclick="windowshopping()">去抽抽樂</button>
		 </div>
		 <div style="position: absolute;right: 13px; margin-top: 144px;">
		 	<button class="change-member-button" id="select-bonus-button">兌換紀錄</button>
		 </div>
	<script type="text/javascript">
		var bingo = $("#bingo-p");
		var already = $("#bingo-next-p");
		//兌換商品的click
		$(".goods-ending").click(function(e){
			var id_index = e.target.id.split("-").pop();
			//商品的價格的ID
			var money_id = "#money-"+id_index;
			var title_id = "#title-"+id_index;
			//商品的數量的ID
			var amonut_id = "#input-amount-"+id_index;
			var bonus = $("#member-bonus").text();
			//商品的價格的val
			var money = $(money_id).val();
			var title = $(title_id).text();
			//更改商品數量的<p>
			var amount_p_id = "#amount-"+id_index;
			var btn_id = "#"+e.target.id;
			//假設紅利不夠多
			if(parseInt(bonus) < parseInt(money)){
				swal.fire({
					title: "紅利不夠哦！",
					confirmButtonText: "去換紅利"
				});
			}
			//夠多的話
			else{
				swal.fire({
					title : '確定要換嗎？',
					text : '此商品需'+money+'點紅利',
					showCancelButton : true,
					confirmButtonColor : '#3085d6',
					cancelButtonColor : '#d33',
					confirmButtonText : '換！',
					cancelButtonText : '再考慮一下'
				}).then((result) => {
					if (result.isConfirmed){
						swal.fire({
							title:'恭喜！', 
							text:'獲得了'+title+'乙份', 
							icon:'success',
							allowOutsideClick: false
						}).then(function(){
						var params = {};
						params.money = parseInt(money);
						params.goodsId = parseInt(id_index);
						params.title = title;
						$("#member-bonus").text(parseInt($("#member-bonus").text())-parseInt(money));
						var amount = $(amonut_id).val(parseInt($(amonut_id).val())-1);
						$(amount_p_id).html("商品數量："+amount.val());
		            	if(amount.val() == 0){
		            		$(btn_id).removeClass("goods-ending").addClass("goods-ending-empty").off("click");
		            		$(btn_id).text("已無存貨");
		            	}
						$.ajax({
							type: "post",
					    	data: params,
					    	url: "<c:url value='/AjaxUpdateAfterChange_Bonus'/>"
						});
						//ajax結尾
					});
					//then結尾
				}
				//大if的結尾then內部
			})
			//大then結尾
		}
		//夠多的話的else結尾
	})
	//兌換商品的click結尾
	//兌換紅利的click
	$("#change-member-bonus-button").click(function() {
		var iop = $('.change-member-bonus-input').val();
		var coin = $("#member-coin").text();
		var bonus = $('.change-member-bonus').text();
		var real_bonus = "";
		for(var i = 0 ; i<bonus.split(',').length ; i++){
			real_bonus += bonus.split(',')[i];
		}
		console.log('iop:'+parseInt(iop));
		console.log('coin:'+parseInt(coin));
		console.log('bonus:'+real_bonus);
		if(iop ==''){
			swal.fire({
				  title: "兌換欄不可為空哦！",
				  confirmButtonText: "重新填寫"
				});
		}else if(iop == 0){
			swal.fire({
				  title: "不可輸入0哦！",
				  confirmButtonText: "重新填寫"
				});
		}
		else if(parseInt(iop) > parseInt(real_bonus)){
			swal.fire({
				  title: "你的金幣沒那麼多可以兌換！",
				  confirmButtonText: "重新填寫"
				});
		}
		else{
			swal.fire({
				title : '確定要兌換嗎？',
				text : '此次兌換'+iop+'點紅利',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '兌換',
				cancelButtonText : '不兌換'
			}).then((result) => {
				if (result.isConfirmed){
				swal.fire({
					title:'兌換成功！', 
					text:'已成功兌換'+iop+'點紅利', 
					icon:'success',
					allowOutsideClick: false
					}).then(function(){
						$("#member-coin").text(coin-iop*100);
						$("#member-bonus").text(parseInt($("#member-bonus").text())+parseInt(iop));
						$("#red-bonus").text(parseInt(real_bonus)-parseInt(iop));
						$.ajax({
							type: "post",
					    	data: {"bonus":parseInt(iop)},
					    	url: "<c:url value='/AjaxSwitchBonus'/>"
						});
						//ajax結尾
					});
				}
				//裡面的if
			})
			//then
		}
		//else
	})
	//兌換紅利的click結尾
	
	$("#select-bonus-button").click(function(){
		location.href= "<c:url value='/selectBonus' />"
			
	})
	
	function windowshopping() {
		window.location.href="<c:url value='/windowShop' />"
		}
	
	function reservation() {
		window.location.href="<c:url value='/searchAllReservation' />"
		}
	</script>
</body>

</html>