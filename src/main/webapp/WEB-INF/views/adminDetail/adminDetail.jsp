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
</head>
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
	margin-right: 36%;
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
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	
	<div class="wrapper clearfix">
<!-- =================================  左側目錄 ================================================================================================================================================================= -->
		<div class="sidemenu">
			<div class="navBar">
				<div class="navTitle">
					後臺管理<img id="pic1" src="https://img.icons8.com/ios/40/000000/outdent.png" />
				</div>
				<div class="navContent" id="memberNav" >
					<img src="https://img.icons8.com/carbon-copy/30/000000/user-female-circle.png"/>
					<span style="margin-left: 6%;" class="link" id="clickMember">會員管理</span>
					<i id="angle1" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
				</div>
				<div class="navContent" id="shopNav" >
					<img src="https://img.icons8.com/carbon-copy/30/000000/shop.png"/>
					<span style="margin-left: 6%;" class="link" id="clickShop">店家管理</span>
					<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;visibility:hidden"></i>
				</div>
				<div class="navContent" id="customerNav" >
					<img src="https://img.icons8.com/dotty/30/000000/repository.png"/>
					<span style="margin-left: 6%;" class="link" id="clickCustomer">客服管理</span>
					<i id="angle3" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;visibility:hidden"></i>
				</div>
				<div class="navContent" id="reportNav" >
					<img src="https://img.icons8.com/carbon-copy/30/000000/combo-chart.png"/>
					<span style="margin-left: 6%;" class="link" id="clickReport">網站分析</span>
					
				</div>
				<div style="margin-left:45px;display:none" id="theReport">
					<div class="navContent" id="reportBasicNav" >
						<img src="https://img.icons8.com/carbon-copy/30/000000/business-report.png"/>
						<span style="margin-left: 6%;" class="link" id="clickReportBasic">基礎資料</span>
						<i id="angle5" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;visibility:hidden"></i>
					</div>
					
					<div class="navContent" id="reportOperationNav" >
						<img src="https://img.icons8.com/carbon-copy/30/000000/bullish--v1.png"/>
						<span style="margin-left: 6%;" class="link" id="clickReportOperation">營運分析</span>
						<i id="angle6" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;visibility:hidden"></i>
					</div>
				</div>
				
				<div style="height:15px"></div>
				
				<div class="pink" id="pink" style="display: none;"></div>
		</div>
<!-- =================================  主要畫面 ================================================================================================================================================================= -->		
		</div>
		<div class="main" style="margin-right:15px;">
<!-- =================================  顯示會員 ================================================================================================================================================================= -->
		<div id="divMember" >
<!-- =================================  會員搜尋列 ================================================================================================================================================================= -->
			<div style="margin-bottom:10px;margin-left:15px;">
				<input class="search_input" placeholder="搜尋會員" type="text" id="search_Member"/>
				<input class="search_btn" type="image" id="TheChosenMember"  src="http://3.bp.blogspot.com/-fpi6-9d3JpQ/Vo0LXN6iUDI/AAAAAAAANPA/89JVfzXNtXg/s1600/search-icon.png" />
			</div>
<!-- =================================  會員內容 ================================================================================================================================================================= -->			
		<div class="searchData"></div>
		<div id="conditionPages">
			<nav aria-label="...">
				<ul class="pagination pagination-lg" style="box-shadow: 12px 12px 7px #dfe3e8;"></ul>
			</nav>
		</div>
		
		<div class="allData">
		<c:forEach  var="member" items="${members}" varStatus="status" >
			<div id="Member_${member.value.memberID}" class="TheMember">
				<input type="hidden" value="${member.value.memberID}" style="display:none" id="Memberid_${member.value.memberID}">
				<div class="form-table"> 
				<div class="form-item fih" style="height:250px">
					<div class="form-controler">
						<img src = "${member.value.profilePicture}"  class="theimg">
					</div>
					<div style="display:block;padding-left: 17px;">
						<div style="margin-left:10px">
							<span class="spanTitle">帳號</span>
							<input type="text" class="input-holder" value="${member.value.account}" readonly/>
						</div>
							
						<div style="margin-left:10px">		
							<span class="spanTitle" >狀態</span>
							<c:choose>
								<c:when test="${ member.value.status == '刪除' }"> 
									<input  type="text" class="input-holder" value="${member.value.status}" disabled/>	
								</c:when>
								<c:otherwise>
								
									<c:choose>
										<c:when test="${ member.value.status == '會員' }">
											<select name="Member_status" id="Member_status${member.value.memberID}" class="theselectMember" style="width:200px;height:40px;text-align:center;margin-bottom:11px;" onchange="changeType(this)">
												<option value="黑名單" >黑名單</option>
												<option value="會員" selected="selected">會員</option>
											</select>
										</c:when>
										<c:otherwise>
											<select name="Member_status" id="Member_status${member.value.memberID}" class="theselectMember" style="width:200px;height:40px;text-align:center;margin-bottom:11px;" onchange="changeType(this)">
												<option value="黑名單" selected="selected">黑名單</option>
												<option value="會員" >會員</option>
											</select>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>

						<div style="margin-left:10px;display:flex;">
							<span class="spanTitle" style="margin-top: 7px;">信箱</span>
							<input type="text" class="input-holder" style="width:335px;margin-left:5px;" value="${member.value.email}" readonly/>
						</div>
							
						<div style="margin-left:10px;display:flex;">
							<span class="spanTitle" style="margin-top: 7px;">地址</span>		
							<input type="text"  class="input-holder"   style="width:335px;margin-left:5px;" value="${member.value.address }" readonly/>
						</div>
			
					</div><!--  display:block-->
				</div><!-- form-item -->
						
						
				</div><!-- table -->
				<div style="height:15px"></div>
						
			</div><!-- TheMember -->
		</c:forEach>
		
		<div class="pages" id="allPages">
			<nav aria-label="...">
				<ul class="pagination pagination-lg"style="box-shadow: 12px 12px 7px #dfe3e8;">
					<c:forEach var="page" begin="1" end="${memberTotalPages}" varStatus="aa">
						<c:set var="pageNo" value="${memberPageNo}" />
						<c:choose>
							<c:when test="${page == memberPageNo}">
								<li class="page-item disabled">
								<a class="page-link" href="javascript:" tabindex="-1">
								<span style="font-weight: 600; color: #6A7287" id="page${page}">${page}</span>
								</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
								<a class="page-link" href="<c:url value='/adminDetail?pageNo=${page}' />">
									<span id="page${page}" style="font-weight: 600; color: #B11429">${page}</span>
								</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</nav>
		</div>
		</div>
		
		</div><!-- divMember -->
<!-- =================================  顯示店家 ================================================================================================================================================================= -->
<!-- 			<div id="divShop"> -->
<!-- 				<div style="margin-bottom:10px;margin-left:15px;"> -->
<!-- 					<input class="search_input" placeholder="搜尋店家" type="text" id="search_Shop"/> -->
<!-- 					<input class="search_btn" type="image" id="TheChosenShop"  src="http://3.bp.blogspot.com/-fpi6-9d3JpQ/Vo0LXN6iUDI/AAAAAAAANPA/89JVfzXNtXg/s1600/search-icon.png" /> -->
<!-- 				</div> -->
<%-- 				<c:forEach  var="shop" items="${ shops }" varStatus="status"> --%>
				
<%-- 				<div id="Shop_${shop.shopID}" class="TheShop"> --%>
<%-- 				<input type="hidden" value="${shop.shopID}" style="display:none" id="Shopid_${status.count}"> --%>
<!-- 				<div class="form-table"> -->
<!-- 					<div class="form-item fih" style="height:250px"> -->
<!-- 						<div class="form-controler"> -->
<%-- 							<img src = "${shop.environmentalPhotos}"  class="theimg"> --%>
<!-- 						</div> -->
<!-- 						<div style="display:block;padding-left: 17px;"> -->
<!-- 							<div style="margin-left:10px"> -->
<!-- 								<span class="spanTitle">店名</span> -->
<%-- 								<input type="text" class="input-holder" value="${shop.shopName}" readonly/> --%>
<!-- 							</div> -->
							
<!-- 							<div style="margin-left:10px">		 -->
<!-- 									<span class="spanTitle" >狀態</span> -->
<%-- 								<c:choose> --%>
<%-- 								<c:when test="${ shop.status == '刪除' }">  --%>
<%-- 									<input  type="text" class="input-holder" value="${shop.status}" disabled/>	 --%>
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<%-- 									<select name="Shop_status" id="Shop_status${status.count}" class="theselectShop" style="width:200px;height:40px;text-align:center;margin-bottom:11px;"> --%>
<!-- 										<option value="-1" >請選擇</option> -->
<!-- 									</select> -->
									
<!-- 								<script> -->
<%-- // 									var Shop_status = $("#Shop_status${status.count}")[0]; --%>
<!-- // 									Shop_status.options.length = 0; -->
															
<!-- // 					 				var new_option = new Option("不合格","不合格"); -->
<!-- // 					 				Shop_status.options.add(new_option); -->
		
