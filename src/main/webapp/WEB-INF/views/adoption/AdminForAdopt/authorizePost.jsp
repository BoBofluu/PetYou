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
	width: 13.7%;
	display: inline-block;
	text-align: center;
	margin-top: 2%;
	font-size: 18pt;
}

input[type=radio] {
	transform: scale(1.6);
	margin-right: 2px;
	margin-left: 20%;
}

.cover {
	background-color: #e9012c;
	border-radius: 50px;
	position: relative;
	height: 45px;
	width: 45px;
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
	<jsp:include page="navForAdmin.jsp"></jsp:include>
	<h3 id="head">文章審核管理</h3>
	<div class="allPosts">
		<div class="myLang title">文章編號</div>
		<div class="myLang title">審核狀態</div>
		<div class="myLang title">審核通過</div>
		<div class="myLang title">審核失敗</div>
		<div class="myLang title">審核暫緩</div>
		<div class="myLang title">修改狀態</div>
		<div class="myLang title">刪除文章</div>
		<hr style="width: 95%; margin-left: 2%">
		<div id="wrapper"></div>
		<hr style="width: 95%; margin-left: 2%">
		<div id="reason"></div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
		var i;
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/authorizePostJson' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				allArticles = JSON.parse(xhr.responseText);
				var wrapper = document.getElementById("wrapper");

				if (allArticles.length == 0) {
					wrapper.innerHTML += "<div style='text-align:center;font-weight:600'><img src='https://img.icons8.com/material-outlined/24/000000/no-idea.png'/> 目前無文章供管理</div>"
				}

				var reason;
				for (i = 0; i < allArticles.length; i++) {
					switch (allArticles[i].statusAdoption) {
					case 0:
						var reason = '<button type="button" class="btn btn-warning" style="color:white;font-weight:600;cursor:default">正在審核</button>'
						break;
					case 1:
						var reason = '<button type="button" class="btn btn-success" style="color:white;font-weight:600;cursor:default">審核成功</button>'
						break;
					case 4:
						var reason = '<button type="button" class="btn btn-danger"  style="color:white;font-weight:600;cursor:default">審核失敗</button>'
						break;
					}
					var radio1;
					var radio2;
					var radio3;
					switch (allArticles[i].statusAdoption) {
					case 0:
						radio1 = '<input type="radio" value="1" id="pass'+allArticles[i].adoptionInfoID+'" name="check'+allArticles[i].adoptionInfoID+'"><label for="pass'+allArticles[i].adoptionInfoID+'">&nbsp通過審核</label>';
						radio2 = '<input type="radio" value="4" id="notPass'+allArticles[i].adoptionInfoID+'" name="check'+allArticles[i].adoptionInfoID+'"><label for="notPass'+allArticles[i].adoptionInfoID+'">&nbsp未通過</label>'
						radio3 = '<input type="radio" value="0" id="wait'+allArticles[i].adoptionInfoID+'" name="check'+allArticles[i].adoptionInfoID+'" checked><label for="wait'+allArticles[i].adoptionInfoID+'">&nbsp暫緩審核</label>'
						break;
					case 1:
						radio1 = '<input type="radio" value="1" id="pass'+allArticles[i].adoptionInfoID+'" name="check'+allArticles[i].adoptionInfoID+'" checked><label for="pass'+allArticles[i].adoptionInfoID+'"> &nbsp通過審核</label>';
						radio2 = '<input type="radio" value="4" id="notPass'+allArticles[i].adoptionInfoID+'" name="check'+allArticles[i].adoptionInfoID+'"><label for="notPass'+allArticles[i].adoptionInfoID+'"> &nbsp未通過</label>'
						radio3 = '<input type="radio" value="0" id="wait'+allArticles[i].adoptionInfoID+'" name="check'+allArticles[i].adoptionInfoID+'" ><label for="wait'+allArticles[i].adoptionInfoID+'">&nbsp 暫緩審核</label>'

						break;
					case 4:
						radio1 = '<input type="radio" value="1" id="pass'+allArticles[i].adoptionInfoID+'" name="check'+allArticles[i].adoptionInfoID+'"><label for="pass'+allArticles[i].adoptionInfoID+'"> &nbsp通過審核</label>';
						radio2 = '<input type="radio" value="4" id="notPass'+allArticles[i].adoptionInfoID+'" name="check'+allArticles[i].adoptionInfoID+'" checked><label for="notPass'+allArticles[i].adoptionInfoID+'"> &nbsp未通過</label>'
						radio3 = '<input type="radio" value="0" id="wait'+allArticles[i].adoptionInfoID+'" name="check'+allArticles[i].adoptionInfoID+'" ><label for="wait'+allArticles[i].adoptionInfoID+'"> &nbsp暫緩審核</label>'

						break;
					}
					wrapper.innerHTML += '<div class="myLang title ID"><a style="text-decoration:none" href="showSinglePet/'+allArticles[i].adoptionInfoID+'"><div class="cover">'
							+ allArticles[i].adoptionInfoID
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
							+ allArticles[i].adoptionInfoID
							+ ')" >修改</button></div><div class="myLang title image" onclick="deletePost('+allArticles[i].adoptionInfoID+')"><img  style="margin-left:35%" src="https://img.icons8.com/cotton/50/000000/delete-sign--v2.png"/></div>';
				}
			}
		}
		function getIDP(id) {

			var status = $('input[name=check' + id + ']:checked').val();
			var xhr = new XMLHttpRequest();
			xhr.open("PUT", "<c:url value='/updatePostStatus/' />" + id, true);
			var jsonPet = {
				"statusAdoption" : status
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
		function deletePost(adoptionInfoID) {
			Swal.fire({
				  title: '您確定要刪除此篇文章嗎?',
				  text: "刪除後不可再修改喔",
				  icon: 'warning',
				  allowOutsideClick: false,
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '是的，確定刪除',
				  cancelButtonText: '不，我再想一下',
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire({
				    		title: '已刪除', 
				    		text: '希望浪浪都有個家',
				      icon: 'success',
				      allowOutsideClick: false
				  }).then(function(){
				    	 location.href = '<c:url value="/adminDeleted/'+adoptionInfoID+'?plusTime=yes" />';
				    })
				  }
				})
		}
	</script>
</body>
</html>