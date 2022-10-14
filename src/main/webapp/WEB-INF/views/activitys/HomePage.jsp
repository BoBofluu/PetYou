<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
<style>
/* 搜尋欄位CSS */
* {
	margin: 0;
}

form.form{
	padding:3px;
}

.topnav {
    overflow: hidden;
    background-color: #f4acb7;
    width: 1430px;
    margin-left: 40px;
}

.topnav a {
	float: right;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 20px;
}

.topnav>div a:hover {
    background-color: azure;
    color: #705b5b;
}

.topnav a.active {
    background-color: #f4acb7;
    color: #ffffff;
}

.topnav .search-container {
	float: left;
	margin-left: 20px;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.topnav .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}
/* 功能：搜尋條件 */
.navTitle {
	display: inline-block;
    line-height: 0px;
}

.naContent {
	height: auto;
	display: inline-block;
}

.arrow {
	font-size: 35pt;
	margin-left:10px;
}
input[type=checkbox],.send[type=submit],.send[type=reset]{
	margin-left:20px;
}

</style>
</head>

<body style="background-color: transparent;">
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<div class="topnav">
		<div class="search-container">
			<form id="form" class="form" action="<c:url value='/activitys/search'/>" method="get">
				<input id="search" type="text" placeholder="請輸入..旅館/餐廳/活動 名稱" name="search"
					style="width: 300px;" onblur="check();">
				<button id="submit" type="submit" onblur="return submit();">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
		<div>
			<c:if test="${ userType == 'isAdmin'}">
				<a class="active" id="manager" href="<c:url value='/activityAdmin'/>">管理功能<input id="in4" type="hidden" value="${total_act}"></a>
			</c:if>
			<a class="active" id="hotel" href="javascript:void(0)">旅館<input id="in1" type="hidden" value="${total_hot}"></a> 
			<a class="active" id="resturant" href="javascript:void(0)">餐廳<input id="in2" type="hidden" value="${total_res}"></a> 
			<a class="active" id="activity" href="javascript:void(0)">活動<input id="in3" type="hidden" value="${total_act}"></a>
		</div>
	</div>

<!-- 	<div class="d1 end"> -->
<!-- 		<div class="navTitle"> -->
<!-- 			<div class="arrow" id="arrow" onclick="hide();"> -->
<!-- 				<i class="fa fa-bars" aria-hidden="true" id ="arrowbars" style="font-size:40px"></i> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="naContent" id="cotent1" style="display: none;"> -->
<%-- 		<form:form method='POST' modelAttribute="" class='form-horizontal' enctype="multipart/form-data">					  --%>
<!-- 			<input type="checkbox" id="ch1" name="ch1" value="Bike"> -->
<!--   				<label for="ch1"> I have a bike</label> -->
<!--   			<input type="checkbox" id="ch2" name="ch1" value="Bike"> -->
<!--   				<label for="ch2"> I have a bike</label> -->
<!--   			<input type="checkbox" id="ch3" name="ch1" value="Bike"> -->
<!--   				<label for="ch3"> I have a bike</label> -->
<!-- 			<input class="send" type="submit" value="搜尋"/> -->
<!-- 			<input class="send" type="reset" value="清除條件"/>							  -->
<%-- 		</form:form> --%>
	
<!-- 		</div> -->
<!-- 	</div> -->
	
	<hr>

<!-- ------------------------------------------------------------------------------------- -->
<script>
		var hotel = document.getElementById("hotel");
		var resturant = document.getElementById("resturant");
		var activity =  document.getElementById("activity");
		var total_hos = document.getElementById("in1").value;
		var total_res = document.getElementById("in2").value;
		var total_act =  document.getElementById("in3").value;
		var h_state = 0,r_state = 0,a_state=0; // 預設 旅館
		var xhr = new XMLHttpRequest(); // 功能:活動
		var xhr2 = new XMLHttpRequest(); // 分頁:旅館
		var xhr3 = new XMLHttpRequest(); // 分頁:餐廳
		
		activity.onclick=function(){
			h_state = 0;
			r_state = 0;
			a_state = 1;
			str="活動";
			type=1;
			location.href="<c:url value='/activitys?pageNo=1&state="+type+"&type="+str+"'/>";
		}
		hotel.onclick=function(){
			h_state = 1;
			r_state = 0;
			a_state = 0;
			str="旅館";
			type=1;
			location.href="<c:url value='/activitys?pageNo=1&state="+type+"&type="+str+"'/>";
		}
		resturant.onclick=function(){
			h_state = 0;
			r_state = 1;
			a_state = 0;
			str="餐廳";
			type=1;
			location.href="<c:url value='/activitys?pageNo=1&state="+type+"&type="+str+"'/>";
		}
		
		function hide() {
			$("#arrowbars").removeClass("fa-bars").addClass("fa-times");
			document.getElementById("cotent1").style.display = "";
			document.getElementById("arrow").setAttribute("onClick",
					"javascript: Boo();");
		}

		function Boo() {
			$("#arrowbars").removeClass("fa-times").addClass("fa-bars");
			document.getElementById("cotent1").style.display = "none";
			document.getElementById("arrow").setAttribute("onClick",
					"javascript: hide();");
		}
		
// 		$(".active").click(function(){
// 			$(this).css({
// 				"background-color": "#2196F3",
// 				"color": "white"
// 			}).siblings().css({
// 				"background-color": "#ffffff",
// 				"color": "black"
// 			}).end();
// 		})
	
		function check(){
			var search = document.getElementById("search").value; 
			if(search.replace(/^\s*|\s*$/g,"").length==0)
			    alert("請輸入搜尋內容");
			else
			    ;
		}
		
		$("#submit").click(function(){
	        if($("#search").val() == null || $("#search").val() == ""){
	            alert("輸入搜尋內容才可送出");
	            return false;
	        }else{
	        	return true;
	        }       
	    });
			
		
</script>
</body>
</html>