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
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
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
				<div class="navContent" id="shopNav" >
					<img src="https://img.icons8.com/carbon-copy/30/000000/shop.png"/>
					<span style="margin-left: 6%;" class="link" id="clickShop">店家管理</span>
					
				</div>
				<div class="navContent" id="customerNav" >
					<img src="https://img.icons8.com/dotty/30/000000/repository.png"/>
					<span style="margin-left: 6%;" class="link" id="clickCustomer">客服管理</span>
					
				</div>
				<div class="navContent" id="reportNav" >
					<img src="https://img.icons8.com/carbon-copy/30/000000/combo-chart.png"/>
					<span style="margin-left: 6%;" class="link" id="clickReport">網站分析</span>
					
				</div>
				<div style="margin-left:45px;" id="theReport">
					<div class="navContent" id="reportBasicNav" style="color:#8D5433">
						<img src="https://img.icons8.com/carbon-copy/30/000000/business-report.png"/>
						<span style="margin-left: 6%;" class="link" id="clickReportBasic">基礎資料</span>
						<i id="angle1" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</div>
					
					<div class="navContent" id="reportOperationNav" >
						<img src="https://img.icons8.com/carbon-copy/30/000000/bullish--v1.png"/>
						<span style="margin-left: 6%;" class="link" id="clickReportOperation">營運分析</span>
						<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;display:none"></i>
					</div>
				</div>
				
				<div style="height:15px"></div>
				
				<div class="pink" id="pink" style="display: none;"></div>
		</div>
		</div><!-- sidemenu -->
		<div class="main" style="margin-right:15px;">
<!-- =================================  網站分析區 ================================================================================================================================================================= -->			
			<div id="divBasicReport" >
				<div>
					<ul class="ReportUL">
						<li id="clicksexRatio"><div>性別比</div></li>
						<li id="clickplacePercentage"><div>地區分布</div></li>
						<li id="clickpetType"><div>寵物分類</div></li>
					</ul>
				</div>
<!-- =================================  性別比 ================================================================================================================================================================= -->				
				<div id="sexRatioTable">
				<div class="form-table" style="margin-top: 22px;">
					<div id="sexRatioContainer" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332">
						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;">
							</canvas>
						</div>
					</div> <!-- sexRatioContainer -->
				</div>	<!-- table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="sexRatioValue"> -->
<!-- 						123456789 -->
<!-- 					</div> sexRatioValue -->
<!-- 				</div>	table -->
				<div class="fih"></div>
				</div> <!-- sexRatioTable -->
<!-- =================================  地區店家 ================================================================================================================================================================= -->							
				<div id="placePercentageTable">
				<div class="form-table" style="margin-top: 22px;">
					<div id="placePercentageContainer" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332">
						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;">
							</canvas>
						</div>
					</div><!-- placePercentageContainer -->
				</div>	<!-- table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="placePercentageValue"> -->
<!-- 						123456789 -->
<!-- 					</div> placePercentageValue -->
<!-- 				</div>	table -->
				<div class="fih"></div>
				</div> <!-- placePercentageTable -->

<!-- =================================  寵物比 ================================================================================================================================================================= -->
				<div id="petTypeTable">
				<div class="form-table" style="margin-top: 22px;">
					<div id="petTypeContainer" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332">
						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;">
							</canvas>
						</div>
					</div><!-- petTypeContainer -->
				</div>	<!-- table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="petTypeValue"> -->
<!-- 						123456789 -->
<!-- 					</div> petTypeValue -->
<!-- 				</div>	table -->
				<div class="fih"></div>
				</div> <!-- petTypeTable -->

				
<!-- =================================  結束 ================================================================================================================================================================= -->				
				<div class="fih"></div>
			</div><!-- divBasicReport -->
			
<!-- =================================   ================================================================================================================================================================= -->							
			<div id="divOperatorReport">
				<div>
					<ul class="ReportUL">
						<li id="clickregisterNum"><div>註冊人數</div></li>
						<li id="clickCServiceNum"><div>反映項目</div></li>
						<li id="clickCTRateNum"><div>總點擊率</div></li>
					</ul>
				</div>
			
			
