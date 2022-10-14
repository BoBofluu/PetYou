<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>

.wrapper {
	
	width: 1200px;
	margin: 5px auto 15px;
}

.sidemenu {
	float: left;
	width: 300px;
	background-color: #ffffff;
	border-radius: 15px;
	font-size: 2em;
	box-shadow: 12px 12px 7px #dfe3e8;
}

.main {
	
	height: 500px;
	display: block;
	float: right;
	width: 850px;
}

.clearfix::after {
	content: ";
	display: block;
	clear: both;
}

.sidemenu ul li {
	margin: 20px;
	cursor: pointer;
}

.sidemenu ul li:hover {
	font-weight: bold;
	color: #8D5433;
}
.form-table {
	background-color: #ffffff;
	border-radius: 15px;
	padding:10px;
	box-shadow: 12px 12px 7px #dfe3e8;
}

.form-item {
	display: flex;
	padding: 10px 0;
	margin: 15px; 
	border:1px solid white;
}

.fih{
	height:50px;
}

.form-title {
	
	color: #666;
	font-weight: bold;
	margin: 8px 0;
	font-size:x-large;
	
}

.form-label {
	width: 155px;
	text-align: right;
	margin-right: 10px;
	padding-right:5px;
	font-size:25px;
	font-weight:bold;
}

.input-holder {
	width: 300px;
	outline: 0;
	border-radius: 10px;
	text-align: center;
	border:0px;
	background-color:#f6c2cd;
	height: 45px;
}

.theselect{
	width: 147px;
	padding: 0 0 0 30px;
	border:0px;
	background-color:#f6c2cd;
	border-radius: 10px;
	outline: 0; 
	height:45px;
}

.salonIcon {
	overflow: hidden;
	height: 200px;
}

.btnAdd{ 
 	outline: 0; 
 	width:80px;
 	padding-bottom:30px;
 	border-radius:5px;
	border:0px; 
	background-color:#F5AAAF;
} 

img {
	border-radius: 5px;
}

</style>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<form method = "post" action = "<c:url value='/Member/shop/Update' />" enctype="multipart/form-data">
		<div class="wrapper clearfix">
			<div class="sidemenu">

				<ul style="list-style: none; line-height: 20px;">
				
					<li id="clickbasic">
						<i class="fa fa-address-card" aria-hidden="true">基本資訊</i>
							
						<i id="angle1" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					
					<li id="clicktime">
						<i class="fa fa-clock-o" aria-hidden="true">營業時間</i>
							
						<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					
					<li id="clickinfo">
						<i class="fa fa-info-circle" aria-hidden="true">細節項目</i>
							
						<i id="angle3" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					
					<li id="clickphoto">
						<i class="fa fa-camera" aria-hidden="true">環境照片</i>
							
						<i id="angle4" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					
				</ul>
			</div>

			<div class="main">
				<div id="divbasic">
				<div class="form-title">基礎資訊</div>
				<div class="form-table">
					<div class="form-item fih">
						<label class="form-label">店名</label>
						<div class="form-controler">
							<input type="text"  class="input-holder" id="shopName" name="shopName"
									placeholder="輸入店名" autocomplete="off" />
						</div>
					</div>
					<hr>
					<div class="form-item fih">
						<label class="form-label">類型</label>
						<div class="form-controler">
							<label>
         						<input type="radio" name="type" id="t1" value="美容" style="margin:10px">美容<br>
         					</label>
         					<label>
								<input type="radio" name="type" id="t2" value="醫療" style="margin:10px">醫療<br>
							</label>
							<label>
								<input type="radio" name="type" id="t3" value="旅館" style="margin:10px">旅館<br>
							</label>
							<label>
								<input type="radio" name="type" id="t4" value="餐廳" style="margin:10px">餐廳<br>
							</label>
							
						</div>
					</div>
					<hr>
					<div class="form-item fih">
						<label class="form-label">電話</label>
						<div class="form-controler">
							<input type="text"  class="input-holder" id="phone" name="phone"
									placeholder="輸入電話" autocomplete="off" maxlength="10"
									onkeyup="value=this.value.replace(/\D+/g,'');"/>
						</div>
					</div>
					<hr>
					<div class="form-item fih" style="height:120px">
						<label class="form-label">地址</label>
						<div class="form-controler" >
							<select name="city" id="city"  class="theselect" >
								<option value="-1" disabled selected>縣市</option>
							</select>
	
							<select name="township" id="township"  class="theselect" >
								<option value="-1" disabled selected>鄉鎮市區</option>
							</select>
							<br><br>
							<input type="text" class="input-holder" id="lastaddress"  placeholder="街道巷弄" autocomplete="off" style=""/>
							<div style="display:none">
								<input type="hidden"  class="input-holder" id="address" name="address" style="display:none"/>
							</div>
						</div>
					</div>
<!-- 					<div class="form-item fih"> -->
<!-- 						<label class="form-label">地址</label> -->
<!-- 						<div class="form-controler"> -->
<!-- 							<input type="text"  class="input-holder" id="address" name="address" -->
<!-- 									placeholder="輸入地址" autocomplete="off" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<hr>
					<div class="form-item fih">
						<label class="form-label">營業登記</label>
						<div class="form-controler">
							<input type="text"  class="input-holder" id="propertyPermit" name="propertyPermit"
									placeholder="輸入營業登記" autocomplete="off" />
						</div>
						<div id="checkPropertyPermit">&nbsp;</div> 
					</div>
					<hr>
					<div class="form-item fih">
						<label class="form-label">email</label>
						<div class="form-controler">
							<input type="text"  class="input-holder" id="email" name="email"
									placeholder="輸入email" autocomplete="off" />
						</div>
						<div id ="checkEmail"></div>
							
							<script type="text/javascript">
							document.getElementById("email").onblur = function() {
								var ce = document.getElementById('checkEmail');
								var emailValue = document.getElementById("email").value;
								
								if (!emailValue) {
									ce.innerHTML = "<font color='white' size='-2'>&nbsp;</font>";
									return;
								}
//					 			https://ithelp.ithome.com.tw/articles/10094951
								emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
								if (emailValue.search(emailRule) != -1){
								}else{
									ce.innerHTML = "<font color='red' size='-2'>email格式不正確</font>";
									return;
								}
							}
							</script>
						
					</div>
					
					<div class="form-item fih">
						<div style="display:flex;">
							<input type="button" class="btnAdd" value="下一頁"
								style="margin-left:720px;" id="basicNextPage"/>
						</div>
					</div>	
					</div><!-- table -->
					<div class=" fih"></div>
				
				</div>
<!-- =========================================================================================================================================== -->				
				<div id="divtime">
				<div class="form-title">營業時間</div>
				<div class="form-table">
					<div class="form-item fih">
						<label class="form-label">
	                    	<input type="checkbox"  value="全年無休" style="margin-right:20px" id="workAllTime">全年無休
	               		</label>
					</div>
					<hr>
					<div class="form-item fih">
						
						<label class="form-label">
							<input type="checkbox"  value="星期一" style="margin-right:20px" id="workOnmon">星期一
						</label>
						
						<div class="form-controler">
							<select name="monStart_Time" id="monStart_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
							&#126;
							<select name="monEnd_Time" id="monEnd_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
							<input type="button"  value="全部套用" style="margin-left:200px" id="allTheRest">
							
						</div>		
					</div>
					<hr>
					<div class="form-item fih">
						<label class="form-label">
							<input type="checkbox"  value="星期二" style="margin-right:20px" id="workOntue">星期二
						</label>
						<div class="form-controler">
							<select name="tueStart_Time" id="tueStart_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
							&#126;
							<select name="tueEnd_Time" id="tueEnd_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
						</div>		
					</div>	
					<hr>
					<div class="form-item fih">
						<label class="form-label">
							<input type="checkbox"  value="星期三" style="margin-right:20px" id="workOnwed">星期三
						</label>
						<div class="form-controler" style="width: 400px;">
							<select name="wedStart_Time" id="wedStart_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
							&#126;
							<select name="wedEnd_Time" id="wedEnd_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
						</div>		
					</div>	
					<hr>
					<div class="form-item fih">
						<label class="form-label">
							<input type="checkbox"  value="星期四" style="margin-right:20px" id="workOnthu">星期四
						</label>
						<div class="form-controler">
							<select name="thuStart_Time" id="thuStart_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
							&#126;
							<select name="thuEnd_Time" id="thuEnd_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
						</div>		
					</div>	
					<hr>
					<div class="form-item fih">
						<label class="form-label">
							<input type="checkbox"  value="星期五" style="margin-right:20px" id="workOnfri">星期五
						</label>
						<div class="form-controler">
							<select name="friStart_Time" id="friStart_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
							&#126;
							<select name="friEnd_Time" id="friEnd_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
						</div>		
					</div>	
					<hr>
					<div class="form-item fih">
						<label class="form-label">
							<input type="checkbox"  value="星期六" style="margin-right:20px" id="workOnsat">星期六
						</label>
						<div class="form-controler">
							<select name="satStart_Time" id="satStart_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
							&#126;
							<select name="satEnd_Time" id="satEnd_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
						</div>		
					</div>	
					<hr>
					<div class="form-item fih">
						<label class="form-label">
							<input type="checkbox"  value="星期日" style="margin-right:20px" id="workOnsun">星期日
						</label>
						<div class="form-controler">
							<select name="sunStart_Time" id="sunStart_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
							&#126;
							<select name="sunEnd_Time" id="sunEnd_Time" disabled="disabled">
								<option value="-1" >請選擇</option>
							</select>
						</div>
					</div>	
					<div class="form-item fih">
						<div style="display:flex">
							<input type="button"  value="上一頁" class="btnAdd"
								style="float:left" id="timePreviousPage"/>
															
							<input type="button" value="下一頁" class="btnAdd"
								style="margin-left:638px;" id="timeNextPage"/>
						</div>
					</div>
<!-- ================================================================================================================ -->					
			
