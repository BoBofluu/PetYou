<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
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
	width: 147px;
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
 	padding-bottom:30px;
 	border-radius:5px;
	border:0px; 
	background-color:#F5AAAF;
} 

img {
	border-radius: 5px;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="petHomepage.jsp"></jsp:include>
	<form:form method="post" modelAttribute="member" enctype="multipart/form-data">
		<div class="wrapper clearfix">
			<div class="sidemenu">
				<ul style="list-style: none; line-height: 20px;">
					<li id="clickaccount">
						<i class="fa fa-address-card" aria-hidden="true">帳號管理</i>
							
						<i id="angle1" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					<li id="clickpersonal">
						<i id="angle1" class="fa fa-user-circle" aria-hidden="true">個人檔案</i>
							
						<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					<li id="clickinfo">
						<i class="fa fa-info-circle" aria-hidden="true">進階資訊</i>
							
						<i id="angle3" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					<li id="clickphoto">
						<i class="fa fa-camera-retro" aria-hidden="true">關於您</i>
							
						<i id="angle4" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					<li id="onepunch" style="cursor: pointer;">
						<i class="fa fa-hand-peace-o" aria-hidden="true">一鍵輸入</i>
							
					</li>
				</ul>
			</div>

			<div class="main">
				<div id="divaccount">
					<div class="form-title">帳號管理</div>
					<div class="form-table">
						<div class="form-item fih">
							<label class="form-label">信箱<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="email" class="input-holder" 
									id="email" name="email"
									placeholder="exaample@mail.com" autocomplete="off" 
									/>
							</div>
							<div id="checkEmail">&nbsp;</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">暱稱<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="nickName" class="input-holder" 
								id="nickName" name="nickName" placeholder="輸入暱稱" 
								autocomplete="off"   
								maxlength="20"/>
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">帳號<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" class="input-holder" id="account"
									name="account" placeholder="請設置帳號" path="account"
									autocomplete="off" onkeyup="value=value.replace(/[\W]/g,'') "
									onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
									 maxlength="20" />
							</div>
								<div id="checkAccount">&nbsp;</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">密碼<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input  type="password" class="input-holder" id="password" name="password"
									placeholder="6~18 位數密碼，請區分大小寫" autocomplete="off" path="password"
									 style="clear: both"  maxlength="20" />
								<span id="check" class="fa fa-eye-slash" aria-hidden="true"></span>
								
							</div>
							<div id="checkPassword">&nbsp;</div>
								<script>
								var lock = true;
								$("#check").click(function(){
									if(lock){
										$("#check").removeClass("fa-eye-slash").addClass("fa-eye")
										$("#password").attr("type","text");
										lock = false;
									}else{
										$("#check").removeClass("fa-eye").addClass("fa-eye-slash")
										$("#password").attr("type","password");
										lock = true;
									}
								})
								
									$(function() {$("#password").on("keyup",function(event) {
										var cp = document.getElementById('checkPassword');
										if ($('#password').val().length == 0) {
											message = "<font color='green' size='-2'>請輸入密碼</font>";
										} else if ($('#password').val().length <= 6) {
											message = "<font color='green' size='-2'>密碼強度低</font>";
										} else if ($('#password').val().length <= 10) {
											message = "<font color='green' size='-2'>密碼強度中</font>";
										} else {
											message = "<font color='green' size='-2'>密碼強度高</font>";
										}
										cp.innerHTML = message;
										})
									})
								</script>
						</div>
						<div class="form-item fih">
							<div style="display:flex">
								<input type="button" class="btnAdd" value="下一頁"
									style="margin-left:720px;" id="accountNextPage"/>
							</div>
						</div>	
				</div> <!--table -->
				</div><!-- account -->
<!-- ================================================================================================================ -->
				<div id="divpersonal">
					<div class="form-title">個人檔案</div>
					<div class="form-table">
						<div class="form-item fih">
							<label class="form-label">名字<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" class="input-holder" id="firstName" name="firstName" 
									placeholder="輸入名字" autocomplete="off"   
									path="firstName" />
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">姓氏<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" class="input-holder" id="lastName" name="lastName" 
									placeholder="輸入姓氏" autocomplete="off"   
									path="lastName"  /> 
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">性別<span style="color:red">*</span></label>
							<div class="form-controler">
								<label >
									<form:radiobutton name="gender" value="男" style="margin: 10px"  id="r1"  path="gender"  />男<br> 
								</label> 
									
								<label style="margin-left:50px;"> 
									<form:radiobutton name="gender" value="女" style="margin: 10px" id="r2" path="gender"/>女<br> 
			 					</label> 
			 						
			 					<label style="margin-left:50px;"> 
			 						<form:radiobutton name="gender" value="無" style="margin: 10px"  id="r3" path="gender" />無<br> 
								</label> 
								
								<label style="display:none"> 
			 						<form:radiobutton name="gender" value="哈哈" style="margin: 10px;"  id="r4" path="gender" checked="checked" />哈哈<br> 
								</label> 
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">生日<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="birthday" class="input-holder datepicker" id="birthday" name="birthday"
									placeholder="輸入生日" autocomplete="off"  />	
							</div>
						</div>
						<div class="form-item fih">
							<div style="display:flex">
								<input type="button" class="btnAdd" value="上一頁"
									style="float:left" id="personalPreviousPage"/>
															
								
								<input type="button" class="btnAdd" value="下一頁"
									style="margin-left:638px;" id="personalNextPage"/>
							</div>
						</div>	
					</div><!-- table -->
				</div><!-- divpersonal -->
				
<!-- ================================================================================================================ -->
				<div id="divinfo">
					<div class="form-title">進階資訊</div>
					<div class="form-table">
						<div class="form-item fih">
							<label class="form-label">身分證<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" class="input-holder" id="identityCard" 
									name="identityCard" path="identityCard" placeholder="輸入身分證" 
									autocomplete="off"   maxlength="10" />
								<div id="checkIdentityCard">&nbsp;</div>
							</div>
						</div>
						<hr>
<!-- =================================================================================================================== -->						
						<div class="form-item fih" style="height:120px">
							<label class="form-label">地址<span style="color:red">*</span></label>
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
									<form:input type="text"  path="address" class="input-holder" id="address" name="address"/>
								</div>
							</div>
						</div>
						
<!-- =================================================================================================================== -->	
						<hr>
						<div class="form-item fih">
							<label class="form-label">電話<span style="color:red">*</span></label>
							<div class="form-controler">
								<form:input type="text" path="phone" class="input-holder" id="phone" 
								name="phone" placeholder="輸入手機"
									autocomplete="off" maxlength="10"
									/>
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
<!-- ================================================================================================================ -->
				<div id="divphoto">
					<div class="form-title">大頭貼</div>
					<div class="form-table">
					
						<div class="form-item" style="width:400px;margin:15px auto;">
	
							<div style="position:relative;" >
								<form:input type="file" style="position:absolute;opacity:0;width:365px;height:365px;cursor: pointer;" id="memberImage" path="memberImage" accept=".jpg,.png,.jpeg"/> 
								<img src="${pageContext.request.contextPath}/images/upload.jpg" id="ppimg"  style="width:365px;object-fit: contain;height:365px;"> 
							</div>
						</div>

					</div>
					<div class="form-title">關於您</div>
					<div class="form-table">	
						
						<div class="form-item">
							<div class="form-controler">
								<form:textarea name="aboutMe" rows="10" cols="50" 
				  						id="usertextarea" onkeyup="wordsTotal()"
				  						style="resize : none;width:600px;height:200px"
				  						path="aboutMe"/><br>
				  					字數統計：<span id="display">0</span>
							</div>
						</div>
					<div class="form-item fih">
							<div style="display:flex">
								<input type="button" class="btnAdd" value="上一頁"
									style="float:left" id="photoPreviousPage"/>
								
								<input type="submit" class="btnAdd" value="送出"
									style="margin-left:638px;"
									onclick="return check_element()"/>
							</div>
						</div>	

					</div>
				</div> <!-- divphoto -->
			</div><!-- main -->
		</div><!-- wrapper -->
	</form:form>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
	<script>	
	var emailField = false;
	var accountField = false;
	var idcField = false;
	
	
// =================================================  ajax 檢查email ===========================================================	
		document.getElementById("email").onblur = function() {
			var ce = document.getElementById('checkEmail');
			var emailValue = document.getElementById("email").value;
			
			if (!emailValue) {
				ce.innerHTML = "<font color='white' size='-2'>&nbsp;</font>";
				emailField = false;
				return;
			}
	//			https://ithelp.ithome.com.tw/articles/10094951
			emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
			if (emailValue.search(emailRule) != -1){
			}else{
				ce.innerHTML = "<font color='red' size='-2'>email格式不正確</font>";
				emailField = false;
				return;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/CheckEmail' />", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("email=" + emailValue);
			var message = "";
			xhr.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					if (result.id.length == 0) {
						
						message = "<font color='green' size='-2'>email可用</font>";
						emailField = true;
					} else if (result.id.startsWith("Error")) {
						message = "<font color='red' size='-2'>發生錯誤: 代號"
								+ result.id + "</font>";
						emailField = false;
					} else {
						message = "<font color='red' size='-2'>email重複，請重新輸入帳號</font>";
						emailField = false;
					}
					
					ce.innerHTML = message;
				}
			}
		}
