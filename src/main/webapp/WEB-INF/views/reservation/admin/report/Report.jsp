<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>報表分析</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reservation/report.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/reservation/admin/functionNav.jsp"></jsp:include>
	<div class="main">
		<button id="shopReservatedCount-btn" type="button"
			class="btn-shopCount">店家預約統計</button>
		<!-- 雙柱狀 -->
		<button id="jackpot-btn" type="button" class="btn-shopCount">抽獎&出貨統計</button>
		<!-- 雙柱狀 -->
		<button id="feedback-btn" type="button" class="btn-shopCount">回饋比例</button>
		<!-- 圓餅:早中晚、線狀:時間 -->
		<button id="gender-btn" type="button" class="btn-shopCount">性別比例</button>
		<!-- 圓餅 -->
	</div>
	<div class="report-div-count" id="shopReservatedCount-div">
		<div class="totalReport-div" id="totalReport-div">
			<span class="total-report-title">總預約次數</span> <span id='total-count'
				class="total-report-data"></span> <span class="total-report-title">有效預約</span>
			<span id='total-exsist' class="total-report-data"></span> <span
				class="total-report-title">無效預約</span> <span id='total-dead'
				class="total-report-data"></span> <span class="total-report-title"
				style="padding-left: 200px; font-size: 20px">截止日期</span> <span
				id='total-time' class="total-report-title"></span><br>
		</div>
		<div id="shopReservatedCount-div-chart"
			style="height: 500px; width: 1000px; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">
			<div
				style="position: relative; width: 1536px; height: 666px; padding: 0px; margin: 0px; margin-top: 20px; border-width: 0px; cursor: default; margin-top: 20px;">
				<canvas data-zr-dom-id="zr_0" width="1920" height="832"
					style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 666px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 10px; margin: 0px; border-width: 0px;"></canvas>
			</div>
			<div
				style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px/21px&amp; amp; amp; amp; amp; quot; Microsoft YaHei&amp;amp; amp; amp; amp; quot;; padding: 5px; left: 1037px; top: 337px; pointer-events: none;">
				印度<br> <span
					style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 10px; height: 10px; background-color: #c23531;"></span>2011年:
				104,970<br> <span
					style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 10px; height: 10px; background-color: #2f4554;"></span>2012年:
				121,594
			</div>
		</div>
	</div>
	<div class="report-div-count" id="feedback-div" hidden="true"
            style="height:100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">
            <div id="feedback-pie"
			style="height: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: absolute;">
			<div style="margin-top:0px;position: relative; width: 1536px; height: 722px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
				<canvas data-zr-dom-id="zr_0" width="1920" height="902"
					style="position: absolute; left: 0px; top: -175px; width: 1536px; height: 722px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
			</div>
		</div>
        </div>
        
	<div class="report-div-count" id="gender-div" hidden="true">
		<div id="gender-pie"
			style="height: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">
			<div
				style="position: relative; width: 1536px; height: 722px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
				<canvas data-zr-dom-id="zr_0" width="1920" height="902"
					style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 722px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
			</div>
			<div
				style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px/21px&amp; amp; amp; amp; amp; amp; amp; amp; quot; Microsoft YaHei&amp;amp; amp; amp; amp; amp; amp; amp; quot;; padding: 5px; left: 627px; top: 491px; pointer-events: none;">
				访问来源 <br>搜索引擎 : 1548 (60.42%)
			</div>
		</div>
	</div>

	<div class="report-div-count" id="jackpot-div" hidden="true">
		<div id="jackpot-chart"
			style="height: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">
			<div
				style="position: relative; width: 1536px; height: 722px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
				<canvas data-zr-dom-id="zr_0" width="1920" height="902"
					style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 722px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
			</div>
			<div
				style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px/21px&amp; amp; amp; quot; Microsoft YaHei&amp;amp; amp; quot;; padding: 5px; left: 134px; top: 382px; pointer-events: none;">
				<span
					style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 10px; height: 10px; background-color: #c23531;"></span>map:
				3,237
			</div>
		</div>

	</div>


	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>

	<script type="text/javascript">
	
	//======================================================客訴=======================================
	$("#feedback-btn").click(function(){
		$("#shopReservatedCount-div").attr("hidden", true);
		$("#gender-div").attr("hidden", true);
		$("#jackpot-div").attr("hidden", true);
		$("#feedback-div").attr("hidden", false);
		
		var complaintkey = Object.keys(${complaintRecord});
		var complaintvalue = Object.values(${complaintRecord});
		
		
		var goodkey = Object.keys(complaintvalue[0]);
		var goodvalue = Object.values(complaintvalue[0]);
		var badkey = Object.keys(complaintvalue[1]);
		var badvalue = Object.values(complaintvalue[1]);

		var goodName = [], goodValue = [], badName = [], badValue = [];
		var complaint = {}
		for(let i = 0; i < goodkey.length; i++){
			complaint[goodkey[i]] = goodvalue[i];
			
		}
		for(let i = 0; i < badkey.length; i++){
			complaint[badkey[i]] = badvalue[i];
	}
	
		 var dom = document.getElementById("feedback-div");
         var myChart = echarts.init(dom);
         option = null;
 		option = {
 				title : {
 					text : '回饋比例圖',
 					subtext : '總計',
 					left : 'center'
 				},
 			tooltip : {
 				trigger : 'item',
 				formatter : '{a} <br/>{b} : {c} ({d}%)'
 			},
 			legend : {
 				orient : 'vertical',
 				left: '0	',
 				data : Object.keys(complaint).map(function (key) {
			         return {
				             name: key,
				         };
				     })
 			},
 			series : [ {
 				name : '',
 				type : 'pie',
 				radius : '55%',
 				center : [ '70%', '60%' ],
 				width: '700',
 				data : Object.keys(complaint).map(function (key) {
 				         return {
 				             name: key,
 				             value: complaint[key]
 				         };
 				     })
 				    ,
 				emphasis : {
 					itemStyle : {
 						shadowBlur : 10,
 						shadowOffsetX : 0,
 						shadowColor : 'rgba(0, 0, 0, 0.5)'
 					}
 				}
 			} ]
 		};
 		;
 		if (option && typeof option === "object") {
 			myChart.setOption(option, true);
 		}
	})
	//==================================================================性別===============================================
	$("#gender-btn").click(function(){
		$("#shopReservatedCount-div").attr("hidden", true);
		$("#gender-div").attr("hidden", false);
		$("#jackpot-div").attr("hidden", true);
		$("#feedback-div").attr("hidden", true);
		
		var dom = document.getElementById("gender-pie");
		var myChart = echarts.init(dom);
		
		var sexValue = Object.values(${sex})
		var sexKey = Object.keys(${sex})
		
		var sex = [], sexCount = [];
		for(let i = 0; i < sexValue.length; i++){
			sex.push(sexKey[i])
			sexCount.push(sexValue[i])
		}
		
		option = null;
		option = {
			title : {
				text : '預約會員性別比例',
				subtext : '總計',
				left : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : '{a} <br/>{b} : {c} ({d}%)'
			},
			legend : {
				orient : 'vertical',
				left: '100',
				data : [ sex[0], sex[1] ]
			},
			series : [ {
				name : '',
				type : 'pie',
				radius : '55%',
				center : [ '70%', '60%' ],
				width: '700',
				data : [ {
					value : sexValue[0],
					name : sex[0],
				}, {
					value : sexValue[1],
					name : sex[1],
				} ],
				emphasis : {
					itemStyle : {
						shadowBlur : 10,
						shadowOffsetX : 0,
						shadowColor : 'rgba(0, 0, 0, 0.5)'
					}
				}
			} ]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
	
	})
	//==================================================================抽獎===============================================	
	$("#jackpot-btn").click(function(){
		$("#shopReservatedCount-div").attr("hidden", true);
		$("#gender-div").attr("hidden", true);
		$("#jackpot-div").attr("hidden", false);
		$("#feedback-div").attr("hidden", true);
		
		var dom = document.getElementById("jackpot-chart");
		var myChart = echarts.init(dom);
		option = null;
		
		var shipKey = Object.keys(${shippingRecord})
		var shipValue = Object.values(${shippingRecord})

		
		//============================================出貨紀錄=======================================================
		var thisItemsCount = [], lastItemsCount = [], itemsName = [], maxValue;
		for(let i = 0; i < shipKey.length;i++){
			itemsName.push(shipKey[i])
		}
		
		for(let i = 0; i < shipValue.length; i++){
			if(maxValue < shipValue[i]){
				maxValue = shipValue[i];
			}
			lastItemsCount.push(shipValue[i][0])
			thisItemsCount.push(shipValue[i][1])
		}
		
		//============================================中獎紀錄=======================================================	
		var jackpotKey = Object.keys(${jackpotRecord})
		var jackpotValue = Object.values(${jackpotRecord})
		var thisJackpotCount = [], lastJackpotCount = [], jackpotName= [];
		
		var thisJackpot ={}, lastJackpot={};
		for(let i = 0; i < jackpotValue[0].length; i++) {
			thisJackpot[jackpotValue[0][i]]=jackpotValue[1][1][i];
			lastJackpot[jackpotValue[0][i]]=jackpotValue[1][0][i]
		}
		
		console.log(thisJackpot)
		console.log(lastJackpot)
		
		for(let i = 0; i < jackpotValue[0].length; i++) {
			jackpotName.push(jackpotValue[0][i])
		}
		
		
		var reducer = (accumulator, currentValue) => accumulator + currentValue;
		//用來累加陣列內的值: reduce() 方法將一個累加器及陣列中每項元素（由左至右）傳入回呼函式，將陣列化為單一值。
		var thisTotal, lastTotal;
		for(let i = 0; i < jackpotValue[1][0].length;i++){
			//去年
			lastJackpotCount.push(jackpotValue[1][0][i]);
			//今年
			thisJackpotCount.push(jackpotValue[1][1][i]);
		}
		lastTotal = lastJackpotCount.reduce(reducer);
		thisTotal = thisJackpotCount.reduce(reducer);
		
		var builderJson = {
		"all": maxValue,
		"charts": {
		 "map": 3237,
		 "lines": 2164,
		 "bar": 7561,
		 "line": 7778,
		 "pie": 7355,
		 "scatter": 2405,
		 "candlestick": 1842,
		 "radar": 2090,
		 "heatmap": 1762,
		 "treemap": 1593,
		 "graph": 2060,
		 "boxplot": 1537,
		 "parallel": 1908,
		 "gauge": 2107,
		 "funnel": 1692,
		 "sankey": 1568
		},
		"components": {
		 "geo": 2788,
		 "title": 9575,
		 "legend": 9400,
		 "tooltip": 9466,
		 "grid": 9266,
		 "markPoint": 3419,
		 "markLine": 2984,
		 "timeline": 2739,
		 "dataZoom": 2744,
		 "visualMap": 2466,
		 "toolbox": 3034,
		 "polar": 1945
		},
		"ie": 9743
		};

		var downloadJson = {
		"echarts.min.js": 17365,
		"echarts.simple.min.js": 4079,
		"echarts.common.min.js": 6929,
		"echarts.js": 14890
		};
		
		var themeJson = {
		"dark.js": 1594,
		"infographic.js": 925,
		"shine.js": 1608,
		"roma.js": 721,
		"macarons.js": 2179,
		"vintage.js": 1982
		};

		var waterMarkText = '';

		var canvas = document.createElement('canvas');
		var ctx = canvas.getContext('2d');
		canvas.width = canvas.height = 100;
		ctx.textAlign = 'center';
		ctx.textBaseline = 'middle';
		ctx.globalAlpha = 0.08;
		ctx.font = '20px Microsoft Yahei';
		ctx.translate(50, 50);
		ctx.rotate(-Math.PI / 4);
		ctx.fillText(waterMarkText, 0, 0);

		option = {
		 backgroundColor: {
		     type: 'pattern',
		     image: canvas,
		     repeat: 'repeat'
		 },
		 tooltip: {},
		 title: [{
		     text: '出貨紀錄統計(年)',
		     subtext: "上:" + ${lastYear} + "下:" + ${thisYear} ,
		     left: '25%',
		     textAlign: 'center'
		 }, {
		     text:${lastYear} + '中獎紀錄' ,
		     subtext: '總計抽獎次數:  ' + lastTotal,
		     left: '75%',
		     textAlign: 'center'
		 }, {
		     text: ${thisYear} + '中獎紀錄',
		     subtext: '總計抽獎次數:  ' + thisTotal,
		     left: '75%',
		     top: '50%',
		     textAlign: 'center'
		 }],
		 grid: [{
		     top: 50,
		     width: '50%',
		     bottom: '45%',
		     left: 10,
		     containLabel: true
		 }, {
		     top: '55%',
		     width: '50%',
		     bottom: 0,
		     left: 10,
		     containLabel: true
		 }],
		 xAxis: [{
		     type: 'value',
		     max: builderJson.all,
		     splitLine: {
		         show: false
		     }
		 }, {
		     type: 'value',
		     max: builderJson.all,
		     gridIndex: 1,
		     splitLine: {
		         show: false
		     }
		 }],
		 yAxis: [{
			//========================================去年柱狀圖=========================================
		     type: 'category',
		     data: itemsName,
		     axisLabel: {
		         interval: 0,
		         rotate: 30
		     },
		     splitLine: {
		         show: false
		     }
		 }, {
			//========================================今年柱狀圖=========================================
		     gridIndex: 1,
		     type: 'category',
		     data:itemsName,
		     axisLabel: {
		         interval: 0,
		         rotate: 30
		     },
		     splitLine: {
		         show: false
		     }
		 }],
		 series: [{
			//========================================去年柱狀圖=========================================
		     type: 'bar',
		     stack: 'chart',
		     z: 3,
		     label: {
		         normal: {
		             position: 'right',
		             show: true
		         }
		     },
		     data: lastItemsCount
		 }, {
		     type: 'bar',
		     stack: 'chart',
		     silent: true,
		     itemStyle: {
		         normal: {
		             color: '#eee'
		         }
		     },
		     data: lastItemsCount
		 }, {
			//========================================今年柱狀圖=========================================
		     type: 'bar',
		     stack: 'component',
		     xAxisIndex: 1,
		     yAxisIndex: 1,
		     z: 3,
		     label: {
		         normal: {
		             position: 'right',
		             show: true
		         }
		     },
		     data: thisItemsCount
		 }, {
			
		     type: 'bar',
		     stack: 'component',
		     silent: true,
		     xAxisIndex: 1,
		     yAxisIndex: 1,
		     itemStyle: {
		         normal: {
		             color: '#eee'
		         }
		     },
		     data: thisItemsCount
		 }, {
			
			//========================================去年圓餅圖=========================================
		     type: 'pie',
		     radius: [0, '30%'],
		     center: ['75%', '25%'],
		     data: Object.keys(lastJackpot).map(function (key) {
		         return {
		             name: key,
		             value: lastJackpot[key]
		         };
		     })
		 }, {
			//========================================今年圓餅圖=========================================
		     type: 'pie',
		     radius: [0, '30%'],
		     center: ['75%', '75%'],
		     data: Object.keys(thisJackpot).map(function (key) {
		         return {
		             name: key,
		             value: thisJackpot[key]
		         };
		     })
		 }]
		};;
		if (option && typeof option === "object") {
		 myChart.setOption(option, true);
		}
	})
	
//==============================================預約總次數統計:去年比較今年=======================================
	$("#shopReservatedCount-btn").click(function(){
			$("#shopReservatedCount-div").attr("hidden", false);
			$("#gender-div").attr("hidden", true);
			$("#jackpot-div").attr("hidden", true);
			$("#location-div").attr("hidden", true);
			$("#timing-div").attr("hidden", true);
			$("#feedback-div").attr("hidden", true);
		})	
	
		var dom = document.getElementById("shopReservatedCount-div-chart");
		var myChart = echarts.init(dom);

		var yearKey = Object.keys(${sum});
		var yearValue = Object.values(${sum});

		var shopName = [] , thisYearCount = [], lastYearCount = [];
		for(let i = 0; i < yearValue[0].length; i++){
			shopName.push(yearValue[0][i])
		}
		for(let i = 0; i < yearValue[1][0].length; i++){
			thisYearCount.push(yearValue[1][0][i])
		}
		for(let i = 0; i < yearValue[1][1].length; i++){
			lastYearCount.push(yearValue[1][1][i])
		}

		option = null;
		var goods_bingo = [];

		option = {
			title : {
				text : '各店家預約總次數統計表',
				subtext : '',
			},
			tooltip : {
				trigger : 'axis',
				axisPointer : {
					type : 'shadow'
				}
			},
			legend : {
				data : ['${lastYear}', '${thisYear}']
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			xAxis : {
				type : 'value',
				boundaryGap : [ 0, 0.01 ]
			},
			yAxis : {
				type : 'category',
				data : shopName,
			},
			series : [ {
				name : ${lastYear} ,//去年
				type : 'bar',
				itemStyle : {
					normal : {
						color : '#888888',
					}
				},
				data : lastYearCount

			}, {
				name : ${thisYear},//今年
				type : 'bar',
				itemStyle : {
					normal : {
						color : 'pink',
					}
				},
				data : thisYearCount
			} ]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
		
//================================================累計次數統計===================================
			var totalReportKey = Object.keys(${report}) //["reservation", "exsistOrder", "deadOrder"]
			var totalReportValue = Object.values(${report})
			var report = [];
			var reportValue = [];
			for(let i = 0; i < totalReportKey.length; i++){
				report.push(totalReportKey[i]);
				reportValue.push(totalReportValue[i]);
			}

			$("#total-count").text(totalReportValue[0])
			$("#total-exsist").text(totalReportValue[1])
			$("#total-dead").text(totalReportValue[2])
			var date = new Date();
			$("#total-time").text(date.getFullYear() + "/" + (date.getMonth()+1) + "/" + date.getDate());
			
//=========================================性別比例統計===================================
				
	</script>
</body>
</html>