<!-- // 						 			var new_option = new Option("合格", "合格"); -->
<!-- // 						 			Shop_status.options.add(new_option); -->
						 			
<%-- // 						 			if('${shop.status}' == "不合格"){ --%>
<%-- // 						 				$("#Shop_status${status.count} option[value='不合格']").attr('selected', 'selected'); --%>
<!-- // 						 			}else{ -->
<%-- // 						 				$("#Shop_status${status.count} option[value='合格']").attr('selected', 'selected');	 --%>
<!-- // 						 			} -->
<!-- // 						 			var newStatus=""; -->
<%-- // 						 			$("#Shop_status${status.count}").on("change",function(){ --%>
<%-- // 						 				newStatus = $("#Shop_status${status.count}").val(); --%>
<%-- // 						 				id = $("#Shopid_${status.count}").val(); --%>
<!-- // 						 				changeShopStatus(id,newStatus); -->
<!-- // 						 			})				 			 -->
						 			
<!-- // 						 			function changeShopStatus(id,newStatus){ -->
<!-- // 						 				console.log("newStatus = " + newStatus); -->
<!-- // 						 				console.log("id = " + id); -->
<!-- // 						 				$.ajax({  -->
<%-- // 						 					url:"<c:url value='/changeShopStatus' />",  --%>
<!-- // 						 					type:'post',  -->
<!-- // 						 					data: { "shopID" : id , "status" : newStatus }, -->
<!-- // 						 					error:function(){  -->
<!-- // 						 						alert('error');  -->
<!-- // 						 					},  -->
<!-- // 						 					success:function(data){  -->
<!-- // 						 						console.log(data["changeType"]) -->
<!-- // 						 						changesuccess(); -->
<!-- // 						 					} -->
<!-- // 						 				}); -->
<!-- // 						 			} -->
						 			
<!-- // 						 			function changesuccess() { -->
<!-- // 						 	            Swal.fire( -->
<!-- // 						 	                "更改成功",  -->
<!-- // 						 	                "",  -->
<!-- // 						 	                "success"     -->
<!-- // 						 	            ); -->
<!-- // 						 	        } -->
<!-- 								</script>	 -->
		
<%-- 								</c:otherwise> --%>
<%-- 								</c:choose> --%>
<!-- 							</div> -->
							
<!-- 							<div style="margin-left:10px"> -->
<!-- 								<span class="spanTitle">信箱</span> -->
<!-- 								<input type="text" class="input-holder"  style="width:335px" -->
<%-- 									value="${shop.email}" readonly/> --%>
<!-- 							</div> -->
							
<!-- 							<div style="margin-left:10px"> -->
<!-- 								<span class="spanTitle">地址</span>		 -->
<!-- 								<input type="text"  class="input-holder"   style="width:335px" -->
<%-- 									value="${shop.address }" readonly/> --%>
<!-- 							</div> -->
			
<!-- 							</div>display:block -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div style="height:15px"></div> -->
<!-- 				</div> -->
<%-- 				</c:forEach> --%>
				
<!-- 			</div> -->
<!-- =================================  客服管理區 ================================================================================================================================================================= -->			
<!-- 			<div id="divCustomer" > -->
<!-- 				<div> -->
<!-- 					<ul class="customerUL"> -->
<!-- 						<li ><div id="clickUnChecked">尚未處理</div></li> -->
<!-- 						<li ><div id="clickChecked">已處理</div></li> -->
<!-- <!-- 						<li id="clickCustomerReport"><div>報表</div></li> --> 
<!-- 					</ul> -->
<!-- 				</div> -->
				
<!-- 				<div id="unCheckedTable"> -->
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div class="test1234">反映編號</div> -->
<!-- 					<div class="test1234">反映項目</div> -->
<!-- 					<div class="test1234" style="margin-left: 77px;">反映內容</div> -->
<!-- 					<div class="test1234" style="margin-left: 229px;">處理方式</div> -->
<!-- 					<div class="test1234" style="margin-left: -7px;">處理狀態</div> -->
<!-- 					<hr> -->
<%-- 					<c:forEach  var="UncheckCustomerService" items="${ UncheckCustomerServices }" varStatus="status"> --%>
<!-- 					<div style="margin: 2px 0;"> -->
<%-- 	 					<div id="UncheckCustomerService_${UncheckCustomerService.customerServiceID}" class="CustomerService" style="padding-top: 14px;display:flex;margin: 10px 0px;">  --%>
<%-- 							<div style="background-color:#fca2b4;width: 73px;margin-left: 38px;text-align: center; border-radius: 999rem;font-size: 18pt;">${UncheckCustomerService.customerServiceID}</div> --%>
<%-- 							<div style="margin-left:59px;font-size: 18pt;width:225px;">${UncheckCustomerService.customercomplaintType}</div>	 --%>
<%-- 							<div id="UncheckcomplaintLetter_${UncheckCustomerService.customerServiceID}" style="width:345px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;height:36px;margin-right:62px;cursor: pointer;background-color: #f6c2cd;border-radius:5px;font-size: 18pt;padding-left: 6px;" onclick="openUncheckLetter(this)">${UncheckCustomerService.customercomplaintLetter}</div> --%>
<%-- 							<div id="UncheckresponseLetter_${UncheckCustomerService.customerServiceID}" style="height:36px;margin-right:20px;cursor: pointer;background-color: #c0ebf2;border-radius:5px;font-size: 18pt;" onclick="openUncheckResponse(this)">回覆</div> --%>
<%-- 							<div id="UncheckresponseType_${UncheckCustomerService.customerServiceID}" style="height:36px;margin-right:20px;background-color: #c0ebf2;border-radius:5px;font-size: 18pt;margin-left: 60px;">${UncheckCustomerService.responseType}</div> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 					<div id="UncheckALLCL_${UncheckCustomerService.customerServiceID}" style="width:400px;margin:5px 0;margin-left: 364px;display:none;border:1px solid #e19898;border-radius:5px;"> --%>
<%-- 						內文&nbsp;&nbsp;:&nbsp;&nbsp;${UncheckCustomerService.customercomplaintLetter} --%>
<%-- 						<c:if test="${UncheckCustomerService.customerPicture!='nopicture'}"> --%>
<%-- 							<img src = "${UncheckCustomerService.customerPicture}" style="width:365px;object-fit: contain;height:365px;"> --%>
<%-- 						</c:if> --%>
<%-- 						<div>姓名&nbsp;&nbsp;:&nbsp;&nbsp;${UncheckCustomerService.customerName}</div> --%>
<%-- 						<div>信箱&nbsp;&nbsp;:&nbsp;&nbsp;${UncheckCustomerService.customerEmail}</div> --%>
<%-- 						<c:if test="${not empty UncheckCustomerService.customerAccount}"> --%>
<%-- 							<div>帳號:${UncheckCustomerService.customerAccount}</div> --%>
<%-- 						</c:if> --%>
<%-- 						時間&nbsp;&nbsp;:&nbsp;&nbsp;${UncheckCustomerService.createTime} --%>
						
<!-- 					</div> -->
<%-- 					<div id="Uncheckhr_${UncheckCustomerService.customerServiceID}"> --%>
<!-- 					 <hr> -->
<!-- 					</div> -->
<!-- 					<script> -->
							
<!-- 							function openUncheckLetter(eventLetter){ -->
<!-- 								var thid = eventLetter.id.toString().replace("UncheckcomplaintLetter_",""); -->
<!-- 								var display =$("#UncheckALLCL_"+thid).css("display"); -->
<!-- 								if(display=='none'){ -->
<!-- 									$("#UncheckALLCL_"+thid).css("display","block"); -->
<!-- 								}else{ -->
<!-- 									$("#UncheckALLCL_"+thid).css("display","none"); -->
<!-- 								} -->
<!-- 							} -->
							
<!-- 							function openUncheckResponse(eventLetter){ -->
<!-- 								var thid = eventLetter.id.toString().replace("UncheckresponseLetter_",""); -->
<!-- 								Swal.fire({ -->
<!-- 									  title: '輸入回覆', -->
<!-- 									  input: 'textarea', -->
<!-- 									  inputAttributes: { -->
<!-- 									    autocapitalize: 'off' -->
<!-- 									  }, -->
<!-- 									  showCancelButton: true, -->
<!-- 									  confirmButtonText: '送出', -->
<!-- 									  cancelButtonText: '取消', -->
<!-- 									  showLoaderOnConfirm: true, -->
<!-- 									  allowOutsideClick: false, -->
<!-- 									}).then((result) => { -->
<!-- 										if(result.value.length != 0) -->
<!-- 											sentResponse(thid,result.value); -->
<!-- 									}) -->
<!-- 								} -->
							
