<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
#sitebody {
	margin: 0 auto;
	background-color: white;
}

#header {
	background-color: #F0F0F0;
	height: 150px;
	text-align: left;
	padding-left: 150px;
	padding-top: 2%;
}

#sidebar_right {
	background-color: white;
	width: 800px;
	height: 530px;
	float: right;
	padding: 20px;
	padding-right: 5%
}

.content {
	overflow: hidden;
	height: 373px;
	line-height: 373px;
	margin-left: 6%;
	margin-top: 9%;
	text-align: center;
}

#content img {
	border-radius: 10px;
}

#footer {
	clear: both;
	background-color: white;
	height: 500px;
	padding: 100px 100px 0px 100px
}

.hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 5px solid #FC9691;
	margin: 1em 0;
	padding: 0;
}

.cuteDog {
	padding: 0px;
	margin: 5px;
	height: 50px;
	margin-left: 30%
}

.information {
	height: 450px;
	text-align: left;
	font-weight: 500;
}

.information tr td:nth-child(1) {
	width: 150px;
	border: 2px solid lightgray;
	padding-left: 20px;
	color: #FFFF;
	background-color: #AF2E41;
	font-weight: 600;
	opacity: 0.8;
}

.information tr td:nth-child(2) {
	width: 550px;
	border: 2px solid lightgray;
	padding-left: 20px;
	color: #3a3b3c;
}

.contactPerson {
	height: 200px;
	text-align: left;
	font-weight: 500;
}

.contactPerson tr td:nth-child(2) {
	width: 1500px;
	border: 2px solid lightgray;
	color: #3a3b3c;
	padding: 15px 0px 15px 20px
}

.contactPerson tr td:nth-child(1) {
	width: 280px;
	border: 2px solid lightgray;
	color: #FFFF;
	background-color: #AF2E41;
	padding: 15px 0px 15px 20px;
	opacity: 0.8;
	font-weight: 600;
}

.ud {
	display: inline-block;
	height: 70px;
	width: 120px;
	float: right;
	padding: 15px;
	margin-right: 3%;
	font-size: 18pt;
	background-color: #9B93AE;
	color: white;
	border: 0px;
	border-radius: 10px;
	font-weight: bold;
	outline: none;
}

.ud:hover {
	background-color: #FFFEFF;
	color: black;
	outline: none;
}

.notLogIn tr td:nth-child(2) {
	filter: blur(3.5px);
	user-select: none;
}

.father {
	position: relative;
}

.needLogIn {
	position: absolute;
	margin-left: 35%;
	padding-top: 6%;
	z-index: 9999;
	opacity: 0.9
}

