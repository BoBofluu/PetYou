<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>

.wrapper {
	
	width: 1200px;
	margin: 5px auto 15px;
}

.sidemenu {
	float: left;
	width: 300px;
	background-color: #ffffff;
	border-radius: 15px;
	font-size: 2em;
	box-shadow: 12px 12px 7px #dfe3e8;
}

.main {
	
	height: 500px;
	display: block;
	float: right;
	width: 850px;
}

.clearfix::after {
	content: ";
	display: block;
	clear: both;
}

.sidemenu ul li {
	margin: 20px;
	cursor: pointer;
}

.sidemenu ul li:hover {
	font-weight: bold;
	color: #8D5433;
}
.form-table {
	background-color: #ffffff;
	border-radius: 15px;
	padding:10px;
	box-shadow: 12px 12px 7px #dfe3e8;
}

.form-item {
	display: flex;
	padding: 10px 0;
	margin: 15px; 
	border:1px solid white;
}

.fih{
	height:50px;
}

.form-title {
	
	color: #666;
	font-weight: bold;
	margin: 8px 0;
	font-size:x-large;
	
}

.form-label {
	width: 155px;
	text-align: right;
	margin-right: 10px;
	padding-right:5px;
	font-size:25px;
	font-weight:bold;
}

.input-holder {
	width: 300px;
	outline: 0;
	border-radius: 10px;
	text-align: center;
	border:0px;
	background-color:#f6c2cd;
	height: 45px;
}

.theselect{
	width: 100px;
	padding: 0 0 0 10px;
	border:0px;
	background-color:#f6c2cd;
	border-radius: 10px;
	outline: 0; 
}

.salonIcon {
	overflow: hidden;
	height: 200px;
}

.btnAdd{ 
 	outline: 0; 
 	width:80px;
 	padding-bottom:30px;
 	border-radius:5px;
	border:0px; 
	background-color:#F5AAAF;
} 

img {
	border-radius: 5px;
}

</style>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<form:form method="post" enctype="multipart/form-data">
		<div class="wrapper clearfix">
			<div class="sidemenu"><!--sidemenu -->
				<div class="sidemenu">

				<ul style="list-style: none; line-height: 20px;">
				
					<li id="clickbasic">
						<i class="fa fa-address-card" aria-hidden="true">基本資訊</i>
							
						<i id="angle1" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					
					<li id="clicktime">
						<i class="fa fa-clock-o" aria-hidden="true">營業時間</i>
							
						<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					
					<li id="clickinfo">
						<i class="fa fa-info-circle" aria-hidden="true">細節項目</i>
							
						<i id="angle3" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					
					<li id="clickphoto">
						<i class="fa fa-camera" aria-hidden="true">環境照片</i>
							
						<i id="angle4" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					
<!-- 					<li id="onepunch"><i class="fa fa-hand-peace-o" aria-hidden="true"></i>一鍵輸入</li> -->
				</ul>
			</div>
				
			</div>
			
			<div class="main">
				<div id="divbasic">
				<div class="form-title">
					基礎資訊
					<span style="margin-right:630px;"></span>
					<input type="button" value="修改" style="border:0px" id="updateTheShop">
					<input type="button" value="刪除" style="border:0px" id="deleteTheShop">
				</div>
				<div class="form-table">
					<div class="form-item fih">
						<label class="form-label">店名</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="shopName" name="shopName"
								value="${shop.shopName}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">類型</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="type" name="type"
								value="${shop.type}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">電話</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="phone" name="phone"
								value="${shop.phone}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">地址</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="address" name="address"
								value="${shop.address}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">營業號</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="propertyPermit" name="propertyPermit"
								value="${shop.propertyPermit}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">email</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="email" name="email"
								value="${shop.email}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<div style="display:flex;">
							<input type="button" class="btnAdd" value="下一頁"
								style="margin-left:720px;" id="basicNextPage"/>
						</div>
					</div>	
					</div><!-- table -->
					<div class=" fih"></div>
				</div>
<!-- ============================================================================================================== -->				
				<div id="divtime">
				<div class="form-title">營業時間</div>
				<div class="form-table">	

					<div class="form-item fih">
						<label class="form-label">星期一</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="monTilde" name="monTilde"
								value="${shop.monTilde}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">星期二</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="tueTilde" name="tueTilde"
								value="${shop.tueTilde}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">星期三</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="wedTilde" name="wedTilde"
								value="${shop.wedTilde}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">星期四</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="thuTilde" name="thuTilde"
								value="${shop.thuTilde}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">星期五</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="friTilde" name="friTilde"
								value="${shop.friTilde}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">星期六</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="satTilde" name="satTilde"
								value="${shop.satTilde}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<label class="form-label">星期日</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="sunTilde" name="sunTilde"
								value="${shop.sunTilde}" readonly/>		
						</div>
					</div>
					
					<div class="form-item fih">
						<div style="display:flex">
							<input type="button"  value="上一頁" class="btnAdd"
								style="float:left" id="timePreviousPage"/>
															
							<input type="button" value="下一頁" class="btnAdd"
								style="margin-left:638px;" id="timeNextPage"/>
						</div>
					</div>
					
					
					</div><!-- table -->
					<div class=" fih"></div>
				</div><!-- divTime -->
