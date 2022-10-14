<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">
<jsp:include page="/WEB-INF/views/petHomepage.jsp" />
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

/* style for content */
.warp {
	width: 100%;
	margin: 0 auto;
}

#content {
	height: 600px;
	width: 50%;
	float: left;
}

#sidecontent {
	height: 600px;
	width: 50%;
	float: right;
}

.clearfix {
	clear: both;
}

.title {
	margin-top: 10%;
	color: #5D001E;
	font-size: 20pt;
	font-weight: 600;
	text-align: center;
	text-decoration: underline;
	text-underline-position: under;
}

.recruit {
	margin-top: 10px;
	font-weight: 600;
	text-align: center;
	color: #5D001E;
	margin-bottom: 5%
}

.types, .sex {
	width: 43%;
	background-color: #fadadd;
	margin-left: 27%;
	border-radius: 20px;
	padding: 10px
}

select {
	outline: none;
}

.picArea {
	display: inline-block;
	width: 48%;
	overflow: hidden;
	height: 50%;
	margin-left: 1%;
	margin-top: 1%;
	position: relative;
	text-align: center;
}

.info {
	position: absolute;
	bottom: 0px;
	background-color: #DDC7C7;
	width: 100%;
	height: 45px;
	line-height: 45px;
	text-align: left;
	font-weight: 600
}

.bringHome:hover {
	-webkit-filter: brightness(.9);
	cursor: pointer;
}

.navu {
	margin-bottom: 30px
}
</style>
</head>

<body>

	<div class="warp">
		<div id="content">
			<div class="title">開始認養屬於您的浪浪</div>
			<div class="recruit">浪浪資料募集中！</div>
			<span style="font-size: 12pt; margin-left: 27%">種類</span> <select
				id="langType" class="pretty-select
			types space" required>
				<option value="" label="請選擇" selected="selected" disabled />
			</select> <br> <br> <span style="font-size: 12pt; margin-left: 27%">性別</span>
			<select id="langType" class="pretty-select
			sex space" required>
				<option value="" label="請選擇" selected="selected" disabled />
			</select>
			<div style="text-align: center; margin-top: 5%">
				<button type="button" class="btn btn-danger" onclick="submit()">搜尋</button>
			</div>

		</div>
		<div id="sidecontent">
			<c:forEach items="${images}" var="img">
				<div class="picArea"
					onclick="toSingle(${img.adoptionBean.adoptionInfoID})">
					<img class="bringHome" height="90%" alt=""
						src='/file/${img.picContent}'>
					<div class="info">
						<img width="30px" style="margin-right: 10px"
							src="https://img.icons8.com/plasticine/100/000000/search.png" />帶
						${img.adoptionBean.petName} 回家
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="clearfix"></div>
	</div>

	<script>
		var animal = [ '全部種類', '貓', '狗', '兔子', '其他' ];
		var sex = [ '全部性別', '公', '母' ];
		for (var i = 0; i < animal.length; i++) {
			$('.types').append(
					'<option value="'+animal[i]+'">' + animal[i] + '</option>');
		}
		for (var i = 0; i < sex.length; i++) {
			$('.sex').append(
					'<option value="'+sex[i]+'">' + sex[i] + '</option>');
		}

		function toSingle(id) {
			location.href = '<c:url value="/showSinglePet/'+id+'" />';
		}
		
		function submit() {
			var typesA = $('.types').val()
			if (typesA == null) {
				typesA = '全部種類' 
			}
			
			var sex = $('.sex').val()
			if (sex == null) {
				sex = '全部性別'
			}
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/LangCoverJson/?types=" +typesA  + "&sex="+sex+"' />", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr.readyState == 4 && xhr.status == 200) {
					result = JSON.parse(xhr.responseText);
					
					$('#sidecontent').html("")
					
					if (result.length == 0) {
						for (var i = 0; i < 4; i++) {
							$('#sidecontent').append('<div class="picArea" ><img class="bringHome" height="90%" alt="" src="${pageContext.request.contextPath}/img/langCover'+i+'.jpg"><div class="info"><img width="30px" style="margin-right: 10px"src="https://img.icons8.com/plasticine/100/000000/search.png" />目前查無資料</div></div>')
						}
					}
					
					if (result.length == 1) {
						$('#sidecontent').append('<div class="picArea" onclick="toSingle('+result[0].adoptionBean.adoptionInfoID+')"><img class="bringHome" height="90%" alt="" src="/file/'+result[0].picContent+'"><div class="info"><img width="30px" style="margin-right: 10px"src="https://img.icons8.com/plasticine/100/000000/search.png" />帶 '+result[0].adoptionBean.petName+' 回家</div></div>')
						for (var i = 0; i < 3; i++) {
							$('#sidecontent').append('<div class="picArea" ><img class="bringHome" height="90%" alt="" src="${pageContext.request.contextPath}/img/langCover'+i+'.jpg"><div class="info"><img width="30px" style="margin-right: 10px"src="https://img.icons8.com/plasticine/100/000000/search.png" />目前查無資料</div></div>')
						}
					}
					
					if (result.length == 2) {
						for (var i = 0; i < 2; i++) {
							$('#sidecontent').append('<div class="picArea" onclick="toSingle('+result[i].adoptionBean.adoptionInfoID+')"><img class="bringHome" height="90%" alt="" src="/file/'+result[i].picContent+'"><div class="info"><img width="30px" style="margin-right: 10px"src="https://img.icons8.com/plasticine/100/000000/search.png" />帶 '+result[i].adoptionBean.petName+' 回家</div></div>')
						}
						for (var i = 0; i < 2; i++) {
							$('#sidecontent').append('<div class="picArea" ><img class="bringHome" height="90%" alt="" src="${pageContext.request.contextPath}/img/langCover'+i+'.jpg"><div class="info"><img width="30px" style="margin-right: 10px"src="https://img.icons8.com/plasticine/100/000000/search.png" />目前查無資料</div></div>')
						}
					}
					
					if (result.length == 3) {
						for (var i = 0; i < 3; i++) {
							$('#sidecontent').append('<div class="picArea" onclick="toSingle('+result[i].adoptionBean.adoptionInfoID+')"><img class="bringHome" height="90%" alt="" src="/file/'+result[i].picContent+'"><div class="info"><img width="30px" style="margin-right: 10px"src="https://img.icons8.com/plasticine/100/000000/search.png" />帶 '+result[i].adoptionBean.petName+' 回家</div></div>')
						}
							$('#sidecontent').append('<div class="picArea" ><img class="bringHome" height="90%" alt="" src="${pageContext.request.contextPath}/img/langCover0.jpg"><div class="info"><img width="30px" style="margin-right: 10px"src="https://img.icons8.com/plasticine/100/000000/search.png" />目前查無資料</div></div>')
					}
					
					if (result.length == 4) {
						for ( var e in result) {
							$('#sidecontent').append('<div class="picArea" onclick="toSingle('+result[e].adoptionBean.adoptionInfoID+')"><img class="bringHome" height="90%" alt="" src="/file/'+result[e].picContent+'"><div class="info"><img width="30px" style="margin-right: 10px"src="https://img.icons8.com/plasticine/100/000000/search.png" />帶 '+result[e].adoptionBean.petName+' 回家</div></div>')
						}
					}
				}
			}
			
		}
	</script>
</body>
</html>