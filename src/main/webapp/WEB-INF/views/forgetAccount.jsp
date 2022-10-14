<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<style>

.form_group {
	position: relative;
}
.inside_group {
/* 	margin-top: -75px; */
	position: absolute;
	left: 10%;
	top: 20%;
	color: black;
/* 	font-weight: bold; */
 	background-color: rgba(255, 255, 255, 0.8); 
/* 	background-color: white; */
	opacity: 0.8;
	border-radius: 30px;
	padding: 20px;
	width: 35%;
	height:410px;
}

.img{
	width:100px;
}

.input-icons i { 
    position: absolute; 
} 
          
.input-icons { 
    width: 100%; 
    margin-bottom: 10px; 
} 
          
.icon { 
    padding: 10px; 
    min-width: 40px; 
    margin-top:15px;
} 
          
.input-field { 
	margin-top:10px;
    width: 100%; 
    padding: 10px; 
    text-align: center; 
    text-align:center;
	border-radius: 5px;
	outline: 0;
	back-color:white;
    
} 
.getMail{
	border-radius: 5px;
	width: 100%;  
	margin: 7px auto;
	margin-bottom: 14px;
	border: 0px;
	height:45px;
/* 	background-color:#a193f2; */
	background-color:gray;
	outline:0;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<jsp:include page="petHomepage.jsp"></jsp:include>
	<form:form method="post">
		<div class="form_group">
			<div class="inside_group">
				<h1 style="text-align:center;color:black" id="onepunch">忘記帳號</h1>
				
				<div style="width:396px;margin:2px auto;">
					<span >您的帳號將以信件寄至您認證的e-mail信箱。</span>
				</div>
				<div style="max-width:350px;margin:auto">  
					<div class="input-icons"> 
						<i class="fa fa-envelope icon" aria-hidden="true"></i>
						<input class="input-field" type="email" id="email" name="email" placeholder="請輸入信箱">
					</div>
					<div >
						<input type="submit" value="取得信件"  onclick="return check_element()" class="getMail">

					</div>

					<div style="border:1px solid gray ;height:89px;color:red;width: 100%;text-align: text-align:left;padding-left: 5px;">
						<span>※ 注意：<br>
								請輸入您帳號的信箱，否則無法收到信件。若仍收不到信件，請與<a href="<c:url value='/TalkToService'/>">客服</a>聯繫。</span><br>
						
					</div>
					

				</div>			
			</div><!-- introduction -->	
				<img alt="dog" src="${pageContext.request.contextPath}/images/1601821576585.jpg" style="margin-top: -40px;">	
		</div>
	</form:form>	
<!-- ============================================================================================================================== -->		
	<script type="text/javascript">
<!-- ============================================================================================================================== -->		
$("#onepunch").click(function(){
	$("#email").val("petyoueeit119@gmail.com");
	$('.getMail').removeAttr('disabled');
	$('.getMail').css("background-color", "#a193f2");
})

// 	var lock = true;
// 	$("#check").click(function(){
// 		if(lock){
// 			$("#check").removeClass("fa-eye").addClass("fa-eye-slash")
// 			$("#password").attr("type","text");
// 			lock = false;
// 		}else{
// 			$("#check").removeClass("fa-eye-slash").addClass("fa-eye")
// 			$("#password").attr("type","password");
// 			lock = true;
// 		}
// 	})
<!-- ============================================================================================================================== -->		
// 	if(${status == '黑名單'}){
// 		 Swal.fire(
// 	       "此帳號為黑名單",
// 	       "有任何問題請向客服申訴!",
// 	       "error"    
// 	      );	
// 	}else if(${status == '帳密有誤'}){
// 		 Swal.fire(
// 			 "請再次檢查自己的帳號密碼",
// 			 "",
// 			 "error"    
// 		);	
// 	}
<!-- ============================================================================================================================== -->	
	var checkEmail = true;
	var checkAccount = true;
	$('.getMail').attr('disabled', 'disabled');
	$("#email").blur(function(){
		var emailValue = document.getElementById("email").value;
		emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
		if (emailValue.search(emailRule) != -1){
			checkEmail = true;
		}else{
			checkEmail = false
		}
		
		if(emailValue.length == 0){
			checkEmail = false;
		}else{
			checkEmail = true;
		}
		access();
	})
	
	function access(){
		if(checkEmail ){
			$('.getMail').removeAttr('disabled');
			$('.getMail').css("background-color", "#a193f2");
		}else{
			$('.getMail').attr('disabled', 'disabled');
			$('.getMail').css("background-color", "gray");
		}
	}

	function check_element(){
		var emailValue = document.getElementById("email").value;
		emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
		if (emailValue.search(emailRule) != -1){
		}else{
			Swal.fire(
			    	"信箱不符合格式", //標題 
			    	"", 
			        "warning" 
			    );
			return false;
		}		

		if(($("#email").val() == "")){
			Swal.fire(
			    	"請輸入信箱", //標題 
			    	"", 
			        "warning" 
			    );
			return false;
		}else{
			Swal.fire(
			    	"信件將在信箱核對正確後寄送給您", //標題 
			    	"若24小時之後仍未收到信件，請確認您輸入的信箱是否正確。", 
			        "success" 
			);
			
			
			return true;
		}
	}
	</script>
</body>
</html>