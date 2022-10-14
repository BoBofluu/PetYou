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
	href="<spring:url value='/css/adminArticleOpenMouth.css'/>"
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
	<div class="title-member">開口中遊玩人數分析</div>
	<div id="container">
		<div>
			<canvas></canvas>
		</div>
	</div>
	<br>
	<div class="title-member-2">開口中排行榜</div>
		<table class="member-table">
			<tbody>
			<tr class="member-table-fist-tr">
			<td>會員ID</td>
			<td>會員暱稱</td>
			<td>總得失</td>
			<td>猜中次數</td>
			<td>二分之一次數</td>
			<td>總遊玩次數</td>
			<td>最後遊玩時間</td>
			</tr>
	<c:forEach var="omb" items="${omb}">
				<tr>
					<td>
					<span>${omb.memberId.memberID}</span>
					</td>
					<td>
					<span>${omb.memberName}</span>
					</td>
					<td>
					<span>${omb.countCoin}</span>
					</td>
					<td>
					<span>${omb.totalAttack}</span>
					</td>
					<td>
					<span>${omb.totalHalf}</span>
					</td>
					<td>
					<span>${omb.totalPlay}</span>
					</td>
					<td>
					<span>${omb.showTime}</span>
					</td>
				</tr>
	</c:forEach>
			</tbody>
		</table>
		<footer style="height: 100px;">
		</footer>
	<script type="text/javascript">
		var memberKey = Object.keys(${map});
		var memberValue = Object.values(${map});
		console.log("memberKey:"+memberKey);
		console.log("memberValue:"+memberValue[1]);
		var no_player = {};
		no_player.value = memberValue[0]-memberValue[1];
		no_player.name = '未遊玩人數';
		var player = {};
		player.value = memberValue[1];
		player.name = '已遊玩人數';
		
	
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		option = {
			tooltip : {
				trigger : 'item',
				formatter : '{a} <br/>{b} : {c} ({d}%)'
			},
			color : [ '#b1d3c5', '#d18063' ],
			series : [ {
				name : '開口中',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				itemStyle : {
					normal : {
						label : {
							textStyle : {
								color : 'black',
								fontSize : 30,
								fontWeight : 'bolder'
							}
						},
						labelLine : {
							lineStyle : {
								color : 'black'
							}
						}
					}
				},
				data : [player,no_player],
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
	</script>

</body>
</html>