<!-- 							function sentResponse(id,value){ -->
<!-- 								$.ajax({  -->
<%-- 									url:"<c:url value='/Admin/sentResponse' />",  --%>
<!-- 									type:'post',  -->
<!-- 									data: { "customerServiceID" : id , "responseText" : value }, -->
<!-- 									error:function(){  -->
<!-- 										Swal.fire( -->
<!-- 									      "請聯絡管理員",  -->
<!-- 									      "", -->
<!-- 									      "error"  -->
<!-- 									    );  -->
<!-- 									},  -->
<!-- 									success:function(data){  -->
<!-- 										$("#UncheckCustomerService_"+id).remove(); -->
<!-- 										$("#UncheckALLCL_"+id).remove(); -->
<!-- 										$("#Uncheckhr_"+id).remove(); -->
<!-- 										Swal.fire( -->
<!-- 								           "回覆完成", -->
<!-- 								           "", -->
<!-- 								           "success"   -->
<!-- 								         ); -->
<!-- 									} -->
<!-- 								}); -->
<!-- 							} -->
<!-- 						</script> -->
<%-- 					</c:forEach> --%>
<!-- 				</div>table -->
<!-- 				<div class="fih"></div> -->
<!-- 				</div> -->
				
<!-- 				<div id="checkedTable"> -->
<!-- 					<div class="form-table" style="margin-top: 22px;"> -->
<!-- 						<div class="test1234">反映編號</div> -->
<!-- 						<div class="test1234">反映項目</div> -->
<!-- 						<div class="test1234" style="margin-left: 77px;">反映內容</div> -->
<!-- 						<div class="test1234" style="margin-left: 229px;">處理方式</div> -->
<!-- 						<div class="test1234" style="margin-left: -7px;">處理狀態</div> -->
<!-- 						<hr> -->
<!-- 						<div id="checkedTableFromAjax"></div> -->
<%-- 						<c:forEach  var="checkCustomerService" items="${ CheckCustomerServices }" varStatus="status"> --%>
<!-- 						<div style="margin: 2px 0;"> -->
<%-- 		 					<div id="CheckCustomerService_${checkCustomerService.customerServiceID}" class="CustomerService" style="padding-top: 14px;display:flex;margin: 10px 0px;">  --%>
<%-- 								<div style="background-color:#fca2b4;width: 73px;margin-left: 38px;text-align: center; border-radius: 999rem;font-size: 18pt;">${checkCustomerService.customerServiceID}</div> --%>
<%-- 								<div style="margin-left:59px;font-size: 18pt;width:225px;">${checkCustomerService.customercomplaintType}</div>	 --%>
<%-- 								<div id="CheckcomplaintLetter_${checkCustomerService.customerServiceID}" style="width:345px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;height:36px;margin-right:62px;cursor: pointer;background-color: #f6c2cd;border-radius:5px;font-size: 18pt;padding-left: 6px;" onclick="openCheckLetter(this)">${checkCustomerService.customercomplaintLetter}</div> --%>
<%-- 								<div id="CheckresponseLetter_${checkCustomerService.customerServiceID}" style="height:36px;margin-right:20px;cursor: pointer;background-color: #c0ebf2;border-radius:5px;font-size: 18pt;" onclick="openCheckResponse(this)">回覆</div> --%>
<%-- 								<div id="CheckresponseType_${checkCustomerService.customerServiceID}" style="height:36px;margin-right:20px;background-color: #c0ebf2;border-radius:5px;font-size: 18pt;margin-left: 60px;">${checkCustomerService.responseType}</div> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div style="display:flex;"> -->
<%-- 						<div id="CheckALLCL_${checkCustomerService.customerServiceID}" style="width:400px;margin:5px 0;margin-left: 364px;display:none;border:1px solid #e19898;border-radius:5px;"> --%>
<%-- 							內文&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.customercomplaintLetter} --%>
<%-- 							<c:if test="${checkCustomerService.customerPicture!='nopicture'}"> --%>
<%-- 								<img src = "${checkCustomerService.customerPicture}" style="width:365px;object-fit: contain;height:365px;"> --%>
<%-- 							</c:if> --%>
<%-- 							<div>姓名&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.customerName}</div> --%>
<%-- 							<div>信箱&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.customerEmail}</div> --%>
<%-- 							<c:if test="${not empty checkCustomerService.customerAccount}"> --%>
<%-- 								<div>帳號:${checkCustomerService.customerAccount}</div> --%>
<%-- 							</c:if> --%>
<%-- 							時間&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.createTime} --%>
							
<!-- 						</div> -->
<%-- 						<div id="CheckALLRT_${checkCustomerService.customerServiceID}" style="width:400px;margin:5px 0 5px 20px;display:none;border:1px solid #e19898;border-radius:5px;"> --%>
<%-- 							內文&nbsp;&nbsp;:&nbsp;&nbsp;${checkCustomerService.responseText} --%>
						
<!-- 						</div> -->
<!-- 						</div> -->
<%-- 						<div id="Checkhr_${checkCustomerService.customerServiceID}"> --%>
<!-- 						 <hr> -->
<!-- 						</div> -->
<!-- 						<script> -->
								
<!-- 								function openCheckLetter(eventLetter){ -->
<!-- 									var thid = eventLetter.id.toString().replace("CheckcomplaintLetter_",""); -->
<!-- 									var displayCL =$("#CheckALLCL_"+thid).css("display"); -->
<!-- 									var displayRT =$("#CheckALLRT_"+thid).css("display"); -->
<!-- 									if(displayCL=='none'){ -->
<!-- 										if(displayRT=='none'){ -->
<!-- 											$("#CheckALLCL_"+thid).css("display","block"); -->
<!-- 											$("#CheckALLCL_"+thid).css("margin-left","364px"); -->
<!-- 										}else{ -->
<!-- 											$("#CheckALLCL_"+thid).css("display","block"); -->
<!-- 											$("#CheckALLRT_"+thid).css("margin-left","215px"); -->
<!-- 										} -->
<!-- 									}else{ -->
<!-- 										if(displayRT=='none'){ -->
<!-- 											$("#CheckALLCL_"+thid).css("display","none"); -->
<!-- 										}else{ -->
<!-- 											$("#CheckALLCL_"+thid).css("display","none"); -->
<!-- 											$("#CheckALLRT_"+thid).css("margin-left","650px"); -->
<!-- 										} -->
<!-- 									} -->
<!-- 								} -->
								
<!-- 								function openCheckResponse(eventLetter){ -->
<!-- 									var thid = eventLetter.id.toString().replace("CheckresponseLetter_",""); -->
<!-- 									var displayCL =$("#CheckALLCL_"+thid).css("display"); -->
<!-- 									var displayRT =$("#CheckALLRT_"+thid).css("display"); -->
<!-- 									if(displayCL=='none'){  -->
<!-- 										if(displayRT=='none'){ -->
<!-- 											$("#CheckALLRT_"+thid).css("display","block"); -->
<!-- 											$("#CheckALLRT_"+thid).css("margin-left","650px"); -->
<!-- 										}else{ -->
<!-- 											$("#CheckALLRT_"+thid).css("display","none"); -->
<!-- 										} -->
									
<!-- 									}else{ -->
<!-- 										if(displayRT=='none'){ -->
<!-- 											$("#CheckALLCL_"+thid).css("margin-left","215px"); -->
<!-- 	 										$("#CheckALLRT_"+thid).css("display","block"); -->
<!-- 	 										$("#CheckALLRT_"+thid).css("margin-left","20px"); -->
<!-- 										}else{ -->
<!-- 											$("#CheckALLCL_"+thid).css("margin-left","364px"); -->
<!-- 											$("#CheckALLRT_"+thid).css("display","none"); -->
<!-- 										} -->
<!-- 									}	 -->
<!-- 								} -->
								
				
<!-- 							</script> -->
<%-- 						</c:forEach> --%>
<!-- 					</div>table -->
<!-- 				</div> -->
				
<!-- 				<div id="customerReportTable"> -->
<!-- 					<div class="form-table" style="margin-top: 22px;"> -->
<!-- 						報表 -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- =================================  網站分析區 ================================================================================================================================================================= -->			
<!-- 			<div id="divBasicReport" > -->
<!-- 				<div> -->
<!-- 					<ul class="ReportUL"> -->
<!-- 						<li id="clicksexRatio"><div>性別比</div></li> -->
<!-- 						<li id="clickplacePercentage"><div>地區分布</div></li> -->
<!-- 						<li id="clickpetType"><div>寵物分類</div></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- =================================  性別比 ================================================================================================================================================================= -->				
<!-- 				<div id="sexRatioTable"> -->
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="sexRatioContainer" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332"> -->
<!-- 						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"> -->
<%-- 							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"> --%>
<%-- 							</canvas> --%>
<!-- 						</div> -->
<!-- 					</div> sexRatioContainer -->
<!-- 				</div>	table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="sexRatioValue"> -->
<!-- 						123456789 -->
<!-- 					</div> sexRatioValue -->
<!-- 				</div>	table -->
<!-- 				</div> sexRatioTable -->
<!-- =================================  地區店家 ================================================================================================================================================================= -->							
<!-- 				<div id="placePercentageTable"> -->
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="placePercentageContainer" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332"> -->
<!-- 						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"> -->
<%-- 							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"> --%>
<%-- 							</canvas> --%>
<!-- 						</div> -->
<!-- 					</div>placePercentageContainer -->
<!-- 				</div>	table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="placePercentageValue"> -->
<!-- 						123456789 -->
<!-- 					</div> placePercentageValue -->
<!-- 				</div>	table -->
<!-- 				</div> placePercentageTable -->

