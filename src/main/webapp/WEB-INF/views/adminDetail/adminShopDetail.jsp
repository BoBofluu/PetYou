<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
* {
	padding: 0px;
	margin: 0px;
}

.navBar {
	width: 250px;
	height: auto;
	background-color: white;
	border-radius: 8px;
	margin-left: 3%;
	box-shadow: 12px 12px 7px #dfe3e8;
	display: inline-block;
}

.navTitle {
	background-color: #FDDAD8;
	padding: 20px;
	font-weight: 600;
	color: #642018;
	font-size: 20pt;
}

.navContent {
	padding: 20px;
	padding-bottom: 0px;
	font-weight: 600;
}

.navContent:hover { 
	color: #E22B2F;
}

#pic1 {
	float: right;
}

.pink {
	padding: 10px;
	margin-top: 10px
}
.link{
	cursor: pointer;
}

.link:hover {
	color: #E22B2F;
}
.wrapper {
	
	width: 1445px;
	margin: 5px auto 15px;
}

.sidemenu {
	float: left;
	width: 300px;
/* 	background-color: #ffffff; */
	border-radius: 15px;
	font-size: 2em;
/* 	box-shadow: 12px 12px 7px #dfe3e8; */
}

.main {
	
	height: 500px;
	display: block;
	float: right;
	width: 1065px;
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
}

.input-holder {
	width: 200px;
	outline: 0;
	border-radius: 10px;
	text-align: center;
	border:0px;
	background-color:#f6c2cd;
	height: 45px;
	margin-bottom: 10px;
}

.theselectMember{
	width: 100px;
	padding: 0 0 0 70px;
	border:0px;
	background-color:#f6c2cd;
	border-radius: 10px;
	outline: 0; 
}

.theselectShop{
	width: 100px;
	padding: 0 0 0 70px;
	border:0px;
	background-color:#f6c2cd;
	border-radius: 10px;
	outline: 0; 
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

.theimg {
/* 	border-radius: 20px; */
	width:200px;
	height:200px;
	object-fit: contain;
/* 	border:1px solid #f9dae1; */
}

.site_search {
	width: 90%;
	margin: auto;
}

.search_input {
	margin-right: 5px;
	height: 30px;
	width: calc(100% - 100px);
	border: 1px solid #642017;
	padding: 4px 10px;
	background: #f0ede9;
	color: #642017;
	font-size: 15px;
	vertical-align: middle;
	border-radius: 5px;
	outline: 0; 
	height: 50px;
}

.search_btn {
	width: initial;
	height: 30px;
	padding: 8px 25px;
	background-color: #d9d9d9;
	border: 1px solid #bbb;
	border-radius: 2px;
	vertical-align: middle;
	border-radius: 5px;
	outline: 0; 
	height: 50px;
}

.search_btn:hover{
	background-color:#f8cdd6;
}

.cool{
	padding: 8px;
    border: 0px;
    font-size: large;
    border-radius: 5px;
    margin-left: 4%;
    background-color: #F5AAAF;
    font-weight: bold;
    opacity: 0.8;
    color: #2F2F2F;
    outline: none;
    letter-spacing: 2px;
    width: 100px;
}

.spanTitle{
	color: #7E3B31;
	font-weight: 600;
	width:40px;
	
}

.ReportUL {
	width: 100%;
	overflow: auto;
/* 	background: #E96681; */
	border-radius: 5px;
	list-style-type: none;
	margin: auto;
	font-weight: 900;
	display: flex;
}

.ReportUL li {
	flex: 1;
	line-height: 2em;
	float: left;
	cursor: pointer;
}

.ReportUL li div {
	margin:0px auto;
	display: block;
	text-align: center;
	font-size: x-large;
	color: #642018;
	background: #FDDAD8;
	width: 130px;
    border-radius: 12px;
}

.customerUL {
	width: 100%;
	overflow: auto;
/* 	background: #E96681; */
	border-radius: 5px;
	list-style-type: none;
	margin: auto;
	font-weight: 900;
	display: flex;
}

.customerUL li {
	flex: 1;
	line-height: 2em;
	float: left;
/* 	cursor: pointer; */
}
 
.customerUL li div {
	margin:0px auto;
	display: block;
	text-align: center;
	font-size: x-large;
	color: #642018;
	background: #FDDAD8;
	width: 130px;
    border-radius: 12px;
    cursor: pointer;
}


.pages {
	margin-bottom: 10px;
	float: right;
	margin-right: 21%;
}

#conditionPages {
	margin-bottom: 10px;
	float: right;
	margin-right: 50%;
	
}

