<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style type="text/css">
.overAllAnalysis {
	font-size: 24pt;
	color: #5D001E;
	font-weight: bolder;
}

.hr {
	height: 1px;
	border: 0;
	border-top: 5px solid #FC9691;
	margin: 1em 0;
	padding: 0;
}

.wrapper {
	width: 70%;
	height: auto;
	margin-left: 6%;
	margin-top: 2%;
	display: inline-block;
	position: absolute;
}

.runChart {
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	width: 65%;
	padding: 20px;
	border-radius: 8px;
	display: inline-block;
	position: absolute;
}

#deletedPie {
	display: inline-block;
	position: absolute;
	margin-left: 67%;
	width: 33%;
	height: auto;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	height: auto;
	padding: 2% 28px 3.5% 28px;
	border-radius: 8px;
	background-color: white;
}

.pageData {
	display: inline-block;
	position: absolute;
	width: 100%;
	height: auto;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	height: auto;
	padding: 2% 45px 2% 45px;
	border-radius: 8px;
	background-color: white;
	margin-top: 38%;
	margin-bottom: 30px
}

#city {
	color: #ee4d2d;
	font-weight: 600
}

.type {
	font-weight: 500
}

.sex {
	font-weight: 500
}

#city:hover {
	cursor: default;
}

#sex:hover {
	color: black;
	cursor: pointer;
	font-weight: 600
}