.pleaseLogIn {
	background-color: #ea7066;
	padding: 20px;
	border-radius: 10px;
	color: white;
	font-weight: 550;
}
</style>
<link href="/path/to/bootstrap.min.css" rel="stylesheet">
<link href="/path/to/buttons.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="../HomePage.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<div id="sitebody">

		<div id="header">
			<span style="font-size: 20pt" id="foundDate"></span> <input
				type="hidden" id="id">
			<div id="owner"></div>
			<h3>
				<span id="petName" style="font-size: 26pt"></span> <span
					style="font-size: 26pt" id="petSex"></span> 找個幸福溫暖的家<img
					src="https://img.icons8.com/color/48/000000/dog-collar.png" />
			</h3>
		</div>

		<div id="sidebar_right">
			<hr class="hr">
			<h4>
				<img src="https://img.icons8.com/bubbles/75/000000/home.png" />浪浪認養中
			</h4>
			<table class="information">
				<tr>
					<td>名稱
					<td><span id="petName2"></span>
				<tr>
					<td>年齡
					<td><span id="ageYear"></span>歲<span id="ageMonth"></span>個月
				<tr>
					<td>性別
					<td><span id="petSex2"></span>
				<tr>
					<td>品種
					<td><span id="breed"></span>
				<tr>
					<td>毛色
					<td><span id="furColor"></span>
				<tr>
					<td>體型
					<td><span id="size"></span>
				<tr>
					<td>領養地點
					<td><span id="adoptionLocation"></span>
				<tr>
					<td>拾獲地點
					<td><span id="source"></span>
			</table>
		</div>
		<div id="carouselExampleIndicators" class="carousel slide content"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active" style="height: 10px"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"
					style="height: 10px"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"
					style="height: 10px"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="${pageContext.request.contextPath}/img/0710-領養代替購買.jpg"
						alt="First slide">
				</div>

				<c:forEach var="ab" items="${Albumnlist}">
					<c:set scope="session" var="string1" value="${ab.picContent}" />
					<c:set scope="session" var="string2"
						value="${fn:split(string1, '_')}" />
					<c:set scope="session" var="string3" value="${string2[2]}" />
					<c:set scope="session" var="string4"
						value="${fn:split(string3, '.')}" />
					<c:set scope="session" var="b" value="${string4[0]}" />
					<c:set scope="session" var="c" value="${adoptionInfoID}" />
					<c:choose>
						<c:when test="${b==c}">
							<div class="carousel-item">
								<img id="petImage" width="550px" alt="pet"
									src="/file/${ab.picContent}">
							</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:forEach>

			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <img
				src="https://img.icons8.com/plasticine/48/000000/rewind.png" /> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <img
				src="https://img.icons8.com/plasticine/48 /000000/fast-forward.png" />
				<span class="sr-only">Next</span>
			</a>
		</div>

		<div id="footer" style="height: 300px">
			<hr class="hr">
			<h5 style="margin-bottom: 30px">
				<img src="https://img.icons8.com/dotty/50/000000/animal-shelter.png" />浪浪個性、健康狀況
			</h5>
			<div style="padding-left: 100px" id="petCondition"></div>
		</div>

		<div id="footer" style="margin-top: 0px; padding-top: 10px">
			<hr class="hr">
			<h5 style="margin-bottom: 30px">
				<img src="https://img.icons8.com/dusk/40/000000/phone.png" />刊登人聯絡方式
			</h5>
			<c:choose>
				<c:when test="${login}">
					<table class="contactPerson">
						<tr>
							<td>聯絡人姓名
							<td><span id="lastName"></span><span id="firstName"></span>
						<tr>
							<td>聯絡人信箱
							<td><span id="email"></span>
						<tr>
							<td>聯絡人電話
							<td><span id="cellPhone"></span>
						<tr>
							<td>聯絡人地址
							<td><span id="address"></span>
					</table>
				</c:when>
				<c:otherwise>
					<div class="needLogIn">
						<div class="pleaseLogIn">
							請先登入會員查看聯絡資訊
							<button type="button" onclick="toLogIn()"
								class="btn btn-success btn-sm">前往登入</button>
						</div>
					</div>
					<div class="father">
						<table class="contactPerson notLogIn">
							<tr>
								<td>聯絡人姓名
								<td>寵你 只寵愛你
							<tr>
								<td>聯絡人信箱
								<td>PetYou@gmail.com
							<tr>
								<td>聯絡人電話
								<td>0912-345-678
							<tr>
								<td>聯絡人地址
								<td>最喜歡我可愛的鄰座♡
						</table>
					</div>

				</c:otherwise>
			</c:choose>

		</div>
		<input id="hiddenVal" type="hidden" value=""> <input
			type="hidden" id="hidInput">
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	
		// 取得浪浪編號
		var adoptionInfoID = ${adoptionInfoID};
		
