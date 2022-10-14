<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
</head>
<body>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<jsp:include page="aaaa.jsp"></jsp:include>
	<div style="width:1000px;margin-left:350px;">
    <div id="container" style="height: 1200px; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1605755109776"><div style="position: relative; width: 1536px; height: 666px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="1920" height="832" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 666px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div></div></div>
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
option = {
		color:['rgba(234,112,112,1)','rgba(253,196,182,1)','rgba(229,149,114,1)','rgba(38,148,171,1)','rgba(254,218,119,1)'],
 title: {
     text: '退貨原因分析',
     left: 'center'
 },
 tooltip: {
     trigger: 'item',
     formatter: '{a} <br/>{b} : {c} ({d}%)'
 },
 legend: {
     orient: 'vertical',
     left: 'right',
     data: ['商品與預期不符', '商品缺件', '我收到不對的商品', '商品有毀損', '商品部分功能無法使用']
 },
 series: [
     {
         name: '退貨原因',
         type: 'pie',
         radius: '55%',
         center: ['50%', '30%'],
         data: [
             {value: '${count.a}', name: '商品與預期不符'},
             {value: '${count.b}', name: '商品缺件'},
             {value: '${count.c}', name: '我收到不對的商品'},
             {value: '${count.d}', name: '商品有毀損'},
             {value: '${count.e}', name: '商品部分功能無法使用'}
         ],
         emphasis: {
             itemStyle: {
                 shadowBlur: 10,
                 shadowOffsetX: 0,
                 shadowColor: 'rgba(0, 0, 0, 0.5)'
             }
         }
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