<!-- ============================================================================================================== -->				
					<div id="divinfo">
					<div class="form-title">細節項目</div>
					
						<div class="form-table">
						<div id="divFieldBeauty">
							<div class="form-item fih">
								<label class="form-label">美容對象</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="beautyTarget" 
										value="${shop.typeBeauty.beautyTarget}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">基本服務項目</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="beautyBasicProject" 
										value="${shop.typeBeauty.beautyBasicProject}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">特殊服務項目</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="beautySpecialProject" 
										value="${shop.typeBeauty.beautySpecialProject}" readonly/>		
								</div>
							</div>
						</div>
						
<!-- ====================================================================================================== -->						
						<div id="divFieldHospital">
							<div class="form-item fih">
								<label class="form-label">醫生</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="hospitalDoctors"
										value="${shop.typeHospital.hospitalDoctors}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">醫療對象</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="hospitalTarget"
										value="${shop.typeHospital.hospitalTarget}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">醫療項目</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id=hospitalProject 
										value="${shop.typeHospital.hospitalProject}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">醫療設施</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="hospitalFacility" 
										value="${shop.typeHospital.hospitalFacility}" readonly/>		
								</div>
							</div>
							
						</div><!-- 		divFieldHospital -->
						
						<div id="divFieldHotel">
							
							
							<div class="form-item fih">
								<label class="form-label">設備服務</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="hotelService" 
										value="${shop.typeHotel.hotelService}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">適合寵物類型</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="hotelPetType" 
										value="${shop.typeHotel.hotelPetType}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">費用</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="hotelFee" 
										value="${shop.typeHotel.hotelFee}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">寵物友善</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="hotelFriendly" 
										value="${shop.typeHotel.hotelFriendly}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">限制</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="hotelRestrictItem" 
										value="${shop.typeHotel.hotelRestrictItem}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">簡介</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="hotelIntroduction" 
										value="${shop.typeHotel.hotelIntroduction}" readonly/>		
								</div>
							</div>

						</div><!-- 		divFieldHotel -->
						
						<div id="divFieldRestaurant">
							
							<div class="form-item fih">
								<label class="form-label">設備服務</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="restaurantService" 
										value="${shop.typeRestaurant.restaurantService}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">適合寵物類型</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="restaurantPetType"
										value="${shop.typeRestaurant.restaurantPetType}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">費用</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="restaurantFee" 
										value="${shop.typeRestaurant.restaurantFee}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">寵物友善</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="restaurantFriendly" 
										value="${shop.typeRestaurant.restaurantFriendly}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">限制</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="restaurantRestrictItem" 
										value="${shop.typeRestaurant.restaurantRestrictItem}" readonly/>		
								</div>
							</div>
							
							<div class="form-item fih">
								<label class="form-label">簡介</label>
								<div class="form-controler">
									<input type="text" class="input-holder" id="restaurantIntroduction" 
										value="${shop.typeRestaurant.restaurantIntroduction}" readonly/>		
								</div>
							</div>
						</div><!-- 		divFieldRestaurant -->
						
						<div class="form-item fih">
							<div style="display:flex">
								<input type="button"  value="上一頁" class="btnAdd"
									style="float:left" id="infoPreviousPage"/>
																
								<input type="button" value="下一頁" class="btnAdd"
									style="margin-left:638px;" id="infoNextPage"/>
							</div>
						</div>
					
				</div><!-- 		table -->
				<div class=" fih"></div>	
				</div>
				<div id="divphoto">
				<div class="form-title">環境照片</div>
					<div class="form-table">
					<div class="form-item fih" style="height:250px">
						<div class="form-controler">
							<img src = "${shop.environmentalPhotos}"  class="salonIcon">
						</div>
					</div>
					
					
					<div style="display:flex;margin-bottom: 20px;">
						<input type="button" class="btnAdd" value="上一頁"
							style="margin-left:20px;float:left;height:34px;" id="photoPreviousPage"/>
		