// 		取得html的ID
		var id = document.getElementById("id");
		var petName = document.getElementById("petName");
		var petName2 = document.getElementById("petName2");
		var ageYear = document.getElementById("ageYear");
		var ageMonth = document.getElementById("ageMonth");
		var petCondition = document.getElementById("petCondition");
		var petSex = document.getElementById("petSex");
		var petSex2 = document.getElementById("petSex2");
		var foundDate = document.getElementById("foundDate");
		var source = document.getElementById("source");
		var adoptionLocation = document.getElementById("adoptionLocation");
		var size = document.getElementById("size");
		var breed = document.getElementById("breed");
		var furColor = document.getElementById("furColor");
		var lastName = document.getElementById("lastName");
		var firstName = document.getElementById("firstName");
		var email = document.getElementById("email");
		var cellPhone = document.getElementById("cellPhone");
		var address = document.getElementById("address");
		var adoptionBean;

// 		取得浪浪的Json
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/getPetJson/" + adoptionInfoID + "' />",
				true);
		xhr.send();
		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && xhr.status == 200) {
				adoptionBean = JSON.parse(xhr.responseText);
				id.value = adoptionBean.adoptionInfoID;
				petName.innerHTML = adoptionBean.petName;
				petName2.innerHTML = adoptionBean.petName;
				ageYear.innerHTML = adoptionBean.ageYear;
				ageMonth.innerHTML = adoptionBean.ageMonth;
				petCondition.innerHTML = adoptionBean.petCondition;
				if (adoptionBean.petSex == '母') {
					petSex.innerHTML = '妹妹';
				} else if (adoptionBean.petSex == '公') {
					petSex.innerHTML = '弟弟';
				} else {
					petSex.innerHTML = '';
				}
				petSex2.innerHTML = adoptionBean.petSex;
				foundDate.innerHTML = adoptionBean.foundDate;
				source.innerHTML = adoptionBean.source;
				adoptionLocation.innerHTML = adoptionBean.adoptCity;
				adoptionLocation.innerHTML += adoptionBean.adoptDistrict;
				if (adoptionBean.adoptionLocation == null || adoptionBean.adoptionLocation == "NULL") {
					adoptionLocation.innerHTML += " ";
				}else{
					adoptionLocation.innerHTML += adoptionBean.adoptionLocation;
				} 
				size.innerHTML = adoptionBean.size;
				breed.innerHTML = adoptionBean.breed;
				furColor.innerHTML = adoptionBean.furColor;
				
// 				必須是po文者才可新刪修文章
				if(${login==true}){
					var test1= adoptionBean.member.memberID;
					$("#hidInput").val(${userId});
 					var test2 = $("#hidInput").val();
					if (test1==test2) {
						var owner = document.getElementById("owner");
						owner.innerHTML='<input type="button" value="修改貼文" class="ud" id="update" onclick="updatePost()"><input type="button" value="修改圖片" class="ud" id="update" onclick="revisePic()"><input type="button" style="font-size:15.5pt;padding-left:10px;" value="變更聯絡人" class="ud" id="update" onclick="changeContact()"><input type="button" onclick="deletePost()" value="刪除貼文" class="ud" id="delete">';
					}
				}
			}
		}
		
// 		取得聯絡人的JSON
		var contactPersonID;
		var contact;
		var xhr2 = new XMLHttpRequest();
		xhr2.open("GET", "<c:url value='/getContactJson/" + adoptionInfoID + "' />",
				true);
		xhr2.send();
		xhr2.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr2.readyState == 4 && xhr2.status == 200) {
				contact = JSON.parse(xhr2.responseText);
				//這邊使用Json取得資料 ===>待完成
				lastName.innerHTML = contact.lastName;
				firstName.innerHTML = contact.firstName;
				email.innerHTML = contact.email;
				cellPhone.innerHTML = contact.cellPhone;
				address.innerHTML = contact.address;
				contactPersonID = contact.contactPersonID;
			}
		}
		
		//修改聯絡人的資料
		function changeContact() {
			$("#hiddenVal").val(${userId});
				var userId = $("#hiddenVal").val();
				location.href='<c:url value="/changeContact/'+userId+'/'+contactPersonID+'/'+adoptionInfoID+'" />'
		}

