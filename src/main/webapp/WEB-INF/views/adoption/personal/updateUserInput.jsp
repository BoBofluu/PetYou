<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style type="text/css">
* {margin =0;padding =0;
	
}

#head {
	color: #5D001E;
	font-weight: bolder;
	margin-left: 41%
}

.contactInfo {
	padding: 100px;
	margin-top: 2%;
	margin-left: 13%;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	border-radius: 10px;
	position: absolute;
	margin-bottom: 40px;
	height: auto;
	width: 1150px;
}

#inputInfo {
	padding: 20px;
	margin: 20px;
	font-size: large;
	padding-right: 50px
}

.insert {
	padding: 5px 0px 20px 0px;
	margin-left: 30px
}

.spanStyle {
	margin-left: 10px;
	margin-right: 60px;
	font-size: 15pt
}

.status {
	height: 100px
}

.radioType {
	font-size: large;
	margin-right: 10px;
	margin-left: 5px;
}

.restrict {
	margin: 0px 0px 0px 240px;
	font-size: 12pt
}

.column {
	background-color: #DFDCE3;
	border: 0px;
	padding: 3px;
	border-radius: 5px
}

.info {
	font-weight: bolder;
	font-size: 18pt;
}

.nextStep {
	font-size: 15pt;
	background-color: #B03656;
	color: white;
	padding: 10px;
	border: 0px;
	border-radius: 10px;
	font-weight: bold;
	margin-left: 43%;
	margin-top: 3%;
	outline: none;
}

.inputBySelf {
	border: 1px solid gray;
	border-radius: 5px;
	padding: 3px
}

.addressSame {
	width: 500px
}

.address {
	width: 500px
}

#mail, #nameCheck, #phoneW, #addressC, #full {
	margin-left: 10px;
	color: red;
	font-weight: bold;
}

.emailSpan {
	width: 400px
}
</style>

</head>