<!-- 						<input type="submit" class="btnAdd" value="送出" -->
<!-- 							style="margin-left:638px;height:34px;"  onclick="return check_element()"/> -->
					</div>
				</div>
				</div>
				<div class=" fih"></div>	
			</div><!-- 		main -->
		</div><!-- 		wrapper -->
	</form:form>
<!-- ================================================================================================================= -->
	<script>
	$("#divtime").hide();
	$("#divinfo").hide();
	$("#divphoto").hide();
	$("#angle2").hide();
	$("#angle3").hide();
	$("#angle4").hide();
	
<!-- ================================================================================================================= -->
	var theType =$("#type").val();
	if(theType=="美容"){
		$("#divFieldBeauty").show();
		$("#divFieldHospital").hide();
		$("#divFieldHotel").hide();
		$("#divFieldRestaurant").hide();
	}else if(theType=="醫療"){
		$("#divFieldBeauty").hide();
		$("#divFieldHospital").show();
		$("#divFieldHotel").hide();
		$("#divFieldRestaurant").hide();
	}else if(theType=="旅館"){
		$("#divFieldBeauty").hide();
		$("#divFieldHospital").hide();
		$("#divFieldHotel").show();
		$("#divFieldRestaurant").hide();
	}else if(theType=="餐廳"){
		$("#divFieldBeauty").hide();
		$("#divFieldHospital").hide();
		$("#divFieldHotel").hide();
		$("#divFieldRestaurant").show();
	}
<!-- ================================================================================================================= -->
	$("#clickbasic").click(function() { showBasic(); });
	$("#clicktime").click(function() { showTime(); });
	$("#clickinfo").click(function() { showInfo(); });	
	$("#clickphoto").click(function() { showPhoto(); });
	
	$("#basicNextPage").click(function(){ showTime(); })
	$("#timePreviousPage").click(function(){ showBasic(); })
	$("#timeNextPage").click(function(){ showInfo(); })
	$("#infoPreviousPage").click(function(){ showTime(); })
	$("#infoNextPage").click(function(){ showPhoto(); })
	$("#photoPreviousPage").click(function(){ showInfo(); })
<!-- ================================================================================================================= -->
	function showBasic(){
		$("#clickbasic").css("color", "#8D5433");
		$("#clicktime").css("color", "black");
		$("#clickinfo").css("color", "black");
		$("#clickphoto").css("color", "black");
		$("#angle1").show();
		$("#angle2").hide();
		$("#angle3").hide();
		$("#angle4").hide();
		$("#divbasic").show();
		$("#divtime").hide();
		$("#divinfo").hide();
		$("#divphoto").hide();
	}
		
	function showTime(){
		$("#clickbasic").css("color", "black");
		$("#clicktime").css("color", "#8D5433");
		$("#clickinfo").css("color", "black");
		$("#clickphoto").css("color", "black");
		$("#angle1").hide();
		$("#angle2").show();
		$("#angle3").hide();
		$("#angle4").hide();
		$("#divbasic").hide();
		$("#divtime").show();
		$("#divinfo").hide();
		$("#divphoto").hide();
	}
		
	function showInfo(){
		$("#clickbasic").css("color", "black");
		$("#clicktime").css("color", "black");
		$("#clickinfo").css("color", "#8D5433");
		$("#clickphoto").css("color", "black");
		$("#angle1").hide();
		$("#angle2").hide();
		$("#angle3").show();
		$("#angle4").hide();
		$("#divbasic").hide();
		$("#divtime").hide();
		$("#divinfo").show();
		$("#divphoto").hide();
	}
		
	function showPhoto(){
		$("#clickbasic").css("color", "black");
		$("#clicktime").css("color", "black");
		$("#clickinfo").css("color", "#black");
		$("#clickphoto").css("color", "#8D5433");
		$("#angle1").hide();
		$("#angle2").hide();
		$("#angle3").hide();
		$("#angle4").show();
		$("#divbasic").hide();
		$("#divtime").hide();
		$("#divinfo").hide();
		$("#divphoto").show();
	}	
<!-- ================================================================================================================= -->
	$("#updateTheShop").click(function() {
		Swal.fire({
	        title: "確定要修改店家資料嗎？",
	        showCancelButton: true
	    }).then(function(result) {
	       if (result.value) {
	    	   location.href="<c:url value='/Member/shop/Update'/>";
	       }
	       else {    
	       }
	    });
	})
	
<!-- ================================================================================================================= -->	
	$("#deleteTheShop").click(function() {
		Swal.fire({
            title: "確定要刪除店家資料嗎？",
            showCancelButton: true
        }).then(function(result) {
           if (result.value) {
        	   location.href="<c:url value='/Member/shop/Delete'/>";
           }
           else {    
           }
        });
	})
	</script>
</body>
</html>