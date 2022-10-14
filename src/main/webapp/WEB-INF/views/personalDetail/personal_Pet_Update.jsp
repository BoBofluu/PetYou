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
 <script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
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
	width: 400px;
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
	<form:form method="post" modelAttribute="pet" enctype="multipart/form-data">
		<div class="wrapper clearfix">
			<div class="sidemenu">
				<ul style="list-style: none; line-height: 20px;">
					<li id="clickaccount">
						<i class="fa fa-address-card" aria-hidden="true">寵物檔案</i>
							
						<i id="angle1" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					<li id="clickinfo">
						<i class="fa fa-info-circle" aria-hidden="true">進階資訊</i>
							
						<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					<li id="clickphoto">
						<i class="fa fa-camera-retro" aria-hidden="true">可愛圖片</i>
							
						<i id="angle3" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
<!-- 					<li id="onepunch" style="cursor: pointer;"> -->
<!-- 						<i class="fa fa-hand-peace-o" aria-hidden="true"></i> -->
<!-- 							一鍵輸入 -->
<!-- 					</li> -->
				</ul>
			</div>
<!-- =========================================================================================================================== -->
			<div class="main">
				<div id="divaccount">
				
					<div class="form-title">寵物檔案</div>
					<div class="form-table">
						<div class="form-item fih">
							<label class="form-label">名字<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="petName" class="input-holder" id="petName" name="petName" 
									placeholder="輸入名字" autocomplete="off" />
			
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">晶片</label>
							<div class="form-controler">
								<form:input type="text" class="input-holder" id="chip"
									name="chip" placeholder="請輸入晶片" path="chip"
									autocomplete="off" 
									onkeyup="value=this.value.replace(/\D+/g,'');" maxlength="15"/>
							</div>
								<div id="checkChip">&nbsp;</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">類型<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" class="input-holder" id="type" name="type" 
									placeholder="輸入類型" autocomplete="off"  
									path="type" />
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">品種</label>
							<div class="form-controler">
								<form:input type="text" class="input-holder" id="variety" name="variety" 
									placeholder="輸入品種" autocomplete="off"   
									path="variety" /> 
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">性別<span style="color:red">*</span></label>
							<div class="form-controler">
								<label >
									<form:radiobutton name="gender" value="男" style="margin: 10px"  id="g1" path="gender"  />男<br> 
								</label> 
								<label style="margin-left:50px;"> 
									<form:radiobutton name="gender" value="女" style="margin: 10px" id="g2" path="gender"/>女<br> 
			 					</label> 
			 					<label style="margin-left:50px;"> 
			 						<form:radiobutton name="gender" value="不知道" style="margin: 10px"  id="g3" path="gender" />不知道<br> 
								</label> 
								
							</div>
						</div>
						<div class="form-item fih">
							<div style="display:flex">
								
								<input type="button" class="btnAdd" value="下一頁"
									style="margin-left:720px;" id="accountNextPage"/>
							</div>
						</div>	
					</div>
				</div>
<!-- ====================================================================================================================	 -->
				<div id="divinfo">
					<div class="form-title">進階資訊</div>
					<div class="form-table">
						
						<div class="form-item fih">
							<label class="form-label">體型<span style="color:red">*</span></label>
							<div class="form-controler">
								<label >
									<form:radiobutton name="size" value="小" style="margin: 10px"  id="s1"  path="size" />小<br> 
								</label> 
								<label style="margin-left:50px;"> 
									<form:radiobutton name="size" value="中" style="margin: 10px" id="s2" path="size"/>中<br> 
			 					</label> 
			 					<label style="margin-left:50px;"> 
			 						<form:radiobutton name="size" value="大" style="margin: 10px"  id="s3" path="size" />大<br> 
								</label> 
								
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">年齡<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text"  path="age" class="input-holder" id="age" name="age" placeholder="輸入年齡"
								autocomplete="off"  />
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">開刀狀況<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="operated" class="input-holder" id="operated" name="operated" placeholder="輸入開刀狀況"
									autocomplete="off"  maxlength="10"/>
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">驅蟲藥<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="deworming" class="input-holder" id="deworming" name="deworming" placeholder="輸入驅蟲藥"
									autocomplete="off"  maxlength="10"/>
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">結紮<span style="color:red">*</span></label>
							<div class="form-controler">
								<label >
									<form:radiobutton name="ligation" value="1" style="margin: 10px"  id="l1"  path="ligation" />有<br> 
								</label> 
								<label style="margin-left:50px;"> 
									<form:radiobutton name="ligation" value="0" style="margin: 10px" id="l2" path="ligation"/>無<br> 
				 				</label> 
				 				
							</div>
						</div>
						<div class="form-item fih">
							<div style="display:flex">
								<input type="button" class="btnAdd" value="上一頁"
									style="float:left" id="infoPreviousPage"/>
															
								
								<input type="button" class="btnAdd" value="下一頁"
									style="margin-left:638px;" id="infoNextPage"/>
							</div>
						</div>	
					</div><!-- table -->
				</div><!-- divinfo -->