<!-- =================================  註冊人數 ================================================================================================================================================================= -->
				<div id="registerNumTable">
				<div class="form-table" style="margin-top: 22px;">
					<div id="registerNumContainer1" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332">
						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;">
							</canvas>
						</div>
					</div><!-- placePercentageContainer -->
				</div>	<!-- table -->
				
				<div class="form-table" style="margin-top: 22px;">
					<div id="registerNumContainer2" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332">
						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;">
							</canvas>
						</div>
					</div><!-- placePercentageContainer -->
				</div>	<!-- table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="registerNumValue"> -->
<!-- 						//用日期+男女比 -->
<!-- 					</div> placePercentageValue -->
<!-- 				</div>	table -->
				<div class="fih"></div>
				</div> <!-- placePercentageTable -->				

<!-- =================================  反映項目 ================================================================================================================================================================= -->
				<div id="CServiceNumTable">
				<div class="form-table" style="margin-top: 22px;">
					<div id="CServiceNumContainer" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332">
						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;">
							</canvas>
						</div>
					</div><!-- placePercentageContainer -->
				</div>	<!-- table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="CServiceNumValue"> -->
<!-- 						<div style="display:flex"> -->
<!-- 							<div style="padding-left:190px;font-size:20pt">反映項目</div> -->
<!-- 							<div style="font-size:20pt;margin-left:200px;">數量</div> -->
<!-- 							<div style="font-size:20pt;margin-left:200px;">百分比</div> -->
<!-- 						</div> -->
<!-- 							<hr> -->
<!-- 						<div style="display:flex"> -->
<!-- 							<div style="font-size:20pt">帳號相關</div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 							<div style="font-size:20pt"></div>	 -->
<!-- 						</div> -->
						
<!-- 						<div style="display:flex">	 -->
<!-- 							<div style="font-size:20pt">合作提案</div> -->
<!-- 							<div style="font-size:20pt"> </div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 						</div>	 -->
						
<!-- 						<div style="display:flex">	 -->
<!-- 			 	     		<div style="font-size:20pt">申請發放學術問</div> -->
<!-- 			 	     		<div style="font-size:20pt"></div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 						</div>	 -->
						
<!-- 						<div style="display:flex">			 -->
<!-- 				 	   		<div style="font-size:20pt">檢舉、處分相關</div> -->
<!-- 				 	   		<div style="font-size:20pt"></div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 						</div>	 -->
						
<!-- 						<div style="display:flex">		 -->
<!-- 							<div style="font-size:20pt">寵物聚會</div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 						</div> -->
						
<!-- 						<div style="display:flex">	 -->
<!-- 							<div style="font-size:20pt">我要預約</div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 						</div> -->
						
<!-- 						<div style="display:flex">		 -->
<!-- 							<div style="font-size:20pt">寵你論壇</div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 						</div> -->
						
<!-- 						<div style="display:flex">		 -->
<!-- 							<div style="font-size:20pt">線上商城</div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 						</div> -->
						
<!-- 						<div style="display:flex">		 -->
<!-- 							<div style="font-size:20pt">領養浪浪</div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 						</div> -->
						
<!-- 						<div style="display:flex">		 -->
<!-- 							<div style="font-size:20pt">其他問題</div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 							<div style="font-size:20pt"></div> -->
<!-- 						</div>	 -->
<!-- 					</div>	 -->
							
<!-- 					</div> placePercentageValue -->
					<div class="fih"></div>
				</div>	<!-- table -->
				
							
<!-- =================================  總點擊率 ================================================================================================================================================================= -->	
				<div id="CTRateNumTable">
				<div class="form-table" style="margin-top: 22px;">
					<div id="CTRateNumContainer" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332">
						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;">
							</canvas>
						</div>
					</div><!-- placePercentageContainer -->
				</div>	<!-- table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="CTRateNumValue"> -->