<!-- ================================================================================================================ -->						
<!-- 				<script> -->
<!-- // // 				var theTiming = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30",  -->
<!-- // // 								 "04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30", -->
<!-- // // 					 			 "08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30", -->
<!-- // // 								 "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30", -->
<!-- // // 								 "16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30", -->
<!-- // // 								 "20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30", -->
<!-- // // 								 "24:00"]; -->
<!-- // // 				var days = ["mon","tue","wed","thu","fri","sat","sun"]; -->
				
<!-- // // 				//時間初始化 -->
<!-- // // 				days.forEach(function(day){ -->
<!-- // // 					timing($("#"+day+"Start_Time")[0]); -->
<!-- // // 				}); -->

<!-- // // 				//全年無休動作 -->
<!-- // // 				$("#workAllTime").click(function(){ -->
<!-- // // 					days.forEach(function(day){ -->
<!-- // // 						if($("#workAllTime").prop("checked")){ -->
<!-- // // 							$("#allTheRest").attr("disabled","disabled"); -->
<!-- // // 							$("#workOn"+day).attr("disabled","disabled");  -->
<!-- // // 							$("#"+day+"Start_Time").attr("disabled","disabled");  -->
<!-- // // 							$("#"+day+"End_Time").attr("disabled","disabled"); 	 -->
<!-- // // 						}else{ -->
<!-- // // 							if($("#monStart_Time").val() != -1 && $("#monEnd_Time").val() != -1 &&　$("#workOnmon").prop("checked")) -->
<!-- // // 		 						$("#allTheRest").removeAttr("disabled");  -->
<!-- // // 							else  -->
<!-- // // 								$("#allTheRest").attr("disabled","disabled"); -->
<!-- // // 							$("#workOn"+day).removeAttr("disabled"); -->
<!-- // // 							if($("#"+day+"Start_Time").val() != -1 && $("#"+day+"End_Time").val() != -1){ -->
<!-- // // 								$("#"+day+"Start_Time").removeAttr("disabled"); -->
<!-- // // 								$("#"+day+"End_Time").removeAttr("disabled"); -->
<!-- // // 							}	 -->
<!-- // // 						} -->
<!-- // // 					}); -->
<!-- // // 				}); -->
				
<!-- // // 				//開啟時間動作 -->
<!-- // // 				$("#workOnmon").click(function(){ -->
<!-- // // 					if($("#monStart_Time").val() != -1 && $("#monEnd_Time").val() != -1 &&　$("#workOnmon").prop("checked")) -->
<!-- // //  						$("#allTheRest").removeAttr("disabled");  -->
<!-- // // 					else $("#allTheRest").attr("disabled","disabled");  -->
<!-- // // 					openTheTime(days[0]); -->
<!-- // // 				}) -->
				
<!-- // // 				$("#workOntue").click(function(){ openTheTime(days[1]); }) -->
<!-- // // 				$("#workOnwed").click(function(){ openTheTime(days[2]); }) -->
<!-- // // 				$("#workOnthu").click(function(){ openTheTime(days[3]); }) -->
<!-- // // 				$("#workOnfri").click(function(){ openTheTime(days[4]); }) -->
<!-- // // 				$("#workOnsat").click(function(){ openTheTime(days[5]); }) -->
<!-- // // 				$("#workOnsun").click(function(){ openTheTime(days[6]); }) -->
				
<!-- // // 				//開啟時間方法 -->
<!-- // // 				function openTheTime(day){ -->
<!-- // // 					if($("#workOn"+day).prop("checked")){ -->
<!-- // // 						$("#"+day+"Start_Time").removeAttr("disabled"); -->
<!-- // // 						$("#"+day+"End_Time").removeAttr("disabled");  -->
<!-- // // 					}else{ -->
<!-- // // 						$("#"+day+"Start_Time").attr("disabled","disabled");  -->
<!-- // // 						$("#"+day+"End_Time").attr("disabled","disabled"); 	 -->
<!-- // // 					} -->
<!-- // // 				} -->
				
<!-- // // 				//預設套用關閉 -->
<!-- // // 				$("#allTheRest").attr("disabled","disabled");  -->
				
<!-- // // 				//由星期一來開啟套用全部 -->
<!-- // // 				$("#monStart_Time").on("change",function(){ -->
<!-- // // 					giveNextTime("mon"); -->
<!-- // // 					if($("#monStart_Time").val() == -1 || $("#monEnd_Time").val() == -1){ -->
<!-- // // 						$("#allTheRest").attr("disabled","disabled");  -->
<!-- // // 					}else{ -->
<!-- // // 						$("#allTheRest").removeAttr("disabled"); -->
<!-- // // 					} -->
<!-- // // 				}) -->
				
<!-- // // 				//設立下一個時間動作 -->
<!-- // // 				for(let theDay = 1; theDay < days.length ; theDay++){ -->
<!-- // // 					$("#"+days[theDay]+"Start_Time").on("change",function(){giveNextTime(days[theDay]);}) -->
<!-- // // 				} -->
					
<!-- // // 				//設立下一個時間方法 -->
<!-- // // 				function giveNextTime(day){ -->
<!-- // // 					var mst = parseInt($("#"+day+"Start_Time").val()); -->
<!-- // // 					var End_Time = $("#"+day+"End_Time")[0]; -->

<!-- // // 					End_Time.options.length = 0; -->
<!-- // // 					var new_option = new Option("請選擇", -1); -->
<!-- // // 					End_Time.classList.add("theselect"); -->
<!-- // // 					End_Time.options.add(new_option); -->
					
<!-- // // 					for(var i = mst+1;i < 49 ;i++){ -->
<!-- // // 						var new_option = new Option(theTiming[i], i); -->
<!-- // // 						End_Time.classList.add("theselect"); -->
<!-- // // 						End_Time.options.add(new_option); -->
<!-- // // 					} -->
<!-- // // 				} -->

<!-- // // 				//由星期一來開啟套用全部 -->
<!-- // // 				$("#monEnd_Time").on("change",function(){ -->
<!-- // // 					if($("#monStart_Time").val() == -1 || $("#monEnd_Time").val() == -1){ -->
<!-- // // 						$("#allTheRest").attr("disabled","disabled");  -->
<!-- // // 					}else{ -->
<!-- // // 						$("#allTheRest").removeAttr("disabled"); -->
<!-- // // 					} -->
<!-- // // 				}) -->
				
<!-- // // 				//全部套用 -->
<!-- // // 				$("#allTheRest").click(function(){ -->
<!-- // // 					var mst = parseInt($("#monStart_Time").val()); -->
<!-- // // 					var met = parseInt($("#monEnd_Time").val()); -->
<!-- // // 					days.forEach(function(item){ -->
<!-- // // 						$("#workOn"+item).prop("checked",true); -->
<!-- // // 						$("#"+item+"Start_Time").removeAttr("disabled"); -->
<!-- // // 						$("#"+item+"End_Time").removeAttr("disabled"); -->
<!-- // // 						$("#"+item+"Start_Time option[value=" + mst+ "]").attr('selected', 'selected'); -->
<!-- // // 						giveNextTime(item); -->
<!-- // // 						$("#"+item+"End_Time option[value=" + met+ "]").attr('selected', 'selected'); -->
<!-- // // 					});	 -->
<!-- // // 				}) -->
				
<!-- // // 				//塞值到資料庫 -->
<!-- // // 				$("#getTime").click(function(){  -->
<!-- // // 					if($("#workAllTime").prop("checked")){ -->
<!-- // // 						$(".showTime").each(function(){ -->
<!-- // // 							$(this).val("00:00~24:00"); -->
<!-- // // 						}) -->
<!-- // // 						$(".showTimeSQL").each(function(){ -->
<!-- // // 							var message = ""; -->
<!-- // // 							theTiming.forEach(item => message += item + ","); -->
<!-- // // 							$(this).val(message.substring(0, message.length-1)); -->
<!-- // // 						}) -->
<!-- // // 						return; -->
<!-- // // 					} -->
<!-- // // 					days.forEach(item => gotodb(item)); -->
<!-- // // 				}) -->
				
<!-- // // 				//進資料庫 -->
<!-- // // 				function gotodb(day){ -->
<!-- // // 					if($("#workOn" + day).prop("checked")){ -->
<!-- // // 						var theStartTimetext = $("#"+day+"Start_Time option:selected").text(); -->
<!-- // // 						var theEndTimetext = $("#" + day + "End_Time option:selected").text(); -->
						
<!-- // // 						var theStartTimeval = $("#" + day + "Start_Time").val(); -->
<!-- // // 						var theEndTimeval = $("#" + day + "End_Time").val(); -->
<!-- // // 						var worktime = ""; -->
<!-- // // 						if(parseInt(theStartTimeval) != -1 && parseInt(theEndTimeval) != -1){ -->
<!-- // // 							for(var i = parseInt(theStartTimeval); i <= parseInt(theEndTimeval);i++){ -->
<!-- // // 								worktime += theTiming[i]; -->
<!-- // // 								if(i != theEndTimeval) worktime += ","; -->
<!-- // // 							} -->
<!-- // // 							$("#" + day + "Tilde").val(theStartTimetext + "~" + theEndTimetext); -->
<!-- // // 							$("#" + day).val(worktime); -->
<!-- // // 						} -->
<!-- // // 					}else{ -->
<!-- // // 						$("#" + day + "Tilde").val("公休"); -->
<!-- // // 						$("#" + day).val("公休"); -->
<!-- // // 					} -->
<!-- // // 				} -->
				
<!-- // // 				//設置select -->
<!-- // // 				function timing(eventSelect){ -->
<!-- // // 					for(let i = 0; i < 49 ; i++){ -->
<!-- // // 						var new_option = new Option(theTiming[i], i); -->
<!-- // // 						eventSelect.classList.add("theselect"); -->
<!-- // // 						eventSelect.options.add(new_option); -->
<!-- // // 					} -->
<!-- // // 				} -->
				
				
<!-- 				</script> -->
				</div><!-- table -->
				<div class=" fih"></div>