//=================================================  ajax 檢查帳號 ===========================================================	
	document.getElementById("account").onblur = function() {
			var ca = document.getElementById('checkAccount');
			var accountValue = document.getElementById("account").value;

			if (!accountValue) {
				ca.innerHTML =   "<font color='white' size='-2'>&nbsp;</font>";
				accountField = false;
				return;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/CheckAccount' />", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("account=" + accountValue);
			var message = "";
			xhr.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					if (result.id.length == 0) {
						message = "<font color='green' size='-2'>帳號可用</font>";
						accountField = true;
					} else if (result.id.startsWith("Error")) {
						message = "<font color='red' size='-2'>發生錯誤: 代號"
								+ result.id + "</font>";
						accountField = false;
					} else {
						message = "<font color='red' size='-2'>帳號重複，請重新輸入帳號</font>";
						accountField = false;
					}
					ca.innerHTML = message;
				}
			}
		}
// ================================================  ajax 檢查身分證 ===========================================================	
	document.getElementById("identityCard").onblur = function() {
		var cic= document.getElementById('checkIdentityCard');
		var idcValue = $("#identityCard").val();
		if (!idcValue) {
			cic.innerHTML =   "<font color='white' size='-2'>&nbsp;</font>";
			idcField = false;
			return;
		}
		var message = "";
		tab = "ABCDEFGHJKMNPQTUVXWZIO"
		A1 = new Array (1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,3,3,3,3,3 );
		A2 = new Array (0,1,2,3,4,5,6,7,8,9,1,2,3,4,7,8,9,0,2,3,4,5 );
		Mx = new Array (9,8,7,6,5,4,3,2,1,1);
		var correct = true;
		if ( idcValue.length != 10 ) 
			correct = false;
		i = tab.indexOf( idcValue.charAt(0) );
		if ( i == -1 ) 
			correct = false;
		sum = A1[i] + A2[i]*9;
		for ( i=1; i<10; i++ ) {
			v = parseInt( idcValue.charAt(i) );
				if ( isNaN(v) ) 
					correct = false;
				sum = sum + v * Mx[i];
		}
		if ( sum % 10 != 0 ) 
			correct = false;
		if(!correct){
			cic.innerHTML = "<font color='red' size='-2'>身分證格式錯誤</font>";
			idcField = false;
			return;
		}else{
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/CheckIdentityCard' />", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("identityCard=" + idcValue);
			xhr.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					if (result.id.length == 0) {
						message = "<font color='green' size='-2'>身分證格式正確</font>";
						idcField = true;
					} else if (result.id.startsWith("Error")) {
						message = "<font color='red' size='-2'>發生錯誤: 代號"
								+ result.id + "</font>";
						idcField = false;
					} else {
						message = "<font color='red' size='-2'>帳號重複，請重新輸入帳號</font>";
						idcField = false;
					}
					cic.innerHTML = message;
				}
			}
		}
	}
	
	
	var $j = jQuery.noConflict();
	$j(".datepicker").datepicker({
		dateFormat : "yy-mm-dd"
	});
	window.history.forward(1);
	
