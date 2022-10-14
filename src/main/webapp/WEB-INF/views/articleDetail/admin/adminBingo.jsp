<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link type="text/css"
	href="<spring:url value='/css/adminArticleBingo.css'/>"
	rel="stylesheet">
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

</head>
<body>
	<jsp:include
		page="/WEB-INF/views/articleDetail/admin/adminHomepage.jsp"></jsp:include>
	<div class="title-member">單筆數據分析</div>
	<div id="container-member">
		<div class="first-div">
			<canvas data-zr-dom-id="zr_0" width="1920" height="942"
				class="first-canvas"></canvas>
		</div>
	</div>
	<div class="title-total">總和數據分析</div>
	<div id="container-total">
		<div class="first-div">
			<canvas data-zr-dom-id="zr_0" width="1920" height="942"
				class="first-canvas"></canvas>
		</div>
	</div>
	<script type="text/javascript">
		var memberKey = Object.keys(${map});
		var memberValue = Object.values(${map});
		var goods_title = [];
		for(var i = 0 ; i < memberValue[1].length ; i++){
			goods_title.push(memberValue[1][i]);
		}
		var goods_count = [];
		for(var i = 0 ; i < memberValue[0].length ; i++){
			goods_count.push(memberValue[0][i]);
		}		
		var goods_bingo = [];
		for(var i = 0 ; i < memberValue[2].length ; i++){
			goods_bingo.push({
					name : i+1,
					type : 'bar',
					stack : '总量',
					label : {
						show : true,
						position : 'insideRight'
					},
					data :  memberValue[2][i] 
				});
		}
		console.log(goods_bingo);
		var dom = document.getElementById("container-member");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		option = {
			textStyle : {
				fontSize : 16,
				fontWeight : 900
			},
			tooltip : {
				trigger : 'axis',
				axisPointer : { // 坐标轴指示器，坐标轴触发有效
					type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			xAxis : {
				type : 'value',
				axisLabel : {
					textStyle : {
						fontSize : 16,
						fontWeight : 900
					}
				}
			},
			yAxis : {
				type : 'category',
				axisLabel : {
					textStyle : {
						fontSize : 16,
						fontWeight : 900
					}
				},
				data : goods_title
			},
			series : goods_bingo
		};
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
		
		 var dom_2 = document.getElementById("container-total");
	        var myChart = echarts.init(dom_2);
	        var app = {};
	        option = null;
	        option = {
	    		tooltip : {
	    			trigger : 'axis',
	    			axisPointer : { // 坐标轴指示器，坐标轴触发有效
	    			type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
	    			}
	    		},
				grid : {
					show:true,
					bottom:"40%"
				},
	            xAxis: {
	                type: 'category',
	                data: goods_title,
	                axisLabel: {  
                        interval: 0,
    					textStyle : {
    						fontSize : 16,
    						fontWeight : 900
    					},
                        formatter:function(value)  
                        {  
                            return value.split("").join("\n");  
                        }  
                    }
	            },
	            yAxis: {
	                type: 'value',
	                axisLabel: { 
						textStyle : {
							fontSize : 16,
							fontWeight : 900
						}
	            	}
	            },
	            series: [{
	                data: goods_count,
	                type: 'bar',
	                showBackground: true,
	                backgroundStyle: {
	                    color: 'rgba(220, 220, 220, 0.8)'
	                }
	            }]
	        };;
	        if (option && typeof option === "object") {
	            myChart.setOption(option, true);
	        }
	</script>
</body>

</html>