<!-- ================================================================================================================ -->									
				<div style="display:none"><!-- style="display:none" -->
					<input type="button"  value="getTime" onclick="getTimefunc()"/>
					<input type="text" id="monTilde" name="monTilde" class = "showTime" /><br>
					<input type="text" id="tueTilde" name="tueTilde" class = "showTime" /><br>
					<input type="text" id="wedTilde" name="wedTilde" class = "showTime" /><br>
					<input type="text" id="thuTilde" name="thuTilde" class = "showTime" /><br>
					<input type="text" id="friTilde" name="friTilde" class = "showTime"/><br>
					<input type="text" id="satTilde" name="satTilde" class = "showTime" /><br>
					<input type="text" id="sunTilde" name="sunTilde" class = "showTime" /><br>
							
					<input type="text" id="mon"  name="mon" class="showTimeSQL"/><br>
					<input type="text" id="tue"  name="tue" class="showTimeSQL"/><br>
					<input type="text" id="wed"  name="wed" class="showTimeSQL"/><br>
					<input type="text" id="thu"  name="thu" class="showTimeSQL"/><br>
					<input type="text" id="fri"  name="fri" class="showTimeSQL"/><br>
					<input type="text" id="sat"  name="sat" class="showTimeSQL"/><br>
					<input type="text" id="sun"  name="sun" class="showTimeSQL"/><br>
				</div>
				</div><!-- divTime -->
<!-- ================================================================================================================ -->
				<div id="divinfo">
				<div id="divFieldBeauty">
				<div class="form-title">美容項目</div>
				<div class="form-table">
					<div class="form-item fih" style="height:130px">
						<label class="form-label">美容對象</label>
						<div class="form-controler">                    
							<label style="width:120px">
                    			<input type="checkbox" name="beautyTarget" value="貓" style="margin:10px">貓
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyTarget" value="狗" style="margin:10px">狗
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyTarget" value="兔" style="margin:10px">兔
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyTarget" value="鴨" style="margin:10px">鴨
               				</label>
               				<br>
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyTarget" value="豬" style="margin:10px">豬
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyTarget" value="羊" style="margin:10px">羊
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyTarget" value="雞" style="margin:10px">雞
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyTarget" value="貂" style="margin:10px">貂
               				</label>
               				<br>
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyTarget" value="鼠" style="margin:10px">鼠
               				</label>

						</div>
					</div>
					<hr>
					<div class="form-item fih" style="height:90px">
						<label class="form-label">基本服務</label>
						<div class="form-controler">

							<label style="width:120px">
                    			<input type="checkbox" name="beautyBasicProject" value="指甲修整" style="margin:10px" >指甲修整
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyBasicProject" value="擠肛門腺" style="margin:10px">擠肛門腺
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyBasicProject" value="清耳朵" style="margin:10px">清耳朵
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautyBasicProject" value="拔耳毛" style="margin:10px">拔耳毛
               				</label>    
               				
               				<label style="width:150px">
                    			<input type="checkbox" name="beautyBasicProject" value="洗澡+剪髮" style="margin:10px">洗澡+剪髮
               				</label>           			
						</div>
					</div>
					<hr>
					<div class="form-item fih" style="height:140px">
						<label class="form-label">特殊服務</label>
						<div class="form-controler">
							<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="按摩浴缸" style="margin:10px" >按摩浴缸
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="精油護理" style="margin:10px">精油護理
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="腳緣精修" style="margin:10px">腳緣精修
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="去角質" style="margin:10px">去角質
               				</label>  
               				<br>
               				<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="藥浴" style="margin:10px">藥浴
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="造型剪" style="margin:10px">造型剪
               				</label>  
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="除蚤" style="margin:10px">除蚤
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="住宿" style="margin:10px">住宿
               				</label>  
               				<br>
               				<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="口腔護理" style="margin:10px">口腔護理
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="beautySpecialProject" value="到府美容" style="margin:10px">到府美容
               				</label> 
               				
               				<label style="width:170px">
                    			<input type="checkbox" name="beautySpecialProject" value="皮毛養護清潔" style="margin:10px">皮毛養護清潔
               				</label> 
						</div>
					</div>
				<div class="form-item fih">
					<div style="display:flex">
						<input type="button" class="btnAdd" value="上一頁"
							style="float:left" id="beautyPreviousPage"/>
															
						<input type="button" class="btnAdd" value="下一頁"
							style="margin-left:638px;" id="beautyNextPage"/>
					</div>
				</div>
				</div><!-- table -->
				</div>
<!-- ================================================================================================================================================= -->				
				<div id="divFieldHospital">
					<div class="form-title">醫療項目</div>
					<div class="form-table">
					<div class="form-item fih">
						<label class="form-label">醫生名字</label>
						<div class="form-controler">
							<input type="text"  class="input-holder" id="hospitalDoctors" name="hospitalDoctors"
									placeholder="輸入醫生姓名" autocomplete="off"  />
						</div>
					</div>
					<hr>
					<div class="form-item fih">
						<label class="form-label">醫療對象</label>
						<div class="form-controler">
							<label style="width:120px">
                    			<input type="checkbox" name="hospitalTarget" value="犬科" style="margin:10px" >貓科
		               		</label>
		                	<label style="width:120px">
		                    	<input type="checkbox" name="hospitalTarget" value="貓科" style="margin:10px">犬科
		                	</label>
		                	<label style="width:120px">
		                    	<input type="checkbox" name="hospitalTarget" value="非貓犬科" style="margin:10px">非犬貓科
		                	</label>
						</div>
					</div>
					<hr>
					<div class="form-item fih" style="height:150px">
						<label class="form-label">醫療項目</label>
						<div class="form-controler">
							<label style="width:120px">
                    			<input type="checkbox" name="hospitalProject" value="皮膚病" style="margin:10px" >皮膚病
               				</label>

		               		<label style="width:120px">
                    			<input type="checkbox" name="hospitalProject" value="感冒" style="margin:10px">感冒
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hospitalProject" value="咳嗽" style="margin:10px">咳嗽
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hospitalProject" value="氣喘" style="margin:10px">氣喘
               				</label>
               				<br>
               				<label style="width:120px">
                    			<input type="checkbox" name="hospitalProject" value="腎衰竭" style="margin:10px">腎衰竭
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hospitalProject" value="心臟病" style="margin:10px">心臟病
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hospitalProject" value="糖尿病" style="margin:10px">糖尿病
                			</label>
                			
                			<label style="width:120px">
                    			<input type="checkbox" name="hospitalProject" value="心絲蟲病" style="margin:10px">心絲蟲病
                			</label>
                			<br>
                			<label style="width:140px">
                    			<input type="checkbox" name="hospitalProject" value="泌尿道疾病" style="margin:10px">泌尿道疾病
                			</label>
		               		
		               		<label style="width:150px">
		                    	<input type="checkbox" name="hospitalProject" value="腸胃道疾病" style="margin:10px">腸胃道疾病
		               		</label>
						</div>
					</div>
					<hr>
					<div class="form-item fih" style="height:120px">
						<label class="form-label">醫療設施</label>
						<div class="form-controler">
							
               				<label style="width:120px">
                    			<input type="checkbox" name="hospitalFacility" value="住院" style="margin:10px">住院
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hospitalFacility" value="磁振造影" style="margin:10px">磁振造影
               				</label>

               				<label style="width:120px">
                    			<input type="checkbox" name="hospitalFacility" value="到府診療" style="margin:10px">到府診療
               				</label>
               				
               				<label style="width:135px">
                    			<input type="checkbox" name="hospitalFacility" value="腹膜滲透淅" style="margin:10px">腹膜滲透淅
               				</label>
               				<br>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hospitalFacility" value="電腦斷層" style="margin:10px" >電腦斷層
               				</label>
               				
               				
               				<label style="width:158px">
                    			<input type="checkbox" name="hospitalFacility" value="人工關節置換" style="margin:10px">人工關節置換
               				</label>
               				
               				<label style="width:173px">
                    			<input type="checkbox" name="hospitalFacility" value="內視鏡微創手術" style="margin:10px">內視鏡微創手術
               				</label>
						</div>
					</div>
				<div class="form-item fih">
					<div style="display:flex">
						<input type="button" class="btnAdd" value="上一頁"
							style="float:left" id="hospitalPreviousPage"/>
															
						<input type="button" class="btnAdd" value="下一頁"
							style="margin-left:638px;" id="hospitalNextPage"/>
					</div>
				</div>
				</div><!-- table -->
				</div>
