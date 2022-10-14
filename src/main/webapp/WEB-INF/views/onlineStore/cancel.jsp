<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style type="text/css">
.allPosts {
	width: 70%;
	height: auto;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	margin-left: 7%;
	margin-top: 5%;
	display: inline-block;
	position: absolute;
	margin-bottom: 3%;
}

#head {
	color: #5D001E;
	font-weight: bolder;
	margin-left: 35%;
	display: inline-block;
	position: absolute;
}

.title {
	color: #7E3B31;
	font-weight: 600;
}

.myLang {
	width: 15.7%;
	display: inline-block;
	text-align: center;
	margin-top: 2%;
	font-size: 18pt;
}
.myLangreason {
	width: 75%;
	display: inline-block;
	text-align: left;
	margin-top: 2%;
	font-size: 18pt;
	margin-top:45px;
	margin-left:-10px;
	
}

input[type=radio] {
	transform: scale(1.6);
	margin-right: 2px;
	margin-left: 20%;
}

.cover {
	background-color: rgb(232,106,192);
	border-radius: 15px;
	position: relative;
	height: 45px;
	width: 60px;
	margin-left: 36%;
	text-align: center;
	line-height: 45px;
	color: white;
}

.cover:hover {
	background-color: #f5ccd2;
	color: black;
}

.btn-outline-primary {
	margin-left: 35%;
}

.image :hover {
	-webkit-filter: brightness(.9);
}

#reason {
	/* 	background-color: #CE665B; */
	height: 50px;
	/* 	border-radius: 30px */
}
</style>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<jsp:include page="aaaa.jsp"></jsp:include>
	<h3 id="head">退貨審核</h3>
	<div class="allPosts">
		<div class="myLang title">申請單號</div>
		<div class="myLang title">審核狀態</div>
		<div class="myLang title">審核通過</div>
		<div class="myLang title">審核失敗</div>
		<div class="myLang title">審核暫緩</div>
		<div class="myLang title">修改狀態</div>
		
		<hr style="width: 95%; margin-left: 2%">
		<div id="wrapper"></div>
		<hr style="width: 95%; margin-left: 2%">
		<div id="reason"></div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
		var i;
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/getcancel' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				mode = JSON.parse(xhr.responseText);
				
				var wrapper = document.getElementById("wrapper");

				if (mode.length == 0) {
					wrapper.innerHTML += "<div style='text-align:center;font-weight:600'><img src='https://img.icons8.com/material-outlined/24/000000/no-idea.png'/> 目前無退貨請求</div>"
				}
				var reasonreason = document.getElementById("reason");
				var reason;
				for (i = 0; i < mode.length; i++) {
					switch (mode[i].state) {
					case "待審核":
						var reason = '<button type="button" class="btn btn-success" style="color:white;font-weight:600">待審核</button>'
						break;
					case "成功":
						var reason = '<button type="button" class="btn btn-warning" style="color:white;font-weight:600">審核成功</button>'
						break;
					case "失敗":
						var reason = '<button type="button" class="btn btn-danger"  style="color:white;font-weight:600">審核失敗</button>'
						break;
					}
					var radio1;
					var radio2;
					var radio3;
					switch (mode[i].state) {
					case "待審核":
						radio1 = '<input type="radio" value="成功" id="pass'+mode[i].oid+'" name="check'+mode[i].oid+'"><label for="pass'+mode[i].oid+'">&nbsp通過審核</label>';
						radio2 = '<input type="radio" value="失敗" id="notPass'+mode[i].oid+'" name="check'+mode[i].oid+'"><label for="notPass'+mode[i].oid+'">&nbsp未通過</label>'
						radio3 = '<input type="radio" value="待審核" id="wait'+mode[i].oid+'" name="check'+mode[i].oid+'" checked><label for="wait'+mode[i].oid+'">&nbsp暫緩審核</label>'
						break;

					case "失敗":
						radio1 = '<input type="radio" value="成功" id="pass'+mode[i].oid+'" name="check'+mode[i].oid+'"><label for="pass'+mode[i].oid+'"> &nbsp通過審核</label>';
						radio2 = '<input type="radio" value="失敗" id="notPass'+mode[i].oid+'" name="check'+mode[i].oid+'" checked><label for="notPass'+mode[i].oid+'"> &nbsp未通過</label>'
						radio3 = '<input type="radio" value="待審核" id="wait'+mode[i].oid+'" name="check'+mode[i].oid+'" ><label for="wait'+mode[i].oid+'"> &nbsp暫緩審核</label>'

						break;
					}
					wrapper.innerHTML += '<div class="myLang title ID"><a style="text-decoration:none" href="myorderitem/'+mode[i].storeOrdersBean.orderID+'"><div class="cover">'
							+ mode[i].oid
							+ '</div></a></div><div class="myLang title">'
							+ reason
							+ '</div><div class="myLang title">'
							+ radio1
							+ '</div><div class="myLang title">'
							+ radio2
							+ '</div><div class="myLang title">'
							+ radio3
							+ '</div><div class="myLang title"><button type="submit" id="changeStatus'
							+ i
							+ '" class="btn btn-outline-primary" onclick="getIDP('
							+ mode[i].oid
							+ ')" >修改</button></div>'
							+ '<div class="myLang title" style="vertical-align:top">退貨原因：</div>'
							+ '<span class="myLangreason title">'
							+ mode[i].reason
							+ '</span><br><hr>';
					
				    
				}
			}
		}
		function getIDP(id) {

			var status = $('input[name=check' + id + ']:checked').val();
			var xhr = new XMLHttpRequest();
			xhr.open("PUT", "<c:url value='/orderstate/' />" + id, true);
			var jsonPet = {
				"state" : status
			}
			xhr.setRequestHeader("Content-Type",
					"application/json;charset=UTF-8");
			xhr.send(JSON.stringify(jsonPet));

			xhr.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr.readyState == 4
						&& (xhr.status == 200 || xhr1.status == 201)) {
					result = JSON.parse(xhr.responseText);
					if (result.fail) {
						alert("修改失敗");
					} else {
						Swal.fire({
							title : "修改成功！",
							text : "已送出您的請求",
							icon : "success",
							allowOutsideClick : false
						}).then(function() {
							history.go(0);
						})
					}
				}
			}
		}
		
	</script>
</body>
</html>