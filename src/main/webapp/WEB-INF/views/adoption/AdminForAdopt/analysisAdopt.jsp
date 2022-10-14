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

.dataWindow {
	display: inline-block;
	width: 33%;
	margin-left: 67%;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	height: auto;
	padding: 23px;
	border-radius: 8px;
	position: absolute;
}

.fontSize {
	font-size: 13pt;
	margin-top: 27px;
	margin-bottom: 27px
}

.postsCount {
	float: right;
	font-weight: 600;
	margin-right: 5px;
	font-size: 17pt
}

.pieChart {
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	padding: 15px;
	border-radius: 8px;
	width: 65%;
	margin-bottom: 10px;
	margin-right: 1%;
	display: inline-block;
}

.topPie {
	margin-top: 37%
}

.dataWindowPie {
	display: inline-block;
	position: absolute;
	margin-top: 37%;
	margin-left: 1%;
	width: 33%;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	height: auto;
	border-radius: 8px;
	padding: 3.5% 23px 1% 23px;
}

#petTypePie {
	display: inline-block;
	position: absolute;
	margin-left: 1%;
	width: 33%;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	height: auto;
	padding: 5.5% 28px 3.5% 28px;
	border-radius: 8px;
}

#petAgePie {
	display: inline-block;
	position: absolute;
	margin-left: 1%;
	width: 33%;
	height: auto; background-color : white;
	box-shadow: 12px 12px 7px #dfe3e8;
	height: auto;
	padding: 4.5% 28px 3.5% 28px;
	border-radius: 8px;
	background-color: white;
}