<!-- ================================================================================================================================== -->									
				<div id="divFieldHotel">
					<div class="form-title">旅館項目</div>
					<div class="form-table">
					<div class="form-item fih" style="height:100px">
						<label class="form-label">設備服務</label>
						<div class="form-controler">
							<label style="width:120px">
                    			<input type="checkbox" name="hotelService" id="hs1" value="停車場" style="margin:10px" >停車場
               				</label>

               				<label style="width:120px">
                    			<input type="checkbox" name="hotelService" id="hs3" value="提供早餐" style="margin:10px">提供早餐
               				</label>
               				
               				<label style="width:150px">
                    			<input type="checkbox" name="hotelService" id="hs5" value="親子遊樂區" style="margin:10px">親子遊樂區
               				</label>
               				
               				<label style="width:150px">
                    			<input type="checkbox" name="hotelService" id="hs2" value="無障礙設施" style="margin:10px">無障礙設施
               				</label>
               				<br>
               				<label style="width:180px">
                    			<input type="checkbox" name="hotelService" id="hs4" value="wifi 無線網路" style="margin:10px">wifi 無線網路
               				</label>
               				
               				
						</div>
					</div>
					<hr>
					<div class="form-item fih" style="height:100px">
						<label class="form-label">適合寵物類型</label>
						<div class="form-controler">
							<label style="width:120px">
                    			<input type="checkbox" name="hotelPetType" id="htp1" value="小型犬" style="margin:10px" >小型犬
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hotelPetType" id="htp2" value="中型犬" style="margin:10px">中型犬
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hotelPetType" id="htp3" value="大型犬" style="margin:10px">大型犬
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hotelPetType" id="htp4" value="貓咪" style="margin:10px">貓咪
               				</label>
               				<br>
               				<label style="width:120px">
                    			<input type="checkbox" name="hotelPetType" id="htp5" value="親子遊樂區" style="margin:10px">兔子
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="hotelPetType" id="htp6" value="親子遊樂區" style="margin:10px">不限
               				</label>
               				
						</div>
               				<script type="text/javascript">
  	               				$("#htp6").click(function() { 
  	               				   if($("#htp6").prop("checked")) { 
  	               				   		$("input[name='hotelPetType']").each(function() {  
  	               				         	$(this).attr("disabled","disabled"); 
  	               				         	$("#htp6").removeAttr("disabled");
	               				     	}); 
 	               				   }else{
 	               						$("input[name='hotelPetType']").each(function() {  
 	               				         	$(this).removeAttr("disabled");
	               				     	}); 
 	               				   } 
	               				});  
               				</script> 
					</div>
					<hr>
					<div class="form-item fih" >
						<label class="form-label">費用</label>
						<div class="form-controler">
							<input type="text"  class="input-holder" id="hotelFee" name="hotelFee"
									placeholder="輸入費用" autocomplete="off" />
						</div>
					</div>
					<hr>
					<div class="form-item fih" style="height:150px">
						<label class="form-label">寵物友善</label>
						<div class="form-controler">
							<label style="width:150px">
                    			<input type="checkbox" name="hotelFriendly" id="hf1" value="寵物可進房" style="margin:10px">寵物可進房
               				</label>
               				
               				<label style="width:150px">
                    			<input type="checkbox" name="hotelFriendly" id="hf2" value="寵物梳洗區" style="margin:10px">寵物梳洗區
               				</label>
               				
               				<label style="width:150px">
                    			<input type="checkbox" name="hotelFriendly" id="hf3" value="寵物可上床" style="margin:10px">寵物可上床
               				</label>
               				       			      	
               				<label style="width:150px">
                    			<input type="checkbox" name="hotelFriendly" id="hf4" value="可攜帶寵物" style="margin:10px">可攜帶寵物
               				</label>
               				<br>
               				<label style="width:180px">
                    			<input type="checkbox" name="hotelFriendly" id="hf5" value="提供寵物餐點" style="margin:10px">提供寵物餐點
               				</label>
               				
               				<label style="width:200px">
                    			<input type="checkbox" name="hotelFriendly" id="hf6" value="提供寵物美容" style="margin:10px">提供寵物美容
               				</label>
               				
               				<label style="width:180px">
                    			<input type="checkbox" name="hotelFriendly" id="hf7" value="提供寵物游泳池" style="margin:10px">提供寵物游泳池
               				</label>
               				<br>
               				<label style="width:180px">
                    			<input type="checkbox" name="hotelFriendly" id="hf8" value="免費寵物遊樂場" style="margin:10px">免費寵物遊樂場
               				</label>
               				
               				<label style="width:200px">
                    			<input type="checkbox" name="hotelFriendly" id="hf9" value="寵物不需額外費用" style="margin:10px">寵物不需額外費用
               				</label>
               				
               				<label style="width:220px">
                    			<input type="checkbox" name="hotelFriendly" id="hf10" value="免費寵物輕食/零食" style="margin:10px">免費寵物輕食/零食
               				</label>
               				
               				
						</div>
					</div>
					<hr>
					<div class="form-item">
					<label class="form-label">限制</label>
							<div class="form-controler">
								<textarea name="hotelRestrictItem" rows="10" cols="50" 
				  						id="hotelRestrictItem" 
				  						style="resize : none;width:600px;height:200px"></textarea><br>				  					
							</div>
					</div>
					<hr>
					<div class="form-item">
					<label class="form-label">簡介</label>
							<div class="form-controler">
								<textarea name="hotelIntroduction" rows="10" cols="50" 
				  						id="hotelIntroduction" 
				  						style="resize : none;width:600px;height:200px"></textarea><br>		
							</div>
					</div>
				<div class="form-item fih">
					<div style="display:flex">
						<input type="button" class="btnAdd" value="上一頁"
							style="float:left" id="hotelPreviousPage"/>
															
						<input type="button" class="btnAdd" value="下一頁"
							style="margin-left:638px;" id="hotelNextPage"/>
					</div>
				</div>
				</div><!-- table -->
				</div>
<!-- ====================================================================================================================================== -->			
				<div id="divFieldRestaurant">
					<div class="form-title">餐廳項目</div>
					<div class="form-table">
					<div class="form-item fih" style="height:150px">
						<label class="form-label">設備服務</label>
						<div class="form-controler">
               				<label style="width:120px">
                    			<input type="checkbox" name="restaurantService" id="rs1" value="停車場" style="margin:10px">停車場
               				</label>
               				
							<label style="width:120px">
                    			<input type="checkbox" name="restaurantService" id="rs2" value="不限時間" style="margin:10px">不限時間
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="restaurantService" id="rs3" value="附有插座" style="margin:10px">附有插座
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="restaurantService" id="rs4" value="戶外雅座" style="margin:10px">戶外雅座
               				</label>
               				<br>
               				<label style="width:150px">
                    			<input type="checkbox" name="restaurantService" id="rs5" value="不收服務費" style="margin:10px">不收服務費
               				</label>
               				
               				<label style="width:150px">
                    			<input type="checkbox" name="restaurantService" id="rs6" value="無障礙設施" style="margin:10px">無障礙設施
               				</label>
               				
               				<label style="width:150px">
                    			<input type="checkbox" name="restaurantService" id="rs7" value="親子遊樂區" style="margin:10px">親子遊樂區
               				</label>
               				<br>
               				<label style="width:170px">
                    			<input type="checkbox" name="restaurantService" id="rs8" value="wifi 無線網路" style="margin:10px">wifi 無線網路
               				</label>
						</div>
						
					</div>
					<hr>
					<div class="form-item fih" style="height:100px">
						<label class="form-label" >適合寵物類型</label>
						<div class="form-controler">
							<label style="width:120px">
                    			<input type="checkbox" name="restaurantPetType" id="rtp1" value="小型犬" style="margin:10px" >小型犬
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="restaurantPetType" id="rtp2" value="中型犬" style="margin:10px">中型犬
               				</label >
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="restaurantPetType" id="rtp3" value="大型犬" style="margin:10px">大型犬
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="restaurantPetType" id="rtp4" value="貓咪" style="margin:10px">貓咪
               				</label>
               				<br>
               				<label style="width:120px">
                    			<input type="checkbox" name="restaurantPetType" id="rtp5" value="兔子" style="margin:10px">兔子
               				</label>
               				
               				<label style="width:120px">
                    			<input type="checkbox" name="restaurantPetType" id="rtp6" value="不限" style="margin:10px">不限
               				</label>
               				
               				<script type="text/javascript">
 	               				$("#rtp6").click(function() { 
 	               					if($("#rtp6").prop("checked")) { 
	               				   		$("input[name='restaurantPetType']").each(function() {  
	               				         	$(this).attr("disabled","disabled"); 
	               				         	$("#rtp6").removeAttr("disabled");
               				     	}); 
	               				   }else{
	               						$("input[name='restaurantPetType']").each(function() {  
	               				         	$(this).removeAttr("disabled");
               				     	}); 
	               				   } 
 	               				}); 
               				</script> 
						</div>
					</div>
					<hr>
					<div class="form-item fih">
						<label class="form-label">費用</label>
						<div class="form-controler">
							<input type="text"  class="input-holder" id="restaurantFee" name="restaurantFee"
									placeholder="輸入費用" autocomplete="off" />
						</div>
					</div>
					<hr>
					<div class="form-item fih" style="height:150px">
						<label class="form-label">寵物友善</label>
						<div class="form-controler">
							<label style="width:220px">
                    			<input type="checkbox" name="restaurantFriendly" id="rf1" value="可攜帶寵物" style="margin:10px">可攜帶寵物
               				</label>

               				<label style="width:220px">
                    			<input type="checkbox" name="restaurantFriendly" id="rf2" value="提供寵物包廂" style="margin:10px">提供寵物包廂
               				</label>
               				<br>
               				<label style="width:220px">
                    			<input type="checkbox" name="restaurantFriendly" id="rf3" value="提供寵物餐點" style="margin:10px">提供寵物餐點
               				</label>
               				
               				<label style="width:220px">
                    			<input type="checkbox" name="restaurantFriendly" id="rf4" value="免費寵物遊樂場" style="margin:10px">免費寵物遊樂場
               				</label>
               				<br>
               				<label style="width:220px">
                    			<input type="checkbox" name="restaurantFriendly" id="rf5" value="寵物不需額外費用" style="margin:10px" >寵物不需額外費用
               				</label>
               				
               				<label style="width:220px">
                    			<input type="checkbox" name="restaurantFriendly" id="rf6" value="免費寵物輕食/零食" style="margin:10px">免費寵物輕食/零食
               				</label>
               				
               				
						</div>
					</div>
					<hr>
					<div class="form-item">
					<label class="form-label">限制</label>
						<div class="form-controler">
							<textarea name="restaurantRestrictItem" rows="10" cols="50" 
				  					id="restaurantRestrictItem" 
				  					style="resize : none;width:600px;height:200px"></textarea><br>				  					
						</div>
					</div>
					<hr>
					<div class="form-item">
					<label class="form-label">簡介</label>
						<div class="form-controler">
							<textarea name="restaurantIntroduction" rows="10" cols="50" 
				  					id="restaurantIntroduction" 
				  					style="resize : none;width:600px;height:200px"></textarea><br>		
						</div>
					</div>
				<div class="form-item fih">
					<div style="display:flex">
						<input type="button" class="btnAdd"" value="上一頁"
							style="float:left" id="restaurantPreviousPage"/>
															
						<input type="button" class="btnAdd" value="下一頁"
							style="margin-left:638px;" id="restaurantNextPage"/>
					</div>
				</div>
				</div><!--  -->
				</div>
				
				<div class=" fih"></div>	
				</div><!-- divinfo -->
