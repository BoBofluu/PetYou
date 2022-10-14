<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style type="text/css">
.wrapper {
	width: 1000px;
	height: auto;
	text-align: center;
	margin: 20px auto;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	border-radius: 15px;
	padding: 50px 30px 50px 30px
}

input[type=radio] {
	transform: scale(2);
	margin-left: 12px;
}

select {
	width: 500px;
	border-radius: 20px;
	background-color: lightyellow;
	padding: 15px;
}

.select {
	margin-bottom: 30px;
	outline: 0px;
}

.pairSet {
	border-radius: 20px;
	color: white;
	font-weight: 600;
	width: 100px;
	padding: 10px;
	background: #FF4E50;
	background: -webkit-linear-gradient(to right, #F9D423, #FF4E50);
	background: linear-gradient(to right, #F9D423, #FF4E50);
	margin-left: 50px;
}
</style>
</head>
<body>
	<jsp:include page="../HomePage.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<h3 style="color: #5D001E; text-align: center; font-weight: 600;">配對通知設定</h3>
	<h5 style="color: #5D001E; text-align: center;">
		我們將一週寄送一次配對清單至您的信箱<img
			src="https://img.icons8.com/color/48/000000/dog-park.png" />
	</h5>

	<div class="wrapper">
		<div class="pairSet" style="display: inline-block; float: left;">配對設定</div>
		<div class="select"
			style="display: inline-block; margin-right: 150px;">
			<select required class="adoptCity" id="adoptCity">
				<option value="" label="請選擇縣市" selected="selected" disabled />
			</select>
		</div>
		<div class="select">
			<select required class="adoptPet" id="adoptPet">
				<option value="" label="請選擇類型" selected="selected" disabled />
			</select>
		</div>
		<div style="margin-right: 30%">
			<input type="radio" value="公" id="male" required name="petSex" /> <span
				class="radioType"><label for="male" style="margin-left: 10px">公</label></span>

			<input type="radio" value="母" id="female" required name="petSex" />
			<span class="radioType"><label for="female"
				style="margin-left: 10px">母</label></span> <input type="radio" value="皆可"
				id="both" required name="petSex" /> <span class="radioType"><label
				for="both" style="margin-left: 10px">皆可</label></span>
		</div>
		<div>
			<button type="button" class="btn btn-success" onclick="sendEmail()"
				style="margin-top: 20px; float: right;">儲存設定</button>
		</div>

		<hr>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var cities = [ "全部地區", "臺北市", "新北市", "桃園市", "臺中市", "臺南市", "高雄市", "新竹縣",
				"苗栗縣", "彰化縣", "南投縣", "雲林縣", "嘉義縣", "屏東縣", "宜蘭縣", "花蓮縣", "臺東縣",
				"澎湖縣", "金門縣", "連江縣", "基隆市", "新竹市", "嘉義市" ];

		var adoptPet = [ "全部種類", "貓", "狗", "兔子", "其他" ]

		for (var i = 0; i < cities.length; i++) {
			$('.adoptCity')
					.append(
							'<option value="'+cities[i]+'" >' + cities[i]
									+ '</option>')
		}

		for (var i = 0; i < adoptPet.length; i++) {
			$('.adoptPet').append(
					'<option value="'+adoptPet[i]+'" >' + adoptPet[i]
							+ '</option>')
		}

		function sendEmail() {
			var adoptCitySelect = $('#adoptCity').find('option:selected')
					.text();
			var adoptPetSelect = $('#adoptPet').val()
			var petSexSelect = $("input[name='petSex']:checked").val()
			location.href = '<c:url value="/javaMail?setOrCancel=yes&city='
		+ adoptCitySelect + '&type=' + adoptPetSelect + '&sex='
		+ petSexSelect + '" />'
			let timerInterval
			Swal.fire({
  				title: '信件寄送中，請耐心等候！',
  				html: '視窗將於<b></b>毫秒後關閉',
  				timer: 3000,
  				allowOutsideClick: false,
  				showConfirmButton: false,
  				timerProgressBar: true,
  				willOpen: () => {
    				Swal.showLoading()
    				timerInterval = setInterval(() => {
     					 const content = Swal.getContent()
     					 if (content) {
       						 const b = content.querySelector('b')
       						 if (b) {
         					 	b.textContent = Swal.getTimerLeft()
       					 		}
      						}
   						 }, 100)
 					 },
 					willClose: () => {
   						clearInterval(timerInterval)
  					}
 				}).then((result) => {
	
  if (result.dismiss === Swal.DismissReason.timer) {
    console.log('I was closed by the timer')
  }
})

		}
	</script>
</body>
</html>