<!-- 							寵物聚會 -->
<!-- 						領養浪浪 -->
<!-- 						寵你論壇 -->
<!-- 						客服 -->
<!-- 						線上商城 -->
<!-- 						註冊 -->
<!-- 						預約系統 -->
<!-- 						登入 -->
<!-- 						聊天室 -->
						
						
<!-- 					</div> placePercentageValue -->
<!-- 				</div>	table -->
				<div class="fih"></div>
				</div> <!-- placePercentageTable -->
	
<!-- =================================  結束    ================================================================================================================================================================= -->	
			</div><!-- divOperatorReport -->
		</div><!-- main -->
	</div><!-- wrapper -->
	<script>
	if(${block=='ReportBasic'}){
		$("#reportBasicNav").css("color", "#8D5433");
		$("#reportOperationNav").css("color", "black");
		$("#angle1").css("display",'');
		$("#angle2").css("display",'none');
		$("#divBasicReport").show();
		$("#sexRatioTable").show();  
		$("#placePercentageTable").hide();
		$("#petTypeTable").hide();
		$("#divOperatorReport").hide();
		$("#registerNumTable").hide();
		$("#CServiceNumTable").hide();
		$("#CTRateNumTable").hide();
	}else if(${block=='ReportOperation'}){
		$("#reportBasicNav").css("color", "black");
		$("#reportOperationNav").css("color", "#8D5433");
		$("#angle1").css("display",'none');
		$("#angle2").css("display",'');
		getRegisterNum();
		$("#divBasicReport").hide();
		$("#sexRatioTable").hide();  
		$("#placePercentageTable").hide();
		$("#petTypeTable").hide();
		$("#divOperatorReport").show();
		$("#registerNumTable").show();
		$("#CServiceNumTable").hide();
		$("#CTRateNumTable").hide();
	}
	<!-- ================================= 性別比 ajax ============================================================================================================================================= -->	
	var MaleSet = 0; 
 	var FemaleSet = 0;
 	var UnknowSet = 0; 
 	
 	MaleSet = ${mapGender["男"]}; 
	FemaleSet = ${mapGender["女"]}; 
	UnknowSet = ${mapGender["無"]}; 
 	makesexRatioPie(MaleSet,FemaleSet,UnknowSet); 
 	
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
			$("#theReport").css("display","none");
			showReport = true;
		}else{
			$("#theReport").css("display","block");
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
 	
 	$("#clicksexRatio").click(function(){
		getGender();
		$("#sexRatioTable").show();  
		$("#placePercentageTable").hide();
		$("#petTypeTable").hide();
 		
 	})
 	
 	$("#clickplacePercentage").click(function(){
 		getPlace();
 		$("#sexRatioTable").hide();  
		$("#placePercentageTable").show();
		$("#petTypeTable").hide();
 	})
 	
 	$("#clickpetType").click(function(){
 		getPetType();
 		$("#sexRatioTable").hide();  
		$("#placePercentageTable").hide();
		$("#petTypeTable").show();
 	})
 	
 	$("#clickregisterNum").click(function(){
 		getRegisterNum();
 		$("#registerNumTable").show();  
		$("#CServiceNumTable").hide();
		$("#CTRateNumTable").hide();
 	})
 	
 	$("#clickCServiceNum").click(function(){
 		getCService();
 		$("#registerNumTable").hide();  
		$("#CServiceNumTable").show();
		$("#CTRateNumTable").hide();
 	})
 	
 	$("#clickCTRateNum").click(function(){
 		getCTRateNumTable();
 		$("#registerNumTable").hide();  
		$("#CServiceNumTable").hide();
		$("#CTRateNumTable").show();
 	})
 	
<!-- ================================================================================================== -->		 
	 function getGender(){
		 var xhr = new XMLHttpRequest(); 
		 	xhr.open("GET", "<c:url value='/Admin/getGender'/>", true); 
		 	xhr.send(); 
		 	var message = ""; 
		 	xhr.onreadystatechange = function() { 
		 		if (xhr.readyState == 4 && xhr.status == 200) { 
		 			var result = JSON.parse(xhr.responseText); 
		 			MaleSet = result["男"]; 
		 			FemaleSet = result["女"]; 
		 			UnknowSet = result["無"]; 
		 			makesexRatioPie(MaleSet,FemaleSet,UnknowSet); 
		 		} 
			}
	 }
	
<!-- =============================== 性別比 報表 =============================================================================================================================================== -->		
	
 function makesexRatioPie(MaleSet,FemaleSet,UnknowSet){ 
 	var dom = document.getElementById("sexRatioContainer"); 
 	var myChart = echarts.init(dom); 
 	var maleP = (MaleSet / (MaleSet+FemaleSet+UnknowSet)) *100; 
 	var femaleP = (FemaleSet / (MaleSet+FemaleSet+UnknowSet)) *100; 
 	var unknowP = (UnknowSet / (MaleSet+FemaleSet+UnknowSet)) *100; 
	
 	option = null; 
	option = { 
	 	title: { 
	 	     text: '會員性別比', 
	 	     subtext: '', 
	 	     left: 'center' ,
	 	     textStyle: { 
	            fontSize:25, 
	            fontStyle: 'normal',
	            fontWeight: 'bold',
	        },
	 	}, 
	 	tooltip: { 
	 	     trigger: 'item', 
	 	     formatter: '{a} <br/>{b} : {c} ({d}%)' 
	 	}, 
	 	legend: { 
	 	     orient: 'vertical', 
	 	     left: 'left', 
	 	     data: ['女性', '男性', '無'] ,
	 	    textStyle: { 
                fontSize: 20
            },
            formatter: function(name) {
                // 获取legend显示内容
                let data = option.series[0].data;
                let total = 0;
                let tarValue = 0;
                for (let i = 0, l = data.length; i < l; i++) {
                    total += data[i].value;
                    if (data[i].name == name) {
                        tarValue = data[i].value;
                    }
                }
                let p = (tarValue / total * 100).toFixed(2);
                return name + ' ' + ' ' + p + '%';
            },
	 	}, 
	 	series: [ 
	 	     { 
	 	         name: '性別比', 
	 	         type: 'pie', 
	 	         radius: '70%', 
	 	         center: ['50%', '55%'], 
	 	         data: [
	 	             {value: FemaleSet, name: '女性'}, 
	 	             {value: MaleSet, name: '男性'}, 
	 	             {value: UnknowSet, name: '無'} 
		            
	 	         ], 
	 	        label:{            //餅圖圖形上的文本標簽
                    normal:{
                        show:true,
                        
                        textStyle : {
                            fontWeight : 300 ,
                            fontSize : 30    //文字的字體大小
                        }
//                         formatter:'{d}%'     
                    }
                },
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
 }	 
<!-- ================================ 地區比 ajax ============================================================================================================================================== -->	
	var NorthSet = 0;	
	var SouthSet = 0; 
	var EastSet = 0; 
	var CentralSet = 0;
	var Outlying = 0;

 function getPlace(){
	 var xhr = new XMLHttpRequest(); 
	 	xhr.open("GET", "<c:url value='/Admin/getPlace'/>", true); 
	 	xhr.send(); 
	 	var message = ""; 
	 	xhr.onreadystatechange = function() { 
	 		if (xhr.readyState == 4 && xhr.status == 200) { 
	 			var result = JSON.parse(xhr.responseText); 
	 			console.log(result)
	 			NorthSet = result["北部"]; 
	 			CentralSet = result["中部"]; 
	 			SouthSet = result["南部"]; 
	 			EastSet = result["東部"]; 
	 			Outlying = result["離島"]; 
	 			makeplacePercentagePie(NorthSet,CentralSet,SouthSet,EastSet,Outlying); 
	 		} 
		}
 }

<!-- ================================ 地區比 報表 ============================================================================================================================================== -->		

function makeplacePercentagePie(NorthSet,CentralSet,SouthSet,EastSet,Outlying){ 
 	var dom = document.getElementById("placePercentageContainer"); 
 	var myChart = echarts.init(dom);  

 	option = null; 
	option = { 
	 	title: { 
	 	     text: '會員地區分布', 
	 	     subtext: '', 
	 	     left: 'center' ,
	 	     textStyle: { 
	            fontSize:25, 
	            fontStyle: 'normal',
	            fontWeight: 'bold',
	        },
	 	}, 
	 	tooltip: { 
	 	     trigger: 'item', 
	 	     formatter: '{a} <br/>{b} : {c} ({d}%)' 
	 	}, 
	 	legend: { 
	 	     orient: 'vertical', 
	 	     left: 'left', 
	 	     data: ['北部','中部','南部','東部','離島'] ,
	 	    textStyle: { 
                fontSize: 20
            },
            formatter: function(name) {
                // 获取legend显示内容
                let data = option.series[0].data;
                let total = 0;
                let tarValue = 0;
                for (let i = 0, l = data.length; i < l; i++) {
                    total += data[i].value;
                    if (data[i].name == name) {
                        tarValue = data[i].value;
                    }
                }
                let p = (tarValue / total * 100).toFixed(2);
                return name + ' ' + ' ' + p + '%';
            },
	 	}, 
	 	series: [ 
	 	     { 
	 	         name: '性別比', 
	 	         type: 'pie', 
	 	         radius: '70%', 
	 	         center: ['50%', '55%'], 
	 	         data: [
	 	             {value: NorthSet, name: '北部'}, 
	 	             {value: CentralSet, name: '中部'}, 
	 	             {value: SouthSet, name: '南部'}, 
	 	           	 {value: EastSet, name: '東部'}, 
	 	             {value: Outlying, name: '離島'} 
		            
	 	         ], 
	 	        label:{            //餅圖圖形上的文本標簽
                    normal:{
                        show:true,
                        
                        textStyle : {
                            fontWeight : 300 ,
                            fontSize : 30    //文字的字體大小
                        }
//                         formatter:'{d}%'     
                    }
                },
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
 }	 

<!-- ================================ 寵物比 ajax ============================================================================================================================================== -->	


function getPetType(){
 var xhr = new XMLHttpRequest(); 
 	xhr.open("GET", "<c:url value='/Admin/getPetType'/>", true); 
 	xhr.send(); 
 	var message = ""; 
 	xhr.onreadystatechange = function() { 
 		if (xhr.readyState == 4 && xhr.status == 200) { 
 			var result = JSON.parse(xhr.responseText); 
 			var petType = []
 			var petTypeNum = []
 			for(var pet in result){ //用雙陣列把map的key與value取出
 				petType.push(pet); //key
 				petTypeNum.push(result[pet]);//value
 			}
			makepetTypePie(petType,petTypeNum); 
 		} 
	}
}

<!-- ================================ 寵物比 報表 ============================================================================================================================================== -->		

function makepetTypePie(petType,petTypeNum){ 
	var dom = document.getElementById("petTypeContainer"); 
	var myChart = echarts.init(dom); 
	var arr = []
	for(let i= 0;i <  petType.length;i++){ //製作數組
		arr.push({value: petTypeNum[i], name: petType[i]})
	}
	
	option = null; 
	option = { 
	 	title: { 
	 	     text: '註冊之寵物分類', 
	 	     subtext: '', 
	 	     left: 'center' ,
	 	     textStyle: { 
	            fontSize:25, 
	            fontStyle: 'normal',
	            fontWeight: 'bold',
	        },
	 	}, 
	 	tooltip: { 
	 	     trigger: 'item', 
	 	     formatter: '{a} <br/>{b} : {c} ({d}%)' 
	 	}, 
	 	legend: { 
	 	     orient: 'vertical', 
	 	     left: 'left', 
	 	     data: petType,
	 	    textStyle: { 
                fontSize: 20
            },
            formatter: function(name) {
                // 获取legend显示内容
                let data = option.series[0].data;
                let total = 0;
                let tarValue = 0;
                for (let i = 0, l = data.length; i < l; i++) {
                    total += data[i].value;
                    if (data[i].name == name) {
                        tarValue = data[i].value;
                    }
                }
                let p = (tarValue / total * 100).toFixed(2);
                return name + ' ' + ' ' + p + '%';
            },
	 	}, 
	 	series: [ 
	 	     { 
	 	         name: '寵物比', 
	 	         type: 'pie', 
	 	         radius: '70%', 
	 	         center: ['50%', '55%'], 
	 	         data: arr, 
	 	        label:{            //餅圖圖形上的文本標簽
                    normal:{
                        show:true,
                        
                        textStyle : {
                            fontWeight : 300 ,
                            fontSize : 30    //文字的字體大小
                        }
//                         formatter:'{d}%'     
                    }
                },
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
}	 
<!-- ================================ 註冊比 ajax ============================================================================================================================================== -->	


function getRegisterNum(){
// 	$("#registerNumTable").show(); 
	makeregisterNumCategory(); 
	makeregisterNumContinuous(); 
//  var xhr = new XMLHttpRequest(); 
//  	xhr.open("GET", "<c:url value='/Admin/getRegisterNum'/>", true); 
//  	xhr.send(); 
//  	var message = ""; 
//  	xhr.onreadystatechange = function() { 
//  		if (xhr.readyState == 4 && xhr.status == 200) { 
//  			var result = JSON.parse(xhr.responseText); 
//  			console.log(result)
//  			$("#registerNumTable").show(); 
//  			var petType = []
//  			var petTypeNum = []
//  			for(var pet in result){ //用雙陣列把map的key與value取出
//  				petType.push(pet);
//  				petTypeNum.push(result[pet]);
//  			}
// 			makeregisterNumPie(petType,petTypeNum); 
//  		} 
// 	}
}

<!-- ================================ 註冊比 報表 category ============================================================================================================================================== -->		

function makeregisterNumCategory(){ 
	var dom = document.getElementById("registerNumContainer1");
	var myChart = echarts.init(dom);
	var app = {};
	option = null;
	option = {
			title: [{
			     left: 'center',
			     text: '每週註冊人數統計',
			    	 textStyle: { 
				            fontSize:25, 
				            fontStyle: 'normal',
				            fontWeight: 'bold',
				        },
			 }],
	 xAxis: {
	     type: 'category',
	     boundaryGap: false,
	     data: ['第一周', '第二周', '第三周', '第四周', '第五周', '第六周', '第七周'],
	     axisLabel:{textStyle:{fontSize:20}},
	 },
	 yAxis: {
	     type: 'value',
	     axisLabel:{textStyle:{fontSize:20}},
	 },
	 series: [{
	     data: [15, 29, 36, 30 ,30, 28,13],
	     type: 'line',
	     areaStyle: {}
	 }]
	};
	;
	if (option && typeof option === "object") {
	 myChart.setOption(option, true);
	}
}	
<!-- ================================ 註冊比 報表 continuous ============================================================================================================================================== -->		

function makeregisterNumContinuous(){ 
	var dom = document.getElementById("registerNumContainer2");
	var myChart = echarts.init(dom);
	var app = {};
	option = null;

	data = [["2020-10-17",7],["2020-10-18",8],//15
	        ["2020-10-19",5],["2020-10-20",5],["2020-10-21",5],["2020-10-22",3],["2020-10-23",3],["2000-10-24",4],["2000-10-25",4],//29
	        ["2000-10-26",5],["2000-10-27",5],["2000-10-28",5],["2000-10-29",5],["2000-10-30",5],["2000-10-31",5],["2000-11-01",6],//36
	        ["2000-11-02",4],["2000-11-03",3],["2000-11-04",5],["2000-11-05",4],["2000-11-06",4], ["2000-11-07",6],["2000-11-08",4],//30
	        ["2000-11-09",3],["2000-11-10",5],["2000-11-11",3],["2000-11-12",3],["2000-11-13",4],["2000-11-14",7],["2000-11-15",2],//30
	        ["2000-11-16",4],["2000-11-17",6],["2000-11-18",6],["2000-11-19",3],["2000-11-20",6],["2000-11-21",1],["2000-11-22",2],//28
	        ["2000-11-23",3],["2000-11-24",7],["2000-11-25",3]];//13

	var dateList = data.map(function (item) {
	 return item[0];
	});
	var valueList = data.map(function (item) {
	 return item[1];
	});

	option = {

	 // Make gradient line here
	 visualMap: [{
	     show: false,
	     type: 'continuous',
	     seriesIndex: 0,
	     min: 0,
	     max: 6
	 }],
	 title: [{
	     left: 'center',
	     text: '每日註冊人數統計',
	    	 textStyle: { 
		            fontSize:25, 
		            fontStyle: 'normal',
		            fontWeight: 'bold',
		        },
	 }],
	 tooltip: {
	     trigger: 'axis'
	 },
	 xAxis: [{
	     data: dateList,
	     axisLabel:{textStyle:{fontSize:20}}
	 }],
	 yAxis: [{
	     splitLine: {show: false},
	     axisLabel:{textStyle:{fontSize:20}}
	 }],
	 grid: [{
	     bottom: '10%'
	 }],
	 series: [{
	     type: 'line',
	     showSymbol: false,
	     data: valueList
	 }]
	};;
	if (option && typeof option === "object") {
	 myChart.setOption(option, true);
	}
}	 

<!-- ================================ 反映項目 ajax ============================================================================================================================================== -->	


function getCService(){
 var xhr = new XMLHttpRequest(); 
 	xhr.open("GET", "<c:url value='/Admin/getCService'/>", true); 
 	xhr.send(); 
 	var message = ""; 
 	xhr.onreadystatechange = function() { 
 		if (xhr.readyState == 4 && xhr.status == 200) { 
 			var result = JSON.parse(xhr.responseText); 
 			console.log(result);
 			var customercomplaintType = []
 			var customercomplaintTypeNum = []
 			for(var thekey in result){ //用雙陣列把map的key與value取出
 				customercomplaintType.push(thekey); //key
 				customercomplaintTypeNum.push(result[thekey]);//value
 			}
			makeCServicePie(customercomplaintType,customercomplaintTypeNum); 
 		} 
	}
}

<!-- ================================ 反映項目 報表 ============================================================================================================================================== -->		

function makeCServicePie(customercomplaintType,customercomplaintTypeNum){ 
	var dom = document.getElementById("CServiceNumContainer"); 
	var myChart = echarts.init(dom); 
	var arr = []
	for(let i= 0;i <  customercomplaintType.length;i++){ //製作數組
		arr.push({value: customercomplaintTypeNum[i], name: customercomplaintType[i]})
	}
	
	option = null; 
	option = { 
	 	title: { 
	 	     text: '客服反映項目分類', 
	 	     subtext: '', 
	 	     left: 'center' ,
	 	     textStyle: { 
	            fontSize:25, 
	            fontStyle: 'normal',
	            fontWeight: 'bold',
	        },
	 	}, 
	 	tooltip: { 
	 	     trigger: 'item', 
	 	     formatter: '{a} <br/>{b} : {c} ({d}%)' 
	 	}, 
	 	legend: { 
	 	     orient: 'vertical', 
	 	     left: 'left', 
	 	     data: customercomplaintType,
	 	    textStyle: { 
                fontSize: 20
            },
            formatter: function(name) {
                // 获取legend显示内容
                let data = option.series[0].data;
                let total = 0;
                let tarValue = 0;
                for (let i = 0, l = data.length; i < l; i++) {
                    total += data[i].value;
                    if (data[i].name == name) {
                        tarValue = data[i].value;
                    }
                }
                let p = (tarValue / total * 100).toFixed(2);
                return name + ' ' + ' ' + p + '%';
            },
	 	}, 
	 	series: [ 
	 	     { 
	 	         name: '客服反映項目分類', 
	 	         type: 'pie', 
	 	         radius: '70%', 
	 	         center: ['58%', '55%'], 
	 	         data: arr,
	 	        label:{            //餅圖圖形上的文本標簽
                    normal:{
                        show:true,
                        
                        textStyle : {
                            fontWeight : 300 ,
                            fontSize : 30    //文字的字體大小
                        }
//                         formatter:'{d}%'     
                    }
                },
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
}
<!-- ================================ 點擊率 ajax ============================================================================================================================================== -->	


function getCTRateNumTable(){
 var xhr = new XMLHttpRequest(); 
 	xhr.open("GET", "<c:url value='/Admin/getCTRate'/>", true); 
 	xhr.send(); 
 	var message = ""; 
 	xhr.onreadystatechange = function() { 
 		if (xhr.readyState == 4 && xhr.status == 200) { 
 			var result = JSON.parse(xhr.responseText); 
 			console.log(result);
 			var CTRateType = []
 			var CTRateTypeNum = []
 			var sort=["登入系統","註冊系統","寵物聚會","預約系統","寵物論壇","線上商城","領養浪浪","客服系統","聊天室"];
 			for(let i= 0; i <sort.length;i++ ){ 
 				CTRateType.push(sort[i]); //key
 				CTRateTypeNum.push(result[sort[i]]);//value
 			}
 			
			makeCTRateNumTablePie(CTRateType,CTRateTypeNum); 
 		} 
	}
}

<!-- ================================ 點擊率 報表 ============================================================================================================================================== -->		

function makeCTRateNumTablePie(CTRateType,CTRateTypeNum){ 
	
	var dom = document.getElementById("CTRateNumContainer"); 
	var myChart = echarts.init(dom); 
	var arr = []
	for(let i= 0;i <  CTRateType.length;i++){ //製作數組
		arr.push({value: CTRateTypeNum[i], name: CTRateType[i]})
	}
	
	option = null; 
	option = { 
	 	title: { 
	 	     text: '點擊率', 
	 	     subtext: '', 
	 	     left: 'center' ,
	 	     textStyle: { 
	            fontSize:25, 
	            fontStyle: 'normal',
	            fontWeight: 'bold',
	        },
	 	}, 
	 	tooltip: { 
	 	     trigger: 'item', 
	 	     formatter: '{a} <br/>{b} : {c} ({d}%)' 
	 	}, 
	 	legend: { 
	 	     orient: 'vertical', 
	 	     left: 'left', 
	 	     data: CTRateType,
            formatter: function(name) {
                
                let data = option.series[0].data;
                let total = 0;
                let tarValue = 0;
                for (let i = 0, l = data.length; i < l; i++) {
                    total += data[i].value;
                    if (data[i].name == name) {
                        tarValue = data[i].value;
                    }
                }
                
                let p = (tarValue / total * 100).toFixed(2);

                return name + ' ' + ' ' + p + '%';
            },
            textStyle: { 
            	fontSize:20
            }
	 	}, 
	 	series: [ 
	 	     { 
	 	         name: '點擊率', 
	 	         type: 'pie', 
	 	         radius: '70%', 
	 	         center: ['55%', '55%'], 
	 	         data: arr, 
	 	         label:{            //餅圖圖形上的文本標簽
                    normal:{
                        show:true,
                        
                        textStyle : {
                            fontWeight : 300 ,
                            fontSize : 30    //文字的字體大小
                        }
//                         formatter:'{d}%'     
                    }
                },
	 	         emphasis: { 
	 	             itemStyle: { 
	 	                 shadowBlur: 10, 
	 	                 shadowOffsetX: 0, 
		                 shadowColor: 'rgba(0, 0, 0, 0.5)' 
	 	             } ,
	 	             
	 	         } 
	 	     } 
	 	 ] 
		};
	; 
	if (option && typeof option === "object") { 
		 myChart.setOption(option, true); 
	} 
}	 
<!-- ============================================================================================================================================================================== -->		
	
	
	
	</script>
</body>
</html>