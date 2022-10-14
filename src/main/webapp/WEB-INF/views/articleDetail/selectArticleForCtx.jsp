<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link type="text/css"
	href="<spring:url value='/css/selectArticle.css'/>" rel="stylesheet">
<script type="text/javascript"
	src="<spring:url value='/js/selectArticle.js'/>"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	<article style="position: relative;">
		<div id="searchDiv">
			<input type="text" id="searchInput" onkeyup="searchFunction()"
				onfocus="searchfocus()" onblur="searchblur()" placeholder="找文章..."
				autocomplete="off">
			<ul id="searchul">
				<c:forEach var="hot" items="${hotList}" varStatus="status">
					<li><a href="<spring:url value='/view?id=${hot.articleId}&page=1'/>">${hot.articleTitle}</a></li>
				</c:forEach>
			</ul>
			<i class="fa fa-search searchBigBig"
				aria-hidden="true" style="font-size: 30px;"></i>
		</div>
		<select id="selectBoard">
			<option value="title" label="找標題" />
			<option value="author" label="找作者" />
			<option value="ctx" label="找內文" />
		</select> <a href="#" class="subnavdiv"> <span class="subnav"><img
				src="<spring:url value='/images/article/totop.png'/>" style="width: 85px;"></span>
		</a> <a href="<spring:url value='/createArticle'/>" class="subnavdiv"
			style="position: absolute; margin-top: -2%;"> <span
			class="subnav"> <img
				src="<spring:url value='/images/article/Insert.png'/>" style="width: 85px;">
		</span>
		</a>
		<div class="smallgamediv">
			<div class="game-one-div">
				<a href="<spring:url value='/openMouth'/>"><img
					src="<spring:url value='/images/article/openMouth.png'/>"></a>
			</div>
			<div class="game-two-div">
				<a href="<spring:url value='/windowShop'/>"><img
					src="<spring:url value='/images/article/windowShop.png'/>"></a>
			</div>
		</div>
		<div class="controldiv">
			<table class="outtable">
				<tr class="navtable">
					<td class="navtableTime">發文日期</td>
					<td class="navtableView">作者</td>
				</tr>
			</table>
			<form action="${path}/selectOneArticle" method="get">
				<table class="outtable">
					<c:forEach var="i" items="${pb}" varStatus="status">
						<tr class="outdiv">
							<td class="articleBoard">${i.palindromeId.articleBoard}</td>
							<td class="articleTitle"><a class="aTitle"
								href="<spring:url value='/view?id=${i.palindromeId.articleId}&page=1'/>">
									<img class="firstImg" src="${showList[status.index]}"> 
									<span class="titlehidden">
									【${i.palindromeId.articleTag}】${i.palindromeId.articleTitle}
									</span>
									<c:choose>
										<c:when test="${i.palindromeContext.indexOf(\"img\") < 100}">
											<c:choose>
												<c:when test="${i.palindromeContext.indexOf(\"img\") == -1}">
													<span class="ctxhidden">${i.palindromeContext}</span>
												</c:when>
												<c:otherwise>
													<span class="ctxhidden"></span>
												</c:otherwise>
											</c:choose>
										</c:when>
									</c:choose>
							</a></td>
							<td class="articleView"><span class="memberID">${i.memberName}</span></td>
							<td class="articleTime"><span>${i.showCreatedTime}</span></td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<div class="pagination">
				<c:if test="${param.page-2 > 1}">
					<a style="position: absolute;"
						href="<spring:url value='/memberSelect?select=${param.select}&btn=${param.btn}&page=1'/>">1</a>
				</c:if>
				<a id="laquo" style="margin-left: 112px;"
					href="<spring:url value='/memberSelect?select=${param.select}&btn=${param.btn}&page=${param.page-1}'/>">&laquo;</a>

			</div>
		</div>
	</article>
	<script type="text/javascript">
		function searchFunction() {
			var input, filter, ul, li, a, i, txtValue;
			input = document.getElementById("searchInput");
			filter = input.value.toUpperCase();
			ul = document.getElementById("searchul");
			li = ul.getElementsByTagName("li");
			for (i = 0; i < li.length; i++) {
				a = li[i].getElementsByTagName("a")[0];
				txtValue = a.textContent || a.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1)
					li[i].style.display = "";
				else
					li[i].style.display = "none";
			}
		}
		var a = function() {
			ul = document.getElementById("searchul");
			ul.style.display = "none";
		}()
		var isClick = false;
		$("#searchul").mouseenter(function() {
			isClick = true;
			console.log(isClick);
		})
		$("#searchul").mouseleave(function() {
			isClick = false;
			console.log(isClick);
		})
		function searchblur() {
			ul = document.getElementById("searchul");
			if (isClick)
				ul.style.display = "";
			else
				ul.style.display = "none";
		}
		function searchfocus() {
			ul = document.getElementById("searchul");
			ul.style.display = "";
		}
		$("#searchInput").keypress(function(e) {
			code = (e.keyCode ? e.keyCode : e.which);
			if (code == 13) {
				var queryString = $("#searchInput").val().trim();
				if (queryString == '') {
					alert("空");
					return;
				}
				var queryString_2 = $("#selectBoard").val();
				window.location.href = "<spring:url value='/memberSelect?select="
						+ queryString
						+ "&btn="
						+ queryString_2
						+ "&page=1'/>";
			}
		});
		var pageCount = Math.ceil(${pageCount}/7);
		var page = ${param.page};
		var select = '${param.select}';
		var btn = '${param.btn}';
		for (var i = 0; i < 5; i++) {
			var sum = (page - 2) + i;
			if (sum <= 0)
				continue;
			if (sum > pageCount)
				break;
			if (sum == page)
				$(".pagination").append("<a  href='javascript:;' class='active'>" + sum + "</a>");
			else
				$(".pagination").append("<a href=\"<spring:url value='/memberSelect?select="
						+ select + "&btn="
						+ btn + "&page="
						+ sum + "'/>\">"
						+ sum + "</a>");
		}
		$(".pagination").append("<a id='raquo' href=\"<spring:url value='/memberSelect?select="
				+ select+ "&btn="
				+ btn + "&page="
				+ (page + 1) + "'/>\">&raquo;</a>");
		if (page == 1)
			$("#laquo").attr("href", "javascript:;");
		if (page == pageCount)
			$("#raquo").attr("href", "javascript:;");
		if (page + 2 < pageCount)
			$(".pagination").append("<a style='position: absolute;right: 0;' href=\"<spring:url value='/memberSelect?select="
					+ select + "&btn="
					+ btn + "&page="
					+ pageCount + "'/>\">"
					+ pageCount + "</a>");
	</script>
</body>
</html>