<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	body,html{
		margin:0px;
		height:100%
	}
</style>
</head>
<body>
    <div id="container"
        style="height: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;"
        _echarts_instance_="ec_1605510882476">
        <div
            style="position: relative; width: 1536px; height: 666px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
            <canvas data-zr-dom-id="zr_0" width="1920" height="832"
                style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 666px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
        </div>
        <div
            style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px / 21px &quot;Microsoft YaHei&quot;; padding: 5px; left: 842px; top: 332px; pointer-events: none;">
            访问来源 <br>营销广告: 679 (26.5%)</div>
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
    <!-- <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&amp;ak=xfhhaTThl11qYVrqLZii6w8qE5ggnhrY&amp;__ec_v__=20190126"></script><script type="text/javascript" src="https://api.map.baidu.com/getscript?v=2.0&amp;ak=xfhhaTThl11qYVrqLZii6w8qE5ggnhrY&amp;services=&amp;t=20200914160603"></script> -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
    <script type="text/javascript">
// 主程式
		var count= [];
		var result=[];
       	$(document).ready(function() {
       		var url = "<c:url value='/activityAdmin/report'/>";
       		$.ajax({
       			type: 'GET',
       			url: url,
       			success: function(data) {
       				
       				for(key in data){
       					var object = new Object();
//        					console.log("key="+key+",value="+data[key]);			
       					object.name = key;
       					object.value = data[key];
       					result.push(object)
       				}

				       	var dom = document.getElementById("container");
				        var myChart = echarts.init(dom);
				        var app = {};
				        option = null;
				        option = {
				            tooltip: {
				                trigger: 'item',
				                formatter: '{a} <br/>{b}: {c} 個'
				            },
				            legend: {
				                orient: 'vertical',
				                left: 30, 
				                top: 30,
				                data: result
				            },
				            series: [
				                {
				                    name: '活動',
				                    type: 'pie',
				                    selectedMode: 'single',
				                    radius: [0, '60%'],
				
				                    label: {
				                        position: 'inner'
				                    },
				                    labelLine: {
				                        show: false
				                    },
				                    data: 
				                    	result
				                },
				                {
				                    name: '活動',
				                    type: 'pie',
				                    radius: ['70%', '80%'],
				                    label: {
				                        formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  個  ',
				                        backgroundColor: '#eee',
				                        borderColor: '#aaa',
				                        borderWidth: 1,
				                        borderRadius: 4,
				                        // shadowBlur:3,
				                        // shadowOffsetX: 2,
				                        // shadowOffsetY: 2,
				                        // shadowColor: '#999',
				                        // padding: [0, 7],
				                        rich: {
				                            a: {
				                                color: '#999',
				                                lineHeight: 22,
				                                align: 'center'
				                            },
				                            // abg: {
				                            //     backgroundColor: '#333',
				                            //     width: '100%',
				                            //     align: 'right',
				                            //     height: 22,
				                            //     borderRadius: [4, 4, 0, 0]
				                            // },
				                            hr: {
				                                borderColor: '#aaa',
				                                width: '100%',
				                                borderWidth: 0.5,
				                                height: 0
				                            },
				                            b: {
				                                fontSize: 16,
				                                lineHeight: 33
				                            },
				                            per: {
				                                color: '#eee',
				                                backgroundColor: '#334455',
				                                padding: [2, 4],
				                                borderRadius: 2
				                            }
				                        }
				                    },
				                    data: result
				                }
				            ]
				        };;
				        if (option && typeof option === "object") {
				            myChart.setOption(option, true);
				        }
       			}
       		});     		   		
       	});
		
        
    </script>
</body>
</html>