<body>
	<jsp:include page="../HomePage.jsp" />
	<h2 id="head">修改聯絡人資訊</h2>

	<div class="contactInfo">
		<img src="https://img.icons8.com/nolan/50/right.png" /> <span
			class="info">【會員資訊】</span>
		<div class="insert">
			<hr>
			<span class="spanStyle">聯絡信箱：</span> <input type="text" readonly
				class="column email emailSpan" id="emailO" />
		</div>

		<div class="insert">
			<span class="spanStyle">會員姓名：</span> <input type="text" readonly
				class="column lastName" id="lastNameO" /> <input type="text"
				readonly class="column firstName" id="firstNameO" />
		</div>

		<div class="insert">
			<span class="spanStyle">連絡電話：</span> <input type="text" readonly
				class="column cellPhone" id="cellPhoneO" />
		</div>

		<div class="insert" style="margin-bottom: 80px;">
			<span class="spanStyle">收養地址：</span> <input type="text" readonly
				class="column address" id="addressO" />
		</div>

		<!-- =================================================== -->

		<img src="https://img.icons8.com/nolan/50/down-right--v2.png" /> <span
			class="info">【收養資訊】</span> <input type="checkbox" id="sameAsTop"
			name="yes" value="yes" onclick="tof()"> <label
			for="sameAsTop">同上</label><span id="full"></span>
		<div class="insert">
			<hr>
			<button type="button" class="btn btn-warning"
				style="font-weight: 800; color: snow; width: 55px; height: 30px; font-size: 18px; padding: 0px;">必填</button>
			<span class="spanStyle">聯絡信箱：</span> <input type="text"
				value="${cpb.email}" name="email" required="required"
				class="inputBySelf emailSame emailSpan" onblur="emailCheck()" /><span
				id="mail"></span>
		</div>

		<div class="insert">
			<button type="button" class="btn btn-warning"
				style="font-weight: 800; color: snow; width: 55px; height: 30px; font-size: 18px; padding: 0px;">必填</button>
			<span class="spanStyle">會員姓名：</span> <input onblur="family()"
				type="text" value="${cpb.lastName}" name="lastName"
				required="required" class="inputBySelf lastNameSame"
				style="width: 100px" /> <input onblur="family()" type="text"
				value="${cpb.firstName}" name="firstName" required="required"
				style="width: 120px" class="inputBySelf firstNameSame" /> <span
				id="nameCheck"></span>
		</div>

		<div class="insert">
			<button type="button" class="btn btn-warning"
				style="font-weight: 800; color: snow; width: 55px; height: 30px; font-size: 18px; padding: 0px;">必填</button>
			<span class="spanStyle">連絡電話：</span> <input type="text"
				value="${cpb.cellPhone}" name="cellPhone"
				class="inputBySelf cellPhoneSame" onblur="phoneCheck()" /><span
				id="phoneW"></span>
		</div>

		<div class="insert">
			<span class="spanStyle" style="margin-left: 70px">收養地址：</span> <input
				type="text" onblur="addressCheck()" value="${cpb.address}"
				name="address" class="inputBySelf addressSame" /> <span
				id="addressC"></span>
		</div>
		<input type="submit" value="確認送出" class="nextStep" onclick="insert()" />
		<img src="https://img.icons8.com/emoji/48/000000/paw-prints.png" />
	</div>

	<!-- JAVA SCRIPT 程式碼 -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		// 		取得會員資料
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/getMemberJson/" + ${memberID} + "' />",
				true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var member = JSON.parse(xhr.responseText);
				$("#emailO").val(member.email);
				$("#lastNameO").val(member.lastName);
				$("#firstNameO").val(member.firstName);
				$("#cellPhoneO").val(member.phone);
				$("#addressO").val(member.address);
			}
		}

		// 		基本設定
		window.history.forward(1);

		// 		複製會員訊息至欄位(同上功能)
		var insertEmail;
		var insertFirstName;
		var insertlastName;
		var insertcellPhone;
		var insertAddress;

		$('input[name="yes"]').click(function() {
			if ($(this).is(':checked')) {
				insertEmail = $(".email").val();
				$(".emailSame").val(insertEmail);

				insertFirstName = $(".firstName").val();
				$(".firstNameSame").val(insertFirstName);

				insertlastName = $(".lastName").val();
				$(".lastNameSame").val(insertlastName);

				insertcellPhone = $(".cellPhone").val();
				$(".cellPhoneSame").val(insertcellPhone);

				insertAddress = $(".address").val();
				$(".addressSame").val(insertAddress);
			} else {
				$(".emailSame").val('');
				$(".firstNameSame").val('');
				$(".lastNameSame").val('');
				$(".cellPhoneSame").val('');
				$(".addressSame").val('');
			}
		});

		// 		檢查輸入值
		var noError = 0;

		// 同上勾選||取消的檢查 onclick
		function tof() {
			if (document.getElementById("sameAsTop").checked) {
				noError = 4;
				$('#full').html("")
				$("#mail").html(" ");
				$("#nameCheck").html("");
				$("#phoneW").html("");
				$("#addressC").html("");
			} else {
				noError = 0;
			}
		}

		// emailr檢查 onchange
		function emailCheck() {
			var strP = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			var regu = /^[ ]+$/;
			if ($(".emailSame").val().length <= 0
					|| $(".emailSame").val().match(/^[ ]*$/)) {
				$("#mail").html("請填寫email, 請勿填寫空格");
				noError -= 1;
			} else if (!strP.test($(".emailSame").val())) {
				$("#mail").html("email格式有誤");
				noError -= 1;
			} else {
				$("#mail").html(" ");
				$('#full').html("")
				noError = 4;
			}
		}

		// 姓名欄檢查 onchange
		function family() {
			if ($(".firstNameSame").val().length <= 0
					|| $(".firstNameSame").val().match(/^[ ]*$/)
					|| $(".lastNameSame").val().match(/^[ ]*$/)
					|| $(".lastNameSame").val().length <= 0) {
				$("#nameCheck").html("請填寫姓名，請勿輸入空格");
				noError -= 1;
			} else {
				$("#nameCheck").html("");
				$('#full').html("")
				noError = 4;
			}
		}

		// 電話檢查 onchange
		function phoneCheck() {
			var mobile = /^[09]{2}\d{8}$/;
			var local = /^0(2|3|4|5|6|7|8)\d{0,2}-\d{6,8}$/;
			if ($(".cellPhoneSame").val().length <= 0
					|| $(".cellPhoneSame").val().match(/^[ ]*$/)) {
				$("#phoneW").html("請填寫號碼，請勿輸入空格");
				noError -= 1;
			} else if (!mobile.test($(".cellPhoneSame").val())
					&& !local.test($(".cellPhoneSame").val())) {
				$("#phoneW").html("號碼格式有誤，請填寫家電或手機");
				noError -= 1;
			} else {
				$("#phoneW").html("")
				noError = 4;
				$('#full').html("")
			}
		}

		// 地址檢查 onchange
		function addressCheck() {
			if ($(".addressSame").val().length <= 0) {
				$(".addressSame").val('請直接聯繫送養人');
				$("#addressC").html("");
				noError = 4;
				$('#full').html("")
			} else if ($(".addressSame").val().match(/^[ ]*$/)) {
				$("#addressC").html("請勿填空格");
				noError -= 1;
			} else {
				$("#addressC").html("");
				noError = 4;
				$('#full').html("")
			}
		}

		// 送出前最後檢查 onclick
		function insert() {
			if (noError == 4) {
				noError += 1;
			}
			// 			確認所有欄位皆不為空
			if (noError >= 5 || noError == 0) {
				if ($(".emailSame").val().length <= 0
						|| $(".emailSame").val().match(/^[ ]*$/)
						|| $(".firstNameSame").val().length <= 0
						|| $(".firstNameSame").val().match(/^[ ]*$/)
						|| $(".lastNameSame").val().match(/^[ ]*$/)
						|| $(".lastNameSame").val().length <= 0
						|| $(".cellPhoneSame").val().length <= 0
						|| $(".cellPhoneSame").val().match(/^[ ]*$/)) {
					if ($(".addressSame").val().length <= 0) {
						$(".addressSame").val('請直接聯繫送養人');
					}
					noError = 0;
					$('#full').html("請填寫必填欄位")
				} else {
					// 到此步則所有欄位皆正確
					if ($(".addressSame").val().length <= 0) {
						$(".addressSame").val('請直接聯繫送養人');
					}

					window.location.href = "<c:url  value='/changeAContact/"
							+ ${contactpersonID}+"/" + 
							$(".emailSame").val() + "/"
							+ $(".lastNameSame").val() + "/"
							+ $(".firstNameSame").val() + "/"
							+ $(".cellPhoneSame").val() + "/"
							+ $(".addressSame").val() + "/"
							+ ${adoptionInfoID} + "'/>";
				}
			}
		}
	</script>
</body>

</html>