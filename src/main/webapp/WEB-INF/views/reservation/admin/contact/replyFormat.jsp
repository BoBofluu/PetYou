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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/replyFormat.css'/>">
</head>
<body>
<jsp:include page="/WEB-INF/views/reservation/admin/functionNav.jsp"></jsp:include>

<div class="main-container">
	<div id="main">
		<span class="contact-title">留言內容</span><br>
		<span class="shopId">店家ID</span>
		<input readonly style="border: 1px solid brown;background-color: #ffffff94;border-radius: 10px;width: 40px;text-align: center;" type="text" value="${rcb.contactShop}"/>
		<span style="margin-left: 20px;">名稱</span>
		<input readonly style="border: 1px solid brown;background-color: #ffffff94;border-radius: 10px;text-align: center;" type="text" value="${shop.shopName }" />
		<br>
		<div class="contact-subtitle" >主旨：</div>
		<input readonly type="text" class="context-title" value="${rcb.contextTitle}" />
		<div class="contact-subtitle" >內容：</div>
		<textarea readonly class="context" rows="6" cols="85" >${rcb.context}</textarea>
	</div>
	<form:form id="myForm" method="POST" modelAttribute="rcfb">
	<div id="reply-main">
		<span class="contact-title">回覆內容</span>
		<span style="margin-left:360px;">編號</span>
		<input style="width:50px;border: 1px solid brown;background-color: #ffffff94;border-radius: 10px;text-align: center;"  readonly="true" path="rescontact" type="text" value="${rcb.contactID}" />
		<br>
		<div class="reply-contact-subtitle" >主旨：</div>
			
		<input readonly type="text" class="context-title" value="${rcb.contextTitle}"/>
		<div class="reply-contact-subtitle" >內容：</div>
		
		<form:textarea path="feedbackContext" id="context" class="context reply-context" rows="8" cols="85"></form:textarea>
		<button id="btn-noItems" type="button" class="btn btn-secondary">未填寫商品</button>
		<button id="btn-handled" type="button" class="btn btn-secondary">已著手處理</button>
		<button id="btn-handled-member" type="button" class="btn btn-secondary">已聯絡會員</button>
		<button id="submit" type="submit" class="btn btn-outline-light btn-sm" style="float: right;margin-top: 5px;">回覆</button>
	</div>
	</form:form>
</div>
<script>
$("#btn-noItems").click(function(){
	$("#context").attr("style", "background:#fff;").val(" 未填寫需寄送商品，請重新提出留言，謝謝。");
})
$("#btn-handled").click(function(){
	$("#context").attr("style", "background:#fff;").val(" 已安排出貨單，將盡快送達，再請協助收貨，謝謝");
})
$("#btn-handled-member").click(function(){
	$("#context").attr("style", "background:#fff;").val(" 已聯絡會員，因個人因素未準時前往。\n若此會員再有預約未到紀錄將黑名單處理。\n造成店家困擾，深感歉意。");
})

</script>
</body>
</html>