<!-- =========================================================================================================================================== -->				
				<div id="divphoto">
					<div class="form-title">環境照片</div>
					<div class="form-table">
					<div class="form-item" style="width:400px;margin:15px auto;">
						<div style="position:relative;" >
							<input type="file" style="position:absolute;opacity:0;width:365px;height:191px;cursor: pointer;" id="shopImage" accept=".jpg,.png,.jpeg" name="shopImage"> 
							<img src="${shop.environmentalPhotos}" id="ppimg"  style="width:365px;"> 
						</div>
					</div>

					<div style="display:flex;margin-bottom: 20px;">
						<input type="button" class="btnAdd" value="上一頁"
							style="margin-left:20px;float:left;height:34px;" id="photoPreviousPage"/>
	
						<input type="submit" class="btnAdd" value="送出"
							style="margin-left:638px;height:34px;"  onclick="return check_element()"/>
					</div>
					</div><!-- table -->	
					<div class=" fih"></div>	
				</div><!-- divphoto -->

				</div><!-- main -->
			</div><!-- wrapper -->
	
		<input type="hidden" style="display:none" value="${shop.manager}" name="manager">
	</form>
<!-- ======================================================================================================================================== -->
	<script type="text/javascript">
<!-- =========================================================================================================== -->	
	$("#clickbasic").css("color", "#8D5433");
	$("#divtime").hide();
	$("#divinfo").hide();
	$("#divphoto").hide();
	$("#angle2").hide();
	$("#angle3").hide();
	$("#angle4").hide();
	$("#divFieldBeauty").hide();
	$("#divFieldHospital").hide();
	$("#divFieldHotel").hide();
	$("#divFieldRestaurant").hide();
	

	$('[name=type]').change(function () {
	    var checked = $('[name=type]:checked')
	    if(checked.val() == "美容"){
	    	$("#divFieldBeauty").show();
	    	$("#divFieldHospital").hide();
	    	$("#divFieldHotel").hide();
	    	$("#divFieldRestaurant").hide();
	    }else if(checked.val() == "醫療"){
	    	$("#divFieldBeauty").hide();
	    	$("#divFieldHospital").show();
	    	$("#divFieldHotel").hide();
	    	$("#divFieldRestaurant").hide();
	    }else if(checked.val() == "旅館"){
	    	$("#divFieldBeauty").hide();
	    	$("#divFieldHospital").hide();
	    	$("#divFieldHotel").show();
	    	$("#divFieldRestaurant").hide();
	    }else if(checked.val() == "餐廳"){
	    	$("#divFieldBeauty").hide();
	    	$("#divFieldHospital").hide();
	    	$("#divFieldHotel").hide();
	    	$("#divFieldRestaurant").show();
	    } 
	})
<!-- =========================================================================================================== -->		
	$("#clickbasic").click(function() { showBasic(); });
	$("#clicktime").click(function() { showTime(); });
	$("#clickinfo").click(function() { showInfo(); });	
	$("#clickphoto").click(function() { showPhoto(); });
	
	$("#basicNextPage").click(function(){ showTime(); })
	$("#timePreviousPage").click(function(){ showBasic(); })
	$("#timeNextPage").click(function(){ showInfo(); })
	$("#beautyPreviousPage").click(function(){ showTime(); })
	$("#beautyNextPage").click(function(){ showPhoto(); })
	$("#hospitalPreviousPage").click(function(){ showTime(); })
	$("#hospitalNextPage").click(function(){ showPhoto(); })
	$("#hotelPreviousPage").click(function(){ showTime(); })
	$("#hotelNextPage").click(function(){ showPhoto(); })
	$("#restaurantPreviousPage").click(function(){ showTime(); })
	$("#restaurantNextPage").click(function(){ showPhoto(); })
	$("#photoPreviousPage").click(function(){ showInfo(); })
	
	
<!-- =========================================================================================================== -->	
	function showBasic(){
		$("#clickbasic").css("color", "#8D5433");
		$("#clicktime").css("color", "black");
		$("#clickinfo").css("color", "black");
		$("#clickphoto").css("color", "black");
		$("#angle1").show();
		$("#angle2").hide();
		$("#angle3").hide();
		$("#angle4").hide();
		$("#divbasic").show();
		$("#divtime").hide();
		$("#divinfo").hide();
		$("#divphoto").hide();
	}
	
	function showTime(){
		$("#clickbasic").css("color", "black");
		$("#clicktime").css("color", "#8D5433");
		$("#clickinfo").css("color", "black");
		$("#clickphoto").css("color", "black");
		$("#angle1").hide();
		$("#angle2").show();
		$("#angle3").hide();
		$("#angle4").hide();
		$("#divbasic").hide();
		$("#divtime").show();
		$("#divinfo").hide();
		$("#divphoto").hide();
	}
	
	function showInfo(){
		$("#clickbasic").css("color", "black");
		$("#clicktime").css("color", "black");
		$("#clickinfo").css("color", "#8D5433");
		$("#clickphoto").css("color", "black");
		$("#angle1").hide();
		$("#angle2").hide();
		$("#angle3").show();
		$("#angle4").hide();
		$("#divbasic").hide();
		$("#divtime").hide();
		$("#divinfo").show();
		$("#divphoto").hide();
	}
	
	function showPhoto(){
		$("#clickbasic").css("color", "black");
		$("#clicktime").css("color", "black");
		$("#clickinfo").css("color", "black");
		$("#clickphoto").css("color", "#8D5433");
		$("#angle1").hide();
		$("#angle2").hide();
		$("#angle3").hide();
		$("#angle4").show();
		$("#divbasic").hide();
		$("#divtime").hide();
		$("#divinfo").hide();
		$("#divphoto").show();
	}
	
	var cities = ["臺北市","新北市","桃園市","臺中市","臺南市","高雄市","新竹縣",
		"苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣",
		"臺東縣","澎湖縣","金門縣","連江縣","基隆市","新竹市","嘉義市"];
	
	var taipei =["中正區","大同區","中山區","松山區","大安區","萬華區",
		"信義區","士林區","北投區","內湖區","南港區","文山區"];
	
	var newTaipei =["萬里區","金山區","板橋區","汐止區","深坑區","石碇區","瑞芳區",
		"平溪區","雙溪區","貢寮區","新店區","坪林區","烏來區","永和區","中和區",
		"土城區","三峽區","樹林區","鶯歌區","三重區","新莊區","泰山區","林口區",
		"蘆洲區","五股區","八里區","淡水區","三芝區","石門區"];
	
	var taoYuan =["中壢區","平鎮區","龍潭區","楊梅區","新屋區",
		"觀音區","桃園區","龜山區","八德區","大溪區","復興區",
		"大園區","蘆竹區"]
	
	var taichung=["中區","東區","西區","南區","北區","西屯區","南屯區",
		"北屯區","豐原區","大里區","太平區","清水區","沙鹿區","大甲區",
		"東勢區","梧棲區","烏日區","神岡區","大肚區","大雅區","后里區",
		"霧峰區","潭子區","龍井區","外埔區","和平區","石岡區","大安區","新社區"]
	
	var tainan = ["中西區","東區","南區","北區","安平區","安南區","永康區",
		"歸仁區","新化區","左鎮區","玉井區","楠西區","南化區","仁德區","關廟區",
		"龍崎區","官田區","麻豆區","佳里區","西港區","七股區","將軍區",
		"學甲區","北門區","新營區","後壁區","白河區","東山區","六甲區","下營區",
		"柳營區","鹽水區","善化區","大內區","山上區","新市區","安定區"]
	
	var kao=["楠梓區", "左營區", "鼓山區", "三民區", "苓雅區", "新興區", "前金區", "鹽埕區", "小港區", "旗津區",
		"前鎮區", "鳳山區", "岡山區", "旗山區", "美濃區", "大寮區", "茄萣區", "永安區", "大園區",
		"大社區", "杉林區", "仁武區", "田寮區", "燕巢區", "路竹區", "阿蓮區", "甲仙區", "大樹區",
		"湖內區", "桃源區", "鳥松區", "彌陀區", "那瑪夏區(原三民鄉)", "梓官區", "內門區", "茂林區",
		"橋頭區", "六龜區", "林園區"]
	
	var hsinChu=["竹北市", "竹東鎮", "新埔鎮", "關西鎮", "新豐鄉", "峨眉鄉", "寶山鄉", "五峰鄉", "橫山鄉", "北埔鄉", 
		"尖石鄉", "芎林鄉", "湖口鄉"]
	
	var miao=["苗栗市", "頭份市", "苑裡鎮", "通霄鎮", "竹南鎮",
		"後龍鎮", "卓蘭鎮", "大湖鄉", "公館鄉", "銅鑼鄉",
		"南莊鄉", "頭屋鄉", "三義鄉", "西湖鄉", "造橋鄉",
		"三灣鄉", "獅潭鄉", "泰安鄉"]
	
	var chungHua =["彰化市", "員林市", "鹿港鎮", "和美鎮", "北斗鎮", "溪湖鎮",
		"田中鎮", "二林鎮", "線西鄉", "伸港鄉", "福興鄉", "秀水鄉",
		"花壇鄉", "芬園鄉", "大村鄉", "埔鹽鄉", "埔心鄉", "永靖鄉",
		"社頭鄉", "二水鄉", "田尾鄉", "埤頭鄉", "芳苑鄉", "大城鄉",
		"竹塘鄉", "溪州鄉"]
	
	var nanTou=["南投市", "草屯鎮", "埔里鎮", "竹山鎮", "集集鎮",
		"名間鄉", "鹿谷鄉", "中寮鄉", "魚池鄉", "國姓鄉",
		"水里鄉", "信義鄉", "仁愛鄉"]
	
	var yunLin=["斗六市", "斗南鎮", "虎尾鎮", "西螺鎮", "土庫鎮",
		"北港鎮", "古坑鄉", "大埤鄉", "莿桐鄉", "林內鄉",
		"二崙鄉", "崙背鄉", "麥寮鄉", "東勢鄉", "褒忠鄉",
		"臺西鄉", "元長鄉", "四湖鄉", "口湖鄉", "水林鄉"]
	
	var chiaYi=["太保市", "朴子市", "布袋鎮", "大林鎮", "民雄鄉",
		"溪口鄉", "新港鄉", "六腳鄉", "東石鄉", "義竹鄉",
		"鹿草鄉", "水上鄉", "中埔鄉", "竹崎鄉", "梅山鄉",
		"番路鄉", "大埔鄉", "阿里山鄉"]
	
	var pinTong=["屏東市", "潮州鎮", "東港鎮", "恆春鎮", "萬丹鄉",
		"長治鄉", "麟洛鄉", "九如鄉", "里港鄉", "鹽埔鄉",
		"高樹鄉", "萬巒鄉", "內埔鄉", "竹田鄉", "新埤鄉",
		"枋寮鄉", "新園鄉", "崁頂鄉", "林邊鄉", "南州鄉",
		"佳冬鄉", "琉球鄉", "車城鄉", "滿州鄉", "枋山鄉",
		"三地門鄉", "霧臺鄉", "瑪家鄉", "泰武鄉", "來義鄉",
		"春日鄉", "獅子鄉", "牡丹鄉"]
	
	var yiLan=["宜蘭市", "羅東鎮", "蘇澳鎮", "頭城鎮", "礁溪鄉",
		"壯圍鄉", "員山鄉", "冬山鄉", "五結鄉", "三星鄉",
		"大同鄉", "南澳鄉"]
	
	var huaLian=["花蓮市", "鳳林鎮", "玉里鎮", "新城鄉", "吉安鄉",
		"壽豐鄉", "光復鄉", "豐濱鄉", "瑞穗鄉", "富里鄉",
		"秀林鄉", "萬榮鄉", "卓溪鄉"]
	
	var taiTong=["臺東市", "成功鎮", "關山鎮", "卑南鄉",	
		"大武鄉", "太麻里鄉","東河鄉", "長濱鄉", 
		"鹿野鄉", "池上鄉", "綠島鄉", "延平鄉",	
		"海端鄉", "達仁鄉", "金峰鄉", "蘭嶼鄉"]
	
	var ponHu=["馬公市", "湖西鄉", "白沙鄉", "西嶼鄉", "望安鄉", "七美鄉"]
	
	var kingMen=["金城鎮", "金湖鎮", "金沙鎮", "金寧鄉", "烈嶼鄉", "烏坵鄉"]
	
	var lianChian=["南竿鄉","北竿鄉","莒光鄉","東引鄉"]
	
	var keeLung=["中正區", "七堵區", "暖暖區", "仁愛區", "中山區","安樂區", "信義區"]
	
	var hisnChuCity=["東區","北區","香山區"]
	
	var chiaYiCity=["東區","西區"]
	
