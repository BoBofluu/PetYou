<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>預約資訊</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<spring:url value='/css/reservation/createReservation.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>

	<div>
		<form method="POST" class="reservate" action="<c:url value='/insertReservation' />">
			<div class="outContainer">
				<div class="title">
				<img src="<c:url value='/image/reservation/預約資訊(咖啡色字體).png' />"/>
				</div>
				<div class="shopContainer">
					<span class="infoBox">店家資訊</span>
					<hr>
					<label>店家ID</label>
						<input name="shopID" id="shopId" type="text" value="${sb.shopID}" readonly /><br>
						<label>店家名稱</label>
							<input id="shopName" type="text" value="${sb.shopName}" readonly />
							<span></span>
							<br>
						<label>聯絡電話</label>
							<input type="text" value="${sb.phone}" readonly />
							<span></span>
							<br>
				</div>
				<!-- shopContainer -->
					<!-- 預設是會員本人 -->
					<div class="memberContainer">
					<span class="infoBox">聯絡人資料</span> 
					<hr>
						<label>會員ID</label> 
							<input name=memberID id="memberId" type="text"  value="${mb.memberID}"  readonly/> <br>
						<label>聯絡人姓名</label> 
							<input name="contactPerson" id="contactName" type="text" value="${mb.lastName}${mb.firstName}" required />
							<span class="check" id="personCheck" hidden></span>
							 <br>
						<label>聯絡人電話</label> 
							<input name="contactPhone" id="contactPhone" type="text" value="${mb.phone}"  required />
							<span class="check" id="phoneCheck" hidden></span>
							<br>

					</div>
						<!-- memberContainer -->

				<div class="reservateContainer">
					<span class="infoBox">預約資訊</span>
					<button id="reservate-btn" type="button">我要預約</button>
					<hr>
						
						<label>醫療/美容</label> 
							<input name="reservationType" id="reservationType" type="text" value="${sb.type}" readonly /><br>
						
						<label>預約日期</label>
							<input name="reservationDate" id="reservationDate" type="Date">
							<input id="week" hidden> 
							<span class="check" id="dateCheck" hidden></span><br>
					<label>預約時段</label> 
					
					<select name="reservationTime" id="0" hidden onchange="return chosenTime(this.id)">
							<option value="0">請選擇</option>
						<c:forTokens var="time" delims="," items="${sb.sun}">
							<option>${time}</option>
						</c:forTokens>
					</select>
					<select name="reservationTime" id="1" hidden onchange="return chosenTime(this.id)">
							<option value="0">請選擇</option>					
						<c:forTokens var="time" delims="," items="${sb.mon}">
							<option>${time}</option>
						</c:forTokens>
					</select>
					<select name="reservationTime" id="2" hidden onchange="return chosenTime(this.id)">
							<option value="0">請選擇</option>
						<c:forTokens var="time" delims="," items="${sb.tue}">
							<option>${time}</option>
						</c:forTokens>
					</select>
					<select name="reservationTime" id="3" hidden onchange="return chosenTime(this.id)">
							<option value="0">請選擇</option>					
						<c:forTokens var="time" delims="," items="${sb.wed}">					
							<option>${time}</option>
						</c:forTokens>
					</select>
					<select name="reservationTime" id="4" hidden onchange="return chosenTime(this.id)">
							<option value="0">請選擇</option>					
						<c:forTokens var="time" delims="," items="${sb.thu}">						
							<option>${time}</option>
						</c:forTokens>
					</select>
					<select name="reservationTime" id="5" hidden onchange="return chosenTime(this.id)">
							<option value="0">請選擇</option>
						<c:forTokens var="time" delims="," items="${sb.fri}">					
							<option>${time}</option>
						</c:forTokens>
					</select>
					<select name="reservationTime" id="6" hidden onchange="return chosenTime(this.id)">
							<option value="0">請選擇</option>	
						<c:forTokens var="time" delims="," items="${sb.sat}">
							<option>${time}</option>
						</c:forTokens>
					</select>
					<span class="check" id="timeCheck" hidden></span>
					
					<br> <label>服務種類</label>
					<div class="custom-control custom-radio" style="display: inline-block;">
						<input type="radio" id="personService" name="serviceType" value="personService" class="custom-control-input" 
											style="background-color: lightpink;border-radius: 15px;" checked>
						<label class="custom-control-label" for="personService">親自接送</label>
					</div>
					<div class="custom-control custom-radio" style="display: inline-block;">
						<input type="radio" id="shopService" name="serviceType" value="shopService" class="custom-control-input" >
						<label class="custom-control-label" for="shopService">店家接送</label>
					</div>
					<div class="custom-control custom-radio" style="display: inline-block;">
						<input type="radio" id="homeService" value="homeService" name="serviceType" class="custom-control-input">
						<label class="custom-control-label" for="homeService">到府服務</label>
					</div>
					
					<c:choose>
						<c:when test="${sb.type == '醫療' }">
					<br><label>醫生名稱</label>
					<select name="doctorName" id="doctor">
							<option selected>請選擇</option>
						<c:forTokens var="doctor" delims="," items="${sb.typeHospital.hospitalDoctors}">					
							<option>${doctor}</option>
						</c:forTokens>
					</select>
					<span id="doctorCheck" class="check" hidden></span>
					
					<br><label>診療項目</label>
					<select name="hItems"  id="project">
							<option>請選擇</option>
						<c:forTokens var="project" delims="," items="${sb.typeHospital.hospitalProject}">					
							<option>${project}</option>
						</c:forTokens>
					</select>
						</c:when>
						
					<c:when test="${sb.type == '美容' }">				
					<br><label>美容項目</label>
					<select name="sItems" id="project">
							<option>請選擇</option>
						<c:forTokens var="project" delims="," items="${sb.typeBeauty.beautyBasicProject}">						
							<option>${project}</option>
						</c:forTokens>
						<c:forTokens var="project" delims="," items="${sb.typeBeauty.beautySpecialProject}">					
							<option>${project}</option>
						</c:forTokens>
					</select>
						</c:when>
					</c:choose>
					<span id="projectCheck" class="check" hidden></span>
					<br>
					<label>預約備註</label>
					<input name="remark" id="remark" type="text" style="width: 700px;" /><br>
					</div>
				<!-- reservateContainer -->
				
				
				<div class="petContainer">
					<span class="infoBox">寶貝資訊</span>
					<hr>
					<label>名稱</label>
					
					<select id="pickPet">
					<option selected>請選擇</option>
					</select>
					<input name="petID" type="text" id="petID" hidden>
					<span id="petCheck" class="check" hidden></span>
					<br>
					 <label>類型</label>
						<input id="petType" type="text" readonly /><br>
					<label>品種</label> 
						<input id="petVariety" type="text" readonly /><br> 
					<label>體型</label>
						<input id="petSize" type="text" readonly/><br>
					 <label>年齡</label> 
					 	<input id="petAge" type="text" readonly /><br>
					 <label>性別</label>
					 	<input id="petGender" type="text" readonly /><br>
					 	
					<c:choose>
						<c:when test="${sb.type == '醫療'}">
						<br>
						<span class="infoBox">醫療紀錄</span>
						<hr>
							<label>開刀紀錄</label>
								<input name="operated" id="petOperated" type="text" /><br>
							<label>驅蟲藥</label>
								<input name="deworming" id="petDeworming" type="text" /><br>
							<label>結紮</label>
								<select id="ligation" name="ligation">
									<option value="0">否
									<option value="1">是
									<option value="2">不清楚
								</select>
							<br><label>特殊狀況</label>
								<input style="width: 700px;" name="hDescription" id="hDescription" type="text" /><br>
						</c:when>
						<c:when test="${sb.type == '美容'}">
						<label>特殊狀況</label>
							<input style="width: 700px;" name="sDescription" id="sDescription" type="text" /><br>
							<!-- 為了讓controller有值，所以hidden起來 -->
							<input name="operated" id="petOperated" type="text"  hidden/>
							<input name="deworming" id="petDeworming" type="text" hidden />
							<input id="ligation" name="ligation"  hidden>
						</c:when>
					</c:choose>

				</div>
				<!-- petContainer -->
				<label class="sendData">
				<input value="" type="submit"  id="sendData" disabled/>
				<img src="<c:url value='/image/reservation/確認送出(咖啡色字體).png' />"/>
				</label>
				<input id="checkAll" hidden>
				<img src="<c:url value='/image/reservation/icons8-llama-96.png' />" id="llama" hidden />
				
			</div>
		</form>
	</div>
	<!-- outContainer -->
	
	<script type="text/javascript">
	

	var key = 0
	
	var contactName = $("#contactName").val();
	var contactPhone = $("#contactPhone").val();
	var reservationType = $("#reservationType").val();
	var reservationDate = $("#reservationDate").val();
	var remark = $("#remark").val();
	var hDescription = $("#hDescription").val();
	var sDescription = $("#sDescription").val();
	
	
	window.onload = function(){
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/petInfoJson' />", "true");
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var pet = JSON.parse(xhr.responseText);
	 				for(let i = 0 ; i < pet.length; i++ ){
	 				$("#pickPet").append("<option>" + pet[i].petName);
	 			}
	 				var selectmenu=document.getElementById("pickPet")
	 				selectmenu.onchange=function(){ 
	 				var chosenoption=this.options[this.options.selectedIndex].index;
	 				if(chosenoption == 0){
	 					$("#petType").val("");
		 				$("#petVariety").val("");
		 				$("#petSize").val("");
		 				$("#petAge").val("");
		 				$("#petGender").val("");
		 				$("#petOperated").val("");
		 				$("#petDeworming").val("");
		 				$("#petLigation").val("");
		 				$("#petID").val("");
	 				}else{
	 					$("#petType").val(pet[chosenoption-1].type);
	 					$("#petVariety").val(pet[chosenoption-1].variety);
	 					$("#petSize").val(pet[chosenoption-1].size);
	 					$("#petAge").val(pet[chosenoption-1].age);
	 					$("#petGender").val(pet[chosenoption-1].gender);
	 					$("#petOperated").val(pet[chosenoption-1].operated);
	 					$("#petDeworming").val(pet[chosenoption-1].deworming);
	 					$("#petLigation").val(pet[chosenoption-1].ligation);
	 					$("#petID").val(pet[chosenoption-1].petID);
	 				switch(pet[chosenoption-1].operated){
	 				case 0:
	 					$("#petOperated").val("否");
	 					$("#operatedReason").attr("disabled", true);
	 					break;
	 				case 1:
	 					$("#petOperated").val("是");
	 					$("#operatedReason").attr("disabled", false);
	 				case 2:
	 					$("#petOperated").val("不清楚");
	 					$("#operatedReason").attr("disabled", true);
	 				}
	 				
	 				switch(	(pet[chosenoption-1].deworming)){
	 				case 0:
	 					$("#petDeworming").val("否");
	 					$("#dewormingReason").attr("disabled", true);
	 					break;
	 				case 1:
	 					$("#petDeworming").val("是");
	 					$("#dewormingReason").attr("disabled", false);
	 					break;
	 				case 2:
	 					$("#petDeworming").val("不清楚");
	 					$("#dewormingReason").attr("disabled", true);
	 					break;
	 				}
					var ligationSelect = $("#ligation")
	 				
	 				$("#ligation").val(pet[chosenoption-1].ligation).attr("selected","true");

	 					}
//  						console.log("petIndex==>" + $("#ligation").val())
 						if(chosenoption == 0){
 			 				$("#petCheck").text("要幫哪位寶貝預約呢?");
 			 				$("#petCheck").attr("hidden", false);
 						}else{
 							$("#petCheck").attr("hidden", true);
 						}
	 				}
				}
			}
			
			//即時判斷聯絡人姓名
			$("#contactName").blur(function(){
				if($("#contactName").val().match(/^[ ]*$/) || $("#contactName").val().length <=0 ||$("#contactName").val() == null){
					$("#personCheck").text("請輸入姓名");
					$("#personCheck").attr("hidden", false);
					console.log("聯絡人姓名有誤")
				}else{
					$("#personCheck").attr("hidden", true);
				}
			})
			
			//即時判斷判斷電話長度是否為10碼
			$("#contactPhone").blur(function(){
				if($("#contactPhone").val().match(/^[ ]*$/) || $("#contactPhone").val() == null){
					$("#phoneCheck").text("請輸入電話");
					$("#phoneCheck").attr("hidden", false);
					console.log("聯絡人電話有誤")
				}else if($("#contactPhone").val().length <10 || $("#contactPhone").val().length >10){
					$("#phoneCheck").text("號碼有誤");
					$("#phoneCheck").attr("hidden", false);
					console.log("聯絡人電話格式有誤")
				}else{
					$("#phoneCheck").attr("hidden", true);
				}
			})
			
			//取得今天日期
			var today = new Date();
			var separator = "-";
			var todayyear = today.getFullYear();
			var todaymonth = today.getMonth()+1;
			var todayday = today.getDate();
			var todayWeek = today.getDay();
			getWeekday(todayWeek);
			
			//獲取this加days的日期值
			Date.prototype.addDays = function(days) {
				//this 為今天日期
				 this.setDate(this.getDate() + days);
				 return this;
			}
			
			Date.prototype.minusDays = function(days) {
				//this 為今天日期
				 this.setDate(this.getDate() - days);
				 return this;
			}
			//先將function得到的日期塞進變數，其形態為一date====> max = Wed Nov 18 2020 20:00:33 GMT+0800 (台北標準時間)	
			var max = today.addDays(14);
			var maxYear = max.getFullYear();
			var maxMonth = max.getMonth()+1;
			var maxDay = max.getDate();
			var minday = todayday+1;
			
			//如果數字是個位數，沒辦法新增max or min屬性，所以將0串接在之前，強制變雙位數
			if(maxDay < 10){
				maxDay = "0" + maxDay;
			}
			
			if(minday < 10){
				minday = "0" + minday;
			}
			
			if(maxMonth < 10){
				maxMonth = "0" + maxMonth;
			}
			
			if(todaymonth < 10){
				todaymonth = "0" + todaymonth;
			}
			
			//決定日期範圍只能是今天往後14天
				$("#reservationDate").attr("max", maxYear + separator + maxMonth + separator + maxDay);
				$("#reservationDate").attr("value", todayyear + separator + todaymonth + separator + minday).attr("selected", true);
				$("#reservationDate").attr("min", todayyear + separator + todaymonth + separator + minday);
		
				var date = $("#reservationDate").val();
