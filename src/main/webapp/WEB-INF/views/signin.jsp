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

.easteregg {
  height: 190px;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #E96681;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 8px;
  margin-top: 305px;
}

.easteregg div {
  padding: 8px 8px 8px 9px;
  text-decoration: none;
  font-size: 25px;
  color: #f1f1f1;
  display: block;
  transition: 0.3s;
  cursor:pointer;
}

.easteregg div div:hover {
	background: #f5BAC6;
	color: #8D5433;
	border-radius: 5px;
}


</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<jsp:include page="petHomepage.jsp"></jsp:include>
	<form:form method="post">
	<div id="myEasterEgg" class="easteregg" style="width: 0px;">
		<div style="width:155px">
		  	<div id="Admin">管理員</div>
		  	<div id="zerozakiark">艾德</div>
		  	<div id="johnson">禰豆子</div>
		</div>
	</div>
	
		<div class="form_group">
			<div class="inside_group">
				<h1 style="text-align:center;color:black;margin-left:67px">會員登入<span style="cursor:pointer;opacity:0;" onclick="openEasterEgg()" class="fa fa-address-book-o" aria-hidden="true"></span></h1>
				<div style="max-width:350px;margin:auto">  
					<div class="input-icons"> 
						<i class="fa fa-user icon"></i> 
						<input class="input-field" type="text" placeholder="請輸入帳號" name="account" id="account" autocomplete="off"> 
					</div> 	
   			
					<div class="input-icons"> 
						<i class="fa fa-lock icon" aria-hidden="true"></i>
						<input class="input-field" type="password" id="password" name="password" placeholder="請輸入密碼" autocomplete="off">
						<span id="check" class="fa fa-eye-slash" aria-hidden="true" style="color:black;width:25px;"></span>
						<a href="<c:url value='/forgetAccount'/>" style="text-decoration:none;margin-left:143px;">忘記帳號</a>
						<a href="<c:url value='/forgetPassword'/>" style="text-decoration:none;margin-left:8px;">忘記密碼</a>
					</div>
					<h4 style="border:1px solid gray ;height:45px;color:red;">
						<span>公用電腦請記得登出，或開啟無痕模式</span>
					</h4>
					<div style="width:310px;display:flex;margin:5px auto; ">
						<input type="submit" value="登入" style="border-radius:5px;width:200px;margin-right:10px;" onclick="return check_element()">
						<input type="button" value="取消" style="border-radius:5px;width:100px;" id="cancel" >
					</div>
					<div style="width:280px;margin:3px auto; ">
						還不是會員嗎？<a href="<c:url value='/register/Member'/>" style="text-decoration:none;">立刻註冊新帳號</a>
					</div>
				</div>			
			</div><!-- introduction -->	
				<img alt="dog" src="${pageContext.request.contextPath}/images/1601821576585.jpg" style="margin-top: -40px;">	
		</div>
	</form:form>	
<!-- ============================================================================================================================== -->		
	<script type="text/javascript">
<!-- ============================================================================================================================== -->			
	 $("#Admin").click(function(){
		 $("#account").val("Admin");
		 $("#password").val("tj/3su3");
	 })
	 
	 $("#zerozakiark").click(function(){
		 $("#account").val("zerozakiark");
		 $("#password").val("FirenzeK");
	 })
	
	 $("#johnson").click(function(){
		 $("#account").val("Johnson");
		 $("#password").val("Olive");
	 })
	  

	var myEasterEgg = true;
	function openEasterEgg() {
		if(myEasterEgg){
			document.getElementById("myEasterEgg").style.width = "155px";
			myEasterEgg = false;
		}else{
			document.getElementById("myEasterEgg").style.width = "0px";
			myEasterEgg = true;
		}
	}	 
	 
<!-- ============================================================================================================================== -->		
	$("#cancel").click(function(){
		location.href = "<c:url value='/'/>";
	})
<!-- ============================================================================================================================== -->		
	var lock = true;
	$("#check").click(function(){
		if(lock){
			$("#check").removeClass("fa-eye-slash").addClass("fa-eye")
			$("#password").attr("type","text");
			lock = false;
		}else{
			$("#check").removeClass("fa-eye").addClass("fa-eye-slash")
			$("#password").attr("type","password");
			lock = true;
		}
	})
<!-- ============================================================================================================================== -->		
	if(${status == '黑名單'}){
		 Swal.fire(
	       "此帳號為黑名單",
	       "有任何問題請向客服申訴!",
	       "error"    
	      );	
	}else if(${status == '帳密有誤'}){
		 Swal.fire(
			 "請再次檢查自己的帳號密碼",
			 "",
			 "error"    
		);	
	}
<!-- ============================================================================================================================== -->	
	function check_element(){
		if(($("#account").val() == "") || ($("#password").val() == "")){
			Swal.fire(
			    	"請輸入帳號密碼", //標題 
			    	"", 
			        "warning" 
			    );
			return false;
		}
	}
	
	</script>
</body>
</html>