<!-- =================================  寵物比 ================================================================================================================================================================= -->
<!-- 				<div id="petTypeTable"> -->
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="petTypeContainer" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332"> -->
<!-- 						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"> -->
<%-- 							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"> --%>
<%-- 							</canvas> --%>
<!-- 						</div> -->
<!-- 					</div>petTypeContainer -->
<!-- 				</div>	table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="petTypeValue"> -->
<!-- 						123456789 -->
<!-- 					</div> petTypeValue -->
<!-- 				</div>	table -->
<!-- 				</div> petTypeTable -->

				
<!-- <!-- =================================  結束 ================================================================================================================================================================= -->		
<!-- 				<div class="fih"></div> -->
<!-- 			</div>divBasicReport -->
		
<!-- <!-- =================================   ================================================================================================================================================================= -->			 
<!-- 			<div id="divOperatorReport"> -->
<!-- 				<div> -->
<!-- 					<ul class="ReportUL"> -->
<!-- 						<li id="clickregisterNum"><div>註冊人數</div></li> -->
<!-- 						<li id="clickloginNum"><div>登入人數</div></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
			
			
<!-- <!-- =================================  註冊人數 ================================================================================================================================================================= --> 
<!-- 				<div id="registerNumTable"> -->
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="registerNumContainer1" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332"> -->
<!-- 						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"> -->
<%-- 							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"> --%>
<%-- 							</canvas> --%>
<!-- 						</div> -->
<!-- 					</div>placePercentageContainer -->
<!-- 				</div>	table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="registerNumContainer2" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332"> -->
<!-- 						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"> -->
<%-- 							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"> --%>
<%-- 							</canvas> --%>
<!-- 						</div> -->
<!-- 					</div>placePercentageContainer -->
<!-- 				</div>	table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="registerNumValue"> -->
<!-- 						//用日期+男女比 -->
<!-- 					</div> placePercentageValue -->
<!-- 				</div>	table -->
<!-- 				</div> placePercentageTable				 -->

<!-- <!-- =================================  登入人數 ================================================================================================================================================================= --> 
<!-- 				<div id="loginNumTable"> -->
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="loginNumContainer" style="height:600px;width:1085px; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1604974818332"> -->
<!-- 						<div style="position: relative; width: 1536px; height: 698px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"> -->
<%-- 							<canvas data-zr-dom-id="zr_0" width="1920" height="872" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 698px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"> --%>
<%-- 							</canvas> --%>
<!-- 						</div> -->
<!-- 					</div>placePercentageContainer -->
<!-- 				</div>	table -->
				
<!-- 				<div class="form-table" style="margin-top: 22px;"> -->
<!-- 					<div id="loginNumValue"> -->
<!-- 						123456789 -->
<!-- 					</div> placePercentageValue -->
<!-- 				</div>	table -->
<!-- 				</div> placePercentageTable				 -->
			
			
<!-- 			</div>divOperatorReport -->
			
			
			
		</div><!-- main  -->
	</div><!-- wrapper -->
	
<!-- ============================================================================================================================================================================== -->
	<script>
	$("#memberNav").css("color", "#8D5433");
	$("#shopNav").css("color", "black");
	$("#customerNav").css("color", "black");
	$("#reportNav").css("color", "black");
	$("#reportBasicNav").css("color", "black");
	$("#reportOperationNav").css("color", "black")
	
	$("#divMember").show(); 
	$("#divShop").hide(); 
	$("#divCustomer").hide(); 
	$("#divBasicReport").hide();  
	$("#divOperatorReport").hide();
	
	$("#angle1").css("visibility",'visible');
	$("#angle2").css("visibility",'hidden');
	$("#angle3").css("visibility",'hidden');
	$("#angle5").css("visibility",'hidden');
	$("#angle6").css("visibility",'hidden');
	
// 	if(${page=='Member'}){
// 		$("#memberNav").css("color", "#8D5433");
//  		$("#shopNav").css("color", "black");
//  		$("#customerNav").css("color", "black");
//  		$("#reportNav").css("color", "black");
//  		$("#reportBasicNav").css("color", "black");
//  		$("#reportOperationNav").css("color", "black")
//  		;
//  		$("#divMember").show(); 
//  		$("#divShop").hide(); 
//  		$("#divCustomer").hide(); 
//  		$("#divBasicReport").hide();  
// 			$("#divOperatorReport").hide();
		
//  		$('.TheMember').show();
 		
//  		$("#angle1").css("visibility",'visible');
//  		$("#angle2").css("visibility",'hidden');
//  		$("#angle3").css("visibility",'hidden');
//  		$("#angle5").css("visibility",'hidden');
//  		$("#angle6").css("visibility",'hidden');
// 	}else if(${page=='Shop'}){
// 		$("#memberNav").css("color", "black");
//  		$("#shopNav").css("color", "#8D5433");
//  		$("#customerNav").css("color", "black");
//  		$("#reportNav").css("color", "black");
//  		$("#reportBasicNav").css("color", "black");
//  		$("#reportOperationNav").css("color", "black");
 		
//  		$("#divMember").hide(); 
//  		$("#divShop").show(); 
//  		$("#divCustomer").hide(); 
//  		$("#divBasicReport").hide();  	
//  		$("#divOperatorReport").hide();
 		
//  		$('.TheShop').show();
 		
//  		$("#angle1").css("visibility",'hidden');
//  		$("#angle2").css("visibility",'visible');
//  		$("#angle3").css("visibility",'hidden');
//  		$("#angle5").css("visibility",'hidden');
//  		$("#angle6").css("visibility",'hidden');
// 	}else if(${page=='UnCheck'}){
// 		$("#memberNav").css("color", "black");
// 		$("#shopNav").css("color", "black");
// 		$("#customerNav").css("color", "#8D5433");
// 		$("#reportNav").css("color", "black");
// 		$("#reportBasicNav").css("color", "black");
//  		$("#reportOperationNav").css("color", "black");
 		
// 		$("#divMember").hide();  
// 		$("#divShop").hide(); 
// 		$("#divCustomer").show(); 
// 		$("#divBasicReport").hide();  
// 		$("#divOperatorReport").hide();
// 		$("#unCheckedTable").show();
// 		$("#checkedTable").hide();
		
// 		$("#angle1").css("visibility",'hidden');
// 		$("#angle2").css("visibility",'hidden');
// 		$("#angle3").css("visibility",'visible');
// 		$("#angle5").css("visibility",'hidden');
//  		$("#angle6").css("visibility",'hidden');
	
// 	}else if(${page=='Check'}){
// 		$("#memberNav").css("color", "black");
// 		$("#shopNav").css("color", "black");
// 		$("#customerNav").css("color", "#8D5433");
// 		$("#reportNav").css("color", "black");
// 		$("#reportBasicNav").css("color", "black");
//  		$("#reportOperationNav").css("color", "black");
 		
// 		$("#divMember").hide();  
// 		$("#divShop").hide(); 
// 		$("#divCustomer").show(); 
// 		$("#divBasicReport").hide();  
// 		$("#divOperatorReport").hide();
// 		$("#unCheckedTable").hide();
// 		$("#checkedTable").show();
		
// 		$("#angle1").css("visibility",'hidden');
// 		$("#angle2").css("visibility",'hidden');
// 		$("#angle3").css("visibility",'visible');
// 		$("#angle5").css("visibility",'hidden');
//  		$("#angle6").css("visibility",'hidden');
	
// 	}else if(${page=='ReportBasic'}){
// 		$("#memberNav").css("color", "black");
// 		$("#shopNav").css("color", "black");
// 		$("#customerNav").css("color", "black");
// 		$("#reportNav").css("color", "black");
// 		$("#reportBasicNav").css("color", "#8D5433");
//  		$("#reportOperationNav").css("color", "black");
 		
// 		getGender();
		
// 		$("#divMember").hide(); 
// 		$("#divShop").hide(); 
// 		$("#divCustomer").hide(); 
// 		$("#divBasicReport").show();  
// 		$("#divOperatorReport").hide();
		
// 		$("#angle1").css("visibility",'hidden');
// 		$("#angle2").css("visibility",'hidden');
// 		$("#angle3").css("visibility",'hidden');
// 		$("#angle5").css("visibility",'visible');
//  		$("#angle6").css("visibility",'hidden');
// 	}
	
	
<!-- ===========================  按鈕  ============================================================================= -->	
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
 	
