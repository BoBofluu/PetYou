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
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link type="text/css"
	href="<spring:url value='/css/OpenMouthBingo.css'/>" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>

	<div class="articlediv">
		<div class="bm">
			<div class="bm_h">
				<span class="bm_h_title">- 開 口 中 規 則 -</span>
			</div>
			<div class="bm_c">
				<ul class="infoul">
					<li>每次估數可得 <span>金幣 2 </span></li>
					<li>估中者要罰款 <span>金幣 10 </span></li>
					<li>大家可以在 <span>1-100</span> 內估一個數字
					</li>
					<li>如最後只剩兩個數字, 而又估不中, 便可得 <span>金幣 10 </span></li>
					<li>每個會員兩次估數字必須相隔 <span>30</span> 分鐘
					</li>
					<li>你上次操作的時間為: <span id="member-time">${omb.showTime}</span></li>
					<li>嚴禁兩個會員互相洗金幣, 違例者將可能會禁止玩開口中!!!</li>
					<li>目前有 <span>23</span> 個會員被禁止玩開口中
					</li>
				</ul>
			</div>
		</div>
		<div class="bm" style="border: none;" id="div-now">
			<div style="height: 50px;"></div>
			<div class="bm_c">
				<table class="infotable">
					<tbody>
						<tr>
							<td><input type="button" id="new-game" value="開新遊戲"
								style="display: none;"></td>
							<td><span class="openNumber" id="pre-Number"></span> <span
								class="openNumber" id="member-Number">至</span> <span
								class="openNumber" id="next-Number"></span> <input type="hidden"
								id="bingo-Number"></td>
						</tr>
						<tr>
							<td style="width: 18%;">遊戲編號：</td>
							<td id="play-Number"></td>
						</tr>
						<tr>
							<td>遊戲狀況：</td>
							<td id="play-Now-Status"></td>
						</tr>
						<tr>
							<td>開局者：</td>
							<td id="member-Name"></td>
						</tr>
						<tr>
							<td>最後估者：</td>
							<td id="member-Name-Last"></td>
						</tr>
						<tr>
							<td>最後時間：</td>
							<td id="member-Name-Time"></td>
						</tr>
						<tr>
							<td>機會率：</td>
							<td id="not-belong-me"></td>
						</tr>
						<tr>
							<td>估數過程：</td>
							<td id="play-press"></td>
						</tr>
						<tr>
							<td>估數字：</td>
							<td id="td-input"><input type="text" id="input-value"
								oninput="value=value.replace(/[^\d]/g,'')"> <input
								type="button" id="input-value-button" value="送出"> <span
								id="member-time-span"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="bm" style="border: none; display: none;" id="div-new">
			<div style="height: 50px;"></div>
			<div class="bm_c">
				<table class="infotable">
					<tbody>
						<tr>
							<td style="width: 18%;">開新遊戲</td>
							<td><input type="text" id="input-new"
								oninput="value=value.replace(/[^\d]/g,'')"> <input
								type="button" id="input-new-button" value="送出"> <input
								type="button" id="input-rollback" value="回上頁"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="rightdiv">
			<div class="bm">
				<div class="bm_h">
					<span class="bm_h_title">積分概況</span>
				</div>
				<div class="bm_c">
					<ul class="rightinfoul">
						<li><b>會員: ${omb.memberName}</b></li>
						<li><b>金幣: ${omb.memberId.coin}</b></li>
						<li><b>紅利: ${omb.memberId.bonus}</b></li>
					</ul>
				</div>
			</div>
			<div class="bm">
				<div class="bm_h">
					<span class="bm_h_title">個人記錄</span>
				</div>
				<div class="bm_c">
					<ul class="rightinfoul">
						<li>估中次數: ${omb.totalAttack} / ${omb.totalPlay}</li>
						<li>二份一次數: ${omb.totalHalf} / ${omb.totalPlay}</li>
						<li>不中比率: ${omb.countAttack}%</li>
						<c:choose>
							<c:when test="${omb.countCoin gt 0}">
								<li>總得失:+${omb.countCoin}</li>
							</c:when>
							<c:when test="${omb.countCoin eq 0}">
								<li>總得失:${omb.countCoin}</li>
							</c:when>
							<c:otherwise>
								<li>總得失:-${omb.countCoin}</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<div class="bm">
				<div class="bm_h">
					<span class="bm_h_title">遊玩回饋</span>
				</div>
				<div class="bm_c" style="text-align: center;">
					<a href="https://forms.gle/TY9Tbi8wDTAobsVq8">前往表單</a>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			//網頁一開始讀入的ajax
			$.ajax({
	            type: "get",
	            url: "<c:url value='/AjaxToOpenMouth'/>",
	            success: function(data) {
	            	//遊戲編號
	            	$("#play-Number").text(data.playNumber);
	            	//開局者
	            	$("#member-Name").text(data.ownerMemberName);
	            	//最後估者
	            	$("#member-Name-Last").text(data.memberName);
	            	//最後時間
	            	$("#member-Name-Time").text(data.showTime);
	            	//開局者的數字
	            	$("#bingo-Number").val(data.ownerNumber);
// 	            	console.log("data.ownerNumber:"+data.ownerNumber);
	            	
	            	if(data.memberNumber > data.ownerNumber){
	            		//前數字
		           		$("#pre-Number").text(data.preNumber);
	            		//後數字
	            		$("#next-Number").text(data.memberNumber);	            		
	            	}else if(data.memberNumber < data.ownerNumber){
		            	//前數字
			            $("#pre-Number").text(data.memberNumber);
		            	//後數字
		            	$("#next-Number").text(data.nextNumber);	
	            	}else{
		            	//前數字
			            $("#pre-Number").text(data.preNumber);
		            	//後數字
		            	$("#next-Number").text(data.nextNumber);
	            	}
	            	//機率
	            	var persent = $("#next-Number").text()-$("#pre-Number").text()-1;
	            	
	            	//遊戲狀況
	            	if(data.playStatus=='now' || data.playStatus=='owner'){	            		
	            		$("#play-Now-Status").text("正在進行中");
	            		$("#play-Now-Status").css("color","blue");
	            		$("#not-belong-me").text("1/"+persent);
	            	}else{
	            		$("#play-Now-Status").text("已結束");
	            		$("#play-Now-Status").css("color","red");
	            		$("#member-Number").text(data.ownerNumber);
		            	$("#not-belong-me").text("");
	            	}
	    			if ($("#play-Now-Status").text() == "已結束") {
	    				$("#new-game").show();
	    				$("#input-value").hide();
	    				$("#input-value-button").hide();
	    			}
	            }
	            //success結尾
			});
	        //ajax請求結尾 
	        
			//開新遊戲跟回上頁的click
			$("#new-game").click(function() {
				$("#div-now").hide();
				$("#div-new").show();
			})
			$("#input-rollback").click(function() {
				$("#div-new").hide();
				$("#div-now").show();
			})

			//輸入新遊戲的bingo後進入ajax
			$("#input-new-button").click(function() {
				var input_new = $("#input-new").val();
				if(input_new ==""){
					swal.fire({
						  title: "請輸入數字哦！",
						  confirmButtonText: "關閉"
						});
					return;
				}else if(input_new >= 100){
					swal.fire({
						  title: "請輸入100以內哦！",
						  confirmButtonText: "關閉"
						});
					return;
				}else if(input_new < 1){
					swal.fire({
						  title: "請輸入正確數字哦！",
						  confirmButtonText: "關閉"
						});
					return;
				}
				//開新按鈕隱藏
				$("#new-game").hide();
				//input
				$("#input-value").show();
	    		$("#input-value-button").show();
				//設定區間數字
				$("#pre-Number").text(1);
				$("#member-Number").text("至");
				$("#next-Number").text(100);
				//轉換div
				$("#div-new").hide();
				$("#div-now").show();
				$.ajax({
		            type: "post",
		            data: {"input_new":parseInt(input_new)},
		            url: "<c:url value='/AjaxToOpenMouth'/>",
		            success: function(data) {
		            	console.log("playTime:"+data.showTime);
		            	$("#play-Number").text(data.playNumber);
		            	$("#play-Now-Status").text("正在進行中");
	            		$("#play-Now-Status").css("color","blue");
		            	$("#member-Name").text(data.memberName);
		            	$("#member-Name-Time").text(data.showTime);
		            	$("#bingo-Number").val(data.memberNumber);
		            	$("#not-belong-me").text("1/98");
		           }
				});
			})
			//輸入數字後送出
			$("#input-value-button").click(function(){
            	var bingo_Number = $("#bingo-Number").val();
				var input_value = $("#input-value").val();
				var pre_value = parseInt($("#pre-Number").text());
				var next_value = parseInt($("#next-Number").text());
				var persent = $("#not-belong-me").text().split("/").pop();
				if(input_value == ""){
					swal.fire({
						  title: "請輸入數字哦！",
						  confirmButtonText: "關閉"
						});
					return;
				}else if(input_value > next_value){
					swal.fire({
						  title: "請輸入正確的範圍哦！",
						  confirmButtonText: "關閉"
						});
					return;
				}else if(input_value < pre_value){
					swal.fire({
						  title: "請輸入正確的範圍哦！",
						  confirmButtonText: "關閉"
						});
					return;
				}
				//要是猜的數字在區間的話
				if(input_value < next_value && input_value > pre_value){
					//要是猜的數字等於開局者的數字
					console.log("input_value:"+input_value);
					console.log("bingo_Number:"+bingo_Number);
					
					if(input_value == bingo_Number){
						var params={};
						params.preNumber = pre_value;
						params.memberNumber = parseInt(input_value);
						params.nextNumber = next_value;
						params.bingo_coin = parseInt(10);
						$.ajax({
				            type: "post",
				            data: params,
				            dataType: "json",
				            url: "<c:url value='/AjaxToOpenMouth_Bingo'/>"
						});
						swal.fire({
							title: "Ｂｏｍｂ！",
							text:"殘念，要被扣10金幣了...",
							timer: 2000,
							timerProgressBar: true,
							showConfirmButton: false
						}).then((result) => {
							window.location.href = "<spring:url value='/openMouth' />";
						})
					}
					//else要是猜的數字不等於的話
					else{
						//要是猜的數字不等於，然後機率又剩2分之1的話
						if(persent == 2){
							var params={};
							params.preNumber = pre_value;
							params.memberNumber = parseInt(input_value);
							params.nextNumber = next_value;
							params.bingo_coin = parseInt(10);
							params.enforceEnd = parseInt(0);
							$.ajax({
					            type: "post",
					            data: params,
					            dataType: "json",
					            url: "<c:url value='/AjaxToOpenMouth_NiceCatch'/>"
							});
							swal.fire({
								title: "太幸運了，二選一都猜不中！",
								text:"獎勵10金幣！兩秒後跳轉",
								timer: 2000,
								timerProgressBar: true,
								showConfirmButton: false
							}).then((result) => {
								window.location.href = "<spring:url value='/openMouth' />";
							})
						}
						//小if的結尾
						//要是直接把bingo包起來
						else if((bingo_Number*2)==(parseInt(input_value)+next_value) ||
								(bingo_Number*2)==(parseInt(input_value)+pre_value)){
							
							var params={};
							params.preNumber = pre_value;
							params.memberNumber = parseInt(input_value);
							params.nextNumber = next_value;
							params.bingo_coin = parseInt(2);
							params.enforceEnd = parseInt(1);
							$.ajax({
					            type: "post",
					            data: params,
					            dataType: "json",
					            url: "<c:url value='/AjaxToOpenMouth_NiceCatch'/>"
							});
							swal.fire({
								title: "巧妙迴避！",
								text:"獎勵2金幣！兩秒後跳轉",
								timer: 2000,
								timerProgressBar: true,
								showConfirmButton: false
							}).then((result) => {
								window.location.href = "<spring:url value='/openMouth' />";
							})
						}
						//包起來的結尾
						else{
							var params={};
							params.preNumber = pre_value;
							params.memberNumber = parseInt(input_value);
							params.nextNumber = next_value;
							params.bingo_coin = parseInt(2);
							params.enforceEnd = parseInt(0);
							$.ajax({
					            type: "post",
					            data: params,
					            dataType: "json",
					            url: "<c:url value='/AjaxToOpenMouth_NiceCatch'/>"
							});
							swal.fire({
								title: "巧妙迴避！",
								text:"獎勵2金幣！兩秒後跳轉",
								timer: 2000,
								timerProgressBar: true,
								showConfirmButton: false
							}).then((result) => {
								window.location.href = "<spring:url value='/openMouth' />";
							})
						}
						//小else的結尾
					}
					//大else的結尾
				}
				//大if的結尾
			})
			//click的結尾
			//設定秒數
			//180,000 = 1000毫秒 * 60秒 * 3分鐘 = 3分鐘的毫秒數      
			var member_time = new Date($("#member-time").text()).getTime() + 1800000;
	        var now = new Date().getTime();
	        var user_ID = ${userId};
	        console.log("user_ID:"+user_ID);
	        if(user_ID == 24){
	        	member_time = 0;
        	} 
	        console.log("member_time:"+member_time);
	        var distance = member_time - now;
	        var seconds = Math.floor((distance % (1000 * 60 * 60)) / 1000);
	        var now_time = function(){
	        	if($("#play-Now-Status").text() == "已結束"){
		            $("#member-time-span").text("");
		        }else if(distance > 0){
			        $("#input-value").hide();
			    	$("#input-value-button").hide();
	            	$("#member-time-span").text(seconds+" 秒 ");
		        }else if (distance < 0) {
		            clearInterval(run_time);
	            	$("#member-time-span").text("");
		        	$("#input-value").show();
		    		$("#input-value-button").show();
		        }else{
		           	$("#member-time-span").text("");
		        }
	        }();

	        var run_time = setInterval(function() {
	        	var now = new Date().getTime();
	        	var distance = member_time - now;
	        	var seconds = Math.floor((distance % (1000 * 60 * 60)) / 1000);
	        	if($("#play-Now-Status").text() == "已結束"){
	            	$("#member-time-span").text("");
	          	}
	          	else if(distance > 0){
		        	$("#input-value").hide();
		    		$("#input-value-button").hide();
            		$("#member-time-span").text(seconds+" 秒 ");
	          	}
	          	else if (distance < 0) {
	            	clearInterval(run_time);
            		$("#member-time-span").text("");
	        		$("#input-value").show();
	    			$("#input-value-button").show();
	          	}else{
	            	$("#member-time-span").text("");
	          	}
	        }, 1000);
	        //設定時間的結尾
		})
	</script>
</body>
</html>