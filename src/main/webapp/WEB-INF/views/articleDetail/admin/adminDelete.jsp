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
	<jsp:include
		page="/WEB-INF/views/articleDetail/admin/adminHomepage.jsp"></jsp:include>
	<div class="controldiv">
		<table class="outtable">
			<tr class="navtable">
				<td class="nav-table-id">文章ID</td>
				<td class="nav-table-id">樓層</td>
				<td class="nav-table-report">舉報原因</td>
				<td class="navtableTime">舉報回應</td>
				<td class="navtableView">舉報者</td>
			</tr>
		</table>
		<table class="outtable">
			<c:forEach var="aab" items="${articleAdminBean}" varStatus="status">
				<tr class="outdiv">
					<td class="articleBoard">${aab.articleBean.articleId}</td>
					<td class="articleBoard">${aab.articleFloor}</td>
					<fmt:formatNumber type="number" 
					value="${(aab.articleFloor/ 7)+((aab.articleFloor/ 7)%1 == 0 ? 0 : 0.5)}"
						maxFractionDigits="0" var="page" />
					<td class="articleTitle"><a class="aTitle"
						href="<spring:url value='/view?id=${aab.articleBean.articleId}&page=${page}&floor=${aab.articleFloor}'/>">
							${aab.whyReport}</a></td>
					<td class="articleView"><span class="memberID">${aab.member.memberID}</span></td>
					<td class="articleTime"><span style="font-size:16px;">${aab.showCreatedTime}</span></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>