// =================================================  輸入地區 ===========================================================		
	
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

	$("#lastaddress").on("blur",function(){
		var address = $("#city").val() + $("#township").val() + $("#lastaddress").val();
		$("#address").val(address);
	})
	
	
	
// =================================================  一鍵輸入 ===========================================================	
	$("#onepunch").click(function() {
		var emailPunch = "zerozakiark@gmail.com";
		var accountPunch = "zerozakiark";
		var idcPunch = "H124492633";
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/CheckMemberRegisterPunch' />", true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("email=" + emailPunch + "&account=" + accountPunch + "&identityCard=" +idcPunch);
		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && xhr.status == 200) {
				$("#email").val("zerozakiark@gmail.com");
				$("#nickName").val("艾德");
				$("#account").val("zerozakiark");
				$("#password").val("FirenzeK");
				$("#firstName").val("欣哲");
				$("#lastName").val("李");
				$("#birthday").val("2020-12-25");
				$("#identityCard").val("H124492633");
				$("#city option[value='臺北市']").attr('selected', 'selected');
				$("#township option[value='大安區']").attr('selected', 'selected');
				$("#lastaddress").val("復興南路一段390號2樓"); 
				$("#address").val("台北市大安區復興南路一段390號2樓"); 
				$("#phone").val("0978285891");
				$("#r1").attr("checked",true);
				$("#usertextarea").val("一鍵輸入");
				document.getElementById('display').innerHTML = $("#usertextarea").val().length;
				$("#clickaccount").css("color", "black");
				$("#clickpersonal").css("color", "black");
				$("#clickinfo").css("color", "black");
				$("#clickphoto").css("color", "#8D5433");
				$("#angle1").hide();
				$("#angle2").hide();
				$("#angle3").hide();
				$("#angle4").show();
				$("#divinfo").hide();
				$("#divpersonal").hide();
				$("#divaccount").hide();
				$("#divphoto").show();
				emailField = true;
				accountField = true;
				idcField = true;
				$("#checkEmail").val("");
				$("#checkAccount").val("");
				$("#checkIdentityCard").val("");
			}
		}
	});
	