//  	function showMemberReport(){
//  		$("#memberNav").css("color", "#8D5433");
//  		$("#shopNav").css("color", "black");
//  		$("#customerNav").css("color", "black");
//  		$("#reportNav").css("color", "black");
//  		$("#reportBasicNav").css("color", "black");
//  		$("#reportOperationNav").css("color", "black");
//  		$("#divMember").show(); 
//  		$("#divShop").hide(); 
//  		$("#divCustomer").hide(); 
//  		$("#divBasicReport").hide();  
// 		$("#divOperatorReport").hide(); 	
//  		$('.TheMember').show();
//  		$("#angle1").css("visibility",'visible');
//  		$("#angle2").css("visibility",'hidden');
//  		$("#angle3").css("visibility",'hidden');
//  		$("#angle5").css("visibility",'hidden');
//  		$("#angle6").css("visibility",'hidden');
 		
//  	}
 	
//  	function showShopReport(){
//  		$("#memberNav").css("color", "black");
//  		$("#shopNav").css("color", "#8D5433");
//  		$("#customerNav").css("color", "black");
//  		$("#reportNav").css("color", "black");
//  		$("#reportBasicNav").css("color", "black");
//  		$("#reportOperationNav").css("color", "black");
//  		$("#divMember").hide(); 
//  		$("#divShop").show(); 
//  		$("#divCustomer").hide(); 
//  		$("#divBasicReport").hide();  	
//  		$("#divOperatorReport").hide();
//  		$('.TheShop').show();
//  		$("#angle1").css("visibility",'hidden');
//  		$("#angle2").css("visibility",'visible');
//  		$("#angle3").css("visibility",'hidden');
//  		$("#angle5").css("visibility",'hidden');
//  		$("#angle6").css("visibility",'hidden');
//  	}
 	
//  	function showCustomerReport(){
// 		$("#divMember").hide(); 
// 		$("#memberNav").css("color", "black");
// 		$("#shopNav").css("color", "black");
// 		$("#customerNav").css("color", "#8D5433");
// 		$("#reportNav").css("color", "black");
// 		$("#reportBasicNav").css("color", "black");
//  		$("#reportOperationNav").css("color", "black");
// // 		getGender();
// 		$("#divShop").hide(); 
// 		$("#divCustomer").show(); 
// 		$("#unCheckedTable").show();
// 		$("#checkedTable").hide();
// // 		$("#customerReportTable").hide();	
// 		$("#divBasicReport").hide();  
// 		$("#divOperatorReport").hide();
		
// 		$("#angle1").css("visibility",'hidden');
// 		$("#angle2").css("visibility",'hidden');
// 		$("#angle3").css("visibility",'visible');
// 		$("#angle5").css("visibility",'hidden');
//  		$("#angle6").css("visibility",'hidden');
//  	}
 	
// 	function showCustomerReportChecked(){
// 		$("#memberNav").css("color", "black");
// 		$("#shopNav").css("color", "black");
// 		$("#customerNav").css("color", "#8D5433");
// 		$("#reportNav").css("color", "black");
// 		$("#reportBasicNav").css("color", "black");
//  		$("#reportOperationNav").css("color", "black");
// 		$("#divMember").css("display","none"); 
// 		$("#divShop").hide(); 
// 		$("#divCustomer").show(); 
// 		$("#unCheckedTable").hide();
// 		$("#checkedTable").show();
// 		$("#divBasicReport").hide();  
// 		$("#divOperatorReport").hide();
		
// // 		$("#customerReportTable").hide();	
		
// 		$("#angle1").css("visibility",'hidden');
// 		$("#angle2").css("visibility",'hidden');
// 		$("#angle3").css("visibility",'visible');
// 		$("#angle5").css("visibility",'hidden');
//  		$("#angle6").css("visibility",'hidden');
// //  		makeCustomerReportChecked();
//  	}
 	
// 	function makeCustomerReportChecked(){
// 		$(".checkedTableFromAjax").html();
// 	}
 	
 	
 	
//  	function showBasicReport(){
// 		$("#memberNav").css("color", "black");
// 		$("#shopNav").css("color", "black");
// 		$("#customerNav").css("color", "black");
// 		$("#reportNav").css("color", "black");
// 		$("#reportBasicNav").css("color", "#8D5433");
//  		$("#reportOperationNav").css("color", "black");
		
// 		$("#divMember").hide(); 
// 		$("#divShop").hide(); 
// 		$("#divCustomer").hide(); 
// 		$("#divBasicReport").show();  
// 		$("#sexRatioTable").show();  
// 		$("#divOperatorReport").hide();
// 		$("#angle1").css("visibility",'hidden');
// 		$("#angle2").css("visibility",'hidden');
// 		$("#angle3").css("visibility",'hidden');
// 		$("#angle5").css("visibility",'visible');
//  		$("#angle6").css("visibility",'hidden');
//  	}
 	
