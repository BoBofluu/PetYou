<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* .outter{ */
/* 	width:1300px; */
/* 	display:flex; */
/* 	margin:50px auto; */

/* } */
/* .rating-boxin { */
/* 	width: 600px; */
/* 	text-align: center; */
/* 	border: 2px solid #e96681; */
/* 	border-radius: 15px; */
/* 	margin:110px auto; */
/* 	height: 300px;  */
/* } */

/* .rating-boxH1 { */
/* 	margin: 20px; */
/* 	width: 180px; */
/* } */

/* .buttom { */
/* 	background-color: #e96681; */
/* 	border-radius: 15px; */
/* 	width: 75%; */
/* 	margin: 15px auto; */
/* 	height: 150px; */
	
/* } */
/* .input { */
	
/* 	text-align:center; */
/* 	border-radius: 5px; */
	
/* 	outline: 0; */
	<%--將輸入框點選的時候出現的邊框去掉 --%> 
/* } */

/* label { */
/* 	margin: 25px auto; */
/* 	color: #EBD4C7; */
	
/* } */
</style> 

</head>
<body>
<%-- 	<jsp:include page="petHomepage.jsp"></jsp:include> --%>
	
<!-- 	<div id="outter"> -->

<!-- 		<fieldset class="rating-boxin"> -->
<!-- 			<legend class="rating-boxH1"> 登入系統 </legend> -->
<%-- 			<form:form method="post"> --%>
<!-- 				<div id="button1" class="buttom" > -->
<!-- 				<div style="float:left;margin-left:50px;"> -->
<!-- 					<label> 輸入帳號: </label>  -->
<!-- 					<input type="text" name="account" id="account" -->
<!-- 						required="required" class="input"> <br>  -->
				
<!-- 					<label> 輸入密碼: </label>  -->
<!-- 					<input type="password" name="password" required="required" class="input"   id="password"> -->
<!-- 				</div> -->
<!-- 				<div style="width:25px;height:25px;float:right;margin-right:50px;margin-top:90px;">	 -->
<!-- 					<span id="check" class="fa fa-eye" aria-hidden="true"></span> -->
<!-- 				</div>	 -->
<!-- 					<script> -->
<!-- // 					var lock = true; -->
<!-- // 					$("#check").click(function(){ -->
<!-- // 						if(lock){ -->
<!-- // 							$("#check").removeClass("fa-eye").addClass("fa-eye-slash") -->
<!-- // 							$("#password").attr("type","text"); -->
<!-- // 							lock = false; -->
<!-- // 						}else{ -->
<!-- // 							$("#check").removeClass("fa-eye-slash").addClass("fa-eye") -->
<!-- // 							$("#password").attr("type","password"); -->
<!-- // 							lock = true; -->
<!-- // 						} -->
<!-- // 					}) -->
					
					
<!-- 					</script> -->
<!-- 				</div> -->
<!-- 				<input type="button" value="送出" id="gogogo"> -->
<%-- 			</form:form> --%>
<!-- 		</fieldset> -->
<!-- 	</div> -->
	<script>
	
// 		document.getElementById("gogogo").onclick = function() {
// 			var account = document.getElementById('account').value;
// 			var password = document.getElementById('password').value;
// 			console.log(account);
// 			console.log(password);
			
// 			var xhr = new XMLHttpRequest();
// 			xhr.open("POST", "<c:url value='/CheckMemberInside' />", true);
// 			xhr.setRequestHeader("Content-Type",
// 					"application/x-www-form-urlencoded");
// 			xhr.send("account=" + account + "&password=" +password);
// 			xhr.onreadystatechange = function() {
// 				// 伺服器請求完成
// 				if (xhr.readyState == 4 && xhr.status == 200) {
// 					var result = JSON.parse(xhr.responseText);
// 					if (result.login == "true") {
// 						location.href = document.referrer;
// 					} else {
					
// 					}
// 				}
// 			}
// 		}
</script>
</body>
</html>