.test1234{
	width: 13.7%;
    display: inline-block;
    text-align: center;
    margin-top: 2%;
    font-size: 18pt;
}
</style>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	
	<div class="wrapper clearfix">
		<div class="sidemenu">
			<div class="navBar">
				<div class="navTitle">
					後臺管理<img id="pic1" src="https://img.icons8.com/ios/40/000000/outdent.png" />
				</div>
				<div class="navContent" id="memberNav" >
					<img src="https://img.icons8.com/carbon-copy/30/000000/user-female-circle.png"/>
					<span style="margin-left: 6%;" class="link" id="clickMember">會員管理</span>
					
				</div>
				<div class="navContent" id="shopNav" style="color:#8D5433">
					<img src="https://img.icons8.com/carbon-copy/30/000000/shop.png"/>
					<span style="margin-left: 6%;" class="link" id="clickShop">店家管理</span>
					<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
				</div>
				<div class="navContent" id="customerNav" >
					<img src="https://img.icons8.com/dotty/30/000000/repository.png"/>
					<span style="margin-left: 6%;" class="link" id="clickCustomer">客服管理</span>
					
				</div>
				<div class="navContent" id="reportNav" >
					<img src="https://img.icons8.com/carbon-copy/30/000000/combo-chart.png"/>
					<span style="margin-left: 6%;" class="link" id="clickReport">網站分析</span>
					
				</div>
				<div style="margin-left:45px;display:none" id="theReport">
					<div class="navContent" id="reportBasicNav" >
						<img src="https://img.icons8.com/carbon-copy/30/000000/business-report.png"/>
						<span style="margin-left: 6%;" class="link" id="clickReportBasic">基礎資料</span>
						
					</div>
					
					<div class="navContent" id="reportOperationNav" >
						<img src="https://img.icons8.com/carbon-copy/30/000000/bullish--v1.png"/>
						<span style="margin-left: 6%;" class="link" id="clickReportOperation">營運分析</span>
						
					</div>
				</div>
				
				<div style="height:15px"></div>
				
				<div class="pink" id="pink" style="display: none;"></div>
		</div>
		</div><!-- sidemenu -->
		<div class="main" style="margin-right:15px;">
		<div id="divShop">
				<div style="margin-bottom:10px;margin-left:15px;">
					<input class="search_input" placeholder="搜尋店家" type="text" id="search_Shop"/>
					<input class="search_btn" type="image" id="TheChosenShop"  src="http://3.bp.blogspot.com/-fpi6-9d3JpQ/Vo0LXN6iUDI/AAAAAAAANPA/89JVfzXNtXg/s1600/search-icon.png" />
				</div>
				<c:forEach  var="shop" items="${ shops }" varStatus="status">
				
				<div id="Shop_${shop.shopID}" class="TheShop">
				<input type="hidden" value="${shop.shopID}" style="display:none" id="Shopid_${status.count}">
				<div class="form-table">
					<div class="form-item fih" style="height:250px">
						<div class="form-controler">
							<img src = "${shop.environmentalPhotos}"  class="theimg">
						</div>
						<div style="display:block;padding-left: 17px;">
							<div style="margin-left:10px">
								<span class="spanTitle">店名</span>
								<input type="text" class="input-holder" value="${shop.shopName}" readonly/>
							</div>
							
							<div style="margin-left:10px">		
									<span class="spanTitle" >狀態</span>
								<c:choose>
								<c:when test="${ shop.status == '刪除' }"> 
									<input  type="text" class="input-holder" value="${shop.status}" disabled/>	
								</c:when>
								<c:otherwise>
									<select name="Shop_status" id="Shop_status${status.count}" class="theselectShop" style="width:200px;height:40px;text-align:center;margin-bottom:11px;">
										<option value="-1" >請選擇</option>
									</select>
									
								<script>
									var Shop_status = $("#Shop_status${status.count}")[0];
									Shop_status.options.length = 0;
															
					 				var new_option = new Option("不合格","不合格");
					 				Shop_status.options.add(new_option);
		
						 			var new_option = new Option("合格", "合格");
						 			Shop_status.options.add(new_option);
						 			
						 			if('${shop.status}' == "不合格"){
						 				$("#Shop_status${status.count} option[value='不合格']").attr('selected', 'selected');
						 			}else{
						 				$("#Shop_status${status.count} option[value='合格']").attr('selected', 'selected');	
						 			}
						 			var newStatus="";
						 			$("#Shop_status${status.count}").on("change",function(){
						 				newStatus = $("#Shop_status${status.count}").val();
						 				id = $("#Shopid_${status.count}").val();
						 				changeShopStatus(id,newStatus);
						 			})				 			
						 			
						 			function changeShopStatus(id,newStatus){
						 				console.log("newStatus = " + newStatus);
						 				console.log("id = " + id);
						 				$.ajax({ 
						 					url:"<c:url value='/changeShopStatus' />", 
						 					type:'post', 
						 					data: { "shopID" : id , "status" : newStatus },
						 					error:function(){ 
						 						alert('error'); 
						 					}, 
						 					success:function(data){ 
						 						console.log(data["changeType"])
						 						changesuccess();
						 					}
						 				});
						 			}
						 			
						 			function changesuccess() {
						 	            Swal.fire(
						 	                "更改成功", 
						 	                "", 
						 	                "success"    
						 	            );
						 	        }
								</script>	
		
								</c:otherwise>
								</c:choose>
							</div>
							
							<div style="margin-left:10px">
								<span class="spanTitle">信箱</span>
								<input type="text" class="input-holder"  style="width:335px"
									value="${shop.email}" readonly/>
							</div>
							
							<div style="margin-left:10px">
								<span class="spanTitle">地址</span>		
								<input type="text"  class="input-holder"   style="width:335px"
									value="${shop.address }" readonly/>
							</div>
			
							</div><!-- display:block -->
					</div>
				</div>
				<div style="height:15px"></div>
				</div>
				</c:forEach>
				</div><!-- shop -->
			</div><!-- main -->
		</div><!-- wrapper -->
	<script>
