<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>旅館</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/active.css'/>">
</head>
<body>
	<jsp:include page="../HomePage.jsp" />
	
	<section class='all'>
		<c:forEach var='hotel' items='${hotels}' varStatus="aa">
			<!-- 第2區塊	-->
<div style="width: 1500px; margin: auto;">
			<div class="container4" id="a${hotel.value.shopID}">
				<div class="border2 fi">
					<div class="in shop-pic-div">
					
						<img
							src="<c:url value='/activitys/other/image${hotel.value.shopID}.jpg' />" />
							
					</div>
					<div class="dddd">
						<input class="openmap-btn" id="btn3${hotel.value.shopID}" type="button" value="開啟地圖資訊"
							onclick="btn3(this.id);">
						<input class="openmap-btn" id="btn${hotel.value.shopID}" type="button" value="店家詳細資料"
							onclick="btn(this.id);" style="margin-top:5px">
					</div>
					
				</div>
				<div class="border2">
						<div class="shopName">旅館名稱：${hotel.value.shopName}</div>
					<div class="in shop-info-div">
						<div>負責人：${hotel.value.manager}</div>
						<div>聯絡方式：${hotel.value.phone}</div>
						<div>Email：${hotel.value.email}</div>
						<div>地址：${hotel.value.address}</div>
						<div>狀態：${hotel.value.status}</div>
						<div>統一編號：${hotel.value.propertyPermit}</div>
						<div>註冊日期：${hotel.value.registationDate}</div>
					</div>
				</div>
				<div class="border2 t1">
					<div class="in shop-time-div">
						<div>營業時間：</div>
						<div>星期一：${hotel.value.monTilde}</div>
						<div>星期二：${hotel.value.tueTilde}</div>
						<div>星期三：${hotel.value.wedTilde}</div>
						<div>星期四：${hotel.value.thuTilde}</div>
						<div>星期五：${hotel.value.friTilde}</div>
						<div>星期六：${hotel.value.satTilde}</div>
						<div>星期日：${hotel.value.sunTilde}</div>
					</div>
				</div>
				<div class="out iframe-div" id="iframe${hotel.value.shopID}" >
					<iframe class="t1"
					  id="c${hotel.value.shopID}"
				      width="500" 
				      height="300" 
				      frameborder="0" 
				      style="border:0;display:none;float:right;vertical-align: top;"
				      src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCf_NwQPpjokij66qmx93pwyr5N0irmE78&q=${hotel.value.address}" 
				      allowfullscreen 
					  >
				  	</iframe>
				</div>
			</div>
</div>
			<!-- 第3區塊 -->
			<div class="container2" style="display: none;" id="b${hotel.value.shopID}">
				<div class="in">
				<div class="details-div">
					<div class="title-div">設備與服務：</div> <div class="value-div">${hotel.value.typeHotel.hotelService}</div><br>
					<div class="title-div">適合寵物類型：</div> <div class="value-div">${hotel.value.typeHotel.hotelPetType}</div><br>
					<div class="title-div">寵物友善：</div> <div class="value-div">${hotel.value.typeHotel.hotelFriendly}</div><br>
					<div class="title-div">費用：</div> <div class="value-div">約&ensp;${hotel.value.typeHotel.hotelFee}</div><br>
					<c:if test="${hotel.value.typeHotel.hotelRestrictItem==null}">
						<div class="title-div">限制：</div> <div class="value-div">${hotel.value.typeHotel.hotelRestrictItem}</div><br>
					</c:if>
					<div class="title-div">旅館介紹：</div> <div class="value-div">&emsp;&emsp;${hotel.value.typeHotel.hotelIntroduction}</div>
				</div>
				<div style="margin:auto;width: 130px;">
					<input  class="openmap-btn" id="btn2${hotel.value.shopID}" type="button" value="返回"
						onclick="btn2(this.id);" style="width: 130px;"> 
				</div>
				</div>		
			</div>
			<!-- 第4區塊 -->
			<hr>
		</c:forEach>
	
	
	<nav class="mt-20 mb-20">
			<ul class="pagebar">
				<c:set var="pageNo" value="${pageNo}" />
				<c:forEach var="page" begin="1" end="${totalPages}" varStatus="aa">
					<li class="pagenum">
						<c:choose>
							<c:when test="${type == '旅館'}">
								<c:choose>
									<c:when test="${page == pageNo}">
										<span class="pagenum2" id="page${page}">${page}</span>
									</c:when>
									<c:otherwise>								
										<a href="<c:url value='/activitys/searchPages?pageNo=${page}&type=旅館&search=${search}' />"
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
										<a href="<c:url value='/activitys/pages?pageNo=${page}&type=旅館' />"
											class="pagenum2"> <span id="page${page}">${page}</span>
										</a>									
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
			</ul>
		</nav>
	</section>
	<a class="go-top show"> <i class="fa fa-angle-up"></i>
	</a>
</body>

<script>
// 	btn  店家詳細資料，區塊id=b${hotel.value.shopID}
// 	btn2 返回，區塊id=a${hotel.value.shopID}
//  btn3 地圖， 區塊iframe${hotel.value.shopID} / 區塊id=c${hotel.value.shopID}
// -----------------------------------------------------------------------------------------
    // 地圖按鈕
   	$(document).ready(function(){
   		$('.iframe-div').attr("style","border:none;box-shadow:none");
   	})
    	
    
	function btn(id) {
		var str = "a" + id.substring(3);  //隱藏
		var str2 = "b" + id.substring(3); //顯示
		var str3 = "c"+id.substring(3); //隱藏
		var str4 = "btn3"+id.substring(3); //按鈕回朔
		
		document.getElementById(str).style.display = "none";
		document.getElementById(str2).style.display = "";	
		
		if(document.getElementById(str4).value=="關閉地圖資訊"){
			//關閉地圖
			document.getElementById(str3).style.display="none";
		}
		document.getElementById(str4).value="開啟地圖資訊";
		
	}

	function btn2(id) {
		var str = "a" + id.substring(4);
		var str2 = "b" + id.substring(4);
		var str3 = "c"+id.substring(4); //隱藏
		var divId ="#a" + id.substring(4);
		
		document.getElementById(str).style.display = "";
		document.getElementById(str2).style.display = "none";
		document.getElementById(str3).style.display="none";
		
		//返回 地圖回復
		$(divId).attr("style", "margin:auto;");	
		$('.iframe-div').attr("style","border:none;box-shadow:none");
	}
	
	var id;
	var state=true;
	function btn3(id) {
		var str3 = "c"+id.substring(4);
		var btn = document.getElementById(id.substring(0));
		var btn2 = document.getElementById(id);
		var btn7 = document.getElementById(id);
		var btn3 = document.getElementById(str3);
		
		var divId ="#a" + id.substring(4)
		var iframeId = "iframe" + id.substring(4)
		console.log(iframeId)
		if(state=true && btn7.value=="開啟地圖資訊"){
			//開啟地圖
			$(iframeId).attr("hidden", false);
			btn3.style.display="block";
			btn7.value="關閉地圖資訊";
			$(divId).attr("style", "margin:0px;margin-left:30px;display: inline-block;");
			$('.iframe-div').attr("style","display:'';");
			state = false;
		}else{
			//關閉地圖
			$(iframeId).attr("hidden", true);
			btn3.style.display="none";	
			btn2.value="開啟地圖資訊";
			$(divId).attr("style", "margin:auto;");
			$('.iframe-div').attr("style","display:none;");
			state = true;
		}
		state = true;	
	}
	
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