// 	var test = [taipei,newTaipei,taoYuan,taichung,
// 				tainan,kao,hsinChu,miao,
// 				chungHua,nanTou,yunLin,chiaYi,
// 				pinTong,yiLan,huaLian,taiTong,
// 				ponHu,kingMen,lianChian,keeLung,
// 				hisnChuCity,chiaYiCity];
	
	
	initSelect($("#city")[0],cities);
	
	initSelect($("#township")[0],taipei);
	
	$("#city").on("change",function(){
		var cityName = $("#city").val();
		if(cityName == "臺北市"){
			setSelect($("#township")[0],taipei);
		}else if(cityName == "新北市"){
			setSelect($("#township")[0],newTaipei);
		}else if(cityName == "桃園市"){
			setSelect($("#township")[0],taoYuan);
		}else if(cityName == "臺中市"){
			setSelect($("#township")[0],taichung);
		}else if(cityName == "臺南市"){
			setSelect($("#township")[0],tainan);
		}else if(cityName == "高雄市"){
			setSelect($("#township")[0],kao);
		}else if(cityName == "新竹縣"){
			setSelect($("#township")[0],hsinChu);
		}else if(cityName == "苗栗縣"){
			setSelect($("#township")[0],miao);
		}else if(cityName == "彰化縣"){
			setSelect($("#township")[0],chungHua);
		}else if(cityName == "南投縣"){
			setSelect($("#township")[0],nanTou);
		}else if(cityName == "雲林縣"){
			setSelect($("#township")[0],yunLin);
		}else if(cityName == "嘉義縣"){
			setSelect($("#township")[0],chiaYi);
		}else if(cityName == "屏東縣"){
			setSelect($("#township")[0],pinTong);
		}else if(cityName == "宜蘭縣"){
			setSelect($("#township")[0],yiLan);
		}else if(cityName == "花蓮縣"){
			setSelect($("#township")[0],huaLian);
		}else if(cityName == "臺東縣"){
			setSelect($("#township")[0],taiTong);
		}else if(cityName == "澎湖縣"){
			setSelect($("#township")[0],ponHu);
		}else if(cityName == "金門縣"){
			setSelect($("#township")[0],kingMen);
		}else if(cityName == "連江縣"){
			setSelect($("#township")[0],lianChian);
		}else if(cityName == "基隆市"){
			setSelect($("#township")[0],keeLung);
		}else if(cityName == "新竹市"){
			setSelect($("#township")[0],hisnChuCity);
		}else if(cityName == "嘉義市"){
			setSelect($("#township")[0],chiaYiCity);
		}						
	})
	
	function initSelect(eventSelect,eventArray){		
		for(let i = 0; i < eventArray.length ; i++){
			var new_option = new Option(eventArray[i], eventArray[i]);
			eventSelect.options.add(new_option);
		}
	}
	
	function setSelect(eventSelect,eventArray){
		eventSelect.options.length = 0;			
		for(let i = 0; i < eventArray.length ; i++){
			var new_option = new Option(eventArray[i], eventArray[i]);
			eventSelect.options.add(new_option);
		}
	}
<!-- =========================================================================================================== -->	
// 	var checkPhoto = false;
	var x = new FileReader;
	document.getElementById('shopImage').onchange = function() {
		if(document.getElementById('shopImage').value==""){ 
// 			checkPhoto = false;
		}else{
// 			checkPhoto = true;
			x.readAsDataURL(this.files[0]);
		}
	}

	x.onloadend = function() {
		document.getElementById('ppimg').src = this.result;
	}
<!-- =========================================================================================================== -->	
	var theTiming = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30",
		 "04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30",
		 "08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30",
		 "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30",
		 "16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30",
		 "20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30",
		 "24:00"];
	
	var days = ["mon","tue","wed","thu","fri","sat","sun"];

	//時間初始化
	days.forEach(function(day){ timing($("#"+day+"Start_Time")[0]); });
	
	//全年無休動作
	$("#workAllTime").click(function(){
		days.forEach(function(day){
			if($("#workAllTime").prop("checked")){
				$("#allTheRest").attr("disabled","disabled");
				$("#workOn"+day).attr("disabled","disabled"); 
				$("#"+day+"Start_Time").attr("disabled","disabled"); 
				$("#"+day+"End_Time").attr("disabled","disabled"); 	
			}else{
				if($("#monStart_Time").val() != -1 && $("#monEnd_Time").val() != -1 &&　$("#workOnmon").prop("checked"))
					$("#allTheRest").removeAttr("disabled"); 
				else 
					$("#allTheRest").attr("disabled","disabled");
				$("#workOn"+day).removeAttr("disabled");
				if($("#"+day+"Start_Time").val() != -1 && $("#"+day+"End_Time").val() != -1){
					$("#"+day+"Start_Time").removeAttr("disabled");
					$("#"+day+"End_Time").removeAttr("disabled");
				}	
			}
		});
	});
	
	//開啟時間動作
	$("#workOnmon").click(function(){
		if($("#monStart_Time").val() != -1 && $("#monEnd_Time").val() != -1 &&　$("#workOnmon").prop("checked"))
			$("#allTheRest").removeAttr("disabled"); 
		else $("#allTheRest").attr("disabled","disabled"); 
		openTheTime(days[0]);
	})
	
	$("#workOntue").click(function(){ openTheTime(days[1]); })
	$("#workOnwed").click(function(){ openTheTime(days[2]); })
	$("#workOnthu").click(function(){ openTheTime(days[3]); })
	$("#workOnfri").click(function(){ openTheTime(days[4]); })
	$("#workOnsat").click(function(){ openTheTime(days[5]); })
	$("#workOnsun").click(function(){ openTheTime(days[6]); })
	
	//開啟時間方法
	function openTheTime(day){
		if($("#workOn"+day).prop("checked")){
			$("#"+day+"Start_Time").removeAttr("disabled");
			$("#"+day+"End_Time").removeAttr("disabled"); 
		}else{
			$("#"+day+"Start_Time").attr("disabled","disabled"); 
			$("#"+day+"End_Time").attr("disabled","disabled"); 	
		}
	}
	
	//預設套用關閉
	$("#allTheRest").attr("disabled","disabled"); 
	
	//由星期一來開啟套用全部
	$("#monStart_Time").on("change",function(){
		giveNextTime("mon");
		if($("#monStart_Time").val() == -1 || $("#monEnd_Time").val() == -1){
			$("#allTheRest").attr("disabled","disabled"); 
		}else{
			$("#allTheRest").removeAttr("disabled");
		}
	})
	
	//設立下一個時間動作
	for(let theDay = 1; theDay < days.length ; theDay++){
		$("#"+days[theDay]+"Start_Time").on("change",function(){giveNextTime(days[theDay]);})
	}
	
	//設立下一個時間方法
	function giveNextTime(day){
		var mst = parseInt($("#"+day+"Start_Time").val());
		var End_Time = $("#"+day+"End_Time")[0];
		
		End_Time.options.length = 0;
		var new_option = new Option("請選擇", -1);
		End_Time.classList.add("theselect");
		End_Time.options.add(new_option);
		
		for(var i = mst+1;i < 49 ;i++){
			var new_option = new Option(theTiming[i], i);
			End_Time.classList.add("theselect");
			End_Time.options.add(new_option);
		}
	}
	
	//由星期一來開啟套用全部
	$("#monEnd_Time").on("change",function(){
		if($("#monStart_Time").val() == -1 || $("#monEnd_Time").val() == -1){
			$("#allTheRest").attr("disabled","disabled"); 
		}else{
			$("#allTheRest").removeAttr("disabled");
		}
	})
	
	//全部套用
	$("#allTheRest").click(function(){
		var mst = parseInt($("#monStart_Time").val());
		var met = parseInt($("#monEnd_Time").val());
		days.forEach(function(item){
			$("#workOn"+item).prop("checked",true);
			$("#"+item+"Start_Time").removeAttr("disabled");
			$("#"+item+"End_Time").removeAttr("disabled");
			$("#"+item+"Start_Time option[value=" + mst+ "]").attr('selected', 'selected');
			giveNextTime(item);
			$("#"+item+"End_Time option[value=" + met+ "]").attr('selected', 'selected');
		});	
	})

	//塞值到資料庫欄位
	function getTimefunc(){ 
		if($("#workAllTime").prop("checked")){
			$(".showTime").each(function(){
				$(this).val("00:00~24:00");
			})
			$(".showTimeSQL").each(function(){
				var message = "";
				theTiming.forEach(item => message += item + ",");
				$(this).val(message.substring(0, message.length-1));
			})
		}else{
			days.forEach(item => gotodb(item));
		}
		
	}

	//進資料庫方法
	function gotodb(day){
		var theStartTimetext = $("#"+day+"Start_Time option:selected").text();
		var theEndTimetext = $("#" + day + "End_Time option:selected").text();
		var theStartTimeval = $("#" + day + "Start_Time").val();
		var theEndTimeval = $("#" + day + "End_Time").val();

		if($("#workOn" + day).prop("checked")){				
			var worktime = "";
			if(parseInt(theStartTimeval) != -1 && parseInt(theEndTimeval) != -1){
				for(var i = parseInt(theStartTimeval); i <= parseInt(theEndTimeval);i++){
					worktime += theTiming[i];
					if(i != theEndTimeval) worktime += ",";
				}
				$("#" + day + "Tilde").val(theStartTimetext + "~" + theEndTimetext);
				$("#" + day).val(worktime);
			}else{
				$("#" + day + "Tilde").val("");
				$("#" + day).val("");
			}
		}else{
			$("#" + day + "Tilde").val("公休");
			$("#" + day).val("公休");
		}
	}
	
	//設置select
	function timing(eventSelect){
		for(let i = 0; i < 49 ; i++){
			var new_option = new Option(theTiming[i], i);
			eventSelect.classList.add("theselect");
			eventSelect.options.add(new_option);
		}
	}
	