// 	function showOperationReport(){
// 		$("#memberNav").css("color", "black");
// 		$("#shopNav").css("color", "black");
// 		$("#customerNav").css("color", "black");
// 		$("#reportNav").css("color", "black");
// 		$("#reportBasicNav").css("color", "black");
//  		$("#reportOperationNav").css("color", "#8D5433");
// // 		getGender();
// 		$("#divMember").hide(); 
// 		$("#divShop").hide(); 
// 		$("#divCustomer").hide(); 
// 		$("#divBasicReport").hide();  
// 		$("#divOperatorReport").show();
// // 		getRegisterNum();
// 		$("#angle1").css("visibility",'hidden');
// 		$("#angle2").css("visibility",'hidden');
// 		$("#angle3").css("visibility",'hidden');
// 		$("#angle5").css("visibility",'hidden');
//  		$("#angle6").css("visibility",'visible');
//  	}
 	
 	
<!-- ============================ 修改會員狀態 ============================================================================== --> 	
 	
	function changeType(x){
		var newStatus=document.getElementById(x.id).value;
		var id = "Memberid_" + x.id.toString().replace("Member_status","");
		var idvalue = $("#"+id).val();
		changeMemberStatus(idvalue,newStatus);
	}
		 			
							 			
	function changeMemberStatus(id,newStatus){
		console.log("newStatus = " + newStatus);
		console.log("id = " + id);
		$.ajax({ 
			url:"<c:url value='/changeMemberStatus' />", 
			type:'post', 
			data: { "memberID" : id , "status" : newStatus },
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

 <!--========================= 點擊客服管理  ================================================================================================================================================================-->
//  	$("#clickUnChecked").click(function(){
// // 		getGender();
// 		$("#unCheckedTable").show();
// 		$("#checkedTable").hide();
// 		$("#customerReportTable").hide();	
// 	})
	
// 	$("#clickChecked").click(function(){  
// 		getGender();
// 		$("#unCheckedTable").hide();
// 		$("#checkedTable").show();
// 		$("#customerReportTable").hide();	
// 	})
	
// 	$("#clickCustomerReport").click(function(){
// // 		getGender();
// 		$("#unCheckedTable").hide();
// 		$("#checkedTable").hide();
// 		$("#customerReportTable").show();	
// 	})
 
 
 
//  	$("#clicksexRatio").click(function(){
//  		getGender();
//  		$("#placePercentageTable").hide();
//  		$("#petTypeTable").hide();
//  		$("#registerNumTable").hide();
//  		$("#loginNumTable").hide();
 	
//  	})
 	
//  	$("#clickplacePercentage").click(function(){
//  		$("#sexRatioTable").hide();
//  		getPlace();
//  		$("#petTypeTable").hide();
//  		$("#registerNumTable").hide();
//  		$("#loginNumTable").hide();
//  	})
 	
//  	$("#clickpetType").click(function(){
//  		$("#sexRatioTable").hide();
//  		$("#placePercentageTable").hide();
// 	  	getPetType();
//  		$("#registerNumTable").hide();
//  		$("#loginNumTable").hide();
 		
//  	})
 	
//  	$("#clickregisterNum").click(function(){
//  		$("#sexRatioTable").hide();
//  		$("#placePercentageTable").hide();
//  		$("#petTypeTable").hide();
//  		getRegisterNum();
//  		$("#loginNumTable").hide();
//  	})
 	
//  	$("#clickloginNum").click(function(){
//  		$("#sexRatioTable").hide();
//  		$("#placePercentageTable").hide();
//  		$("#petTypeTable").hide();
//  		$("#registerNumTable").hide();
// //  		$("#loginNumTable").hide();
//  	})
<!-- =====================================  會員搜尋列  ================================================================================================================================= -->	
 	$("#search_Member").keyup(function(e){ 
	    var code = e.key; 
	    if(code==="Enter") {
	    	if($("#search_Member").val() != "")
	    		findMember();
	    	else
	    		showAll();
	    }
	});

 	document.getElementById("TheChosenMember").onclick = function(){
 		if($("#search_Member").val() != "")
    		findMember();
    	else
    		showAll();
 	}
 	function showAll(){
 		location.href = "<c:url value='/adminDetail'  /> ";
 	}
 	
 	
 	
 	function findMember(){
	 	var theChosenOne = $("#search_Member").val();
		console.log("theChosenOne = " + theChosenOne);
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/TheChosenMember' />", true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("theChosenOne=" + theChosenOne);
		var message = "";
		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);
				$(".allData").remove();
				$(".searchData div").remove();
				console.log(result);
				var count = 0;
				for ( var i in result["members"]) { count++; }
				console.log("count = " +　count);
				var postsCount = count - 2;
				console.log("postsCount = " +　postsCount);
				$("<div/>").attr('class', 'searchResult' + postsCount).appendTo($(".searchData"));
				
				for ( var i in result["members"]) {
					var choose = "";
					if(result["members"][i].status == "刪除"){
						choose = '<input  type="text" class="input-holder" value="'+result["members"][i].status+'" disabled/>';
					}else if(result["members"][i].status == "會員"){
						choose = '<select name="Member_status" id="Member_status'+result["members"][i].memberID+'" class="theselectMember" style="width:200px;height:40px;text-align:center;margin-bottom:11px;" onchange="changeType(this)">'
								+	'<option value="黑名單" >黑名單</option>'
								+	'<option value="會員" selected="selected">會員</option>'
								+ '</select>';
					}else{
						choose = '<select name="Member_status" id="Member_status'+result["members"][i].memberID+'" class="theselectMember" style="width:200px;height:40px;text-align:center;margin-bottom:11px;" onchange="changeType(this)">'
						+	'<option value="黑名單" selected="selected">黑名單</option>'
						+	'<option value="會員" >會員</option>'
						+ '</select>';
					}
				
					$(".searchResult" + postsCount)
						.html(
							'<div id="Member_' + result["members"][i].memberID + '" class="TheMember">'
							+ '<input type="hidden" value="'+ result["members"][i].memberID+ '" style="display:none" id="Memberid_'+ result["members"][i].memberID+ '">'
							+ '<div class="form-table">'
							+ '<div class="form-item fih" style="height:250px">'
							+ '<div class="form-controler">'
							+ '<img src = " '+result["members"][i].profilePicture+ '"class="theimg">'
							+ '</div>'
							+ '<div style="display:block;">'
							+ '<div style="margin-left:10px">'
							+ '<span class="spanTitle" style="margin-right: 5px;margin-left:17px;">帳號</span>'
							+ '<input type="text" class="input-holder" value="'+result["members"][i].account+ '" readonly/>'
							+ '</div>'
							+ '<div style="margin-left:10px">'
							+ '<span class="spanTitle" style="margin-right: 5px;margin-left:17px;">狀態</span>'
							+ choose
							+ '</div>'
							+ '<div style="margin-left:10px">'
							+ '<span class="spanTitle" style="margin-right: 5px;margin-left:17px;">信箱</span>'
							+ '<input type="text" class="input-holder" style="width:335px" value="'+result["members"][i].email+'" readonly/>'
							+ '</div>'
							+ '<div style="margin-left:10px">'
							+ '<span class="spanTitle" style="margin-right: 5px;margin-left:17px;">地址</span>'
							+ '<input type="text"  class="input-holder"   style="width:335px" value="'+result["members"][i].address+'" readonly/>'
							+ '</div>'
							+ '</div>' //<!--  display:block-->
							+ '</div>' //<!-- form-item -->
							+ '</div>' //<!-- table -->
							+ '<div style="height:15px"></div>'
							+ '</div>' //<!-- TheMember -->
							);
					
					postsCount = postsCount - 1;
					$("<div/>").attr('class', 'searchResult' + postsCount).appendTo($(".searchData"));

					for (var i = 0; i < result["memberTotalPages"]; i++) {
						if (result["memberPageNo"] == (i + 1)) {
							$(".pagination-lg")
									.html(
											'<li class="page-item disabled"><a class="page-link" href="javascript:" tabindex="-1"><span style="font-weight: 600; color: #6A7287" id="page'
													+ (i + 1)
													+ '">'
													+ (i + 1)
													+ '</span></a></li>')
						} else {
							$('.pagination-lg')
									.append(
											'<li class="page-item"><a class="page-link" ><span onclick="getNextPage('
													+ (i + 1)
													+ ')" id="page'
													+ (i + 1)
													+ '" style="font-weight: 600; color: #B11429">'
													+ (i + 1)
													+ '</span></a></li>')
						}
					}

					if (result["memberTotalPages"] == 0) {
						$(".searchData")
								.html(
										'<div style="float: right;width: 75%;height: 500px;background-color: white;text-align: center;border-radius: 10px;line-height: 500px;color: #c74c6b;font-size: 22pt;box-shadow: 12px 12px 7px #dfe3e8;margin-right: 10%;font-weight: 700;margin-bottom:10px"><a  href="http://localhost:8080/PetYou/freePost" ><buttontype="button" class="btn btn-outline-danger">我要幫忙刊登</button></a><img src="https://img.icons8.com/doodle/48/000000/rabbit-in-hat.png" />Oops... 目前無資料，或查無資料！</div>');
						$('.pagination-lg').html("")
					}
				}//result["members"]
			}//if 4 200
		}//onreadystatechange
 	}//findMember
 	
 	
 	function getNextPage(pageNo) {
 		var theChosenOne = $("#search_Member").val();
		console.log("theChosenOne = " + theChosenOne);
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/TheChosenMember' />", true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("theChosenOne=" + theChosenOne +"&pageNo=" + pageNo);
		var message = "";
		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);
				$(".allData").remove();
				$(".searchData div").remove();
				console.log("getNextPage result = " + result);
				console.log("result['memberPageNo'] =" + result["memberPageNo"]);
				console.log("result['memberTotalPages'] = " + result["memberTotalPages"]);
				var count = 0;
				for ( var i in result["members"]) { count++; }
				console.log("count = " + count);
				var postsCount = count - 2;
				$("<div/>").attr('class', 'searchResult' + postsCount).appendTo($(".searchData"));
				
				for ( var i in result["members"]) {
					var choose = "";
					if(result["members"][i].status == "刪除"){
						choose = '<input  type="text" class="input-holder" value="'+result["members"][i].status+'" disabled/>';
					}else if(result["members"][i].status == "會員"){
						choose = '<select name="Member_status" id="Member_status'+result["members"][i].memberID+'" class="theselectMember" style="width:200px;height:40px;text-align:center;margin-bottom:11px;" onchange="changeType(this)">'
								+	'<option value="黑名單" >黑名單</option>'
								+	'<option value="會員" selected="selected">會員</option>'
								+ '</select>';
					}else{
						choose = '<select name="Member_status" id="Member_status'+result["members"][i].memberID+'" class="theselectMember" style="width:200px;height:40px;text-align:center;margin-bottom:11px;" onchange="changeType(this)">'
						+	'<option value="黑名單" selected="selected">黑名單</option>'
						+	'<option value="會員" >會員</option>'
						+ '</select>';
					}
				
					$(".searchResult" + postsCount)
						.html(
							'<div id="Member_' + result["members"][i].memberID + '" class="TheMember">'
							+ '<input type="hidden" value="'+ result["members"][i].memberID+ '" style="display:none" id="Memberid_'+ result["members"][i].memberID+ '">'
							+ '<div class="form-table">'
							+ '<div class="form-item fih" style="height:250px">'
							+ '<div class="form-controler">'
							+ '<img src = " '+result["members"][i].profilePicture+ '"class="theimg">'
							+ '</div>'
							+ '<div style="display:block;">'
							+ '<div style="margin-left:10px">'
							+ '<span class="spanTitle" style="margin-right: 5px;">帳號</span>'
							+ '<input type="text" class="input-holder" value="'+result["members"][i].account+ '" readonly/>'
							+ '</div>'
							+ '<div style="margin-left:10px">'
							+ '<span class="spanTitle" style="margin-right: 5px;">狀態</span>'
							+ choose
							+ '</div>'
							+ '<div style="margin-left:10px">'
							+ '<span class="spanTitle" style="margin-right: 5px;">信箱</span>'
							+ '<input type="text" class="input-holder" style="width:335px" value="'+result["members"][i].email+'" readonly/>'
							+ '</div>'
							+ '<div style="margin-left:10px">'
							+ '<span class="spanTitle" style="margin-right: 5px;">地址</span>'
							+ '<input type="text"  class="input-holder"   style="width:335px" value="'+result["members"][i].address+'" readonly/>'
							+ '</div>'
							+ '</div>' //<!--  display:block-->
							+ '</div>' //<!-- form-item -->
							+ '</div>' //<!-- table -->
							+ '<div style="height:15px"></div>'
							+ '</div>' //<!-- TheMember -->
							);
					
					postsCount = postsCount - 1;
					$("<div/>").attr('class', 'searchResult' + postsCount).appendTo($(".searchData"));
					
					if (pageNo == 1) {
						console.log("pageNo == 1")
						$('.pagination-lg').html(
										'<li class="page-item disabled" >'
										+'<a class="page-link" >'
										+ '<span onclick="" id="page'+ 1+ '" style="font-weight: 600; color: #6A7287">'
										+ 1 
										+ '</span></a></li>');
					} else {
						console.log("pageNo != 1")
						$(".pagination-lg").html(
										'<li class="page-item">'
										+'<a class="page-link" >'
										+ '<span onclick="getNextPage('+1+')" id="page'+1+'" style="font-weight: 600; color: #B11429">'
										+ 1 
										+ '</span></a></li>');
					}
					
					for (var i = 1; i < result["memberTotalPages"]; i++) {
						if (pageNo == (i + 1)) {
							$(".pagination-lg")
									.append(
											'<li class="page-item disabled"><a class="page-link" >'
											+ '<span onclick="getNextPage('+(i + 1)+ ')" id="page'+ (i + 1)+ '" style="font-weight: 600; color: #6A7287">'
											+ (i + 1)
											+ '</span></a></li>')
						} else {
							$('.pagination-lg')
									.append(
											'<li class="page-item">'
											+'<a class="page-link" ><span onclick="getNextPage('+(i + 1)+ ')" id="page'+ (i + 1)+ '" style="font-weight: 600; color: #B11429">'
											+ (i + 1)
											+ '</span></a></li>')

						}
					}

					if (result["memberTotalPages"] == 0) {
						$(".searchData")
								.html(
										'<div style="float: right;width: 75%;height: 500px;background-color: white;text-align: center;border-radius: 10px;line-height: 500px;color: #c74c6b;font-size: 22pt;box-shadow: 12px 12px 7px #dfe3e8;margin-right: 10%;font-weight: 700;margin-bottom:10px"><a  href="http://localhost:8080/PetYou/freePost" ><buttontype="button" class="btn btn-outline-danger">我要幫忙刊登</button></a><img src="https://img.icons8.com/doodle/48/000000/rabbit-in-hat.png" />Oops... 目前無資料，或查無資料！</div>');
						$('.pagination-lg').html("")
					}
				}//test	
			}//if 4 200
		}//onreadystatechange
	}  