// 				console.log("reservationDate==>" + date);
				var array = date.split("-");
				var week = new Date(array[0], array[1] - 1, array[2]);
				var weekday = week.getDay();
				$("#week").attr('value', weekday);
				getWeekday(weekday);

			//根據日期，判斷星期，並顯示與之對應的時間選項
			$("#reservationDate").change(function() {
				var date = $(this).val();
// 				console.log("reservationDate==>" + date);
				var array = date.split("-");
				var week = new Date(array[0], array[1] - 1, array[2]);
				var weekday = week.getDay();
				$("#week").attr('value', weekday);
				getWeekday(weekday);
			})
			
			//ok
			//獲取預設的serviceType
			var serviceType = document.querySelector('[name=serviceType]:checked').id;
			//獲取選項改變後的serviceType
			$("input[name='serviceType']").change(function (){
				serviceType = document.querySelector('[name=serviceType]:checked').id;
// 				console.log("serviceType==>" + serviceType)
			});
			
			//ok
			var doctor;
			//取得選取醫生
			$("#doctor").change(function(){
				doctor=$("#doctor").val();
// 				console.log("doctor==>" + doctor)
				if(doctor == "請選擇"){
						$("#doctorCheck").text("記得選擇醫生喔^^");
						$("#doctorCheck").attr("hidden", false);
				}else{
					$("#doctorCheck").attr("hidden", true);
				}
			})
			
			//ok
			//醫療or美容項目
			var project;
			$("#project").change(function(){
				project = $("#project").val();
// 				console.log("project==>" + project)
				if(project == "請選擇"){
					$("#projectCheck").text("糟糕! 忘記選項目了喔~");
					$("#projectCheck").attr("hidden", false);
				}else{
				switch($("#reservationType").val()){
				case "醫療":
					$("#projectCheck").attr("hidden", true);
					break;
				case "美容":
					$("#projectCheck").attr("hidden", true);
					break;
					}
				}
			})
			
			//送出前的最終檢查
			//此處的value都要重新取值，不能用上面宣告的，才能取到最新的值
			$(".sendData").mouseenter(function(){
			if(key ==  0){
								lastCheck();
								if($("#personCheck").attr("hidden") == 'hidden' &&
										$("#phoneCheck").attr("hidden")== 'hidden' &&
										$("#timeCheck").attr("hidden")== 'hidden' &&
										$("#projectCheck").attr("hidden")== 'hidden' &&
										$("#petCheck").attr("hidden")== 'hidden'){
									console.log("lastcheck is all done when key = 0");
									$("#sendData").attr("disabled",false);
								}else{
									$("#sendData").attr("disabled",true);
									$("#checkAll").attr("hidden",false).val("還沒填寫完喔!");
									$("#llama").attr("hidden", false);
									console.log("lastcheck is not done when key = 0");
								}
			}else{
				lastCheck();
				if($("#personCheck").attr("hidden") == 'hidden' &&
						$("#phoneCheck").attr("hidden")== 'hidden' &&
						$("#timeCheck").attr("hidden")== 'hidden' &&
						$("#projectCheck").attr("hidden")== 'hidden' &&
						$("#petCheck").attr("hidden")== 'hidden'){
					console.log("lastcheck is all done when key is not 1");
					$("#sendData").attr("disabled",false);
					$("#checkAll").attr("hidden",true)
					$("#llama").attr("hidden", true)
				}else{
					$("#sendData").attr("disabled",true);
					$("#checkAll").attr("hidden",false).val("還沒填寫完喔!");
					$("#llama").attr("hidden", false);
					console.log("lastcheck is not done when key is not 1")
				}
			}
			key++
			console.log(key)
			})
		}//window onload
		
		//取得選取時間
		function chosenTime(time){
			var selector=document.getElementById(time);
			var reservationTime=selector.options[selector.options.selectedIndex].value;
// 			console.log("reservationTime==>" + reservationTime)
			if(reservationTime == "公休"){
				$("#timeCheck").text("今天休息，請選擇別天！");
				$("#timeCheck").attr("hidden", false);
			}else if(reservationTime == 0){
				$("#timeCheck").text("忘記選時間囉!");
				$("#timeCheck").attr("hidden", false);
			}else{
				$("#timeCheck").attr("hidden", true);
			}
		}

		//取得星期
		function getWeekday(weekday){
			switch (weekday) {
			case 0:
				$("#1, #2, #3, #4, #5, #6").attr("hidden", true);
				$("#0").attr("hidden", false);
				break;
			case 1:
				$("#0, #2, #3, #4, #5, #6").attr("hidden", true);
				$("#1").attr("hidden", false);
				break;
			case 2:
				$("#0, #1, #3, #4, #5, #6").attr("hidden", true);
				$("#2").attr("hidden", false);
				break;
			case 3:
				$("#0, #1, #2, #4, #5, #6").attr("hidden", true);
				$("#3").attr("hidden", false);
				break;
			case 4:
				$("#0, #1, #2, #3, #5, #6").attr("hidden", true);
				$("#4").attr("hidden", false);
				break;
			case 5:
				$("#0, #1, #2, #3, #4, #6").attr("hidden", true);
				$("#5").attr("hidden", false);
				break;
			case 6:
				$("#0, #1, #2, #3, #4, #5").attr("hidden", true);
				$("#6").attr("hidden", false);
				break;
			}
		}
		
		function lastCheck(){
			if($("#contactName").val().match(/^[ ]*$/) || $("#contactName").val().length <=0 ||$("#contactName").val() == null){
				$("#personCheck").text("請輸入姓名");
				$("#personCheck").attr("hidden", false);
				console.log("聯絡人姓名有誤")
			}else{
				$("#personCheck").attr("hidden", true);
			}
			
			//判斷電話長度是否為10碼
			if($("#contactPhone").val().match(/^[ ]*$/) || $("#contactPhone").val() == null){
				$("#phoneCheck").text("請輸入電話");
				$("#phoneCheck").attr("hidden", false);
				console.log("聯絡人電話有誤")
			}else if($("#contactPhone").val().length <10 || $("#contactPhone").val().length >10){
				$("#phoneCheck").text("號碼有誤");
				$("#phoneCheck").attr("hidden", false);
					console.log("聯絡人電話格式有誤");
			}else{
				$("#phoneCheck").attr("hidden", true);
			}
			
			//判斷是否有選擇時間
			for(i = 0; i < 7; i++){
			var selector=document.getElementById(i);
			var reservationTime=selector.options[selector.options.selectedIndex].value;
// 			console.log("reservationTime==>" + reservationTime)
			if(reservationTime == "公休"){
				console.log("time: " + reservationTime)
				$("#timeCheck").text("今天休息，請選擇別天！");
				$("#timeCheck").attr("hidden", false);
			}else if(reservationTime == 0){
				console.log("time: " + reservationTime)
				$("#timeCheck").text("忘記選時間囉!");
				$("#timeCheck").attr("hidden", false);
			}else{
				console.log("time: " + reservationTime)
				$("#timeCheck").attr("hidden", true);
				break;
			}
		}

			//判斷是否有選擇醫生
			if($("#doctor").val() == "請選擇"){
				$("#doctorCheck").text("醫生還沒選!")
				$("#doctorCheck").attr("hidden", false);
					console.log("未選擇醫生")
			}else{
				$("#doctorCheck").attr("hidden", true);
			}
			if($("#project").val() == "請選擇"){
				$("#projectCheck").text("服務項目還沒選!")
				$("#projectCheck").attr("hidden", false);
					console.log("未選擇服務項目")
			}else{
				$("#projectCheck").attr("hidden", true);
			}
			
			if($("#petID").val() == ""){
				$("#petCheck").text("要幫哪位寶貝預約呢?");
				$("#petCheck").attr("hidden", false);
					console.log("未選擇寵物");
				}else{
				console.log($("#petID").val() + " 我是petID")
				$("#petCheck").attr("hidden", true);
			}
			$("#sendData").attr("background-color","black");
			
		}
		
		$("#reservate-btn").click(function(){
			$("#project").val("藥浴").attr("selected","true");
			$("#remark").val("藥物會親自提供，請勿使用店家自己的");
			$("#sDescription").val("狗狗右腳受傷了，梳毛時請小心");
			$("#contactName").val("Vivian Ko");
		})
		
	</script>
</body>
</html>