// 		修改浪浪的資料
		function updatePost() {
			petName2.innerHTML = '<input id="petNameU" type="text" value="'+ adoptionBean.petName+'"></input>';
			ageYear.innerHTML = '<select  id="ageYearChoose" style="width: 30%" required><option value="'+adoptionBean.ageYear+'" selected="selected">'
					+ adoptionBean.ageYear + '</option></select>';
			ageMonth.innerHTML = '<select  id="ageMonthChoose" style="width: 30%; margin-left: 30px" required> <option value="'+adoptionBean.ageMonth+'" selected="selected">'
					+ adoptionBean.ageMonth + '</option></select>';
			if (adoptionBean.petSex == '公') {
				petSex2.innerHTML = '<input type="radio" checked name="petSex" value="公" id="male"><label for="male"> 公 </label>  <input type="radio" name="petSex" value="母" id="female"> <label for="female">母 </label> <input type="radio" name="petSex" value="性別未知" id="none"> <label for="none">性別未知</label>';
			} else if (adoptionBean.petSex == '母') {
				petSex2.innerHTML = '<input type="radio" name="petSex" value="公" id="male"> <label for="male"> 公 </label>  <input type="radio" checked  name="petSex" value="母" id="female"> <label for="female">母 </label> <input type="radio" name="petSex" value="性別未知" id="none"> <label for="none">性別未知</label>';
			} else {
				petSex2.innerHTML = '<input type="radio" name="petSex" value="公" id="male"><label for="male"> 公 </label>  <input type="radio" name="petSex" value="母" id="female"> <label for="female">母 </label> <input type="radio" name="petSex" value="性別未知" id="none" checked> <label for="none">性別未知</label>';
			}
			if (adoptionBean.size == '大型') {
				size.innerHTML = '<input   type="radio" checked name="size" value="大型" id="large"><label for="large">大型</label> <input   type="radio" name="size" value="中型" id="middle"><label for="middle">中型</label> <input   type="radio" name="size" value="小型" id="samll"><label for="samll">小型</label>';
			} else if (adoptionBean.size == '中型') {
				size.innerHTML = '<input   type="radio" name="size" value="大型" id="large"><label for="large">大型</label> <input   type="radio" checked  name="size" value="中型" id="middle"> <label for="middle">中型</label> <input   type="radio" name="size" value="小型" id="samll"> <label for="samll">小型</label>';
			} else {
				size.innerHTML = '<input   type="radio" name="size" value="大型" id="large"><label for="large">大型</label> <input   type="radio" name="size" value="中型" id="middle"> <label for="middle">中型</label> <input   type="radio" checked  name="size" value="小型" id="samll"> <label for="samll">小型</label>';
			}
			breed.innerHTML = '<input   id="breedU" type="text" value="'+ adoptionBean.breed+'"></input>';
			furColor.innerHTML = '<select  name="furColor" id="fur"><option selected="selected">'
					+ adoptionBean.furColor + '</option></select>';
			adoptionLocation.innerHTML = '<select id="adoptCity" class="pretty-select adoptCity" required> <option value="'+adoptionBean.adoptCity+'" selected="selected" >'+adoptionBean.adoptCity+'</option> </select> <select id="adoptDistrict" class="pretty-select adoptDistrict" required> <option value="'+adoptionBean.adoptDistrict+'" selected="selected" >'+adoptionBean.adoptDistrict+'</option> </select> <input value="'+ adoptionBean.adoptionLocation+'" type="text" class="space" id="adoptionLocationN" placeholder="街道巷弄(選填)" />';
			petCondition.innerHTML = '<textarea id="petConditionU"  rows="3" cols="120" >'
					+ adoptionBean.petCondition + '</textarea>';
			source.innerHTML = '<input  id="sourceU" style="width:510px;"  type="text" value="'+ adoptionBean.source+'"></input>';
			$('#update').val('確認送出');

// 			以json的格式送出修改後的浪浪資料
			var submitUpdate = document.getElementById("update");
			submitUpdate.onclick = function() {
				var petNameU = document.getElementById("petNameU").value;
				var ageYearChoose = document.getElementById("ageYearChoose").value;
				var ageMonthChoose = document.getElementById("ageMonthChoose").value;
				var petSexU = document
						.querySelector('input[name="petSex"]:checked').value;
				var size = document.querySelector('input[name="size"]:checked').value;
				var breedU = document.getElementById("breedU").value;
				var furU = document.getElementById("fur").value;
				var adoptCity = document.getElementById("adoptCity").value;
				var adoptDistrict = document.getElementById("adoptDistrict").value;
				var adoptionLocation = document.getElementById("adoptionLocationN").value;
				var petConditionU = document.getElementById("petConditionU").value;
				var sourceU = document.getElementById("sourceU").value;

				//執行送出json
				var xhr1 = new XMLHttpRequest();
				xhr1.open("PUT", "<c:url value='/updateSinglePet/' />"
						+ adoptionInfoID, true);
				var jsonPet = {
					"adoptCity" : adoptCity,
					"adoptDistrict" : adoptDistrict,
					"adoptionLocation" : adoptionLocation,
					"petName" : petNameU,
					"ageYear" : ageYearChoose,
					"ageMonth" : ageMonthChoose,
					"petSex" : petSexU,
					"size" : size,
					"breed" : breedU,
					"furColor" : furU,
					"petCondition" : petConditionU,
					"source" : sourceU,
					"statusAdoption" : 0
				}
				xhr1.setRequestHeader("Content-Type",
						"application/json;charset=UTF-8");
				xhr1.send(JSON.stringify(jsonPet));

				xhr1.onreadystatechange = function() {
					// 伺服器請求完成
					if (xhr1.readyState == 4
							&& (xhr1.status == 200 || xhr1.status == 201)) {
						result = JSON.parse(xhr1.responseText);
						if (result.fail) {
							alert("修改失敗");
						} else {
								Swal.fire({title: "謝謝您的愛心！", text: "我們會盡快審核您的文章💌",icon: "success",allowOutsideClick: false}).then(function () {
									window.location.href = 'http://localhost:8080/PetYou/showSinglePet/'
										+ adoptionInfoID;
							    })
						}
					}
				}
			}
			
// 			修改領養地點(選項)
			var cities = ["臺北市","新北市","桃園市","臺中市","臺南市","高雄市","新竹縣",
				"苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣",
				"臺東縣","澎湖縣","金門縣","連江縣","基隆市","新竹市","嘉義市"];
			
			var chiaYiCity=["東區","西區"]
			var hisnChuCity=["東區","北區","香山區"]
			var keeLung=["中正區", "七堵區", "暖暖區", "仁愛區", "中山區",
				"安樂區", "信義區"]
			var lianChian=["南竿鄉","北竿鄉","莒光鄉","東引鄉"]
			var kingMen=["金城鎮", "金湖鎮", "金沙鎮", "金寧鄉", "烈嶼鄉", "烏坵鄉"]
			var ponHu=["馬公市", "湖西鄉", "白沙鄉", "西嶼鄉", "望安鄉", "七美鄉"]
			var taiTong=["臺東市", "成功鎮", "關山鎮", "卑南鄉",	
				"大武鄉", "太麻里鄉","東河鄉", "長濱鄉", 
				"鹿野鄉", "池上鄉", "綠島鄉", "延平鄉",	
				"海端鄉", "達仁鄉", "金峰鄉", "蘭嶼鄉"]
			var huaLian=["花蓮市", "鳳林鎮", "玉里鎮", "新城鄉", "吉安鄉",
				"壽豐鄉", "光復鄉", "豐濱鄉", "瑞穗鄉", "富里鄉",
				"秀林鄉", "萬榮鄉", "卓溪鄉"]
			var yiLan=["宜蘭市", "羅東鎮", "蘇澳鎮", "頭城鎮", "礁溪鄉",
				"壯圍鄉", "員山鄉", "冬山鄉", "五結鄉", "三星鄉",
				"大同鄉", "南澳鄉"]
			var pinTong=["屏東市", "潮州鎮", "東港鎮", "恆春鎮", "萬丹鄉",
				"長治鄉", "麟洛鄉", "九如鄉", "里港鄉", "鹽埔鄉",
				"高樹鄉", "萬巒鄉", "內埔鄉", "竹田鄉", "新埤鄉",
				"枋寮鄉", "新園鄉", "崁頂鄉", "林邊鄉", "南州鄉",
				"佳冬鄉", "琉球鄉", "車城鄉", "滿州鄉", "枋山鄉",
				"三地門鄉", "霧臺鄉", "瑪家鄉", "泰武鄉", "來義鄉",
				"春日鄉", "獅子鄉", "牡丹鄉"]
			var chiaYi=["太保市", "朴子市", "布袋鎮", "大林鎮", "民雄鄉",
				"溪口鄉", "新港鄉", "六腳鄉", "東石鄉", "義竹鄉",
				"鹿草鄉", "水上鄉", "中埔鄉", "竹崎鄉", "梅山鄉",
				"番路鄉", "大埔鄉", "阿里山鄉"]
			var yunLin=["斗六市", "斗南鎮", "虎尾鎮", "西螺鎮", "土庫鎮",
				"北港鎮", "古坑鄉", "大埤鄉", "莿桐鄉", "林內鄉",
				"二崙鄉", "崙背鄉", "麥寮鄉", "東勢鄉", "褒忠鄉",
				"臺西鄉", "元長鄉", "四湖鄉", "口湖鄉", "水林鄉"]
			var nanTou=["南投市", "草屯鎮", "埔里鎮", "竹山鎮", "集集鎮",
				"名間鄉", "鹿谷鄉", "中寮鄉", "魚池鄉", "國姓鄉",
				"水里鄉", "信義鄉", "仁愛鄉"]
			var chungHua =["彰化市", "員林市", "鹿港鎮", "和美鎮", "北斗鎮", "溪湖鎮",
				"田中鎮", "二林鎮", "線西鄉", "伸港鄉", "福興鄉", "秀水鄉",
				"花壇鄉", "芬園鄉", "大村鄉", "埔鹽鄉", "埔心鄉", "永靖鄉",
				"社頭鄉", "二水鄉", "田尾鄉", "埤頭鄉", "芳苑鄉", "大城鄉",
				"竹塘鄉", "溪州鄉"]
			var miao=["苗栗市", "頭份市", "苑裡鎮", "通霄鎮", "竹南鎮",
				"後龍鎮", "卓蘭鎮", "大湖鄉", "公館鄉", "銅鑼鄉",
				"南莊鄉", "頭屋鄉", "三義鄉", "西湖鄉", "造橋鄉",
				"三灣鄉", "獅潭鄉", "泰安鄉"]
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
			
			for (var i = 0; i < cities.length; i++) {
				$("#adoptCity").append('<option value="'+cities[i]+'">' + cities[i]
				+ '</option>')
			}  
			
			$(document).ready(function () {
			    $("#adoptCity").change(function () {
			        var val = $(this).val();
			        if (val == "臺北市") {
			        	$("#adoptDistrict").html(" ")
			        	for (var i = 0; i < taipei.length; i++) {
			        		$("#adoptDistrict").append('<option value="'+taipei[i]+'">' + taipei[i]
			    			+ '</option>')
						}
			        } else if (val == "新北市") {
			        	$("#adoptDistrict").html(" ")
			        	for (var i = 0; i < newTaipei.length; i++) {
			        		$("#adoptDistrict").append('<option value="'+newTaipei[i]+'">' + newTaipei[i]
			    			+ '</option>')
			        	}
			        } else if (val == "桃園市") {
			        	$("#adoptDistrict").html(" ")
			        	for (var i = 0; i < taoYuan.length; i++) {
			        		$("#adoptDistrict").append('<option value="'+taoYuan[i]+'">' + taoYuan[i]
			    			+ '</option>')
			        	}
			        } else if (val == "臺中市") {
			        	$("#adoptDistrict").html(" ")
			        	for (var i = 0; i < taichung.length; i++) {
			        		$("#adoptDistrict").append('<option value="'+taichung[i]+'">' + taichung[i]
			    			+ '</option>')} 
			        }else if (val == "臺南市") {
				        $("#adoptDistrict").html(" ")
				        for (var i = 0; i < tainan.length; i++) {
				        	$("#adoptDistrict").append('<option value="'+tainan[i]+'">' + tainan[i]
				    		+ '</option>')
				    		}
				      }else if (val == "高雄市") {
					       $("#adoptDistrict").html(" ")
				        	for (var i = 0; i < kao.length; i++) {
				        		$("#adoptDistrict").append('<option value="'+kao[i]+'">' + kao[i]
				    			+ '</option>')
				    		}
					   }else if (val == "新竹縣") {
					       $("#adoptDistrict").html(" ")
						    for (var i = 0; i < hsinChu.length; i++) {
						    $("#adoptDistrict").append('<option value="'+hsinChu[i]+'">' + hsinChu[i]
						    + '</option>')
							}
					    }else if (val == "苗栗縣") {
						    $("#adoptDistrict").html(" ")
							for (var i = 0; i < miao.length; i++) {
							$("#adoptDistrict").append('<option value="'+miao[i]+'">' + miao[i]
							+ '</option>')
							}
						}else if (val == "彰化縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < chungHua.length; i++) {
							$("#adoptDistrict").append('<option value="'+chungHua[i]+'">' + chungHua[i]
							+ '</option>')
							}
						}else if (val == "南投縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < nanTou.length; i++) {
							$("#adoptDistrict").append('<option value="'+nanTou[i]+'">' + nanTou[i]
							+ '</option>')
							}
						}else if (val == "雲林縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < yunLin.length; i++) {
							$("#adoptDistrict").append('<option value="'+yunLin[i]+'">' + yunLin[i]
							+ '</option>')
							}
						}else if (val == "嘉義縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < chiaYi.length; i++) {
							$("#adoptDistrict").append('<option value="'+chiaYi[i]+'">' + chiaYi[i]
							+ '</option>')
							}
						}else if (val == "屏東縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < pinTong.length; i++) {
							$("#adoptDistrict").append('<option value="'+pinTong[i]+'">' + pinTong[i]
							+ '</option>')
							}
						}else if (val == "宜蘭縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < yiLan.length; i++) {
							$("#adoptDistrict").append('<option value="'+yiLan[i]+'">' + yiLan[i]
							+ '</option>')
							}
						}else if (val == "花蓮縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < huaLian.length; i++) {
							$("#adoptDistrict").append('<option value="'+huaLian[i]+'">' + huaLian[i]
							+ '</option>')
							}
						}else if (val == "台東縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < taiTong.length; i++) {
							$("#adoptDistrict").append('<option value="'+taiTong[i]+'">' + taiTong[i]
							+ '</option>')
							}
						}else if (val == "澎湖縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < ponHu.length; i++) {
							$("#adoptDistrict").append('<option value="'+ponHu[i]+'">' + ponHu[i]
							+ '</option>')
							}
						}else if (val == "金門縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < kingMen.length; i++) {
							$("#adoptDistrict").append('<option value="'+kingMen[i]+'">' + kingMen[i]
							+ '</option>')
							}
						}else if (val == "連江縣") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < lianChian.length; i++) {
							$("#adoptDistrict").append('<option value="'+lianChian[i]+'">' + lianChian[i]
							+ '</option>')
							}
						}else if (val == "基隆市") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < keeLung.length; i++) {
							$("#adoptDistrict").append('<option value="'+keeLung[i]+'">' + keeLung[i]
							+ '</option>')
							}
						}else if (val == "新竹市") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < hisnChuCity.length; i++) {
							$("#adoptDistrict").append('<option value="'+hisnChuCity[i]+'">' + hisnChuCity[i]
							+ '</option>')
							}
						}else if (val == "嘉義市") {
							$("#adoptDistrict").html(" ")
							for (var i = 0; i < chiaYiCity.length; i++) {
							$("#adoptDistrict").append('<option value="'+chiaYiCity[i]+'">' + chiaYiCity[i]
							+ '</option>')
							} 
						}
			        
			    });
			});
			
