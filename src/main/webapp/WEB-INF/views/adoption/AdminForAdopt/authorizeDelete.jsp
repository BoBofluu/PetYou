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
	margin-bottom: 20px;
	border-radius: 5px;
	padding-left: 25px
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
	width: 17.2%;
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

.cover, .coverTo {
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

.coverTo:hover {
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
	height: 20px;
}

.status {
	width: 300px;
}

.words {
	color: black;
	font-weight: normal;
	font-size: 14pt;
}

.time {
	font-size: 13pt;
	color: black;
	width: 200px
}

.adjust {
	padding-right: 50px;
}
</style>
</head>
<body>
	<jsp:include page="navForAdmin.jsp"></jsp:include>
	<h3 id="head">刪除文章管理</h3>
	<div class="allPosts">
		<div class="myLang title">文章編號</div>
		<div class="myLang title ">刪文時間</div>
		<div class="myLang title status">刪除原因</div>
		<div class="myLang title">目前狀態</div>
		<div class="myLang title">確認刪除</div>
		<hr style="width: 95%; margin-left: 2%">
		<div id="wrapper"></div>
		<hr style="width: 95%; margin-left: 2%">
		<div id="reason"></div>
	</div>
	<div
		style="position: absolute; display: inline-block; height: 50px; border: 1px #F0F0F0 solid; margin-left: 32%; margin-top: 45%"></div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
		var i;
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/deletePostJson' />", true);
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
					case 2:
						var reason = '<button type="button" class="btn btn-secondary" style="color:white;font-weight:600;cursor:default">等待刪除</button>'
						break;
					case 3:
						var reason = '<button type="button" class="btn btn-dark" style="color:white;font-weight:600;cursor:default">管理員刪除</button>'
						break;
					}
					if (allArticles[i].statusAdoption == 2) {
						wrapper.innerHTML += '<div class="myLang title ID"><a style="text-decoration:none" href="showSinglePet/'+allArticles[i].adoptionInfoID+'"><div class="coverTo">'
						+ allArticles[i].adoptionInfoID
						+ '</div></a></div><div class="myLang title time">'+allArticles[i].deletedTime+'</div><div class="myLang title status words">'
						+ allArticles[i].deleteReason
						+ '</div><div class="myLang title">'
						+ reason
						+ '</div><div class="myLang title image adjust" onclick="deletePost('
						+ allArticles[i].adoptionInfoID
						+ ')"><img  style="margin-left:35%" src="https://img.icons8.com/cotton/50/000000/delete-sign--v2.png"/></div>';
					} else{
						wrapper.innerHTML += '<div class="myLang title ID"><div class="cover">'
						+ allArticles[i].adoptionInfoID
						+ '</div></div><div class="myLang title time">'+allArticles[i].deletedTime+'</div><div class="myLang title status words">'
						+ allArticles[i].deleteReason
						+ '</div><div class="myLang title">'
						+ reason
						+ '</div><div class="myLang title image" ></div>';
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
				    	 location.href = '<c:url value="/adminDeleted/'+adoptionInfoID+'" />';
				    })
				  }
				})
		}
	</script>
</body>
</html>