// =================================================  換頁 ===========================================================	
		$("#divpersonal").hide();
		$("#divinfo").hide();
		$("#divphoto").hide();
		$("#clickaccount").css("color", "#8D5433");
		$("#angle2").hide();
		$("#angle3").hide();
		$("#angle4").hide();
		
		$("#clickaccount").click(function(){
			showAccount();
		})
		$("#clickpersonal").click(function(){
			showPersonal();
		})
		$("#clickinfo").click(function(){
			showInfo();
		})
		$("#clickphoto").click(function(){
			showPhoto();
		})
		
		$("#accountNextPage").click(function(){
			showPersonal();
		})
		$("#personalPreviousPage").click(function(){
			showAccount();
		})
		$("#personalNextPage").click(function(){
			showInfo();
		})
		$("#infoPreviousPage").click(function(){
			showPersonal();
		})
		$("#infoNextPage").click(function(){
			showPhoto();
		})
		$("#photoPreviousPage").click(function(){
			showInfo();
		})

		function showAccount() {
			$("#clickaccount").css("color", "#8D5433");
			$("#clickpersonal").css("color", "black");
			$("#clickinfo").css("color", "black");
			$("#clickphoto").css("color", "black");
			$("#angle1").show();
			$("#angle2").hide();
			$("#angle3").hide();
			$("#angle4").hide();
			$("#divaccount").show();
			$("#divpersonal").hide();
			$("#divinfo").hide();
			$("#divphoto").hide();
		}

		function showPersonal() {
			$("#clickaccount").css("color", "black");
			$("#clickpersonal").css("color", "#8D5433");
			$("#clickinfo").css("color", "black");
			$("#clickphoto").css("color", "black");
			$("#angle1").hide();
			$("#angle2").show();
			$("#angle3").hide();
			$("#angle4").hide();
			$("#divpersonal").show();
			$("#divinfo").hide();
			$("#divaccount").hide();
			$("#divphoto").hide();
		}

		function showInfo() {
			$("#clickaccount").css("color", "black");
			$("#clickpersonal").css("color", "black");
			$("#clickinfo").css("color", "#8D5433");
			$("#clickphoto").css("color", "black");
			$("#angle1").hide();
			$("#angle2").hide();
			$("#angle3").show();
			$("#angle4").hide();
			$("#divinfo").show();
			$("#divphoto").hide();
			$("#divpersonal").hide();
			$("#divaccount").hide();
		}

		function showPhoto() {
			$("#clickaccount").css("color", "black");
			$("#clickpersonal").css("color", "black");
			$("#clickinfo").css("color", "black");
			$("#clickphoto").css("color", "#8D5433");
			$("#angle1").hide();
			$("#angle2").hide();
			$("#angle3").hide();
			$("#angle4").show();
			$("#divphoto").show();
			$("#divinfo").hide();
			$("#divpersonal").hide();
			$("#divaccount").hide();
		}