<!-- =========================================  店家搜尋列  ===================================================================================================================================== -->	
//  	$("#search_Shop").keyup(function(e){ 
// 	    var code = e.key; // recommended to use e.key, it's normalized across devices and languages
// 	    if(code==="Enter") {
// 	    	$('.TheShop').show();
// 	    	findShop();
// 	    }
// 	});

//  	document.getElementById("TheChosenShop").onclick = function(){
//  		$('.TheShop').show();
//  		findShop();
//  	}
 	
//  	function findShop(){
// 	 	var theChosenOne = $("#search_Shop").val();
// 		console.log("theChosenOne = " + theChosenOne);
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("POST", "<c:url value='/TheChosenShop' />", true);
// 		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
// 		xhr.send("theChosenOne=" + theChosenOne);
// 		var message = "";
// 		xhr.onreadystatechange = function() {
// 			// 伺服器請求完成
// 			if (xhr.readyState == 4 && xhr.status == 200) {
// 				var result = JSON.parse(xhr.responseText);
// 				for (var x of result) { // 遍歷Set
// 				    $("#Shop_"+x).css('display','none'); 
// 				}
// 				console.log(result.length);
// 			}
// 		}
//  	}
 	
 	
 
 	
<!-- ================================= 性別比 ajax ============================================================================================================================================= -->	
// 	var MaleSet = 0; 
//  	var FemaleSet = 0;
//  	var UnknowSet = 0; 
 	 
// 	 function getGender(){
// 		 var xhr = new XMLHttpRequest(); 
// 		 	xhr.open("GET", "<c:url value='/Admin/getGender'/>", true); 
// 		 	xhr.send(); 
// 		 	var message = ""; 
// 		 	xhr.onreadystatechange = function() { 
// 		 		if (xhr.readyState == 4 && xhr.status == 200) { 
// 		 			var result = JSON.parse(xhr.responseText); 
// 		 			$("#sexRatioTable").show();  
// 		 			MaleSet = result["男"]; 
// 		 			FemaleSet = result["女"]; 
// 		 			UnknowSet = result["無"]; 
// 		 			makesexRatioPie(MaleSet,FemaleSet,UnknowSet); 
// 		 		} 
// 			}
// 	 }
	
// <!-- =============================== 性別比 報表 =============================================================================================================================================== -->		
	
//  function makesexRatioPie(MaleSet,FemaleSet,UnknowSet){ 
//  	var dom = document.getElementById("sexRatioContainer"); 
//  	var myChart = echarts.init(dom); 
//  	var maleP = (MaleSet / (MaleSet+FemaleSet+UnknowSet)) *100; 
//  	var femaleP = (FemaleSet / (MaleSet+FemaleSet+UnknowSet)) *100; 
//  	var unknowP = (UnknowSet / (MaleSet+FemaleSet+UnknowSet)) *100; 
	
//  	option = null; 
// 	option = { 
// 	 	title: { 
// 	 	     text: '本網站會員性別比', 
// 	 	     subtext: '', 
// 	 	     left: 'center' ,
// 	 	     textStyle: { 
// 	            fontSize:25, 
// 	            fontStyle: 'normal',
// 	            fontWeight: 'bold',
// 	        },
// 	 	}, 
// 	 	tooltip: { 
// 	 	     trigger: 'item', 
// 	 	     formatter: '{a} <br/>{b} : {c} ({d}%)' 
// 	 	}, 
// 	 	legend: { 
// 	 	     orient: 'vertical', 
// 	 	     left: 'left', 
// 	 	     data: ['女性', '男性', '無'] ,
// 	 	    textStyle: { 
//                 fontSize: 20
//             }
// 	 	}, 
// 	 	series: [ 
// 	 	     { 
// 	 	         name: '性別比', 
// 	 	         type: 'pie', 
// 	 	         radius: '70%', 
// 	 	         center: ['50%', '55%'], 
// 	 	         data: [
// 	 	             {value: FemaleSet, name: '女性'}, 
// 	 	             {value: MaleSet, name: '男性'}, 
// 	 	             {value: UnknowSet, name: '無'} 
		            
// 	 	         ], 
// // 	 	        itemStyle: {
// // 	                normal: {
// // 	                    color: function(params) {
	                       
// // 	                        var colorList = [
// // 	                          '#FFB5B5','#66B3FF','#AE00AE'
// // 	                        ];
// // 	                        return colorList[params.dataIndex]
// // 	                    }
// // 	                }
// // 	            },
// 	 	         emphasis: { 
// 	 	             itemStyle: { 
// 	 	                 shadowBlur: 10, 
// 	 	                 shadowOffsetX: 0, 
// 		                 shadowColor: 'rgba(0, 0, 0, 0.5)' 
// 	 	             } 
// 	 	         } 
// 	 	     } 
// 	 	 ] 
//  	};
//  	; 
//  	if (option && typeof option === "object") { 
//  		 myChart.setOption(option, true); 
//  	} 
//  }	 
// <!-- ================================ 地區比 ajax ============================================================================================================================================== -->	
// 	var NorthSet = 0;	
// 	var SouthSet = 0; 
// 	var EastSet = 0; 
// 	var CentralSet = 0;
// 	var Outlying = 0;

//  function getPlace(){
// 	 var xhr = new XMLHttpRequest(); 
// 	 	xhr.open("GET", "<c:url value='/Admin/getPlace'/>", true); 
// 	 	xhr.send(); 
// 	 	var message = ""; 
// 	 	xhr.onreadystatechange = function() { 
// 	 		if (xhr.readyState == 4 && xhr.status == 200) { 
// 	 			var result = JSON.parse(xhr.responseText); 
// 	 			console.log(result)
// 	 			$("#placePercentageTable").show(); 
// 	 			NorthSet = result["北部"]; 
// 	 			CentralSet = result["中部"]; 
// 	 			SouthSet = result["南部"]; 
// 	 			EastSet = result["東部"]; 
// 	 			Outlying = result["離島"]; 
// 	 			makeplacePercentagePie(NorthSet,CentralSet,SouthSet,EastSet,Outlying); 
// 	 		} 
// 		}
//  }

// <!-- ================================ 地區比 報表 ============================================================================================================================================== -->		

// function makeplacePercentagePie(NorthSet,CentralSet,SouthSet,EastSet,Outlying){ 
//  	var dom = document.getElementById("placePercentageContainer"); 
//  	var myChart = echarts.init(dom);  

//  	option = null; 
// 	option = { 
// 	 	title: { 
// 	 	     text: '本網站會員地區分布', 
// 	 	     subtext: '', 
// 	 	     left: 'center' ,
// 	 	     textStyle: { 
// 	            fontSize:25, 
// 	            fontStyle: 'normal',
// 	            fontWeight: 'bold',
// 	        },
// 	 	}, 
// 	 	tooltip: { 
// 	 	     trigger: 'item', 
// 	 	     formatter: '{a} <br/>{b} : {c} ({d}%)' 
// 	 	}, 
// 	 	legend: { 
// 	 	     orient: 'vertical', 
// 	 	     left: 'left', 
// 	 	     data: ['北部','中部','南部','東部','離島'] ,
// 	 	    textStyle: { 
//                 fontSize: 20
//             }
// 	 	}, 
// 	 	series: [ 
// 	 	     { 
// 	 	         name: '性別比', 
// 	 	         type: 'pie', 
// 	 	         radius: '70%', 
// 	 	         center: ['50%', '55%'], 
// 	 	         data: [
// 	 	             {value: NorthSet, name: '北部'}, 
// 	 	             {value: CentralSet, name: '中部'}, 
// 	 	             {value: SouthSet, name: '南部'}, 
// 	 	           	 {value: EastSet, name: '東部'}, 
// 	 	             {value: Outlying, name: '離島'} 
		            