<!-- =========================================================================================================== -->		

	$("#shopName").val("${shop.shopName}");
	if("${shop.type}" == "美容"){
		$("#t1").prop("checked",true);
		$("#divFieldBeauty").show();
	}else if("${shop.type}" == "醫療"){
		$("#t2").prop("checked",true);
		$("#divFieldHospital").show();
	}else if("${shop.type}" == "旅館"){
		$("#t3").prop("checked",true);
		$("#divFieldHotel").show();
	}else if("${shop.type}" == "餐廳"){
		$("#t4").prop("checked",true);
		$("#divFieldRestaurant").show();
	}
		
	$("#phone").val("${shop.phone}");
	$("#address").val("${shop.address}");
	$("#propertyPermit").val("${shop.propertyPermit}");
	$("#email").val("${shop.email}");
		
	$("#mon").val("${shop.mon}");
	$("#tue").val("${shop.tue}");
	$("#wed").val("${shop.wed}");
	$("#thu").val("${shop.thu}");
	$("#fri").val("${shop.fri}");
	$("#sat").val("${shop.sat}");
	$("#sun").val("${shop.sun}");
		
	$("#monTilde").val("${shop.monTilde}");
	$("#tueTilde").val("${shop.tueTilde}");
	$("#wedTilde").val("${shop.wedTilde}");
	$("#thuTilde").val("${shop.thuTilde}");
	$("#friTilde").val("${shop.friTilde}");
	$("#satTilde").val("${shop.satTilde}");
	$("#sunTilde").val("${shop.sunTilde}");
		
// // 	var theTiming = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30",
// // 					 "04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30",
// // 					 "08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30",
// // 					 "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30",
// // 					 "16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30",
// // 					 "20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30",
// // 					 "24:00"];
	
// // 	var days = ["mon","tue","wed","thu","fri","sat","sun"];
<!-- =========================================================================================================== -->
	var calWorkDays = 0;
	if($("#monTilde").val() != "公休")
		$("#allTheRest").removeAttr("disabled");
	else
		$("#allTheRest").attr("disabled","disabled"); 
	days.forEach(function(item){
		if($("#"+item+"Tilde").val() != "公休"){
			$("#workOn"+item).prop("checked",true);
			var Time = $("#"+item+"Tilde").val().split("~");
			var mst  = 0;
			var met  = 0;
			for(let i = 0;i <theTiming.length;i++){
				if(Time[0] == theTiming[i]){
					mst = i;
				}
				if(Time[1] == theTiming[i]){
					met = i;
					break;
				}
			}
			$("#"+item+"Start_Time").removeAttr("disabled");
			$("#"+item+"End_Time").removeAttr("disabled");
			$("#"+item+"Start_Time option[value=" + mst+ "]").attr('selected', 'selected');
			giveNextTime(item);
			$("#"+item+"End_Time option[value=" + met+ "]").attr('selected', 'selected');
			if(mst == 0 &&　met　== 48){ calWorkDays++; }
			if(calWorkDays == 7){
				$("#workAllTime").prop("checked",true);
				days.forEach(function(item){
					$("#workOn"+item).prop("checked",false);
					$("#workOn"+item).attr("disabled","disabled"); 
					$("#allTheRest").attr("disabled","disabled"); 
					$("#"+item+"Start_Time").attr("disabled","disabled"); 
					$("#"+item+"End_Time").attr("disabled","disabled"); 
					$("#"+item+"Start_Time option[value=-1]").attr('selected', 'selected');
					$("#"+item+"End_Time option[value=-1]").attr('selected', 'selected');
				});
			}
			
		}else{
			$("#workOn"+item).prop("checked",false);
		}
	});
	
<!-- =========================================================================================================== -->	
	var beautyTargetItem = ["貓","狗","兔","鴨","豬","羊","雞","貂","鼠"];
	var beautyTargetValue = "${shop.typeBeauty.beautyTarget}".split(",");
	for(let i = 0;i <beautyTargetItem.length;i++){
		for(let j = 0;j<beautyTargetValue.length; j++){
			if(beautyTargetItem[i] == beautyTargetValue[j]){
				$('[name=beautyTarget]').eq(i).attr("checked",true);
			}
		}
	}
	
	var beautyBasicProjectItem = ["指甲修整","擠肛門腺","清耳朵","拔耳毛","洗澡+剪髮"];
	var beautyBasicProjectValue = "${shop.typeBeauty.beautyBasicProject}".split(",");
	for(let i = 0;i <beautyBasicProjectItem.length;i++){
		for(let j = 0;j<beautyBasicProjectValue.length; j++){
			if(beautyBasicProjectItem[i] == beautyBasicProjectValue[j]){
				$('[name=beautyBasicProject]').eq(i).attr("checked",true);
			}
		}
	}
	
	var beautySpecialProjectItem = ["按摩浴缸","精油護理","腳緣精修","去角質","藥浴","造型剪","除蚤","住宿","口腔護理","到府美容","皮毛養護清潔"];
	var beautySpecialProjectValue = "${shop.typeBeauty.beautySpecialProject}".split(",");
	for(let i = 0;i <beautySpecialProjectItem.length;i++){
		for(let j = 0;j<beautySpecialProjectValue.length; j++){
			if(beautySpecialProjectItem[i] == beautySpecialProjectValue[j]){
				$('[name=beautySpecialProject]').eq(i).attr("checked",true);
			}
		}
	}
	
<!-- =========================================================================================================== -->	
	$("#hospitalDoctors").val("${shop.typeHospital.hospitalDoctors}");
	
	var hospitalTargetItem = ["貓科","犬科","非犬貓科"];
	var hospitalTargetValue = "${shop.typeHospital.hospitalTarget}".split(",");
	for(let i = 0;i <hospitalTargetItem.length;i++){
		for(let j = 0;j<hospitalTargetValue.length; j++){
			if(hospitalTargetItem[i] == hospitalTargetValue[j]){
				$('[name=hospitalTarget]').eq(i).attr("checked",true);
			}
		}
	}
	
	var hospitalProjectItem = ["皮膚病","感冒","咳嗽","氣喘","腎衰竭","心臟病","糖尿病","心絲蟲病","泌尿道疾病","腸胃道疾病"];
	var hospitalProjectValue = "${shop.typeHospital.hospitalProject}".split(",");
	for(let i = 0;i <hospitalProjectItem.length;i++){
		for(let j = 0;j<hospitalProjectValue.length; j++){
			if(hospitalProjectItem[i] == hospitalProjectValue[j]){
				$('[name=hospitalProject]').eq(i).attr("checked",true);
			}
		}
	}
	
	var hospitalFacilityItem = ["住院","磁振造影","到府診療","腹膜滲透淅","電腦斷層","人工關節置換","內視鏡微創手術"];
	var hospitalFacilityValue = "${shop.typeHospital.hospitalFacility}".split(",");
	for(let i = 0;i <hospitalFacilityItem.length;i++){
		for(let j = 0;j<hospitalFacilityValue.length; j++){
			if(hospitalFacilityItem[i] == hospitalFacilityValue[j]){
				$('[name=hospitalFacility]').eq(i).attr("checked",true);
			}
		}
	}
	
