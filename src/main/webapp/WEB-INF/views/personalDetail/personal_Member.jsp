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

/* .sidemenu ul li:hover { */
/* 	font-weight: bold; */
/* 	color: #8D5433; */
/* } */

.form-table {
	background-color: #ffffff;
	border-radius: 15px;
	padding:10px;
	box-shadow: 12px 12px 7px #dfe3e8;
/* 	width:860px; */
}

.form-item {
	display: flex;
/* 	padding: 10px 0; */
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
	margin-top: 4px;
}

.input-holder {
	width: 400px;
	outline: 0;
	border-radius: 10px;
	text-align: center;
	border:0px;
	background-color:#f6c2cd;
	height: 45px;
}

.theselect{
	width: 100px;
	padding: 0 0 0 10px;
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

img {
	border-radius: 5px;
}
</style>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<form:form method="post" enctype="multipart/form-data">
		<div class="wrapper clearfix">
<!-- ==========================================  左側導覽列 ============================================================================================= -->							
			<div class="sidemenu"><!--sidemenu -->
				<ul style="list-style: none; line-height: 20px;">
					<li id="clickpersonal">
						<i class="fa fa-address-card" aria-hidden="true">個人資訊</i>
						<i id="angle1" class="fa fa-angle-right" aria-hidden="true"style="margin-left: 10px;"></i>
					</li>
				
					<li id="clickpet">
						<i class="fa fa-paw" aria-hidden="true">寵物資訊</i>
						<i id="angle2" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>

					<li id="clickcreditcard">
						<i class="fa fa-credit-card" aria-hidden="true">信用卡資訊</i>
						<i id="angle3" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
					</li>
					
					<c:if test="${empty shopName}">
						<li id="clickshop">
							<i class="fa fa-money" aria-hidden="true">註冊店家</i>
							<i id="angle4" class="fa fa-angle-right" aria-hidden="true" style="margin-left: 10px;"></i>
						</li>
					</c:if> 
					
					<li id="clickservice">
						<i class="fa fa-users" aria-hidden="true">聯絡客服</i>
					</li>
				</ul>
			</div><!--sidemenu -->
			
			<script>
				$("#clickservice").click(function(){
					location.href="<c:url value='/TalkToService'/>";
				})
			</script>
			
<!-- ===============================================  主要畫面  ======================================================================================== -->				
			
			<div class="main"><!-- main -->
<!-- ================================================= 個人內容 ====================================================================================== -->	
				<div id="divpersonal"><!-- divpersonal -->
					
					<div class="form-title" >
						帳號管理
						<span style="margin-right:630px;"></span>
						
						<input type="button" value="修改" style="border:0px" id="updateTheMember">
						<input type="button" value="刪除" style="border:0px" id="deleteTheMember">
						
					
					</div>
					<div class="form-table">
						
						
					<div class="form-item fih">
						<label class="form-label">信箱</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="email" name="email" value="${member.email}" readonly/>
						</div>
					</div>
					<hr>
					<div class="form-item fih">
						<label class="form-label">暱稱</label>
						<div class="form-controler">
							<input  type="text" class="input-holder" id="nickName" name="nickName"
								style="clear: both" value="${member.nickName}" readonly/>
						</div>
					</div>	
					<hr>
					<div class="form-item fih">
						<label class="form-label">帳號</label>
						<div class="form-controler">
							<input type="text" class="input-holder" id="account" name="account" 
								value="${member.account}" readonly/>
							
						</div>
					</div>
					<hr>
					<div class="form-item fih">
						<label class="form-label">密碼</label>
						<div class="form-controler">
							<input  type="text" class="input-holder" id="password" name="password"
								style="clear: both" value="${member.password}" readonly/>
						</div>
					</div>	
					</div>
					<div class="form-title">個人檔案</div>
					<div class="form-table">
						<div class="form-item fih">
							<label class="form-label">名字</label>
							<div class="form-controler">
								<input type="text" class="input-holder" id="firstName" name="firstName" 
								value="${member.firstName}" readonly/>
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">姓氏</label>
							<div class="form-controler">
								<input type="text" class="input-holder" id="lastName" name="lastName" 
									value="${member.lastName}" readonly/> 
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">性別</label>
							<div class="form-controler">
							 	<input type="text" class="input-holder" value="${member.gender }" id="getGender" readonly/>
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">生日</label>
							<div class="form-controler">
								<input type="text" class="input-holder" id="birthday" name="birthday"
								value="${member.birthday }" readonly/>
							</div>
						</div>
						</div>
						
						<div class="form-title">進階資訊</div>
					<div class="form-table">
						<div class="form-item fih">
							<label class="form-label">身分證</label>
							<div class="form-controler">
								<input type="text" class="input-holder" id="identityCard" name="identityCard" 
									value="${member.identityCard }" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">地址</label>
							<div class="form-controler">
								<input type="text"  class="input-holder" id="address" name="address" 
								value="${member.address }" readonly/>
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">電話</label>
							<div class="form-controler">
								<input type="text"  class="input-holder" id="phone" name="phone" 
									value="${member.phone}" readonly/>
							</div>
						</div>
						</div>
						<div class="form-title">關於您</div>
						<div class="form-table">
						
						<div class="form-item fih" style="height:200px">
							<label class="form-label">大頭貼</label>
							<div class="form-controler">
								<img src = "${member.profilePicture}"  class="salonIcon">
							</div>
						</div>
						<hr>
						<div class="form-item fih" style="height:170px">
							<label class="form-label">關於我</label>
							<div class="form-controler">
								<textarea  class="input-holder" id="aboutMe" name="aboutMe" 
									 readonly style="resize : none;width:400px;height:150px;text-align:left;padding-left:5px;">${member.aboutMe}</textarea>
							</div>
						</div>
					</div>
				</div><!-- divpersonal -->
<!-- ======================================================================================================================================= -->				
				<div id="divpet"><!-- divpet -->			
				<c:forEach  var="pet" items="${ pets }" varStatus="status">
				<div>
					<div class="form-title">
						寵物資訊
						<input type="hidden" value="${pet.petID }" class="thePetID" id="thePetID${status.count}">
						<c:choose>
							<c:when test="${status.first}">
								<span style="margin-right:575px;"></span>
								<input type="button" value="新增" style="border:0px;" id="newThePet"> 
							</c:when>
							<c:otherwise>
								<span style="margin-right:630px;"></span>
							</c:otherwise>
						</c:choose>
						<input type="button" value="修改" style="border:0px" id="updateThePet${status.count}" > 
						<input type="button" value="刪除" style="border:0px" id="deleteThePet${status.count}"> 
<!-- ======================================================================================================================================= -->											
					<script type="text/javascript">
<!-- ======================================= 修改寵物資料 ================================================================================================ -->					
					$("#updateThePet${status.count}").click(function() {
						var petId = $("#thePetID${status.count}").val();
						Swal.fire({
				            title: "確定要修改寵物資料嗎？",
				            showCancelButton: true
				        }).then(function(result) {
				           if (result.value) {
				        	   location.href="<c:url value='/Member/pet/Update?id=" + petId + "'/>";
				           }
				           else {    
				           }
				        });
					})
<!-- ======================================= 刪除寵物資料 ================================================================================================ -->										
	 					$("#deleteThePet${status.count}").click(function() {
	 						var petId = $("#thePetID${status.count}").val();
		 			 			Swal.fire({
		 		 	            title: "確定要刪除寵物資料嗎？",
		 		 	            showCancelButton: true
		 		 	        }).then(function(result) {
		 		 	           if (result.value) {
		 		 	        	   location.href="<c:url value='/Member/pet/Delete?id=" + petId + "'/>";
		 		 	           }
		 		 	           else {    
		 		 	           }
		 		 	        });
	 					}) 
					</script> 
<!-- ======================================================================================================================================= -->					
					</div>
					<div class="form-table">
						<div class="form-item fih">
							<label class="form-label">名字</label>
							<div class="form-controler">
								<input type="text" class="input-holder"  name="petname"
									value="${pet.petName}" readonly class="petname"/>	
								
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">晶片</label>
							<div class="form-controler">
								<input type="text" class="input-holder" 
									value="${pet.chip}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">性別</label>
							<div class="form-controler">
								<input type="text" class="input-holder"
									value="${pet.gender}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">年齡</label>
							<div class="form-controler">
								<input type="text" class="input-holder" 
									value="${pet.age}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">類型</label>
							<div class="form-controler">
								<input type="text" class="input-holder" 
									value="${pet.type}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">品種</label>
							<div class="form-controler">
								<input type="text" class="input-holder"  
									value="${pet.variety}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">體型</label>
							<div class="form-controler">
								<input type="text" class="input-holder" 
									value="${pet.size}" readonly/>	
							</div>
						</div>
						<hr>
						
						<div class="form-item fih">
							<label class="form-label">開刀紀錄</label>
							<div class="form-controler">
								<input type="text" class="input-holder"  
									value="${pet.operated}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">驅蟲藥</label>
							<div class="form-controler">
								<input type="text" class="input-holder"  
									value="${pet.deworming}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">結紮</label>
							<div class="form-controler">
								<input type="text" class="input-holder"  
									 readonly id="ligation${status.count}"/>	
							</div>
						</div>
						<input type="hidden"  value="${pet.ligation}" id="ligationValue${status.count}">
						<script>
							if($("#ligationValue${status.count}").val() == '1'){
								$("#ligation${status.count}").val("有");
							}else if($("#ligationValue${status.count}").val() == '0'){
								$("#ligation${status.count}").val("無");
							}
						</script>
						<hr>
						<div class="form-item fih" style="height:250px">
							<label class="form-label">圖片</label>
							<div class="form-controler">
								<img src = "${pet.photo}"  class="salonIcon">
							</div>
						</div>

					</div>

				</div>
				</c:forEach>
				</div><!-- divpet -->
<!-- ======================================================================================================================================= -->					
				<div id="divcreditcard"><!-- divcreditcard -->
				<c:forEach  var="creditcard" items="${creditCards}" varStatus="status">
					<div class="form-title">
						信用卡資訊
						<input type="hidden" value="${creditcard.creditCardID }" id="theCCID${status.count}">
						<c:choose>
							<c:when test="${status.first}">
								<span style="margin-right:551px;"></span>
								<input type="button" value="新增" style="border:0px;" id="newTheCCID"> 
							</c:when>
							<c:otherwise>
								<span style="margin-right:601px;"></span>
							</c:otherwise>
						</c:choose>
						<input type="button" value="修改" style="border:0px" id="updateTheCreditcard${status.count}" > 
						<input type="button" value="刪除" style="border:0px" id="deleteTheCreditcard${status.count}"> 
<!-- ======================================================================================================================================= -->											
					<script type="text/javascript">
<!-- ======================================= 修改信用卡資料 ================================================================================================ -->					
					$("#updateTheCreditcard${status.count}").click(function() {
						var ccId = $("#theCCID${status.count}").val();
						Swal.fire({
				            title: "確定要修改信用卡資料嗎？",
				            showCancelButton: true
				        }).then(function(result) {
				           if (result.value) {
				        	   location.href="<c:url value='/Member/creditcard/Update?id=" + ccId + "'/>";
				           }
				           else {    
				           }
				        });
					})
<!-- ======================================= 刪除信用卡資料 ================================================================================================ -->										
	 					$("#deleteTheCreditcard${status.count}").click(function() {
	 						var ccId = $("#theCCID${status.count}").val();
		 			 			Swal.fire({
		 		 	            title: "確定要刪除信用卡資料嗎？",
		 		 	            showCancelButton: true
		 		 	        }).then(function(result) {
		 		 	           if (result.value) {
		 		 	        	   location.href="<c:url value='/Member/creditcard/Delete?id=" + ccId + "'/>";
		 		 	           }
		 		 	           else {    
		 		 	           }
		 		 	        });
	 					}) 
					</script> 
<!-- ======================================================================================================================================= -->							
					</div>
					<div class="form-table">
						<div class="form-item fih">
							<label class="form-label">信用卡卡號</label>
							<div class="form-controler">
								<input type="text" class="input-holder" 
									value="${creditcard.creditCardNumber}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">到期日</label>
							<div class="form-controler">
								<input type="text" class="input-holder" 
									value="${creditcard.expiryDate}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">審核碼</label>
							<div class="form-controler">
								<input type="text" class="input-holder" 
									value="${creditcard.reviewCode}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">持卡者</label>
							<div class="form-controler">
								<input type="text" class="input-holder"  
									value="${creditcard.cardholder}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">帳單地址</label>
							<div class="form-controler">
								<input type="text" class="input-holder"  
									value="${creditcard.billingAddress}" readonly/>	
							</div>
						</div>
						<hr>
						<div class="form-item fih">
							<label class="form-label">郵遞區號</label>
							<div class="form-controler">
								<input type="text" class="input-holder"  
									value="${creditcard.postalCode}" readonly/>	
							</div>
						</div>

					</div>
				</c:forEach>
				</div><!-- divcreditcard -->
				
				<div class="fih"></div>
			</div><!--main -->
		</div>
	</form:form>
	
	<script >
//========================================= 修改會員資料 ====================================================
	$("#updateTheMember").click(function() {
		Swal.fire({
            title: "確定要修改會員資料嗎？",
            showCancelButton: true
        }).then(function(result) {
           if (result.value) {
        	   location.href="<c:url value='/Member/personal/Update'/>";
           }
           else {    
           }
        });
	})

//========================================= 刪除會員資料 ====================================================
	$("#deleteTheMember").click(function() {
		Swal.fire({
            title: "提醒您，刪除會員資料會刪除此會員的所有相關資料<br>確定要刪除會員資料嗎？",
            showCancelButton: true
        }).then(function(result) {
           if (result.value) {
        	   location.href="<c:url value='/Member/personal/Delete'/>";
           }
           else {    
           }
        });
	})
	

//========================================= 新增寵物資料 ====================================================
// 	/insertPersonalPet
	$("#newThePet").click(function(){
		Swal.fire({
            title: "想要新增寵物資訊嗎？",
            showCancelButton: true
        }).then(function(result) {
           if (result.value) {
        	   location.href="<c:url value='/insertPersonalPet'/>";
           }
           else {    
           }
        });
	})
//========================================= 新增信用卡資料 ====================================================
	$("#newTheCCID").click(function(){
		Swal.fire({
            title: "想要新增信用卡資訊嗎？",
            showCancelButton: true
        }).then(function(result) {
           if (result.value) {
        	   location.href="<c:url value='/insertPersonalCreditCard'/>";
           }
           else {    
           }
        });
	})
//=============================================================================================
	if($("#hidpl").val() == '1'){
		$("#petligation").val("有");
	}else if($("#hidpl").val() == '0'){
		$("#petligation").val("無");
	}
	
	if(${thePage=='Member'}){
		$("#clickpersonal").css("color", "#8D5433");
		$("#clickpet").css("color", "black");
		$("#clickcreditcard").css("color", "black");
		$("#clickshop").css("color", "black");
		$("#angle1").show();
		$("#angle2").hide();
		$("#angle3").hide();
		$("#angle4").hide();
		$("#divpersonal").show();
		$("#divpet").hide();
		$("#divcreditcard").hide();
		$("#divshop").hide();		
	}else if(${thePage=='Pet'}){
		$("#clickpersonal").css("color", "black");
		$("#clickpet").css("color", "#8D5433");
		$("#clickcreditcard").css("color", "black");
		$("#clickshop").css("color", "black");
		$("#angle1").hide();
		$("#angle2").show();
		$("#angle3").hide();
		$("#angle4").hide();
		$("#divpersonal").hide();
		$("#divpet").show();
		$("#divcreditcard").hide();
		$("#divshop").hide();
	}else if(${thePage=='CreditCard'}){
		$("#clickpersonal").css("color", "black");
		$("#clickpet").css("color", "black");
		$("#clickcreditcard").css("color", "#8D5433");
		$("#clickshop").css("color", "black");
		$("#angle1").hide();
		$("#angle2").hide();
		$("#angle3").show();
		$("#angle4").hide();
		$("#divpersonal").hide();
		$("#divpet").hide();
		$("#divcreditcard").show();
		$("#divshop").hide();
	}

	$("#clickpersonal").click(function() {
		$("#clickpersonal").css("color", "#8D5433");
		$("#clickpet").css("color", "black");
		$("#clickcreditcard").css("color", "black");
		$("#clickshop").css("color", "black");
		$("#angle1").show();
		$("#angle2").hide();
		$("#angle3").hide();
		$("#angle4").hide();
		$("#divpersonal").show();
		$("#divpet").hide();
		$("#divcreditcard").hide();
		$("#divshop").hide();
	});
	<%-- https://blog.darkthread.net/blog/sweetalert2/ --%>
	$("#clickpet").click(function() {
		if(${fn:length(pets) }  == 0){
			Swal.fire({
	            title: "您目前沒有寵物資訊<br>請問要新增嗎？",
	            showCancelButton: true
	        }).then(function(result) {
	           if (result.value) {
	        	   location.href="<c:url value='/insertPersonalPet'/>";
	           }
	           else {
	               Swal.fire("期待您新增您的寵物！！");
	           }
	        });
			}else{
				$("#clickpersonal").css("color", "black");
				$("#clickpet").css("color", "#8D5433");
				$("#clickcreditcard").css("color", "black");
				$("#clickshop").css("color", "black");
				$("#angle1").hide();
				$("#angle2").show();
				$("#angle3").hide();
				$("#angle4").hide();
				$("#divpersonal").hide();
				$("#divpet").show();
				$("#divcreditcard").hide();
				$("#divshop").hide();
			}	
	});

	$("#clickcreditcard").click(function() {
		if(${fn:length(creditCards) }  == 0){
			 Swal.fire({
	              title: "您目前沒有信用卡資訊<br>請問要新增嗎？",
	              showCancelButton: true
	          }).then(function(result) {
	             if (result.value) {
	            	 location.href="<c:url value='/insertPersonalCreditCard'/>"; 
	             }
	             else {
	                 Swal.fire("提醒您，本網站部分服務需要信用卡資訊。");
	             }
	          });
		}else{
			$("#clickpersonal").css("color", "black");
			$("#clickpet").css("color", "black");
			$("#clickcreditcard").css("color", "#8D5433");
			$("#clickshop").css("color", "black");
			$("#angle1").hide();
			$("#angle2").hide();
			$("#angle3").show();
			$("#angle4").hide();
			$("#divpersonal").hide();
			$("#divpet").hide();
			$("#divcreditcard").show();
			$("#divshop").hide();
		}
	});
	

	$("#clickshop").click(function() {
        Swal.fire({
            title: "想要註冊店家嗎？",
            showCancelButton: true
        }).then(function(result) {
           if (result.value) {
          	 location.href="<c:url value='/insertPersonalShop'/>";
           }
           else {
              
           }
        });
	});
	

	</script>
</body>
</html>