<!-- ====================================================================================================================	 -->
				<div id="divphoto"><!-- divphoto -->
					<div class="form-title">可愛圖片</div>
					<div class="form-table">
						<div class="form-item" style="width:400px;margin:15px auto;">
							<div style="position:relative;" >
								<form:input type="file" style="position:absolute;opacity:0;width:365px;height:191px;cursor: pointer;" id="petImage" path="petImage" accept=".jpg,.png,.jpeg" /> 
								<img src="${pet.photo}" id="ppimg"  style="width:365px;"> 
							</div>
						</div>
<!-- 						<div class="form-item"> -->
<!-- 							<div class="form-controler"> -->
<%-- 								<form:input id="petImage" path="petImage" type="file" accept=".jpg,.png,.jpeg"/> --%>
<!-- 							<br> -->
<!-- 							<i class="fa fa-photo"></i> 上傳圖片 -->
								
<!-- 							</div> -->
<!-- 							<div style = "height:200px">	 -->
<%--          						<img src="${pet.photo}" id="ppimg"  class="salonIcon">		 --%>
<!--        						</div>	 -->
<!-- 						</div> -->
						<div class="form-item fih">
							<div style="display:flex">
								<input type="button" class="btnAdd" value="上一頁"
									style="float:left" id="photoPreviousPage"/>
															
								
								<input type="submit" class="btnAdd" value="送出"
									style="margin-left:638px;"  onclick="return check_element()"/>
							</div>
						</div>	
					</div><!-- table -->

				</div> <!-- divphoto -->
				<div class="fih"></div>
			</div><!-- main -->
		</div><!-- wrapper -->
		<input type="hidden"  id="genderValue">
		<input type="hidden"  id="sizeValue">
		<input type="hidden"  id="ligationValue">
	</form:form>
	<script type="text/javascript">
<!-- ========================================= 原始檔案 =======================================================================	 -->	
		$("#petName").val("${pet.petName}");
 		$("#chip").val("${pet.chip}");
 		$("#type").val("${pet.type}"); 		
 		$("#variety").val("${pet.variety}");
 		
 		var genderValue = $("#genderValue").val("${pet.gender}");
 		if(genderValue = "男"){
 			$("#g1").attr("checked",true);
 		}else if(genderValue = "女"){
 			$("#g2").attr("checked",true);
 		}else if(genderValue = "不知道"){
 			$("#g3").attr("checked",true);
 		}
 		
 		var sizeValue = $("#sizeValue").val("${pet.size}");
 		if(sizeValue = "小"){
 			$("#s1").attr("checked",true);
 		}else if(sizeValue = "中"){
 			$("#s2").attr("checked",true);
 		}else if(sizeValue = "大"){
 			$("#s3").attr("checked",true);
 		}
 	
 		$("#age").val("${pet.age}");
 		$("#operated").val("${pet.operated}");
		$("#deworming").val("${pet.deworming}");
		
		var ligationValue = $("#ligationValue").val("${pet.ligation}");
 		if(ligationValue = "1"){
 			$("#l1").attr("checked",true);
 		}else if(ligationValue = "0"){
 			$("#l2").attr("checked",true);
 		}
 		
<!-- ========================================= 一鍵輸入 =======================================================================	 -->
	
	
// 	$("#onepunch").click(function() {
// 		$("#name").val("胖白");
// 		$("#chip").val("990000002715101");
// 		$("#type").val("狗");
// 		$("#variety").val("柴犬");
// 		$("#g1").attr("checked",true);
// 		$("#s1").attr("checked",true);
// 		$("#age").val("10");
// 		$("#operated").val("側腹");
// 		$("#deworming").val("寵愛食剋");
// 		$("#l1").attr("checked",true);
// 		showPhoto();
// 	});
	
