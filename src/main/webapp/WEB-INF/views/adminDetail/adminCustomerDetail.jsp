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
	
	<div class="wrapper clearfix" style="height:1300px">
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
<!-- 					<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i> -->
				</div>
				<div class="navContent" id="customerNav" style="color:#8D5433">
					<img src="https://img.icons8.com/dotty/30/000000/repository.png"/>
					<span style="margin-left: 6%;" class="link" id="clickCustomer">客服管理</span>
					<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
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
			<div id="divCustomer" >
				<div>
					<ul class="customerUL">
						<li ><div id="clickUnChecked">尚未處理</div></li>
						<li ><div id="clickChecked">已處理</div></li>
					</ul>
				</div>
				
				<div id="unCheckedTable">
				<div class="form-table" style="margin-top: 22px;">
					<div class="test1234">反映編號</div>
					<div class="test1234">反映項目</div>
					<div class="test1234" style="margin-left: 77px;">反映內容</div>
					<div class="test1234" style="margin-left: 229px;">處理方式</div>
					<div class="test1234" style="margin-left: -7px;">處理狀態</div>
					<hr>
					<c:forEach  var="UncheckCustomerService" items="${ UncheckCustomerServices }" varStatus="status">
					<div style="margin: 2px 0;padding-bottom: 1px;">
	 					<div id="UncheckCustomerService_${UncheckCustomerService.customerServiceID}" class="CustomerService" style="padding-top: 14px;display:flex;margin: 10px 0px;"> 
							<div style="background-color:#fca2b4;width: 73px;margin-left: 38px;text-align: center; border-radius: 999rem;font-size: 18pt;">${UncheckCustomerService.customerServiceID}</div>
							<div style="margin-left:59px;font-size: 18pt;width:225px;">${UncheckCustomerService.customercomplaintType}</div>	
							<div id="UncheckcomplaintLetter_${UncheckCustomerService.customerServiceID}" style="width:345px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;height:36px;margin-right:62px;cursor: pointer;background-color: #f6c2cd;border-radius:5px;font-size: 18pt;padding-left: 6px;" onclick="openUncheckLetter(this)">${UncheckCustomerService.customercomplaintLetter}</div>
							<div id="UncheckresponseLetter_${UncheckCustomerService.customerServiceID}" style="height:36px;margin-right:20px;cursor: pointer;background-color: #c0ebf2;border-radius:5px;font-size: 18pt;" onclick="openUncheckResponse(this)">回覆</div>
							<div id="UncheckresponseType_${UncheckCustomerService.customerServiceID}" style="height:36px;margin-right:20px;background-color: #c0ebf2;border-radius:5px;font-size: 18pt;margin-left: 60px;">${UncheckCustomerService.responseType}</div>
						</div>
					</div>
					<div id="UncheckALLCL_${UncheckCustomerService.customerServiceID}" style="width:400px;margin:5px 0;margin-left: 364px;display:none;border:1px solid #e19898;border-radius:5px;">
						內文&nbsp;&nbsp;:&nbsp;&nbsp;${UncheckCustomerService.customercomplaintLetter}
						<c:if test="${UncheckCustomerService.customerPicture!='nopicture'}">
							<img src = "${UncheckCustomerService.customerPicture}" style="width:365px;object-fit: contain;height:365px;">
						</c:if>
						<div>姓名&nbsp;&nbsp;:&nbsp;&nbsp;${UncheckCustomerService.customerName}</div>
						<div>信箱&nbsp;&nbsp;:&nbsp;&nbsp;${UncheckCustomerService.customerEmail}</div>
						<c:if test="${not empty UncheckCustomerService.customerAccount}">
							<div>帳號:${UncheckCustomerService.customerAccount}</div>
						</c:if>
						時間&nbsp;&nbsp;:&nbsp;&nbsp;${UncheckCustomerService.createTime}
						
					</div>
					<div id="Uncheckhr_${UncheckCustomerService.customerServiceID}">
					 <hr>
					</div>
					<script>
							
							function openUncheckLetter(eventLetter){
								var thid = eventLetter.id.toString().replace("UncheckcomplaintLetter_","");
								var display =$("#UncheckALLCL_"+thid).css("display");
								if(display=='none'){
									$("#UncheckALLCL_"+thid).css("display","block");
								}else{
									$("#UncheckALLCL_"+thid).css("display","none");
								}
							}
							
							function openUncheckResponse(eventLetter){
								var thid = eventLetter.id.toString().replace("UncheckresponseLetter_","");
								Swal.fire({
									  title: '輸入回覆',
									  input: 'textarea',
									  inputAttributes: {
									    autocapitalize: 'off'
									  },
									  showCancelButton: true,
									  confirmButtonText: '送出',
									  cancelButtonText: '取消',
									  showLoaderOnConfirm: true,
									  allowOutsideClick: false,
									}).then((result) => {
										if(result.value.length != 0)
											sentResponse(thid,result.value);
									})
								}
							
							function sentResponse(id,value){
								$.ajax({ 
									url:"<c:url value='/Admin/sentResponse' />", 
									type:'post', 
									data: { "customerServiceID" : id , "responseText" : value },
									error:function(){ 
										Swal.fire(
									      "請聯絡管理員", 
									      "",
									      "error" 
									    ); 
									}, 
									success:function(data){ 
										$("#UncheckCustomerService_"+id).remove();
										$("#UncheckALLCL_"+id).remove();
										$("#Uncheckhr_"+id).remove();
										Swal.fire(
								           "回覆完成",
								           "",
								           "success"  
								         );
									}
								});
							}
						</script>
					</c:forEach>
				</div><!-- table -->
				<div class="fih"></div>
				</div>
				
				<div id="checkedTable">
					<div class="form-table" style="margin-top: 22px;">
						<div class="test1234">反映編號</div>
						<div class="test1234">反映項目</div>
						<div class="test1234" style="margin-left: 77px;">反映內容</div>
						<div class="test1234" style="margin-left: 229px;">處理方式</div>
						<div class="test1234" style="margin-left: -7px;">處理狀態</div>
						<hr>
						<div id="checkedTableFromAjax"></div>
						<c:forEach  var="checkCustomerService" items="${ CheckCustomerServices }" varStatus="status">
						<div style="margin: 2px 0;">
		 					<div id="CheckCustomerService_${checkCustomerService.customerServiceID}" class="CustomerService" style="padding-top: 14px;display:flex;margin: 10px 0px;"> 
								<div style="background-color:#fca2b4;width: 73px;margin-left: 38px;text-align: center; border-radius: 999rem;font-size: 18pt;">${checkCustomerService.customerServiceID}</div>
								<div style="margin-left:59px;font-size: 18pt;width:225px;">${checkCustomerService.customercomplaintType}</div>	
								<div id="CheckcomplaintLetter_${checkCustomerService.customerServiceID}" style="width:345px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;height:36px;margin-right:62px;cursor: pointer;background-color: #f6c2cd;border-radius:5px;font-size: 18pt;padding-left: 6px;" onclick="openCheckLetter(this)">${checkCustomerService.customercomplaintLetter}</div>
								<div id="CheckresponseLetter_${checkCustomerService.customerServiceID}" style="height:36px;margin-right:20px;cursor: pointer;background-color: #c0ebf2;border-radius:5px;font-size: 18pt;" onclick="openCheckResponse(this)">回覆</div>
								<div id="CheckresponseType_${checkCustomerService.customerServiceID}" style="height:36px;margin-right:20px;background-color: #c0ebf2;border-radius:5px;font-size: 18pt;margin-left: 60px;">${checkCustomerService.responseType}</div>
							</div>
						</div>
						<div style="display:flex;">
						<div id="CheckALLCL_${checkCustomerService.customerServiceID}" style="width:400px;margin:5px 0;margin-left: 364px;display:none;border:1px solid #e19898;border-radius:5px;">
							內文&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.customercomplaintLetter}
							<c:if test="${checkCustomerService.customerPicture!='nopicture'}">
								<img src = "${checkCustomerService.customerPicture}" style="width:365px;object-fit: contain;height:365px;">
							</c:if>
							<div>姓名&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.customerName}</div>
							<div>信箱&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.customerEmail}</div>
							<c:if test="${not empty checkCustomerService.customerAccount}">
								<div>帳號:${checkCustomerService.customerAccount}</div>
							</c:if>
							時間&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.createTime}
							
						</div>
						<div id="CheckALLRT_${checkCustomerService.customerServiceID}" style="width:400px;margin:5px 0 5px 20px;display:none;border:1px solid #e19898;border-radius:5px;">
							內文&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.responseText}
						
						</div>
						</div>
						<div id="Checkhr_${checkCustomerService.customerServiceID}">
						 <hr>
						</div>
						<script>
								
								function openCheckLetter(eventLetter){
									var thid = eventLetter.id.toString().replace("CheckcomplaintLetter_","");
									var displayCL =$("#CheckALLCL_"+thid).css("display");
									var displayRT =$("#CheckALLRT_"+thid).css("display");
									if(displayCL=='none'){
										if(displayRT=='none'){
											$("#CheckALLCL_"+thid).css("display","");
											$("#CheckALLCL_"+thid).css("margin-left","364px");
										}else{
											$("#CheckALLCL_"+thid).css("display","");
											$("#CheckALLRT_"+thid).css("margin-left","20px");
										}
									}else{
										if(displayRT=='none'){
											$("#CheckALLCL_"+thid).css("display","none");
										}else{
											$("#CheckALLCL_"+thid).css("display","none");
											$("#CheckALLRT_"+thid).css("margin-left","650px");
										}
									}
								}
								
								function openCheckResponse(eventLetter){
									var thid = eventLetter.id.toString().replace("CheckresponseLetter_","");
									var displayCL =$("#CheckALLCL_"+thid).css("display");
									var displayRT =$("#CheckALLRT_"+thid).css("display");
									if(displayCL=='none'){ 
										if(displayRT=='none'){
											$("#CheckALLRT_"+thid).css("display","");
											$("#CheckALLRT_"+thid).css("margin-left","650px");
										}else{
											$("#CheckALLRT_"+thid).css("display","none");
										}
									
									}else{
										if(displayRT=='none'){
											$("#CheckALLCL_"+thid).css("margin-left","215px");
	 										$("#CheckALLRT_"+thid).css("display","");
	 										$("#CheckALLRT_"+thid).css("margin-left","20px");
										}else{
											$("#CheckALLCL_"+thid).css("margin-left","364px");
											$("#CheckALLRT_"+thid).css("display","none");
										}
									}	
								}
							</script>
						</c:forEach>
					</div><!-- table -->
					<div class="fih"></div>
				</div><!-- checkedTable -->
			</div><!-- divCustomer -->
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
	
	$("#clickUnChecked").click(function(){
  		location.href="<c:url value='/adminCustomerDetail?block=UnCheck'/>";	
 	})
 	
 	$("#clickChecked").click(function(){
 		location.href="<c:url value='/adminCustomerDetail?block=Check'/>";
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
	if(${block=='UnCheck'}){
		$("#unCheckedTable").show();
		$("#checkedTable").hide();
		var h = $("#unCheckedTable").height();
		$(".wrapper").height(h+50);
	}else if(${block=='Check'}){
		$("#unCheckedTable").hide();
		$("#checkedTable").show();
	}
	
<!-- ================================================================================================== -->		
	
	</script>
</body>
</html>