<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE htmls>
<html style="height:100%;">
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
</head>
<body style="height: 100%; margin: 0">


<script id="__bs_script__">//<![CDATA[
    document.write("<script async src='/browser-sync/browser-sync-client.js?v=2.26.7'><\/script>".replace("HOST", location.hostname));
//]]></script><script async="" src="/browser-sync/browser-sync-client.js?v=2.26.7"></script>
<jsp:include page="../petHomepage.jsp"></jsp:include>
	<jsp:include page="aaaa.jsp"></jsp:include>
	<div style="width: 220px;display: inline-block;position: absolute;right: 0;">
		<div style="position: relative;right: 35px;margin-top: 60px;font-weight: 400;">
			本類別最熱賣商品為:<br>${Commodity.aaid }<br>單價:<b>${Commodity.dogHotPrice}</b>元<br>
			本類別銷售總金額為:<br><b style="color:red;">${Commodity.sum1}</b>元
		</div>
		<div style="position: relative;right:35px; margin-top: 60px;font-weight: 400;">
			本類別最熱賣商品為:<br>${Commodity.bbid }<br>單價:<b>${Commodity.catHotPrice }</b>元<br>
			本類別銷售總金額為:<br><b style="color:red;">${Commodity.sum2}</b>元
		</div>
		<div style="position: relative;right:35px; margin-top: 60px;font-weight: 400;">
			本類別最熱賣商品為:<br>${Commodity.ccid }<br>單價:<b>${Commodity.otherHotPrice }</b>元<br>
			本類別銷售總金額為:<br><b style="color:red;">${Commodity.sum3}</b>元
		</div>
	</div>
	<div style="width:1000px;margin-left:350px;">
    <div id="container" style="height: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1605775426541"><div style="position: relative; width: 1536px; height: 722px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="1920" height="902" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 722px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px / 21px &quot;Microsoft YaHei&quot;; padding: 5px; left: 878px; top: 484px; pointer-events: none;">毛孩用品<br><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#c23531;"></span>銷售數量: 30<br><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#2f4554;"></span>銷售平均金額: 110<br><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#61a0a8;"></span>最熱賣商品: 63</div></div>
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
   
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
    <script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;

var weatherIcons = {
 
};

var seriesLabel = {
 normal: {
     show: true,
     textBorderColor: '#333',
     textBorderWidth: 2
 }
}

option = {
 title: {
     text: '熱賣商品分析'
 },
 tooltip: {
     trigger: 'axis',
     axisPointer: {
         type: 'shadow'
     }
 },
 legend: {
     data: ['City Alpha', 'City Beta', 'City Gamma']
 },
 grid: {
     left: 100
 },
 toolbox: {
//      show: true,
     feature: {
//          saveAsImage: {}
     }
 },
 xAxis: {
     type: 'value',
     name: '',
     axisLabel: {
         formatter: '{value}'
     }
 },
 yAxis: {
     type: 'category',
     inverse: true,
     data: ["汪汪城堡", "愛貓園地","毛孩用品"],
     axisLabel: {
         formatter: function (value) {
             return  value ;
         },
         margin: 20,
         rich: {
             value: {
                 lineHeight: 30,
                 align: 'center'
             },
             Sunny: {
                 height: 40,
                 align: 'center',
                 backgroundColor: {
                     image: weatherIcons.Sunny
                 }
             },
             Cloudy: {
                 height: 40,
                 align: 'center',
                 backgroundColor: {
                     image: weatherIcons.Cloudy
                 }
             },
             Showers: {
                 height: 40,
                 align: 'center',
                 backgroundColor: {
                     image: weatherIcons.Showers
                 }
             }
         }
     }
 },
 series: [
     {
         name: '本類別銷售數量',
         type: 'bar',
         data: ['${Commodity.dog}', '${Commodity.cat}', '${Commodity.other}'],
         label: seriesLabel,
         markPoint: {
             symbolSize: 1,
             symbolOffset: [0, '50%'],
             label: {
                 formatter: '{a|{a}\n}{b|{b} }{c|{c}}',
                 backgroundColor: 'rgb(242,242,242)',
                 borderColor: '#aaa',
                 borderWidth: 1,
                 borderRadius: 4,
                 padding: [4, 10],
                 lineHeight: 26,
                 // shadowBlur: 5,
                 // shadowColor: '#000',
                 // shadowOffsetX: 0,
                 // shadowOffsetY: 1,
                 position: 'right',
                 distance: 20,
                 rich: {
                     a: {
                         align: 'center',
                         color: '#fff',
                         fontSize: 18,
                         textShadowBlur: 2,
                         textShadowColor: '#000',
                         textShadowOffsetX: 0,
                         textShadowOffsetY: 1,
                         textBorderColor: '#333',
                         textBorderWidth: 2
                     },
                     b: {
                         color: '#333'
                     },
                     c: {
                         color: '#ff8811',
                         textBorderColor: '#000',
                         textBorderWidth: 1,
                         fontSize: 22
                     }
                 }
             },
             
         }
     },
     {
         name: '本類別銷售平均金額',
         type: 'bar',
         label: seriesLabel,
         data: ['${Commodity.average1}', '${Commodity.average2}','${Commodity.average3}']
     },
     {
         name: '最熱賣商品販售數量',
         type: 'bar',
         label: seriesLabel,
         data: [' ${Commodity.max1}','${Commodity.max2}', '${Commodity.max3}']
     }
 ]
};
;
if (option && typeof option === "object") {
 myChart.setOption(option, true);
}
    </script>
	
</body>
</html>