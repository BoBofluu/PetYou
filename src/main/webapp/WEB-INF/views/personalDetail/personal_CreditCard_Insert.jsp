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
</head>
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
	width: 170px;
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
	width: 196px;
	padding: 0 0 0 30px;
	border:0px;
	background-color:#f6c2cd;
	border-radius: 10px;
	outline: 0; 
	height:45px;
}

.salonIcon {
	overflow: hidden;
	height: 200px;
}

.btnAdd{ 
 	outline: 0; 
 	width:80px;
/*  	padding-bottom:30px; */
 	border-radius:5px;
	border:0px; 
	background-color:#F5AAAF;
} 

img {
	border-radius: 5px;
}
</style>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<form:form method="post" modelAttribute="creditCard" enctype="multipart/form-data">
		<div class="wrapper clearfix">
		<div class="sidemenu">
				<ul style="list-style: none; line-height: 20px;">

					<li id="onepunch" style="cursor: pointer;">
						<i class="fa fa-hand-peace-o" aria-hidden="true">一鍵輸入</i>
							
					</li>
				</ul>
			</div>
		<div class="main">
				<div id="divaccount">
				
					<div class="form-title">新增信用卡資訊</div>
					<div class="form-table">
						<div class="form-item fih">
							<label class="form-label">信用卡卡號<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="creditCardNumber" class="input-holder" id="creditCardNumber" name="creditCardNumber"
									placeholder="輸入信用卡卡號" autocomplete="off" 
									onkeyup="value=this.value.replace(/\D+/g,'');" maxlength="16"/>
			
							</div>
							<div id="checkcreditCardNumber">&nbsp;</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">信用卡到期日<span style="color:red">*</span></label>
							<div class="form-controler">
								<input type="text" class="input-holder" id="expiryDate1"
									autocomplete="off" 
									onkeyup="value=this.value.replace(/\D+/g,'');" maxlength="2"
									style="width:190px"/>
								/	
								<input type="text" class="input-holder" id="expiryDate2"
									autocomplete="off" 
									onkeyup="value=this.value.replace(/\D+/g,'');" maxlength="2"
									style="width:190px"/>
							
							
								<form:input type="hidden"  id="expiryDate"
									name="chip"  path="expiryDate"/>
								<script type="text/javascript">
									$("#expiryDate1").blur(function(){
										var get1 = $("#expiryDate1").val();
										var get2 = $("#expiryDate2").val();
										$("#expiryDate").val(get1 + "/" + get2);
									})
									
									$("#expiryDate2").blur(function(){
										var get1 = $("#expiryDate1").val();
										var get2 = $("#expiryDate2").val();
										$("#expiryDate").val(get1 + "/" + get2);
									})
								
								</script>
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">審核碼<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="reviewCode" class="input-holder" id="reviewCode" name="reviewCode"
									placeholder="輸入審核" autocomplete="off"
									onkeyup="value=this.value.replace(/\D+/g,'');" maxlength="3"/>
			
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">持卡者<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="cardholder" class="input-holder" id="cardholder" name="cardholder"
									placeholder="輸入持卡者" autocomplete="off" />
							</div>
						</div>
						<hr>
						<div class="form-item fih" style="height:120px">
							<label class="form-label">帳單地址<span style="color:red">*</span></label>
							<div class="form-controler" >
								<select name="city" id="city"  class="theselect" >
									<option value="-1" disabled selected>縣市</option>
								</select>
	
								<select name="township" id="township"  class="theselect" >
									<option value="-1" disabled selected>鄉鎮市區</option>
								</select>
								<br><br>
								<input type="text" class="input-holder" id="lastaddress"  placeholder="街道巷弄" autocomplete="off" style=""/>
								<div style="display:none">
									<form:input type="text"  path="billingAddress" class="input-holder" id="billingAddress" name="billingAddress"/>
								</div>
							</div>
						</div>
<!-- 						<div class="form-item fih"> -->
<!-- 							<label class="form-label">帳單地址</label> -->
<!-- 							<div class="form-controler"> -->
<%-- 								<form:input type="text" path="billingAddress" class="input-holder" id="billingAddress" name="billingAddress" --%>
<%-- 									placeholder="輸入地址" autocomplete="off" /> --%>
<!-- 							</div> -->
<!-- 						</div> -->
						<hr>
						<div class="form-item fih">
							<label class="form-label">郵遞區號<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="postalCode" class="input-holder" id="postalCode" name="postalCode"
									placeholder="輸入郵遞區號" autocomplete="off" 
									onkeyup="value=this.value.replace(/\D+/g,'');" maxlength="3"/>
			
							</div>
						</div>
						
						<div style="width:100px;margin-left:720px;">
							<input class="btnAdd" type="submit" value="送出" onclick="return check_element()">
						</div>
					</div>
				</div>
				<div class="fih"></div>
			</div>
		</div>
	</form:form>