#type:hover {
	color: black;
	cursor: pointer;
	font-weight: 600
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<jsp:include page="navForAdmin.jsp"></jsp:include>
	<div class="wrapper">
		<span class='overAllAnalysis'>領養率分析</span>
		<hr class="hr">
		<div class="runChart">
			<canvas id="myChart"></canvas>
		</div>
		<div class="dataWindow" id="deletedPie">
			<span>刪文原因</span><span style="float: right">比率</span>
			<hr>
			<div class="windowContent" style="line-height: 165%;"></div>
		</div>
		<div class="pageData">
			<div style="margin-bottom: 20px">
				<span onclick="showCity()" id="city" class="city">領養率(地區)</span> / <span
					onclick="showSex()" id="sex" class="city"> 領養率(性別)</span> / <span
					id="type" class="type" onclick="showType()"> 領養率(類型)</span>
			</div>
			<div id="cityRate" class="insertHere" style="display: block;">
				<div
					style="background-color: #f6f6f6; height: 50px; line-height: 50px; margin-bottom: 20px">
					<span style="margin-left: 5%;">縣市名稱</span> <span
						style="margin-left: 28%">已領養浪浪數</span><span
						style="margin-left: 29.5%"> 比率</span>
				</div>

				<c:forEach var="city" items="${cityChartO}" varStatus="i">
					<span style="margin-left: 5%; font-weight: 600"> ${city.key}</span>
					<span style="margin-left: 35%"> ${city.value}</span>
					<span style="margin-left: 35%">${cityChart[i.index]} %</span>
					<hr>
				</c:forEach>
			</div>

			<div id="sexRate" class="insertHere" style="display: none;">
				<div
					style="background-color: #f6f6f6; height: 50px; line-height: 50px; margin-bottom: 20px">
					<span style="margin-left: 5%">浪浪性別</span> <span
						style="margin-left: 28%">已領養浪浪數</span><span
						style="margin-left: 29.5%"> 比率</span>
				</div>

				<c:forEach var="sex" items="${sexChart}" varStatus="a">
					<span style="margin-left: 5%; font-weight: 600"> ${sex.key}</span>

					<c:choose>
						<c:when test="${a.index== 2}">
							<span style="margin-left: 34%"> ${sex.value}</span>
						</c:when>
						<c:otherwise>
							<span style="margin-left: 40%"> ${sex.value}</span>
						</c:otherwise>
					</c:choose>

					<span style="float: right; margin-right: 90px">${sexValue[a.index]}
						%</span>
					<hr>
				</c:forEach>
			</div>
			<div id="typeRate" class="insertHere" style="display: none;">
				<div
					style="background-color: #f6f6f6; height: 50px; line-height: 50px; margin-bottom: 20px">
					<span style="margin-left: 5%">浪浪類別</span> <span
						style="margin-left: 28%">已領養浪浪數</span><span
						style="margin-left: 29.5%"> 比率</span>
				</div>

				<c:forEach var="type" items="${typeChart}" varStatus="b">
					<span style="margin-left: 5%; font-weight: 600"> ${type.key}</span>
					<c:choose>
						<c:when test="${b.index== 1}">
							<span style="margin-left: 39%"> ${type.value}</span>
						</c:when>
						<c:when test="${b.index== 2}">
							<span style="margin-left: 39%"> ${type.value}</span>
						</c:when>
						<c:otherwise>
							<span style="margin-left: 37%"> ${type.value}</span>
						</c:otherwise>
					</c:choose>
					<span style="margin-left: 35%">${typeValue[b.index]} %</span>
					<hr>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var barAge = document.getElementById('barAge');
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/deleteChart' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		// 伺服器請求完成
		if (xhr.readyState == 4 && xhr.status == 200) {
			rateData = JSON.parse(xhr.responseText);
			console.log(xhr.responseText)
			var rateKey = [];
			var rateValue = [];
			for ( var e in rateData) {
				rateKey.push(e)
				rateValue.push(rateData[e])
			}
			var data = {
				datasets : [ {
					data : rateValue,
					backgroundColor : [ '#ff1d58', '#7a9903', '#c89666',
							'#bf4aa8', '#0049B7', '#FF5E13', '#787a76' ],
				} ],
				labels : rateKey
			};
			var ctx = $("#myChart");
			Chart.defaults.global.defaultFontColor = "black";
			Chart.defaults.global.defaultFontFamily = "Georgia";
			new Chart(ctx, {
				options : {
					legend : {
						display : false
					},
					title : {
						display : true,
						text : "會員刪除貼文原因",
						fontSize : 24,
						fontColor : '#B03656'
					},
					scales : {
						xAxes : [ {
							ticks : {
								fontSize : 12,
								min : 0,
								max : 12
							}
						} ],
						yAxes : [ {
							ticks : {
								fontSize : 16,
							}
						} ]
					}
				},
				data : data,
				type : 'horizontalBar',
			});
			var countDeleted = 0
			for ( var e in rateData) {
				countDeleted += rateData[e]
			}
			var color = 0;
			var colorCotent = [ '#ff1d58', '#7a9903', '#c89666', '#bf4aa8',
					'#0049B7', '#FF5E13', '#787a76' ]
			var percent = ${percent}
			for ( var e in rateData) {
				$('.windowContent')
						.append(
								'<span class="title'+color+'" style="font-size:12pt" >'
										+ e
										+ '</span>')
				color++
			}
			for (var i = 0; i < percent.length; i++) {
				$('.title'+i)
				.append(
						'<span style="float:right;font-size:13pt;font-weight:600;color:'+colorCotent[i]+'">' + percent[i] + '%</span><br>')
			}
			
		}
	}
	function changeColor(color) {
		$('.title').css('color', colorCotent[color])
	}
	function showSex() {
		$('#cityRate').css("display", "none")
		$('#typeRate').css("display", "none")
		$('#sexRate').css("display", "")
		$('#sex').css("color","#ee4d2d").css("font-weight","600")
		$('#city').css("color","black").css("font-weight","500")
			$('#type').css("color","black").css("font-weight","500")
		$('#city').hover(function(){
  			$(this).css("font-weight", "600");
 		 },function(){
 			$(this).css("font-weight", "500");
 		 })
		$('#type').hover(function(){
 			 $(this).css("font-weight", "600");
 		 },function(){
 			$(this).css("font-weight", "500");
 		 })
	}
	function showCity() {
		$('#cityRate').css("display", "")
		$('#typeRate').css("display", "none")
		$('#sexRate').css("display", "none")
		$('#city').css("color","#ee4d2d").css("font-weight","600")
		$('#sex').css("color","black").css("font-weight","500")
		$('#type').css("color","black").css("font-weight","500")
		$('#sex').hover(function(){
  			$(this).css("font-weight", "600");
 		 },function(){
 			$(this).css("font-weight", "500");
 		 })
		$('#type').hover(function(){
 			 $(this).css("font-weight", "600");
 		 },function(){
 			$(this).css("font-weight", "500");
 		 })
	}
	function showType() {
		$('#cityRate').css("display", "none")
		$('#typeRate').css("display", "")
		$('#sexRate').css("display", "none")
		$('#type').css("color","#ee4d2d").css("font-weight","600")
		$('#city').css("color","black").css("font-weight","500")
		$('#sex').css("color","black").css("font-weight","500")
		$('#sex').hover(function(){
  			$(this).css("font-weight", "600");
 		 },function(){
 			$(this).css("font-weight", "500");
 		 })
		$('#city').hover(function(){
 			 $(this).css("font-weight", "600");
 		 },function(){
 			$(this).css("font-weight", "500");
 		 })
	}
</script>
</html>