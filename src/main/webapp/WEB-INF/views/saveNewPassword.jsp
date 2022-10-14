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
	background-color:#a193f2
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
				<h1 style="text-align:center;color:black">設定新密碼</h1>
				<div style="max-width:350px;margin:auto">  
					<div class="input-icons"> 
						<i class="fa fa-user icon"></i> 
						<input class="input-field" type="text"  id="account" readonly value="${account}" style="border:0px;"> 
					</div> 
					
					<div class="input-icons"> 
						<i class="fa fa-lock icon" aria-hidden="true"></i>
						<input class="input-field" type="password" placeholder="請輸入密碼" id="firstPassword"> 
					</div> 
								
					<div class="input-icons"> 
						<i class="fa fa-lock icon" aria-hidden="true"></i>
						<input class="input-field" type="password" id="secondPassword" name="password" placeholder="再次輸入密碼">
						<span id="check" class="fa fa-eye" aria-hidden="true" style="color:black;width:25px;"></span>
					</div>

					<div >
						<input type="submit" value="確認送出"  onclick="return check_element()" class="getMail">
					</div>

				</div>			
			</div><!-- introduction -->	
				<img alt="dog" src="${pageContext.request.contextPath}/images/1601821576585.jpg" style="margin-top: -40px;">	
		</div>
	</form:form>	
<!-- ============================================================================================================================== -->		
	<script type="text/javascript">
<!-- ============================================================================================================================== -->		
// 	$("#cancel").click(function(){
// 		location.href = "<c:url value='/'/>";
// 	})
<!-- ============================================================================================================================== -->		
	var lock = true;
	$("#check").click(function(){
		if(lock){
			$("#check").removeClass("fa-eye").addClass("fa-eye-slash")
			$("#firstPassword").attr("type","text");
			$("#secondPassword").attr("type","text");
			lock = false;
		}else{
			$("#check").removeClass("fa-eye-slash").addClass("fa-eye")
			$("#firstPassword").attr("type","password");
			$("#secondPassword").attr("type","password");
			lock = true;
		}
	})
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
	function check_element(){
		if(($("#firstPassword").val() == "") || ($("#secondPassword").val() == "")){
			Swal.fire(
			    	"請輸入密碼", //標題 
			    	"", 
			        "warning" 
			    );
			return false;
		}
		if( $("#firstPassword").val() != $("#secondPassword").val() ){
			Swal.fire(
			    	"密碼前後不一致", //標題 
			    	"", 
			        "warning" 
			    );
			return false;
		}else{
			var account = $("#account").val();
			var password = $("#secondPassword").val();
			
			$.ajax({ 
				url:"<c:url value='/resetPasswordTOSQL' />", 
				type:'post', 
				data: { "account" : account , "password" : password },
				error:function(){ 
					Swal.fire(
					    "更改失敗", //標題 
					    "請聯繫管理員", 
					    "warning" 
					 );
				}, 
				success:function(data){ 
					if(data["狀態"] == "更改成功"){
						Swal.fire(
							"更改成功", //標題 
							"", 
							"success" 
						);
						return true;
					}else{
						Swal.fire(
							"更改失敗", //標題 
							"請聯繫管理員", 
							"warning" 
							);
						return false;
					}
				}
			});
		}
		
	}
	
	</script>
</body>
</html>