<!-- ====================================================================================================================	 -->	
	
	$("#clickaccount").css("color", "#8D5433");
	$("#divinfo").hide();
	$("#divphoto").hide();
	$("#angle2").hide();
	$("#angle3").hide();
	
	$("#clickaccount").click(function(){
		showAccount();
	})
	$("#clickinfo").click(function(){
		showInfo();
	})
	$("#clickphoto").click(function(){
		showPhoto();
	})
	
	$("#accountNextPage").click(function(){
		showInfo();
	})
	$("#infoPreviousPage").click(function(){
		showAccount();
	})
	$("#infoNextPage").click(function(){
		showPhoto();
	})
	$("#photoPreviousPage").click(function(){
		showInfo();
	})
	
	
	function showAccount() {
		$("#clickaccount").css("color", "#8D5433");
		$("#clickinfo").css("color", "black");
		$("#clickphoto").css("color", "black");
		$("#angle1").show();
		$("#angle2").hide();
		$("#angle3").hide();
		$("#divaccount").show();
		$("#divinfo").hide();
		$("#divphoto").hide();
	}
	
	function showInfo() {
		$("#clickaccount").css("color", "black");	
		$("#clickinfo").css("color", "#8D5433");
		$("#clickphoto").css("color", "black");
		$("#angle1").hide();
		$("#angle2").show();
		$("#angle3").hide();
		$("#divaccount").hide();
		$("#divinfo").show();
		$("#divphoto").hide();
	}
	
	function showPhoto() {
		$("#clickaccount").css("color", "black");
		$("#clickinfo").css("color", "black");
		$("#clickphoto").css("color", "#8D5433");
		$("#angle1").hide();
		$("#angle2").hide();
		$("#angle3").show();
		$("#divaccount").hide();
		$("#divinfo").hide();
		$("#divphoto").show();
	}
<!-- ====================================================================================================================	 -->	
// 	var checkPhoto = false;
	var x = new FileReader;
	document.getElementById('petImage').onchange = function() { 
		if(document.getElementById('petImage').value==""){
// 			checkPhoto = false;
		}else{
// 			checkPhoto = true;
			x.readAsDataURL(this.files[0]);
		}
	}

	x.onloadend = function() {
		document.getElementById('ppimg').src = this.result;
	}
	
<!-- ========================================== ajax檢查晶片 ==========================================================================	 -->
	var chipField = true;
	document.getElementById("chip").onblur = function() {
		var cc = document.getElementById('checkChip');
		var chipValue = document.getElementById("chip").value;
		cc.innerHTML = "";
		if (!chipValue) {
			cc.innerHTML =   "<font color='white' size='-2'>&nbsp;</font>";
			chipField = true;
			return;
		}
		if (chipValue.length < 10) {
			cc.innerHTML =   "<font color='red' size='-2'>晶片格式有誤，請重新輸入</font>";
			chipField = false;
			return;
		}
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/CheckChip' />", true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("chip=" + chipValue);
		var message = "";
		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);
				if (result.id.length == 0) {
					message = "<font color='green' size='-2'>晶片可以註冊</font>";
					chipField = true;
				} else if (result.id.startsWith("Error")) {
					message = "<font color='red' size='-2'>發生錯誤: 代號"
							+ result.id + "</font>";
							chipField = false;
				} else {
					message = "<font color='red' size='-2'>晶片重複，請重新輸入晶片</font>";
					chipField = false;
				}
				cc.innerHTML = message;
			}
		}
	}
<!-- ========================================= check_element ===========================================================================	 -->
	function check_element(){
		const mySet = new Set();
		var message = "";
		
		if(petName.value == ""){
			mySet.add(1);
			message += "名字尚未填寫<br>";
		}
		
		if(!chipField){
			mySet.add(1);
			message += "晶片不正確<br>";
		}
		
// 		if(chip.value == ""){
// 			mySet.add(1);
// 			message += "晶片尚未填寫<br>";
// 		}
		
		if(type.value == ""){
			mySet.add(1);
			message += "類型尚未填寫<br>";
		}
		
// 		if(variety.value == ""){
// 			mySet.add(1);
// 			message += "品種尚未填寫<br>";
// 		}
		
		
// 		if(!(document.getElementById('g1').checked||document.getElementById('g2').checked||document.getElementById('g3').checked)){
// 			mySet.add(1);
// 			message += "性別尚未選擇<br>";
// 		}
		
// 		if(document.getElementById('s4').checked){
// 			mySet.add(2);
// 			message += "體型尚未選擇<br>";
// 		}
		
		if(age.value == ""){
			mySet.add(2);
			message += "年齡尚未填寫<br>";
		}
		
		if(operated.value == ""){
			mySet.add(2);
			message += "開刀位置尚未填寫<br>";
		}
		
		if(deworming.value == ""){
			mySet.add(2);
			message += "驅蟲藥尚未填寫<br>";
		}
		
// 		if(!(document.getElementById('l1').checked || document.getElementById('l2').checked)){
// 			mySet.add(2);
// 			message += "結紮尚未選擇<br>";
// 		}
		
// 		if(!checkPhoto){
// 			mySet.add(3);
// 			message += "圖片尚未選擇<br>";
// 		}
		
		if(message.length != 0){
			if(mySet.has(1)){
				showAccount();
			}else if(mySet.has(2)){
				showInfo();
			}else if(mySet.has(3)){
				showPhoto();
			}
			alertWarning(message);
			return false;
		}else{
			return true;
		}
	
	}
	function alertWarning(message) {
	    Swal.fire(
	    	"有欄位尚未填寫", //標題 
	    	message, 
	        "warning" 
	    );
	}
	
	</script>
</body>
</html>