// 	 	         ], 
	 	         
// 	 	         emphasis: { 
// 	 	             itemStyle: { 
// 	 	                 shadowBlur: 10, 
// 	 	                 shadowOffsetX: 0, 
// 		                 shadowColor: 'rgba(0, 0, 0, 0.5)' 
// 	 	             } 
// 	 	         } 
// 	 	     } 
// 	 	 ] 
//  	};
//  	; 
//  	if (option && typeof option === "object") { 
//  		 myChart.setOption(option, true); 
//  	} 
//  }	 

// <!-- ================================ 寵物比 ajax ============================================================================================================================================== -->	


// function getPetType(){
//  var xhr = new XMLHttpRequest(); 
//  	xhr.open("GET", "<c:url value='/Admin/getPetType'/>", true); 
//  	xhr.send(); 
//  	var message = ""; 
//  	xhr.onreadystatechange = function() { 
//  		if (xhr.readyState == 4 && xhr.status == 200) { 
//  			var result = JSON.parse(xhr.responseText); 
//  			$("#petTypeTable").show(); 
//  			var petType = []
//  			var petTypeNum = []
//  			for(var pet in result){ //用雙陣列把map的key與value取出
//  				petType.push(pet); //key
//  				petTypeNum.push(result[pet]);//value
//  			}
// 			makepetTypePie(petType,petTypeNum); 
//  		} 
// 	}
// }

// <!-- ================================ 寵物比 報表 ============================================================================================================================================== -->		

// function makepetTypePie(petType,petTypeNum){ 
// 	var dom = document.getElementById("petTypeContainer"); 
// 	var myChart = echarts.init(dom); 
// 	var arr = []
// 	for(let i= 0;i <  petType.length;i++){ //製作數組
// 		arr.push({value: petTypeNum[i], name: petType[i]})
// 	}
	
// 	option = null; 
// 	option = { 
// 	 	title: { 
// 	 	     text: '本網站會員地區分布', 
// 	 	     subtext: '', 
// 	 	     left: 'center' ,
// 	 	     textStyle: { 
// 	            fontSize:25, 
// 	            fontStyle: 'normal',
// 	            fontWeight: 'bold',
// 	        },
// 	 	}, 
// 	 	tooltip: { 
// 	 	     trigger: 'item', 
// 	 	     formatter: '{a} <br/>{b} : {c} ({d}%)' 
// 	 	}, 
// 	 	legend: { 
// 	 	     orient: 'vertical', 
// 	 	     left: 'left', 
// 	 	     data: petType,
// 	 	    textStyle: { 
//                 fontSize: 20
//             }
// 	 	}, 
// 	 	series: [ 
// 	 	     { 
// 	 	         name: '寵物比', 
// 	 	         type: 'pie', 
// 	 	         radius: '70%', 
// 	 	         center: ['50%', '55%'], 
// 	 	         data: arr
//     			 	, 
// 	 	         emphasis: { 
// 	 	             itemStyle: { 
// 	 	                 shadowBlur: 10, 
// 	 	                 shadowOffsetX: 0, 
// 		                 shadowColor: 'rgba(0, 0, 0, 0.5)' 
// 	 	             } 
// 	 	         } 
// 	 	     } 
// 	 	 ] 
// 		};
// 	; 
// 	if (option && typeof option === "object") { 
// 		 myChart.setOption(option, true); 
// 	} 
// }	 
// <!-- ================================ 註冊比 ajax ============================================================================================================================================== -->	


// function getRegisterNum(){
// 	$("#registerNumTable").show(); 
// 	makeregisterNumCategory(); 
// 	makeregisterNumContinuous(); 
// //  var xhr = new XMLHttpRequest(); 
// //  	xhr.open("GET", "<c:url value='/Admin/getRegisterNum'/>", true); 
// //  	xhr.send(); 
// //  	var message = ""; 
// //  	xhr.onreadystatechange = function() { 
// //  		if (xhr.readyState == 4 && xhr.status == 200) { 
// //  			var result = JSON.parse(xhr.responseText); 
// //  			console.log(result)
// //  			$("#registerNumTable").show(); 
// //  			var petType = []
// //  			var petTypeNum = []
// //  			for(var pet in result){ //用雙陣列把map的key與value取出
// //  				petType.push(pet);
// //  				petTypeNum.push(result[pet]);
// //  			}
// // 			makeregisterNumPie(petType,petTypeNum); 
// //  		} 
// // 	}
// }

// <!-- ================================ 註冊比 報表 category ============================================================================================================================================== -->		

// function makeregisterNumCategory(){ 
// 	var dom = document.getElementById("registerNumContainer1");
// 	var myChart = echarts.init(dom);
// 	var app = {};
// 	option = null;
// 	option = {
// 			title: [{
// 			     left: 'center',
// 			     text: '註冊人數統計',
// 			    	 textStyle: { 
// 				            fontSize:25, 
// 				            fontStyle: 'normal',
// 				            fontWeight: 'bold',
// 				        },
// 			 }],
// 	 xAxis: {
// 	     type: 'category',
// 	     boundaryGap: false,
// 	     data: ['第一周', '第二周', '第三周', '第四周', '第五周', '第六周', '第七周'],
// 	     axisLabel:{textStyle:{fontSize:20}},
// 	 },
// 	 yAxis: {
// 	     type: 'value',
// 	     axisLabel:{textStyle:{fontSize:20}},
// 	 },
// 	 series: [{
// 	     data: [24, 29, 31, 27,30,25, 24,13],
// 	     type: 'line',
// 	     areaStyle: {}
// 	 }]
// 	};
// 	;
// 	if (option && typeof option === "object") {
// 	 myChart.setOption(option, true);
// 	}
// }	
// <!-- ================================ 註冊比 報表 continuous ============================================================================================================================================== -->		

// function makeregisterNumContinuous(){ 
// 	var dom = document.getElementById("registerNumContainer2");
// 	var myChart = echarts.init(dom);
// 	var app = {};
// 	option = null;

// 	data = [["2020-10-17",14],["2020-10-18",10],//24
// 	        ["2020-10-19",5],["2020-10-20",5],["2020-10-21",5],["2020-10-22",3],["2020-10-23",3],["2000-10-24",4],["2000-10-25",4],//29
// 	        ["2000-10-26",5],["2000-10-27",5],["2000-10-28",5],["2000-10-29",5],["2000-10-30",5],["2000-10-31",5],["2000-11-01",6],//31
// 	        ["2000-11-02",4],["2000-11-03",3],["2000-11-04",5],["2000-11-05",4],["2000-11-06",1], ["2000-11-07",6],["2000-11-08",4],//27
// 	        ["2000-11-09",3],["2000-11-10",5],["2000-11-11",3],["2000-11-12",3],["2000-11-13",2],["2000-11-14",7],["2000-11-15",2],//25
// 	        ["2000-11-16",4],["2000-11-17",2],["2000-11-18",6],["2000-11-19",3],["2000-11-20",6],["2000-11-21",1],["2000-11-22",2],//24
// 	        ["2000-11-23",3],["2000-11-24",7],["2000-11-25",3]];//13

// 	var dateList = data.map(function (item) {
// 	 return item[0];
// 	});
// 	var valueList = data.map(function (item) {
// 	 return item[1];
// 	});

// 	option = {

// 	 // Make gradient line here
// 	 visualMap: [{
// 	     show: false,
// 	     type: 'continuous',
// 	     seriesIndex: 0,
// 	     min: 0,
// 	     max: 5
// 	 }],
// 	 title: [{
// 	     left: 'center',
// 	     text: '註冊人數統計',
// 	    	 textStyle: { 
// 		            fontSize:25, 
// 		            fontStyle: 'normal',
// 		            fontWeight: 'bold',
// 		        },
// 	 }],
// 	 tooltip: {
// 	     trigger: 'axis'
// 	 },
// 	 xAxis: [{
// 	     data: dateList,
// 	     axisLabel:{textStyle:{fontSize:20}}
// 	 }],
// 	 yAxis: [{
// 	     splitLine: {show: false},
// 	     axisLabel:{textStyle:{fontSize:20}}
// 	 }],
// 	 grid: [{
// 	     bottom: '10%'
// 	 }],
// 	 series: [{
// 	     type: 'line',
// 	     showSymbol: false,
// 	     data: valueList
// 	 }]
// 	};;
// 	if (option && typeof option === "object") {
// 	 myChart.setOption(option, true);
// 	}
// }	 
<!-- ============================================================================================================================================================================== -->		
	
	</script> 
</body>
</html>