.noName {
	padding-top: 5px;
	padding-bottom: 10px
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<jsp:include page="navForAdmin.jsp"></jsp:include>
	<div class="wrapper">
		<span class='overAllAnalysis'>整體分析</span>
		<hr class="hr">
		<div class="runChart">
			<canvas id="chart"></canvas>
		</div>
		<div class="dataWindow">
			<p class="fontSize">
				貼文總數(含已刪除)<span class="postsCount" style="color: #FC6E51">${postData[0]}篇</span>
			</p>
			<hr>
			<p class="fontSize">
				審核中貼文<span class="postsCount" style="color: #FAA41A">${postData[1]}篇</span>
			</p>
			<hr>
			<p class="fontSize">
				未通過審核貼文數量<span class="postsCount" style="color: #3DB9D3">${postData[2]}篇</span>
			</p>
			<hr>
			<p class="fontSize">
				已通過之貼文<span class="postsCount" style="color: gray">${postData[3]}篇</span>
			</p>
		</div>
		<div class="pieChart topPie">
			<canvas class="pie" id="pieDistrict"></canvas>
		</div>
		<div class="dataWindowPie"></div>

		<div class="pieChart" style="display: inline-block;">
			<canvas class="pie" id="pieType"></canvas>
		</div>
		<div class="dataWindow" id="petTypePie">data Window pet Type Pie</div>

		<div class="pieChart" style="display: inline-block;">
			<canvas class="pie" id="barAge"></canvas>
		</div>
		<div class="dataWindow" id="petAgePie">
			<span>年齡區間</span><span style="margin-left: 18%">數量</span><span
				style="margin-left: 18%">佔比</span>
			<hr>
			<div class="windowContent"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//	取得run chart的JSON【當天拾獲之浪浪數量】
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/analysisByDate' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		// 伺服器請求完成
		if (xhr.readyState == 4 && xhr.status == 200) {
			result = JSON.parse(xhr.responseText);
			var labels = [], dataRun = [];
			for ( var elements in result) {
				//處理時間格式
				var splitDate = elements.split('T');
				var objDate = new Date(splitDate);
				var millies = objDate.setDate(objDate.getDate());
				var endResult = new Date(millies)
				var myData = endResult.getFullYear() + '年'
						+ (endResult.getMonth() + 1) + '月'
						+ endResult.getDate() + '日';
				labels.push(myData);
				dataRun.push(result[elements]);
			}
			var ctx = document.getElementById('chart').getContext('2d');
			Chart.defaults.global.defaultFontColor = "black";
			Chart.defaults.global.defaultFontFamily = "Georgia";
			var chart = new Chart(ctx, {
				type : 'line',
				data : {
					labels : labels,
					datasets : [ {
						label : '當天拾獲之浪浪數量',
						backgroundColor : 'rgba(220, 80, 79, 0.7)',
						data : dataRun,
					} ],
				},
				options : {
					legend: {
				        labels: {
				            fontSize: 16
				        }
				    },
					title : {
						display : true,
						text : "近期拾獲數量圖",
						fontSize : 24,
						fontColor : '#B03656'
					},
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true,
								min : 0,
								max :8,
								stepSize : 1
							}
						} ]
					}
				}
			});
		}
	}

	// 	【區域分類（浪浪數量）】
	var xhr1 = new XMLHttpRequest();
	xhr1.open("GET", "<c:url value='/districtPets' />", true);
	xhr1.send();
	xhr1.onreadystatechange = function() {
		// 伺服器請求完成
		if (xhr1.readyState == 4 && xhr1.status == 200) {
			distirctData = JSON.parse(xhr1.responseText);
			var pie = document.getElementById('pieDistrict').getContext('2d');
			var dataDistrict = [];
			var labelDistrict = [];

			var n = 0;
			var c = 0;
			var s = 0;
			var e = 0;
			var i = 0;
			for ( var elements in distirctData) {
				if (elements == '臺北市' || elements == '新北市' || elements == '桃園市'
						|| elements == '新竹縣' || elements == '新竹市'
						|| elements == '基隆市') {
					n = n + distirctData[elements];
				} else if (elements == '臺中市' || elements == '苗栗縣'
						|| elements == '彰化縣' || elements == '南投縣') {
					c = c + distirctData[elements];
				} else if (elements == '臺南市' || elements == '高雄市'
						|| elements == '嘉義市' || elements == '雲林縣'
						|| elements == '嘉義縣') {
					s = s + distirctData[elements];
				} else if (elements == '屏東縣' || elements == '宜蘭縣'
						|| elements == '花蓮縣' || elements == '臺東縣') {
					e = e + distirctData[elements];
				} else {
					i = i + distirctData[elements];
				}
			}
			var myDoughnutChart = new Chart(pie, {
				type : 'doughnut',
				data : {
					datasets : [ {
						data : [ n, c, s, e, i ],
						hoverBackgroundColor : [ '#fa5782', '#d4eb7a',
								'#e1b382', '#bf7cb2', '#6184ba' ],
						backgroundColor : [ '#ff1d58', '#beef00', ' #c89666',
								'#bf4aa8', '#0049B7' ]
					} ],
					labels : [ "北部", "中部", "南部", "東部", "離島" ]
				},
				options : {
					legend: {
				        labels: {
				            fontSize: 16
				        }
				    },
					title : {
						display : true,
						text : "區域分類（浪浪數量）",
						fontSize : 24,
						fontColor : '#B03656'
					}
				}
			});
			var total = n + c + s + e + i
			$('.dataWindowPie')
					.html(
							'<h6><span style="float:left">地區</span><span style="margin-left:18%"> 區域數</span> <span style="float:right">分配百分比</span></h6><hr>')
			$('.dataWindowPie')
					.append(
							'<p>北部<span style="margin-left:25%">'
									+ n
									+ '</span><span style="margin-left:32%;color:#ff1d58;font-weight:600">'
									+ ((n / total) * 100).toFixed(1)
									+ '%</span></p>')
			$('.dataWindowPie')
					.append(
							'<p>中部<span style="margin-left:25%">'
									+ c
									+ '</span><span style="margin-left:32%;color:#beef00;font-weight:600">'
									+ ((c / total) * 100).toFixed(1)
									+ '%</span></p>')
			$('.dataWindowPie')
					.append(
							'<p>南部<span style="margin-left:25%">'
									+ s
									+ '</span><span style="margin-left:32%;color:#c89666;font-weight:600">'
									+ ((s / total) * 100).toFixed(1)
									+ '%</span></span></p>')
			$('.dataWindowPie')
					.append(
							'<p>東部<span style="margin-left:25%">'
									+ e
									+ '</span><span style="margin-left:32%;color:#bf4aa8;font-weight:600">'
									+ ((e / total) * 100).toFixed(1)
									+ '%</span></span></p>')
			$('.dataWindowPie')
					.append(
							'<p>離島<span style="margin-left:25%">'
									+ i
									+ '</span><span style="margin-left:32%;color:#0049B7;font-weight:600">'
									+ ((i / total) * 100).toFixed(1)
									+ '%</span></span></p>')
		}
	}

	// 	【種類分類（浪浪數量）】
	var pieType = document.getElementById('pieType');
	var xhr2 = new XMLHttpRequest();
	xhr2.open("GET", "<c:url value='/typePets' />", true);
	xhr2.send();
	xhr2.onreadystatechange = function() {
		// 伺服器請求完成
		if (xhr2.readyState == 4 && xhr2.status == 200) {
			typeData = JSON.parse(xhr2.responseText);

			var petTypes = []
			var petCounts = []
			var total = 0;
			for ( var elements in typeData) {
				petTypes.push(elements)
				petCounts.push(typeData[elements])
				total += typeData[elements];
			}

			var myDoughnutChart = new Chart(pieType, {
				type : 'doughnut',
				data : {
					datasets : [ {
						data : petCounts,
						hoverBackgroundColor : [ '#fa5782', '#d4eb7a',
								'#e1b382', '#bf7cb2' ],
						backgroundColor : [ '#ff1d58', '#beef00', ' #c89666',
								'#bf4aa8' ]
					} ],
					labels : petTypes
				},
				options : {
					legend: {
				        labels: {
				            fontSize: 16
				        }
				    },
					title : {
						display : true,
						text : "種類分類（浪浪數量）",
						fontSize : 24,
						fontColor : '#B03656'
					}
				}
			});

			$('#petTypePie')
					.html(
							'<h6><span style="margin-left:5%">種類</span><span style="margin-left:20%"> 數量</span> <span style="margin-left:20%">佔比例</span></h6><hr>')
			$('#petTypePie')
					.append(
							'<p><span  id="cat" style="margin-left:5%">貓</span><span class="cat" style="margin-left:30%">'
									+ typeData['貓']
									+ '</span><span class="colorCat"  style="margin-left:30%;font-weight:600">'
									+ ((typeData['貓'] / total) * 100)
											.toFixed(1) + '%</span></span></p>')
			$('#petTypePie')
					.append(
							'<p><span id="rabbit"  style="margin-left:5%">兔子</span><span class="rabbit" style="margin-left:24%">'
									+ typeData['兔子']
									+ '</span><span class="colorRabbit"  style="margin-left:30%;font-weight:600">'
									+ ((typeData['兔子'] / total) * 100)
											.toFixed(1) + '%</span></span></p>')
			$('#petTypePie')
					.append(
							'<p><span id="dog" style="margin-left:5%" >狗</span><span class="dog" style="margin-left:30%">'
									+ typeData['狗']
									+ '</span><span class="colorDog" style="margin-left:30%;font-weight:600">'
									+ ((typeData['狗'] / total) * 100)
											.toFixed(1) + '%</span></span></p>')
			$('#petTypePie')
					.append(
							'<p><span id="other"  style="margin-left:5%">其他</span><span class="other" style="margin-left:24%">'
									+ typeData['其他']
									+ '</span><span class="colorOther"  style="margin-left:30%;font-weight:600">'
									+ ((typeData['其他'] / total) * 100)
											.toFixed(1) + '%</span></span></p>')
			var length = 0;
			for ( var k in typeData)
				if (typeData.hasOwnProperty(k)) {
					length++;
				}

			var maxVal = Object.values(typeData)[0]
			var maxKey
			for (var i = 0; i < length; i++) {
				if (Object.values(typeData)[i] >= maxVal) {
					maxVal = Object.values(typeData)[i];
					maxKey = Object.keys(typeData)[i];
				}
			}
			switch (maxKey) {
			case '狗':
				$('#dog')
						.prepend(
								'<img src="https://img.icons8.com/color/20/000000/trophy.png"/>')
				$('.dog').css('margin-left', '24%')
				$('.colorDog').css('color', '#AB8D3F')
				$('.colorDog').css('margin-left', '28.5%')
				break;
			case '貓':
				$('#cat')
						.prepend(
								'<img src="https://img.icons8.com/color/20/000000/trophy.png"/>')
				$('.cat').css('margin-left', '24%')
				$('.colorCat').css('color', '#AB8D3F')

				break;
			case '兔子':
				$('#rabbit')
						.prepend(
								'<img src="https://img.icons8.com/color/20/000000/trophy.png"/>')
				$('.rabbit').css('margin-left', '16%')
				$('.colorRabbit').css('color', '#AB8D3F')
				break;
			case '其他':
				$('#other')
						.prepend(
								'<img src="https://img.icons8.com/color/20/000000/trophy.png"/>')
				$('.other').css('margin-left', '16%')
				$('.colorOther').css('color', '#AB8D3F')
				break;
			}
		}
	}

	var barAge = document.getElementById('barAge');
	var xhr3 = new XMLHttpRequest();
	xhr3.open("GET", "<c:url value='/agePets' />", true);
	xhr3.send();
	xhr3.onreadystatechange = function() {
		// 伺服器請求完成
		if (xhr3.readyState == 4 && xhr3.status == 200) {
			ageData = JSON.parse(xhr3.responseText);
			var young = 0;
			var adult=0;
			var old=0;
			var lengthOfAge = ageData.length
			console.log("lengthOfAge: "+lengthOfAge)
			var count=0;
			for ( var elemt in ageData) {
				for ( var a in ageData[elemt]) {
					count++
				}
			}
			var end = count/2
			for (var i = 0; i < lengthOfAge; i++) {
				for (var j = 0; j < end; j++) {
					console.log(ageData[1][j])
					if (ageData[1][j] <= 5) {
						young += ageData[0][j]
					} else if (ageData[1][j] > 5 && ageData[1][j] <= 10) {
						adult += ageData[0][j]
					} else {
						old += ageData[0][j]
					}
				}
				console.log("=================")
			}
			console.log("young=" + young / 2)
			console.log("adult=" + adult / 2)
			console.log("old=" + old / 2)
			var myBarChart = new Chart(barAge, {
				type : 'bar',
				options: {
					 legend: {
				          display: false
				        },
					title: {
						display : true,
						text : "歲數分類（浪浪數量）",
						fontSize : 24,
						fontColor : '#B03656'
			        },
		            scales: {
		            	xAxes: [{
		                    ticks: {
		                        fontSize: 20
		                    }
		                }],
		                yAxes: [{
		                    ticks: {
		                        beginAtZero:true,
		                        min: 0,
		                        max: 30
		                    }
		                  }]
		               }
		            },
				data : {
					labels : [ '0-5歲', '6-10歲', '11歲以上' ],
					datasets : [ {
						backgroundColor : [ 'rgba(255, 29, 88, 0.5)',
								'rgba(190, 239, 0, 0.5)',
								'rgba(200, 150, 102, 0.5)' ],
						borderColor : [ 'rgba(255, 29, 88,1)',
								'rgba(190, 239, 0, 1)',
								'rgba(200, 150, 102, 1)',],
						borderWidth : 1,
						label : '',
						data : [ young / 2, adult / 2, old / 2]
					} ]
				},
			});
			var total = ( young / 2)+(adult / 2)+(old / 2)
			var compare = {"0-5歲":young,"6-10歲":adult,"11歲以上":old}
			var max = young
			var maxLabel;
			for (var i = 0; i < 3; i++) {
				if (Object.values(compare)[i] >= max) {
					max = Object.values(compare)[i]
					maxLabel = Object.keys(compare)[i];
				}
			}
			$('.windowContent').append('<div class="noName"><span style="margin-left:5%">0-5歲</span><span style="margin-left:25%">'+young / 2+'</span><span style="margin-left:23%;font-weight:600">'+(((young / 2)/total)*100).toFixed(1)+'%</span></div>')
			$('.windowContent').append('<div class="noName"><span style="margin-left:5%">6-10歲</span><span style="margin-left:22%">'+adult / 2+'</span><span style="margin-left:25%;font-weight:600">'+(((adult / 2)/total)*100).toFixed(1)+'%</span></div>')
			$('.windowContent').append('<div class="noName"><span style="margin-left:5%">11歲以上</span><span style="margin-left:16%">'+old / 2+'</span><span style="margin-left:25%;font-weight:600">'+(((old / 2)/total)*100).toFixed(1)+'%</span></div>')
$('.windowContent').append('<hr><div style="text-align:center">以<img src="https://img.icons8.com/color/25/000000/back.png"/><span style="color:#AF2E41;font-weight:600">'+maxLabel+'</span><img src="https://img.icons8.com/color/25/000000/forward.png"/>為最多數</div>')
		}
	}
</script>
</html>