<!-- ================================================================================================== -->	
	$("#clickMember").click(function(){  
 		location.href="<c:url value='/adminDetail'/>";	
 	})
 	
 	$("#clickShop").click(function(){  
 		location.href="<c:url value='/adminShopDetail'/>"	; 
 	})
 	
 	$("#clickCustomer").click(function(){
		location.href="<c:url value='/adminCustomerDetail?block=UnCheck'/>";	
 	})
 	
 	var showReport = false;
 	$("#clickReport").click(function(){
		if(!showReport){
			$("#theReport").css("display","block");
			showReport = true;
		}else{
			$("#theReport").css("display","none");
			showReport = false;
		}
 	})
 	
 	$("#clickReportBasic").click(function(){  
 		location.href="<c:url value='/adminReport?block=ReportBasic'/>";	  
 	})
 	
 	$("#clickReportOperation").click(function(){  
 		location.href="<c:url value='/adminReport?block=ReportOperation'/>";
 	})
 	
 	
<!-- ================================================================================================== -->	
	$("#search_Shop").keyup(function(e){ 
	    var code = e.key; // recommended to use e.key, it's normalized across devices and languages
	    if(code==="Enter") {
	    	$('.TheShop').show();
	    	findShop();
	    }
	});

 	document.getElementById("TheChosenShop").onclick = function(){
 		$('.TheShop').show();
 		findShop();
 	}
 	
 	function findShop(){
	 	var theChosenOne = $("#search_Shop").val();
		console.log("theChosenOne = " + theChosenOne);
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/TheChosenShop' />", true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("theChosenOne=" + theChosenOne);
		var message = "";
		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);
				for (var x of result) { // 遍歷Set
				    $("#Shop_"+x).css('display','none'); 
				}
				console.log(result.length);
			}
		}
 	}
	
	</script>
</body>
</html>