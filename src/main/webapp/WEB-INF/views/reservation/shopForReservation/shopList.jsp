<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet" type="text/css"
	href="<spring:url value='/css/reservation/shopList.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	<div class="outContainer">
		<div class="search">
			<div class="input-group input-group-sm mb-3 ">
			<h3 style="margin-left: 30px;margin-top: 10px;">條件搜尋</h3>
			<img src="<c:url value='/image/homepage/icons8-edit-100.png' />" style="width:60px;" />
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-sm"
						style="background-color: #FFEBE7; border: 1px solid #FFC0BE;">
						<a href="#"> <image
								src="<c:url value='/image/homepage/放大鏡.png' />"
								class="magnifier" id="magnifier" />
					</a>
					</span>
				</div>
				<input id="searchbar-text" type="text" class="form-control" aria-label="Small"
					aria-describedby="inputGroup-sizing-sm">
			</div>
			<div class="mutiChoose">
				<div class="checkboxObject">
					<span style="font-size: larger;">對象</span><br> 
					<label class="radio-inline">
					<input type="radio" id="dog" name="chooseObject" value="狗">&nbsp犬
					</label> 
					<label class="radio-inline">
					<input type="radio" id="cat"  name="chooseObject"  value="貓">&nbsp貓
					</label> 
					<label class="radio-inline">
					<input type="radio" id="other"  name="chooseObject"  value="其他"> &nbsp其他
					</label>
					<input checked type="radio" id="noObject"  name="chooseObject"  value="a" hidden>
				</div>
				<div class="checkboxObject">
					<span style="font-size: larger;">營業時間</span><br>
					<input checked type="checkbox" class="custom-control-input" value="0" />
					<div class="custom-control custom-checkbox"
						style="display: inline-block">
						<input type="checkbox" class="custom-control-input" value="1"
							id="1"> <label class="custom-control-label" for="1">一</label>
					</div>
					<div class="custom-control custom-checkbox"
						style="display: inline-block">
						<input type="checkbox" class="custom-control-input" value="2"
							id="2"> <label class="custom-control-label" for="2">二</label>
					</div>
					<div class="custom-control custom-checkbox"
						style="display: inline-block">
						<input type="checkbox" class="custom-control-input" value="3"
							id="3"> <label class="custom-control-label" for="3">三</label>
					</div>
					<div class="custom-control custom-checkbox"
						style="display: inline-block">
						<input type="checkbox" class="custom-control-input" value="4"
							id="4"> <label class="custom-control-label" for="4">四</label>
					</div>
					<div class="custom-control custom-checkbox"
						style="display: inline-block">
						<input type="checkbox" class="custom-control-input" value="5"
							id="5"> <label class="custom-control-label" for="5">五</label>
					</div>
					<div class="custom-control custom-checkbox"
						style="display: inline-block">
						<input type="checkbox" class="custom-control-input" value="6"
							id="6"> <label class="custom-control-label" for="6">六</label>
					</div>
					<div class="custom-control custom-checkbox"
						style="display: inline-block">
						<input type="checkbox" class="custom-control-input" value="7"
							id="7"> <label class="custom-control-label" for="7">日</label>
					</div>
				</div>
			</div>
			<div class="checkboxObject">
				<span style="font-size: larger;">地區</span><br> 
				<select id="location" class="place">
						<option selected value="a">請選擇</option>
					<optgroup label="北部">
						<option>臺北市</option>
						<option>新北市</option>
						<option>基隆市</option>
						<option>桃園市</option>
						<option>新竹縣</option>
						<option>新竹市</option>
						<option>苗栗縣</option>
					</optgroup>
					<optgroup label="中部">
						<option>臺中市</option>
						<option>彰化縣</option>
						<option>南投縣</option>
					</optgroup>
					<optgroup label="南部">
						<option>雲林縣</option>
						<option>嘉義縣</option>
						<option>嘉義市</option>
						<option>臺南市</option>
						<option>高雄市</option>
						<option>屏東縣</option>
						<option>澎湖縣</option>
					</optgroup>
					<optgroup label="東部">
						<option>宜蘭縣</option>
						<option>花蓮縣</option>
						<option>臺東縣</option>
					</optgroup>
				</select>
			</div>
			<div>
				<button type="button" id="submit" class="btn btn-secondary btn-sm"
					style="margin-left: 65px;">搜尋</button>
				<button type="button" class="btn btn-danger btn-sm">清除</button>
			</div>
		</div>
		<c:forEach var="shop" items="${shopList}">
			<input hidden class="shopType" value="${shop.type}" />
			<div class="shopContainer">
				<a href="<c:url value='/shop/shopInfo/${shop.shopID}' />"
					class="infoLink">
					<div class="shopsInfoDiv">
						<h3>${shop.shopName}</h3>
						<span>店家電話: ${shop.phone}</span><br> <span>店家信箱:
							${shop.email}</span><br> <span>店家地址: ${shop.address}</span><br>
						<c:choose>
							<c:when test="${shop.mon != '公休'}">
								<span>營業時間: Mon</span>
							</c:when>
							<c:otherwise>
								<span>營業時間: 公休</span>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${shop.tue != '公休'}">
								<span>Tue</span>
							</c:when>
							<c:otherwise>
								<span>公休</span>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${shop.wed != '公休'}">
								<span>Wed</span>
							</c:when>
							<c:otherwise>
								<span>公休</span>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${shop.thu != '公休'}">
								<span>Thur</span>
							</c:when>
							<c:otherwise>
								<span>公休</span>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${shop.fri != '公休'}">
								<span>Fri</span>
							</c:when>
							<c:otherwise>
								<span>公休</span>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${shop.sat != '公休'}">
								<span>Sat</span>
							</c:when>
							<c:otherwise>
								<span>公休</span>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${shop.sun != '公休'}">
								<span>Sun</span>
								<br>
							</c:when>
							<c:otherwise>
								<span>公休</span>
								<br>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${shop.type == '美容'}">
								<span>適合寵物: ${shop.typeBeauty.beautyTarget}</span>
								<br>
								<span>基礎項目: ${shop.typeBeauty.beautyBasicProject}</span>
								<br>
								<span>進階項目: ${shop.typeBeauty.beautySpecialProject}</span>
							</c:when>
							<c:when test="${shop.type == '醫療'}">
								<span>診療對象: ${shop.typeHospital.hospitalTarget}</span>
								<br>
								<span>醫療設施: ${shop.typeHospital.hospitalFacility}</span>
								<br>
								<span>診療項目: ${shop.typeHospital.hospitalProject}</span>
							</c:when>
						</c:choose>
					</div> <!-- shopInfoDiv -->
					<div class="environmentDiv">
								<image
									src="${shop.environmentalPhotos}"
									class="salonIcon" />
					</div> <!-- environmentDiv -->
					<hr class="line">
				</a>
			</div>
			<!-- shopContainer -->
		</c:forEach>
	</div>
	<!-- outContainer -->
	<script>
	$("#submit").click(function(){
		var week = [];
		var shopType = $(".shopType").val();
		console.log(shopType)
		//取得「對象」
		var object = $('input[name="chooseObject"]:checked').val();
		//取得「地區」
		var location = $("#location").val();
		console.log(location);
		
		//取得使用者checkbox勾選的時間
			for(let i = 0; i < 8; i++){
				var checkboxId = '#' + i;
					if($(checkboxId).is(":checked")){
						var weekValue= $('#' + i).val();
						week.push(weekValue);
					}
				}
		if(week.length == 0){
			//0代表都沒選
			week.push(0)
		}
			window.location.href = "<c:url value='/shop/searchShop/" + shopType + "/" + object + "/" + week + "/"+ location +"' />";
		})
		
		$("#clearAll").click(function(){
			$("#dog").prop("checked", false);
			$("#cat").prop("checked", false);
			$("#other").prop("checked", false);
			
			for(let i = 0; i < 8; i++){
				$("#" + i).prop("checked", false);
			}
			
			$("#noObject").prop("checked", true);
			$("#location").val("a").attr("selected", true);
		})
		
		$("#searchbar-text").keypress(function(e){
			var shopType = $(".shopType").val();
			var code = (e.keyCode ? e.keyCode : e.which);
			if(code == 13){
				var queryString = $("#searchbar-text").val().trim();
				if(queryString == '') {
					;
				}else{
					window.location.href = "<c:url value='/shop/searchShop?shopType="+ shopType + "&select=" + queryString + "' />";
				}
			}
		})
		
</script>

</body>
</html>