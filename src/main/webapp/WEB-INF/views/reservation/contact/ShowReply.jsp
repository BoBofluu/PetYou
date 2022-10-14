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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/moreFunction.css'/>">

<script>
/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>

	<div id="mySidenav" class="sidenav">
  		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 		<a class="functionName" href="<c:url value='/searchAllReservation' />"><img
			src="<c:url value='/image/reservation/預約查詢(咖啡色字體).png' />"></a> 
		<a class="functionName" href="<c:url value='/allNotification' />"><img
			src="<c:url value='/image/manageHompage/通知中心(咖啡色字體).png' />"></a>
<!--   		<a href="#">Clients</a> -->
<!--   		<a href="#">Contact</a> -->
	</div>
<!-- Use any element to open the sidenav -->
<span class="moreFunction"  onclick="openNav()"><img  alt="" src="<c:url value='/image/reservation/更多功能(咖啡色字體).png' />"></span>


<div class="main-container">
<div class="returnDiv">
		<!-- javascript:self.location=document.referrer; 返回上一頁，並重新整理 -->
			<a href="javascript:self.location=document.referrer;"><img
				src="<c:url value='/image/searchForReservation/返回(咖啡色字體).png' />" /></a>
		</div>
	<div id="main" style="padding:10px">
		<span class="contact-title">留言內容</span><br>
		<span class="shopId">店家ID</span>
		<input readonly style="border: 1px solid brown;background-color: #ffffff94;border-radius: 10px;width: 40px;text-align: center;" type="text" value="${rcb.contactShop}"/>
		<span style="margin-left: 20px;">名稱</span>
		<input readonly style="border: 1px solid brown;background-color: #ffffff94;border-radius: 10px;text-align: center;" type="text" value="${shop.shopName }" />
		<br>
		<div class="contact-subtitle" >主旨：</div>
		<input readonly type="text" class="context-title" value="${rcb.contextTitle}" />
		<div class="contact-subtitle" >內容：</div>
		<textarea readonly id="context" class="context" rows="6" cols="85" >${rcb.context}</textarea>
	</div>
	
	<c:forEach items="${feedback}" var="feedback" varStatus="sta"> 
	<div id="reply-main">
		<span class="contact-title">管理員回覆內容</span>
		<span class="contact-title" style="font-size: 17px;">回覆時間: ${time[sta.index]}</span>
		<br>
		<div class="reply-contact-subtitle" >主旨：</div>
			
		<input readonly type="text" class="context-title" value="${rcb.contextTitle}"/>
		<div class="reply-contact-subtitle" >內容：</div>
		<textarea readonly id="context" class="context" rows="8" cols="85">${feedback}</textarea>
		</div>
	</c:forEach>
</div>
</body>
</html>