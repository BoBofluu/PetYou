<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link type="text/css"
	href="<spring:url value='/css/adminArticleDelete.css'/>"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>

	<div class="controldiv">
		<table class="outtable">
			<tr class="navtable-notify">
				<td class="nav-table-report">新通知</td>
				<td class="navtableTime">回覆時間</td>
				<td class="navtableView">會員</td>
			</tr>
		</table>
		<table class="outtable">
			<c:forEach var="pb" items="${palindromeBean}" varStatus="status">
				<tr class="outdiv">
					<fmt:formatNumber type="number"
						value="${(pb.articleFloor/ 7)+((pb.articleFloor/ 7)%1 == 0 ? 0 : 0.5)}" maxFractionDigits="0"
						var="page" />
					<td class="articleTitle"><a class="aTitle"
						href="<spring:url value='/view?id=${pb.palindromeId.articleId}&page=${page}&floor=${pb.articleFloor}'/>">
							在<span style="color:#51A1B4;">${pb.palindromeId.articleTitle}</span>中有了新的回應！</a>
							</td>
					<td class="articleView"><span class="memberID">${pb.memberName}</span></td>
					<td class="articleTime"><span style="font-size: 16px;">${pb.showNotifyTime}</span></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>