// =================================================  預覽圖片 ===========================================================		
		var checkPhoto = false;
		var x = new FileReader;
		document.getElementById('memberImage').onchange = function() {
			if(document.getElementById('memberImage').value==""){
				checkPhoto = false;
			}else{
				checkPhoto = true;
				x.readAsDataURL(this.files[0]);
			}
		}

		x.onloadend = function() {
			document.getElementById('ppimg').src = this.result;
		}
		
		 function wordsTotal() {
		 	var total = document.getElementById('usertextarea').value.length;
			document.getElementById('display').innerHTML = total;
		}
		 
		 
		$("#lastaddress").blur(function(){
			var address = $("#city").val() + $("#township").val() + $("#lastaddress").val();
			$("#address").val(address) ;
		})
		 
// =================================================  check_element() ===========================================================	
		function check_element(){
			const mySet = new Set();
			var message = "";
			if(!emailField){
				mySet.add(1);
				message += "身分證不正確<br>";
			}
			
			if(nickName.value == ""){
				mySet.add(1);
				message += "暱稱尚未填寫<br>";
			}
			
			if(!accountField){
				mySet.add(1);
				message += "帳號不正確<br>";
			}
			
			if(password.value == ""){
				mySet.add(1);
				message += "密碼尚未填寫<br>";
			}
			
			if(firstName.value == ""){
				mySet.add(2);
				message += "名子尚未填寫<br>";
			}
			
			if(lastName.value == ""){
				mySet.add(2);
				message += "姓氏尚未填寫<br>";
			}
			
			if(document.getElementById('r4').checked){
				mySet.add(2);
				message += "性別尚未選擇<br>";
			}
			
			if(birthday.value == ""){
				mySet.add(2);
				message += "生日尚未填寫<br>";
			}
			
			if(!idcField){
				mySet.add(3);
				message += "身分證不正確<br>";
			}
			
			if($("#city").val() == -1 || $("#township").val() == -1 || $("#lastaddress").val() == ""){
				mySet.add(3);
				message += "地址尚未填寫<br>";	
			}
			
			if(address.value == ""){
				mySet.add(3);
				message += "地址尚未填寫<br>";
			}
			
			if(phone.value == ""){
				mySet.add(3);
				message += "電話尚未填寫<br>";
			}
			
			if(!checkPhoto){
				mySet.add(4);
				message += "大頭貼尚未選擇<br>";
			}

			if(message.length != 0){
				if(mySet.has(1)){
					showAccount();
				}else if(mySet.has(2)){
					showPersonal();
				}else if(mySet.has(3)){
					showInfo();
				}else if(mySet.has(4)){
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