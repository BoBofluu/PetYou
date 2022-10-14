<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/moreFunction.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/searchOneContact.css'/>">
</head>
<body>
<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a class="functionName" href="<c:url value='/searchAllReservation' />"><img
			src="<c:url value='/image/reservation/預約查詢(咖啡色字體).png' />"></a> 
		<a class="functionName" href="<c:url value='/allNotification' />"><img
			src="<c:url value='/image/manageHompage/通知中心(咖啡色字體).png' />"></a>
<!-- 		<a href="#">Clients</a>  -->
<!-- 		<a href="#">Contact</a> -->
	</div>
	<span class="moreFunction" onclick="openNav()"><img alt=""
		src="<c:url value='/image/reservation/更多功能(咖啡色字體).png' />"></span>

	<form id="myForm">
	<div id="main">
		<span class="contact-title">請留言，管理員會盡快回復!</span>
		<span class="shopId-span">店家ID:</span>
		
		<input id="shopId" readonly type="text" class="contactShop" value="${rcb.contactShop}"/>
		<br>
		<div class="contact-subtitle" >主旨：</div>
		
		<input id="contextTitle" class="contextTitle" type="text" value="${rcb.contextTitle}" />
		<div class="contact-subtitle" >內容：</div>
		
		<textarea id="context" class="context" rows="8" cols="85" >${rcb.context}</textarea>
		<button id="btn-delete" type="button" class="btn btn-secondary">刪除</button>
		<button id="btn-update" type="button" class="btn btn-secondary">修改</button>
	</div>
	</form>

	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
	}

	/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
	}
	
		$("#btn-update").click(function(e){
			swal.fire({
				title : '修改成功',
				icon : 'success',
			}).then(function(){
				var shopId = $("#shopId").val();
				var contextTitle = $("#contextTitle").val();
				var context = $("#context").val();
				var info = {};
				info.contactID = ${contactId};
				info.contactShop = shopId;
				info.contextTitle = contextTitle;
				info.context = context;
				$.ajax({
					 type: "post",
			         url: "<c:url value='/updateOneContact_Ajax'/>",
			         data: info, //將params轉成JSON格式
			         dataType: "json",
			         success: function(data) {
			             window.location.href="<c:url value='/allNotification' />";
			            }
				})
			})
			
		})
		
		
	$("#btn-delete").click(function(){
		swal.fire({
			title : '確定要刪除嗎?',
			text : '刪除後無法回復，請確認後再刪除',
			type : 'warning',
			showCancelButton : true,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
			confirmButtonText : '刪除留言',
		}).then((result) => {
			if (result.isConfirmed){
			swal.fire({title:'已成功刪除', icon:'success',allowOutsideClick: false} ).then(function(){
				window.location.href="<c:url value='/deleteOneContact/" + ${contactId} + "' />";
			});
			}
		})
	})

</script>
</body>
</html>