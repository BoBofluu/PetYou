<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style>
/* 搜尋欄位CSS */
* {
	margin: 0;
}

.topnav {
	overflow: hidden;
	background-color: #e9e9e9;
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

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #2196F3;
 	color: white;
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

/* css */
.d1{
    padding: 10px;
    margin-bottom: 20px;
    height: 45px;
}

/* 設置活動CSS */
.all2 {
	width: 1200px;
	margin: 0 auto;
}

.all2 > div {
	/* 		width:400px; */
	/* 		border:1px groove black; */
	background-color: blue;
	display: inline-block;
	margin-left: 30px;
	margin-bottom: 30px;
	/* 		overflow:hidden; */
	/* 		height: 400px; */
}

.divi {
	border: 1px groove red;
	width: 200px;
}

.divii {
	/* 		border:1px groove black; */
	width: 200px;
	/*--設定超出的內容隱藏, IE, FireFox通用--*/
	overflow: hidden;
	/*--(IE專用)在內容超出時,在後方補上逗號--*/
	text-overflow: ellipsis;
	/*-- 設定內容強制顯示一行,直到內容結束或<br>--*/
	white-space: nowrap;
}

i {
	color: #F4ACB7;
	/* 	size: 2px; */
}

i.fa.fa-map-marker.zz {
	font-size: large;
}

.name {
	font-family: 'Staatliches', cursive;
	font-size: 20px;
	font-weight: bold;
}

.title {
	
}

.lighter {
	font-size: 11px;
}

img {
	width: 200px;
	height: 150px;
}

.pagenum {
	display: inline-block;
}

.pagebar {
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

.pagenum2 {
	margin: 0 5px 5px 5px;
	display: block;
	width: 48px;
	height: 48px;
	line-height: 48px;
	font-family: "Poppins", sans-serif;
	font-size: 20px;
	line-height: 48px;
	text-align: center;
	background-color: #fff;
	border-radius: 50%;
	font-family: "Microsoft JhengHei", Arial, Tahoma, sans-serif;
}
/* 分頁css */
.pagenum {
	display: inline-block;
}

.pagebar {
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

.pagenum2 {
	margin: 0 5px 5px 5px;
	display: block;
	width: 48px;
	height: 48px;
	line-height: 48px;
	font-family: "Poppins", sans-serif;
	font-size: 20px;
	line-height: 48px;
	text-align: center;
	background-color: #fff;
	border-radius: 50%;
	font-family: "Microsoft JhengHei", Arial, Tahoma, sans-serif;
}

li{
	display:inline-block;
}


</style>
</head>

<body style="background-color: transparent;">
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<div class="topnav">
		<div class="search-container">
			<form action="/action_page.php">
				<input type="text" placeholder="請輸入..旅館/餐廳/活動 名稱" name="search"
					style="width: 300px;">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
		<div>
			<a class="active" id="hotel" style="background-color:#ffffff;color:black;" href="javascript:void(0)">旅館<input id="in1" type="hidden" value="${total_hot}"></a> 
			<a class="active" id="resturant" style="background-color:#ffffff;color:black;" href="javascript:void(0)">餐廳<input id="in2" type="hidden" value="${total_res}"></a> 
			<a class="active" id="activity" href="javascript:void(0)">活動<input id="in3" type="hidden" value="${total_act}"></a>
		</div>
	</div>

	<div class="d1 end">
		<div class="navTitle">
			<div class="arrow" id="arrow" onclick="hide();">
				<i class="fa fa-bars" aria-hidden="true" id ="arrowbars" style="font-size:40px"></i>
			</div>
		</div>
		<div class="naContent" id="cotent1" style="display: none;">
		<form:form method='POST' modelAttribute="" class='form-horizontal' enctype="multipart/form-data">					 
			<input type="checkbox" id="ch1" name="ch1" value="Bike">
  				<label for="ch1"> I have a bike</label>
  			<input type="checkbox" id="ch2" name="ch1" value="Bike">
  				<label for="ch2"> I have a bike</label>
  			<input type="checkbox" id="ch3" name="ch1" value="Bike">
  				<label for="ch3"> I have a bike</label>
			<input class="send" type="submit" value="搜尋"/>
			<input class="send" type="reset" value="清除條件"/>							 
		</form:form>
	
		</div>
	</div>
	
	<hr>
	
	<section class='all2' id="all2">
		<nav>
			<ul class="pagebar">
			</ul>
		</nav>
	</section>						
	<script>
	
		$("#activity").click(function(){
			$(".all").remove();
			$(".all2 div").remove();
			$(".pagebar li").remove();
		})
		$("#resturant").click(function(){
			$(".all").remove();
			$(".all2 div").remove();
			$(".pagebar li").remove();
		})
		$("#hotel").click(function(){
			$(".all").remove();
			$(".all2 div").remove();
			$(".pagebar li").remove();
		})
		var hotel = document.getElementById("hotel");
		var resturant = document.getElementById("resturant");
		var activity =  document.getElementById("activity");
		var total_hos = document.getElementById("in1").value;
		var total_res = document.getElementById("in2").value;
		var total_act =  document.getElementById("in3").value;
// 		alert("total_hos>>"+total_hos);
// 		alert("total_res>>"+total_res);
// 		alert("total_act>>"+total_act);
		var h_state = 0,r_state = 0,a_state=0; // 預設 旅館
		var xhr = new XMLHttpRequest(); // 功能:活動
		var xhr2 = new XMLHttpRequest(); // 分頁:旅館
		var xhr3 = new XMLHttpRequest(); // 分頁:餐廳
		
		activity.onclick=function(){
			h_state = 0;
			r_state = 0;
			a_state = 1;
			xhr.open("GET","<c:url value='/activitys/activity?pageNo=1&state="+a_state+"'/>",true);
 			xhr.send();
		}
		hotel.onclick=function(){
			h_state = 1;
			r_state = 0;
			a_state = 0;
			xhr2.open("GET","<c:url value='/activitys/hotel?pageNo=1&state="+h_state+"'/>",true);
 			xhr2.send();
		}
		resturant.onclick=function(){
			h_state = 0;
			r_state = 1;
			a_state = 0;
			xhr3.open("GET","<c:url value='/activitys/resturant?pageNo=1&state="+r_state+"'/>",true);
 			xhr3.send();
		}
		
 		
		xhr.onreadystatechange = function(){
			if(xhr.readyState === 4){
				if(xhr.status=== 200){
// 					alert(xhr.responseText);
					var obj = JSON.parse(xhr.responseText);
					var fina_length = Object.keys(obj).length
					$("<div/>").attr('class', 'containerr' + 1).appendTo(
							$(".all2"));
					var i = 1;
					for (i ; i <= fina_length; i++) {
						var a = '<c:url value="/activitys/in?id='+obj[i].id+'" />';
						var b = '<c:url value="/activitys/'+obj[i].id+'" />';
						$(".containerr" + i).html(
								'<div class="divi">'
								+'<div><a href="'+a+'"/>'
								+'<img src="'+b+'"/>'
								+'</a></div><div class="divii"><span class="name">'
								+ obj[i].name
								+'</span><br> <span class="title">'
								+ obj[i].title
								+'</span><br> <span'
								+'class="lighter"> <i class="fa fa-map-marker zz"aria-hidden="true"></i>&ensp;'
								+ obj[i].city
								+ obj[i].area
								+ obj[i].address
								+'</span><br> <span class="lighter"><i class="fas fa-phone-alt" aria-hidden="true"></i>&nbsp;'
								+ obj[i].phone
								+'</span><br>'
								+'</div><hr>'
								+'<div class=""><i class="fa fa-hashtag" aria-hidden="true"></i>&nbsp;活動</div></div>'						
						);
						if(i == fina_length)
							break;
						else{
							$("<div/>").attr('class', 'containerr' + (i+1))
						.appendTo($(".all2")).after($(".all2 > nav"));
						}				
					}
					for(var i=1; i<=total_act;i++){
						var link = '<li><a href="#" class="pagenum2"><span id="page'+i+'">'+i+'</span></a></li>';
						$("nav > .pagebar").append(link);
					}
//-------------------------------------分頁呈現-------------------------------------
					$("ul>li").click(function(){
						if($(this)!=null)
						$("a>span").parent().attr({
// 												'href':"javascript:void(0)"
												'href':"#"
											 });
						
						var pageNo = $(this).text();
						var url = "<c:url value='/activitys/activity?pageNo="+pageNo+"&state=1 '/>";
						$.ajax({
							url: url,
							dataType:'json',
					        type: 'GET',
					        success:
						        function(data){
									$(".all2 div").remove();				            	
						        	$("<div/>").attr('class', 'containerr' + 1).appendTo(
											$(".all2"));
									var i = 1;
									for(key in data){
										var a = '<c:url value="/activitys/in?id='+data[key].id+'" />';
										var b = '<c:url value="/activitys/'+data[key].id+'" />';
										$(".containerr" + i).html(
												'<div class="divi">'
												+'<div><a href="'+a+'"/>'
												+'<img src="'+b+'"/>'
												+'</a></div><div class="divii"><span class="name">'
												+ data[key].name
												+'</span><br> <span class="title">'
												+ data[key].title
												+'</span><br> <span'
												+'class="lighter"> <i class="fa fa-map-marker zz"aria-hidden="true"></i>&ensp;'
												+ data[key].city
												+ data[key].area
												+ data[key].address
												+'</span><br> <span class="lighter"><i class="fas fa-phone-alt" aria-hidden="true"></i>&nbsp;'
												+ data[key].phone
												+'</span><br>'
												+'</div><hr>'
												+'<div class=""><i class="fa fa-hashtag" aria-hidden="true"></i>&nbsp;活動</div></div>'						
										);
										if(i == fina_length+1)
											break;
										else{
											$("<div/>").attr('class', 'containerr' + (i+1))
												.appendTo($(".all2")).after($(".all2 > nav"));
										}
										i++;
									}				        			        	
						        },
							error:
								function(){
						        	alert("請求有問題!!");
					        	}
					    })
					})
					
					
				     
				}
			}
		}
		
		xhr2.onreadystatechange = function(){
			if(xhr2.readyState === 4){
				if(xhr2.status=== 200){
// 					alert(xhr.responseText);
					var obj = JSON.parse(xhr2.responseText);
					var fina_length = Object.keys(obj).length
					$("<div/>").attr('class', 'containerr' + 1).appendTo(
							$(".all2"));
					var i = 1;
					for (i ; i <= fina_length; i++) {
						var a = '<c:url value="/activitys/in?id='+obj[i].id+'" />';
						var b = '<c:url value="/activitys/'+obj[i].id+'" />';
						$(".containerr" + i).html(
								'<div class="divi">'
								+'<div><a href="'+a+'"/>'
								+'<img src="'+b+'"/>'
								+'</a></div><div class="divii"><span class="name">'
								+ obj[i].name
								+'</span><br> <span class="title">'
								+ obj[i].title
								+'</span><br> <span'
								+'class="lighter"> <i class="fa fa-map-marker zz"aria-hidden="true"></i>&ensp;'
								+ obj[i].city
								+ obj[i].area
								+ obj[i].address
								+'</span><br> <span class="lighter"><i class="fas fa-phone-alt" aria-hidden="true"></i>&nbsp;'
								+ obj[i].phone
								+'</span><br>'
								+'</div><hr>'
								+'<div class=""><i class="fa fa-hashtag" aria-hidden="true"></i>&nbsp;活動</div></div>'						
						);
						if(i == fina_length)
							break;
						else{
							$("<div/>").attr('class', 'containerr' + (i+1))
						.appendTo($(".all2")).after($(".all2 > nav"));
						}				
					}
					for(var i=1; i<=total_hos;i++){
						var link = '<li><a href="#" class="pagenum2"><span id="page'+i+'">'+i+'</span></a></li>';
						$("nav > .pagebar").append(link);
					}
//-------------------------------------分頁呈現-------------------------------------
					$("ul>li").click(function(){
						if($(this)!=null)
						$("a>span").parent().attr({
// 												'href':"javascript:void(0)"
												'href':"#"
											 });
						
						var pageNo = $(this).text();
						var url = "<c:url value='/activitys/activity?pageNo="+pageNo+"&state=1 '/>";
						$.ajax({
							url: url,
							dataType:'json',
					        type: 'GET',
					        success:
						        function(data){
									$(".all2 div").remove();				            	
						        	$("<div/>").attr('class', 'containerr' + 1).appendTo(
											$(".all2"));
									var i = 1;
									for(key in data){
										var a = '<c:url value="/activitys/in?id='+data[key].id+'" />';
										var b = '<c:url value="/activitys/'+data[key].id+'" />';
										$(".containerr" + i).html(
												'<div class="divi">'
												+'<div><a href="'+a+'"/>'
												+'<img src="'+b+'"/>'
												+'</a></div><div class="divii"><span class="name">'
												+ data[key].name
												+'</span><br> <span class="title">'
												+ data[key].title
												+'</span><br> <span'
												+'class="lighter"> <i class="fa fa-map-marker zz"aria-hidden="true"></i>&ensp;'
												+ data[key].city
												+ data[key].area
												+ data[key].address
												+'</span><br> <span class="lighter"><i class="fas fa-phone-alt" aria-hidden="true"></i>&nbsp;'
												+ data[key].phone
												+'</span><br>'
												+'</div><hr>'
												+'<div class=""><i class="fa fa-hashtag" aria-hidden="true"></i>&nbsp;活動</div></div>'						
										);
										if(i == fina_length+1)
											break;
										else{
											$("<div/>").attr('class', 'containerr' + (i+1))
												.appendTo($(".all2")).after($(".all2 > nav"));
										}
										i++;
									}				        			        	
						        },
							error:
								function(){
						        	alert("請求有問題!!");
					        	}
					    })
					})
					
					
				     
				}
			}
		}
		
		xhr3.onreadystatechange = function(){
			if(xhr3.readyState === 4){
				if(xhr3.status=== 200){
					alert(xhr3.responseText);
					var obj = JSON.parse(xhr3.responseText);
					var fina_length = Object.keys(obj).length;
					$("<div/>").attr('class', 'containerr' + 1).appendTo(
							$(".all2"));
					var i=1
					for(key in obj){
						$(".containerr" + i).html(
								"<p>"+obj[key].shopName+"</p>"						
						);
						console.log(obj[key].shopName)	
						if(i == fina_length)
							break;
						else{
							$("<div/>").attr('class', 'containerr' + (i+1))
						.appendTo($(".all2")).after($(".all2 > nav"));
						}
						i++;
					}
					for(var i=1; i<=total_res;i++){
						var link = '<li><a href="#" class="pagenum2"><span id="page'+i+'">'+i+'</span></a></li>';
						$("nav > .pagebar").append(link);
					}
//-------------------------------------分頁呈現-------------------------------------
					$("ul>li").click(function(){
						if($(this)!=null)
						$("a>span").parent().attr({
// 												'href':"javascript:void(0)"
												'href':"#"
											 });
						
						var pageNo = $(this).text();
						var url = "<c:url value='/activitys/activity?pageNo="+pageNo+"&state=1 '/>";
						$.ajax({
							url: url,
							dataType:'json',
					        type: 'GET',
					        success:
						        function(data){
									$(".all2 div").remove();				            	
						        	$("<div/>").attr('class', 'containerr' + 1).appendTo(
											$(".all2"));
									var i = 1;
									for(key in data){
										var a = '<c:url value="/activitys/in?id='+data[key].id+'" />';
										var b = '<c:url value="/activitys/'+data[key].id+'" />';
										$(".containerr" + i).html(
												'<div class="divi">'
												+'<div><a href="'+a+'"/>'
												+'<img src="'+b+'"/>'
												+'</a></div><div class="divii"><span class="name">'
												+ data[key].name
												+'</span><br> <span class="title">'
												+ data[key].title
												+'</span><br> <span'
												+'class="lighter"> <i class="fa fa-map-marker zz"aria-hidden="true"></i>&ensp;'
												+ data[key].city
												+ data[key].area
												+ data[key].address
												+'</span><br> <span class="lighter"><i class="fas fa-phone-alt" aria-hidden="true"></i>&nbsp;'
												+ data[key].phone
												+'</span><br>'
												+'</div><hr>'
												+'<div class=""><i class="fa fa-hashtag" aria-hidden="true"></i>&nbsp;活動</div></div>'						
										);
										if(i == fina_length+1)
											break;
										else{
											$("<div/>").attr('class', 'containerr' + (i+1))
												.appendTo($(".all2")).after($(".all2 > nav"));
										}
										i++;
									}				        			        	
						        },
							error:
								function(){
						        	alert("請求有問題!!");
					        	}
					    })
					})
					
					
				     
				}
			}
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
		
		
		$(".active").click(function(){
			$(this).css({
				"background-color": "#2196F3",
				"color": "white"
			}).siblings().css({
				"background-color": "#ffffff",
				"color": "black"
			}).end();
		})
	</script>
</body>
</html>