<!-- =========================================================================================================== -->		

	var hotelServiceItem = ["停車場","提供早餐","親子遊樂區","無障礙設施","wifi 無線網路"];
	var hotelServiceValue = "${shop.typeHotel.hotelService}".split(",");
	for(let i = 0;i <hotelServiceItem.length;i++){
		for(let j = 0;j<hotelServiceValue.length; j++){
			if(hotelServiceItem[i] == hotelServiceValue[j]){
				$('[name=hotelService]').eq(i).attr("checked",true);
			}
		}
	}
	
	var hotelPetTypeItem = ["小型犬","中型犬","大型犬","貓咪","兔子","不限"];
	var hotelPetTypeValue = "${shop.typeHotel.hotelPetType}".split(",");
	if(hotelPetTypeValue[0] != "不限"){
		for(let i = 0;i <hotelPetTypeItem.length;i++){
			for(let j = 0;j<hotelPetTypeValue.length; j++){
				if(hotelPetTypeItem[i] == hotelPetTypeValue[j]){
					$('[name=hotelPetType]').eq(i).attr("checked",true);
				}
			}
		}
	}else{
		$('[name=hotelPetType]').eq(5).attr("checked",true);
		for(let i = 0;i < hotelPetTypeItem.length-1;i++){
			$('[name=hotelPetType]').eq(i).attr("disabled","disabled"); 
		}
	}
	
	$("#hotelFee").val("${shop.typeHotel.hotelFee}"); 
	
	var hotelFriendlyItem = ["寵物可進房","寵物梳洗區","寵物可上床","可攜帶寵物","提供寵物餐點","提供寵物美容","提供寵物游泳池","免費寵物遊樂場","寵物不需額外費用","免費寵物輕食/零食"];
	var hotelFriendlyValue = "${shop.typeHotel.hotelFriendly}".split(",");
	for(let i = 0;i <hotelFriendlyItem.length;i++){
		for(let j = 0;j<hotelFriendlyValue.length; j++){
			if(hotelFriendlyItem[i] == hotelFriendlyValue[j]){
				$('[name=hotelFriendly]').eq(i).attr("checked",true);
			}
		}
	}
	
	$("#hotelRestrictItem").val("${shop.typeHotel.hotelRestrictItem}"); 
	$("#hotelIntroduction").val("${shop.typeHotel.hotelIntroduction}"); 
	
<!-- =========================================================================================================== -->		

	var restaurantServiceItem = ["停車場","不限時間","附有插座","戶外雅座","不收服務費","無障礙設施","親子遊樂區","wifi 無線網路"];
	var restaurantServiceValue = "${shop.typeRestaurant.restaurantService}".split(",");
	for(let i = 0;i <restaurantServiceItem.length;i++){
		for(let j = 0;j<restaurantServiceValue.length; j++){
			if(restaurantServiceItem[i] == restaurantServiceValue[j]){
				$('[name=restaurantService]').eq(i).attr("checked",true);
			}
		}
	}
	
	var restaurantPetTypeItem = ["小型犬","中型犬","大型犬","貓咪","兔子","不限"];
	var restaurantPetTypeValue = "${shop.typeRestaurant.restaurantPetType}".split(",");
	if(hotelPetTypeValue[0] != "不限"){
		for(let i = 0;i <restaurantPetTypeItem.length;i++){
			for(let j = 0;j<restaurantPetTypeValue.length; j++){
				if(restaurantPetTypeItem[i] == restaurantPetTypeValue[j]){
					$('[name=restaurantPetType]').eq(i).attr("checked",true);
				}
			}
		}
	}else{
		$('[name=restaurantPetType]').eq(5).attr("checked",true);
		for(let i = 0;i < hotelPetTypeItem.length-1;i++){
			$('[name=restaurantPetType]').eq(i).attr("disabled","disabled"); 
		}
	}
	
	$("#restaurantFee").val("${shop.typeRestaurant.restaurantFee}"); 
	
	var restaurantFriendlyItem = ["可攜帶寵物","提供寵物包廂","提供寵物餐點","免費寵物遊樂場","寵物不需額外費用","免費寵物輕食/零食"];
	var restaurantFriendlyValue = "${shop.typeRestaurant.restaurantFriendly}".split(",");
	for(let i = 0;i <restaurantFriendlyItem.length;i++){
		for(let j = 0;j<restaurantFriendlyValue.length; j++){
			if(restaurantFriendlyItem[i] == restaurantFriendlyValue[j]){
				$('[name=restaurantFriendly]').eq(i).attr("checked",true);
			}
		}
	}
	
	$("#restaurantRestrictItem").val("${shop.typeRestaurant.restaurantRestrictItem}"); 
	$("#restaurantIntroduction").val("${shop.typeRestaurant.restaurantIntroduction}"); 


<!-- =========================================================================================================== -->	
	
	function check_element(){
		const mySet = new Set();
		var message = "";
		
		if($("#shopName").val() == ""){
			mySet.add(1);
			message += "店名尚未填寫<br>";
		}
		
		if($("#phone").val() == ""){
			mySet.add(1);
			message += "電話尚未填寫<br>";
		}
		
		if($("#address").val() == ""){
			mySet.add(1);
			message += "地址尚未填寫<br>";
		}
		
		if($("#propertyPermit").val() == ""){
			mySet.add(1);
			message += "營業登記尚未填寫<br>";
		}
		
		if($("#email").val() == ""){
			mySet.add(1);
			message += "email尚未填寫<br>";
		}
		
		getTimefunc();
		
		if($("#monTilde").val() == "" || $("#mon").val() == ""){
			mySet.add(2);
			message += "星期一尚未填寫<br>";
		}
		
		if($("#tueTilde").val() == "" || $("#tue").val() == ""){
			mySet.add(2);
			message += "星期二尚未填寫<br>";
		}
		
		if($("#wedTilde").val() == "" || $("#wed").val() == ""){
			mySet.add(2);
			message += "星期三尚未填寫<br>";
		}
		
		if($("#thuTilde").val() == "" || $("#thu").val() == ""){
			mySet.add(2);
			message += "星期四尚未填寫<br>";
		}
		
		if($("#friTilde").val() == "" || $("#fri").val() == ""){
			mySet.add(2);
			message += "星期五尚未填寫<br>";
		}
		
		if($("#satTilde").val() == "" || $("#sat").val() == ""){
			mySet.add(2);
			message += "星期六尚未填寫<br>";
		}
		
		if($("#sunTilde").val() == "" || $("#sun").val() == ""){
			mySet.add(2);
			message += "星期天尚未填寫<br>";
		}
		
		if($("#t1").prop("checked")){//美容
			if( $("input[name='beautyTarget']:checked").length == 0){
				mySet.add(3);
				message += "美容對象尚未選擇<br>";
			}
		
			if( $("input[name='beautyBasicProject']:checked").length == 0){
				mySet.add(3);
				message += "基本服務尚未選擇<br>";
			}
			
			if( $("input[name='beautySpecialProject']:checked").length == 0){
				mySet.add(3);
				message += "特殊服務尚未選擇<br>";
			}
		}else if($("#t2").prop("checked")){//醫療
			if($("#hospitalDoctors").val() == ""){
				mySet.add(3);
				message += "醫生姓名尚未填寫<br>";
			}
			
			if( $("input[name='hospitalTarget']:checked").length == 0){
				mySet.add(3);
				message += "醫療對象尚未選擇<br>";
			}
			
			if( $("input[name='hospitalProject']:checked").length == 0){
				mySet.add(3);
				message += "醫療項目尚未選擇<br>";
			}
			
			if( $("input[name='hospitalFacility']:checked").length == 0){
				mySet.add(3);
				message += "醫療設施尚未選擇<br>";
			}
		}else if($("#t3").prop("checked")){//旅館
			if( $("input[name='hotelService']:checked").length == 0){
				mySet.add(3);
				message += "設備服務尚未選擇<br>";
			}
		
			if( $("input[name='hotelPetType']:checked").length == 0){
				mySet.add(3);
				message += "寵物類型尚未選擇<br>";
			}
			
			if($("#hotelFee").val() == ""){
				mySet.add(3);
				message += "費用尚未填寫<br>";
			}
			
			if( $("input[name='hotelFriendly']:checked").length == 0){
				mySet.add(3);
				message += "寵物友善尚未選擇<br>";
			}
			
			if($("#hotelRestrictItem").val() == ""){
				mySet.add(3);
				message += "限制尚未填寫<br>";
			}
			
			if($("#hotelIntroduction").val() == ""){
				mySet.add(3);
				message += "簡介尚未填寫<br>";
			}

		}else if($("#t4").prop("checked")){//餐廳
			if( $("input[name='restaurantService']:checked").length == 0){
				mySet.add(3);
				message += "設備服務尚未選擇<br>";
			}
		
			if( $("input[name='restaurantPetType']:checked").length == 0){
				mySet.add(3);
				message += "寵物類型尚未選擇<br>";
			}
			
			if($("#restaurantFee").val() == ""){
				mySet.add(3);
				message += "費用尚未填寫<br>";
			}
			
			if( $("input[name='restaurantFriendly']:checked").length == 0){
				mySet.add(3);
				message += "寵物友善尚未選擇<br>";
			}
			
			if($("#restaurantRestrictItem").val() == ""){
				mySet.add(3);
				message += "限制尚未填寫<br>";
			}
			
			if($("#restaurantIntroduction").val() == ""){
				mySet.add(3);
				message += "簡介尚未填寫<br>";
			}
		}
		
// 		if(!checkPhoto){
// 			mySet.add(4);
// 			message += "圖片尚未選擇<br>";
// 		}
		
		if(message.length != 0){
			if(mySet.has(1)){
				showBasic();
			}else if(mySet.has(2)){
				showTime();
			}else if(mySet.has(3)){
				showInfo();
			}else if(mySet.has(4)){
				showPhoto();
			}
			alertWarning(message);
			return false;
		}else{
			return true;
		}
	
	}
		
	function alertWarning(message) {
	    Swal.fire(
	    	"有欄位尚未填寫", //標題 
	    	message, 
	        "warning" 
	    );
	}
<!-- =========================================================================================================== -->		
	
	</script>
</body>
</html>