// 			毛色選項
			var furTypes = [ "橘色", "三花", "虎斑", "玳瑁", "黑色", "黑白", "黑黃",
				"咖啡", "灰色", "灰白", "黃色", "黃白", "重點色", "雙色", "白色", "紅色",
				"米色", "藍色", "銀色", "金色", "黑棕", "其他" ]
		var fur = $('#fur');
		for (var i = 0; i < 22; i++) {
			fur.append('<option value="'+furTypes[i]+'">' + furTypes[i]
					+ '</option>');
		}
		var year = $('#ageYearChoose');
		var month = $('#ageMonthChoose');
// 年歲選項
		for (var i = 0; i <= 25; i++) {
			year.append('<option value="'+i+'">' + i + '</option>');
		}
// 月歲選項
		for (var i = 0; i <= 12; i++) {
			month.append('<option value="'+i+'">' + i + '</option>');
		}
		}
// 		輪播速度
		$('.carousel').carousel({
			  interval: 3500
			})
			
// 			使用者刪除文章
			function deletePost() {
			Swal.fire({
				  title: '您確定要刪除嗎？',
				  text: "刪除後不可復原喔😔",
				  input: 'select',
				  inputOptions: {
				    '浪浪找到家了': '浪浪找到家了♡',
				    ' 已透過其他管道找到飼主': '已透過其他管道找到飼主',
				    '過世':'過世',
				    '走失':'走失',
				    '決定自己領養':'決定自己領養',
				    '時間過久，仍未有人連絡':'時間過久，仍未有人連絡',
				    '其他': '其他'
				  },
				  inputPlaceholder: '請選擇刪除原因',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  cancelButtonText: '取消刪除',
				  confirmButtonText: '確定刪除！',
				  allowOutsideClick: false,
				  inputLabel: 'Message',
				}).then((result) => {
					if (result.value.length == 0) {
						Swal.fire({
							  icon: 'error',
							  title: '請輸入刪除原因哦🙇🏻'
							}) 
					}
				  if (result.isConfirmed && result.value.length != 0) {
				    Swal.fire({
				    		title: '已刪除😇',
				    		text: '希望浪浪都有個家🏡',
				    		icon: 'success',
				      allowOutsideClick: false
				    }).then(function(text){
				    	 location.href = '<c:url value="/fakedeleted/'+adoptionInfoID+'/'+result.value+'" />';
				    })
				  }
				})
			}

// 使用者修改照片
		function revisePic() {
			Swal.fire({
				  title: '您確定要更改圖片嗎？',
				  icon: 'warning',
				  showCancelButton: true,
				  allowOutsideClick: false,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '我確定❕',
				  cancelButtonText: '我再想想🤔'
				}).then((result) => {
				  if (result.isConfirmed) {
				   location.href='<c:url value="/updateNewPic/'+adoptionInfoID+'" />';
				  }
				})
		}

	function toLogIn() {
		location.href="<c:url value='/signinCheckcc'/>";
	}
</script>
</body>
</html>