<!-- ==================================================================================================================== -->
	<script type="text/javascript">
<!-- ==================================================================================================================== -->
	$("#onepunch").click(function() {
		$("#creditCardNumber").val("4360171107869237");
		$("#expiryDate1").val("06");
		$("#expiryDate2").val("25");
		$("#expiryDate").val("06/25");
		$("#reviewCode").val("849");
		$("#cardholder").val("徐妤瑤");
		$("#city option[value='臺北市']").attr('selected', 'selected');
		$("#township option[value='大安區']").attr('selected', 'selected');
		$("#lastaddress").val("復興南路一段390號2樓"); 
		$("#billingAddress").val("臺北市大安區復興南路一段390號2樓");
		$("#postalCode").val("106");
	});
	
<!-- ========================================== ajax檢查卡號 ==========================================================================	 -->
	var ccField = true;
	document.getElementById("creditCardNumber").onblur = function() { 
		var Checkcc = document.getElementById('checkcreditCardNumber');
		var ccnValue = document.getElementById("creditCardNumber").value;
		Checkcc.innerHTML = "";
		if (!ccnValue) {
			Checkcc.innerHTML =   "<font color='white' size='-2'>&nbsp;123</font>";
			ccField = true;
			return;
		}
		if (ccnValue.length != 16) {
			Checkcc.innerHTML =   "<font color='red' size='-2'>格式有誤，請重新輸入</font>";
			ccField = false;
			return;
		}
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/checkcreditCardNumber' />", true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("creditCardNumber=" + ccnValue);
		var message = "";
		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);
				if (result.id.length == 0) {
	// 				message = "<font color='green' size='-2'>可以註冊</font>";
					ccField = true;
				} else if (result.id.startsWith("Error")) {
					message = "<font color='red' size='-2'>發生錯誤: 代號"
							+ result.id + "</font>";
							ccField = false;
				} else {
					message = "<font color='red' size='-2'>卡號重複，請重新輸入</font>";
					ccField = false;
				}
				Checkcc.innerHTML = message;
			}
		}
	}
	
	
	var cities = ["臺北市","新北市","桃園市","臺中市","臺南市","高雄市","新竹縣",
		"苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣",
		"臺東縣","澎湖縣","金門縣","連江縣","基隆市","新竹市","嘉義市"];
	
	var taipei =["中正區","大同區","中山區","松山區","大安區","萬華區",
		"信義區","士林區","北投區","內湖區","南港區","文山區"];
	
	var newTaipei =["萬里區","金山區","板橋區","汐止區","深坑區","石碇區","瑞芳區",
		"平溪區","雙溪區","貢寮區","新店區","坪林區","烏來區","永和區","中和區",
		"土城區","三峽區","樹林區","鶯歌區","三重區","新莊區","泰山區","林口區",
		"蘆洲區","五股區","八里區","淡水區","三芝區","石門區"];
	
	var taoYuan =["中壢區","平鎮區","龍潭區","楊梅區","新屋區",
		"觀音區","桃園區","龜山區","八德區","大溪區","復興區",
		"大園區","蘆竹區"]
	
	var taichung=["中區","東區","西區","南區","北區","西屯區","南屯區",
		"北屯區","豐原區","大里區","太平區","清水區","沙鹿區","大甲區",
		"東勢區","梧棲區","烏日區","神岡區","大肚區","大雅區","后里區",
		"霧峰區","潭子區","龍井區","外埔區","和平區","石岡區","大安區","新社區"]
	
	var tainan = ["中西區","東區","南區","北區","安平區","安南區","永康區",
		"歸仁區","新化區","左鎮區","玉井區","楠西區","南化區","仁德區","關廟區",
		"龍崎區","官田區","麻豆區","佳里區","西港區","七股區","將軍區",
		"學甲區","北門區","新營區","後壁區","白河區","東山區","六甲區","下營區",
		"柳營區","鹽水區","善化區","大內區","山上區","新市區","安定區"]
	
	var kao=["楠梓區", "左營區", "鼓山區", "三民區", "苓雅區", "新興區", "前金區", "鹽埕區", "小港區", "旗津區",
		"前鎮區", "鳳山區", "岡山區", "旗山區", "美濃區", "大寮區", "茄萣區", "永安區", "大園區",
		"大社區", "杉林區", "仁武區", "田寮區", "燕巢區", "路竹區", "阿蓮區", "甲仙區", "大樹區",
		"湖內區", "桃源區", "鳥松區", "彌陀區", "那瑪夏區(原三民鄉)", "梓官區", "內門區", "茂林區",
		"橋頭區", "六龜區", "林園區"]
	
	var hsinChu=["竹北市", "竹東鎮", "新埔鎮", "關西鎮", "新豐鄉", "峨眉鄉", "寶山鄉", "五峰鄉", "橫山鄉", "北埔鄉", 
		"尖石鄉", "芎林鄉", "湖口鄉"]
	
	var miao=["苗栗市", "頭份市", "苑裡鎮", "通霄鎮", "竹南鎮",
		"後龍鎮", "卓蘭鎮", "大湖鄉", "公館鄉", "銅鑼鄉",
		"南莊鄉", "頭屋鄉", "三義鄉", "西湖鄉", "造橋鄉",
		"三灣鄉", "獅潭鄉", "泰安鄉"]
	
	var chungHua =["彰化市", "員林市", "鹿港鎮", "和美鎮", "北斗鎮", "溪湖鎮",
		"田中鎮", "二林鎮", "線西鄉", "伸港鄉", "福興鄉", "秀水鄉",
		"花壇鄉", "芬園鄉", "大村鄉", "埔鹽鄉", "埔心鄉", "永靖鄉",
		"社頭鄉", "二水鄉", "田尾鄉", "埤頭鄉", "芳苑鄉", "大城鄉",
		"竹塘鄉", "溪州鄉"]
	
	var nanTou=["南投市", "草屯鎮", "埔里鎮", "竹山鎮", "集集鎮",
		"名間鄉", "鹿谷鄉", "中寮鄉", "魚池鄉", "國姓鄉",
		"水里鄉", "信義鄉", "仁愛鄉"]
	
	var yunLin=["斗六市", "斗南鎮", "虎尾鎮", "西螺鎮", "土庫鎮",
		"北港鎮", "古坑鄉", "大埤鄉", "莿桐鄉", "林內鄉",
		"二崙鄉", "崙背鄉", "麥寮鄉", "東勢鄉", "褒忠鄉",
		"臺西鄉", "元長鄉", "四湖鄉", "口湖鄉", "水林鄉"]
	
	var chiaYi=["太保市", "朴子市", "布袋鎮", "大林鎮", "民雄鄉",
		"溪口鄉", "新港鄉", "六腳鄉", "東石鄉", "義竹鄉",
		"鹿草鄉", "水上鄉", "中埔鄉", "竹崎鄉", "梅山鄉",
		"番路鄉", "大埔鄉", "阿里山鄉"]
	
	var pinTong=["屏東市", "潮州鎮", "東港鎮", "恆春鎮", "萬丹鄉",
		"長治鄉", "麟洛鄉", "九如鄉", "里港鄉", "鹽埔鄉",
		"高樹鄉", "萬巒鄉", "內埔鄉", "竹田鄉", "新埤鄉",
		"枋寮鄉", "新園鄉", "崁頂鄉", "林邊鄉", "南州鄉",
		"佳冬鄉", "琉球鄉", "車城鄉", "滿州鄉", "枋山鄉",
		"三地門鄉", "霧臺鄉", "瑪家鄉", "泰武鄉", "來義鄉",
		"春日鄉", "獅子鄉", "牡丹鄉"]
	
	var yiLan=["宜蘭市", "羅東鎮", "蘇澳鎮", "頭城鎮", "礁溪鄉",
		"壯圍鄉", "員山鄉", "冬山鄉", "五結鄉", "三星鄉",
		"大同鄉", "南澳鄉"]
	
	var huaLian=["花蓮市", "鳳林鎮", "玉里鎮", "新城鄉", "吉安鄉",
		"壽豐鄉", "光復鄉", "豐濱鄉", "瑞穗鄉", "富里鄉",
		"秀林鄉", "萬榮鄉", "卓溪鄉"]
	
	var taiTong=["臺東市", "成功鎮", "關山鎮", "卑南鄉",	
		"大武鄉", "太麻里鄉","東河鄉", "長濱鄉", 
		"鹿野鄉", "池上鄉", "綠島鄉", "延平鄉",	
		"海端鄉", "達仁鄉", "金峰鄉", "蘭嶼鄉"]
	
	var ponHu=["馬公市", "湖西鄉", "白沙鄉", "西嶼鄉", "望安鄉", "七美鄉"]
	
	var kingMen=["金城鎮", "金湖鎮", "金沙鎮", "金寧鄉", "烈嶼鄉", "烏坵鄉"]
	
	var lianChian=["南竿鄉","北竿鄉","莒光鄉","東引鄉"]
	
	var keeLung=["中正區", "七堵區", "暖暖區", "仁愛區", "中山區",
		"安樂區", "信義區"]
	
	var hisnChuCity=["東區","北區","香山區"]
	
	var chiaYiCity=["東區","西區"]
	
	initSelect($("#city")[0],cities);
	
	initSelect($("#township")[0],taipei);
	
	$("#city").on("change",function(){
		var cityName = $("#city").val();
		if(cityName == "臺北市"){
			setSelect($("#township")[0],taipei);
		}else if(cityName == "新北市"){
			setSelect($("#township")[0],newTaipei);
		}else if(cityName == "桃園市"){
			setSelect($("#township")[0],taoYuan);
		}else if(cityName == "臺中市"){
			setSelect($("#township")[0],taichung);
		}else if(cityName == "臺南市"){
			setSelect($("#township")[0],tainan);
		}else if(cityName == "高雄市"){
			setSelect($("#township")[0],kao);
		}else if(cityName == "新竹縣"){
			setSelect($("#township")[0],hsinChu);
		}else if(cityName == "苗栗縣"){
			setSelect($("#township")[0],miao);
		}else if(cityName == "彰化縣"){
			setSelect($("#township")[0],chungHua);
		}else if(cityName == "南投縣"){
			setSelect($("#township")[0],nanTou);
		}else if(cityName == "雲林縣"){
			setSelect($("#township")[0],yunLin);
		}else if(cityName == "嘉義縣"){
			setSelect($("#township")[0],chiaYi);
		}else if(cityName == "屏東縣"){
			setSelect($("#township")[0],pinTong);
		}else if(cityName == "宜蘭縣"){
			setSelect($("#township")[0],yiLan);
		}else if(cityName == "花蓮縣"){
			setSelect($("#township")[0],huaLian);
		}else if(cityName == "臺東縣"){
			setSelect($("#township")[0],taiTong);
		}else if(cityName == "澎湖縣"){
			setSelect($("#township")[0],ponHu);
		}else if(cityName == "金門縣"){
			setSelect($("#township")[0],kingMen);
		}else if(cityName == "連江縣"){
			setSelect($("#township")[0],lianChian);
		}else if(cityName == "基隆市"){
			setSelect($("#township")[0],keeLung);
		}else if(cityName == "新竹市"){
			setSelect($("#township")[0],hisnChuCity);
		}else if(cityName == "嘉義市"){
			setSelect($("#township")[0],chiaYiCity);
		}						
	})
	
	function initSelect(eventSelect,eventArray){		
		for(let i = 0; i < eventArray.length ; i++){
			var new_option = new Option(eventArray[i], eventArray[i]);
			eventSelect.options.add(new_option);
		}
	}
	
	function setSelect(eventSelect,eventArray){
		eventSelect.options.length = 0;			
		for(let i = 0; i < eventArray.length ; i++){
			var new_option = new Option(eventArray[i], eventArray[i]);
			eventSelect.options.add(new_option);
		}
	}
	
	$("#lastaddress").blur(function(){
		var address = $("#city").val() + $("#township").val() + $("#lastaddress").val();
		$("#billingAddress").val(address) ;
	})
<!-- ========================================= check_element ===========================================================================	 -->
	function check_element(){
		var message = "";
		
		if(creditCardNumber.value == ""){
			message += "卡號尚未填寫<br>";
		}
		
		if(!ccField){
			message += "卡號不正確<br>";
		}
		if($("#expiryDate").val().length != 5){
			
			message += "到期日尚未填寫<br>";
		}
		
		if(reviewCode.value == ""){
			message += "審核碼尚未填寫<br>";
		}
		
		if(cardholder.value == ""){
			message += "持卡者尚未填寫<br>";
		}
		
		if($("#city").val() == -1 || $("#township").val() == -1 || $("#lastaddress").val() == ""){
			message += "地址尚未填寫<br>";	
		}
		
		if(billingAddress.value == ""){
			message += "地址尚未填寫<br>";
		}
		
		if(postalCode.value == ""){
			message += "郵遞區號尚未填寫<br>";
		}
		
		if(message.length != 0){
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
<!-- ==================================================================================================================== -->
</body>
</html>