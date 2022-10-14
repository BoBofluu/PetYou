<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'
	rel='stylesheet'></link>
<link type="text/css" href="<spring:url value='/css/viewArticle.css'/>"
	rel="stylesheet">
<script type="text/javascript"
	src="<spring:url value='/js/viewArticle.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style type="text/css">
@font-face {
	font-family: myFirstFont;
	src: url(< spring : url value = '/images/article/KTEGAKI.ttf'/ >);
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	<article>
		<c:forEach var="palindromeBean" items="${list}" varStatus="s">
			<c:choose>
				<c:when test="${s.index == 0}">
					<input type="text" id="input-id" hidden="true"
						value="${palindromeBean.palindromeId.articleId}">
					<input type="text"
						class="input-memberid${palindromeBean.articleFloor}" hidden="true"
						value="${palindromeBean.memberId.memberID}">
					<input type="text" id="input-userid" hidden="true"
						value="${userId}">
					<div class="member-screen">
						<img class="member-img"
							src="${palindromeBean.memberId.profilePicture}">
						<p class="member-point">
							<img src="<spring:url value='/images/article/金幣.png'/>"> <span
								class="coin-span">${palindromeBean.memberId.coin}</span>
						</p>
						<p class="member-point">
							<img src="<spring:url value='/images/article/紅利.png'/>"> <span
								class="red-span">${palindromeBean.memberId.bonus}</span>
						</p>
					</div>
					<div class="articlediv outdiv"
						id="floor${palindromeBean.articleFloor}">
						<c:if test="${palindromeBean.articleFloor == 1}">
							<legend id="legendArticle">${palindromeBean.palindromeId.articleTitle}</legend>
						</c:if>
						<div class="memberdiv">
							<a href="javascript:;" class="floor">${palindromeBean.articleFloor}樓</a>
							<a href="javascript:;" class="userName">${palindromeBean.memberName}</a>
							<a href="javascript:;" class="userID">${palindromeBean.memberId.memberID}</a>
							<span class="createDate">修改日期：${palindromeBean.showUpdatedTime}</span>
							<span class="createDate">上傳日期：${palindromeBean.showCreatedTime}</span>
						</div>
						<div class="articlediv">
							<pre class="textareaContext">${palindromeBean.palindromeContext}</pre>
						</div>
						<div class="point-div">
							<button id="bp-btn${palindromeBean.articleFloor}" class="bp">
								<i id="bp-icon${palindromeBean.articleFloor}"
									class="fa fa-thumbs-down" aria-hidden="true"></i>
							</button>
							<span id="gp-span-${palindromeBean.articleFloor}" class="gp-span">${palindromeBean.articlePointForGp}</span>
							<button id="gp-btn${palindromeBean.articleFloor}" class="gp">
								<i id="gp-icon${palindromeBean.articleFloor}"
									class="fa fa-thumbs-up" aria-hidden="true"></i>
							</button>
							<span id="bp-span-${palindromeBean.articleFloor}" class="bp-span">${palindromeBean.articlePointForBp}</span>
							<div class="dropup" style="left: 190px;">
								<button class="dropbtn">
									<i class="fa fa-ellipsis-v" aria-hidden="true"></i>
								</button>
								<c:set var="string1"
									value="內容已於${palindromeBean.showUpdatedTime}由作者刪除" />
								<c:set var="string2"
									value="內容已於${palindromeBean.showUpdatedTime}由管理員刪除" />
								<c:choose>
									<c:when test="${palindromeBean.palindromeContext == string2}">
										<div class="dropup-content">
											<a href="javascript:;">文章已刪</a>
										</div>
									</c:when>
									<c:when test="${palindromeBean.palindromeContext == string1}">
										<div class="dropup-content">
											<a href="javascript:;">文章已刪</a>
										</div>
									</c:when>
									<c:when test="${ userType == 'isAdmin'}">
										<div class="dropup-content">
											<form id="form${palindromeBean.articleFloor}" method="post"
												action="article/admin/deleteArticle/${palindromeBean.palindromeId.articleId}/${palindromeBean.articleFloor}">
												<input type="hidden" name="_method" value="DELETE">
												<a href="javascript:;" class="admin-delete" id="admin-${palindromeBean.articleFloor}">刪除文章</a>
											</form>
										</div>
									</c:when>
									<c:when test="${userId != palindromeBean.memberId.memberID}">
										<div class="dropup-content">
											<a href="javascript:;" class="reportArticle"
												id="repo-${palindromeBean.articleFloor}">檢舉文章</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="dropup-content">
											<a
												href="<spring:url value='/deleteArticle/${palindromeBean.palindromeId.articleId}/${palindromeBean.articleFloor}'/>">刪除文章</a>
											<a
												href="<spring:url value='/updateArticle/${palindromeBean.palindromeId.articleId}/${palindromeBean.articleFloor}'/>">編輯文章</a>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<input type="text"
						class="input-memberid${palindromeBean.articleFloor}" hidden="true"
						value="${palindromeBean.memberId.memberID}">
					<div class="member-screen" style="margin-top: 15px;">
						<img class="member-img"
							src="${palindromeBean.memberId.profilePicture}">
						<p class="member-point">
							<img src="<spring:url value='/images/article/金幣.png'/>"> <span
								class="coin-span">${palindromeBean.memberId.coin}</span>
						</p>
						<p class="member-point">
							<img src="<spring:url value='/images/article/紅利.png'/>"> <span
								class="red-span">${palindromeBean.memberId.bonus}</span>
						</p>
					</div>
					<div class="articlediv outdiv" style="margin-top: 15px;"
						id="floor${palindromeBean.articleFloor}">
						<div class="memberdiv">
							<a href="javascript:;" class="floor">${palindromeBean.articleFloor}樓</a>
							<a href="javascript:;" class="userName">${palindromeBean.memberName}</a>
							<a href="javascript:;" class="userID">${palindromeBean.memberId.memberID}</a>
							<span class="createDate">修改日期：${palindromeBean.showUpdatedTime}</span>
							<span class="createDate">上傳日期：${palindromeBean.showCreatedTime}</span>
						</div>
						<div class="articlediv">
							<pre class="textareaContext">${palindromeBean.palindromeContext}</pre>
						</div>
						<div class="point-div">
							<button id="bp-btn${palindromeBean.articleFloor}" class="bp">
								<i id="bp-icon${palindromeBean.articleFloor}"
									class="fa fa-thumbs-down" aria-hidden="true"></i>
							</button>
							<span id="gp-span-${palindromeBean.articleFloor}" class="gp-span">${palindromeBean.articlePointForGp}</span>

							<button id="gp-btn${palindromeBean.articleFloor}" class="gp">
								<i id="gp-icon${palindromeBean.articleFloor}"
									class="fa fa-thumbs-up" aria-hidden="true"></i>
							</button>
							<span id="bp-span-${palindromeBean.articleFloor}" class="bp-span">${palindromeBean.articlePointForBp}</span>
							<div class="dropup" style="left: 190px;">
								<button class="dropbtn">
									<i class="fa fa-ellipsis-v" aria-hidden="true"></i>
								</button>
								<c:set var="string1"
									value="內容已於${palindromeBean.showUpdatedTime}由作者刪除" />
								<c:set var="string2"
									value="內容已於${palindromeBean.showUpdatedTime}由管理員刪除" />
								<c:choose>
									<c:when test="${palindromeBean.palindromeContext == string2}">
										<div class="dropup-content">
											<a href="javascript:;">文章已刪</a>
										</div>
									</c:when>
									<c:when test="${palindromeBean.palindromeContext == string1}">
										<div class="dropup-content">
											<a href="javascript:;">文章已刪</a>
										</div>
									</c:when>
									<c:when test="${ userType == 'isAdmin'}">
										<div class="dropup-content">
											<form id="form${palindromeBean.articleFloor}" method="post"
												action="article/admin/deleteArticle/${palindromeBean.palindromeId.articleId}/${palindromeBean.articleFloor}">
												<input type="hidden" name="_method" value="DELETE">
												<a href="javascript:;" class="admin-delete" id="admin-${palindromeBean.articleFloor}">刪除文章</a>
											</form>
										</div>
									</c:when>
									<c:when test="${userId != palindromeBean.memberId.memberID}">
										<div class="dropup-content">
											<a href="javascript:;" class="reportArticle"
												id="repo-${palindromeBean.articleFloor}">檢舉文章</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="dropup-content">
											<a
												href="<spring:url value='/deleteArticle/${palindromeBean.palindromeId.articleId}/${palindromeBean.articleFloor}'/>">刪除文章</a>
											<a
												href="<spring:url value='/updateArticle/${palindromeBean.palindromeId.articleId}/${palindromeBean.articleFloor}'/>">編輯文章</a>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<form:form modelAttribute="createPalindrome" method="post"
			id="form123">
			<input type="hidden" value="${articleID}" name="id" />
			<div class="articlediv outdiv"
				style="margin-top: 15px; margin-bottom: 50px; height: 200px;">
				<form:textarea path="palindromeContext" class="textareaContext"
					placeholder="親愛的${userNickName}，要加入討論嗎？" style="padding-left: 1%;" />
				<input type="button" id="submitArticle" value="發表文章">
			</div>
		</form:form>
		<div id="overlay">
			<div id="text"></div>
		</div>
		<div class="pagination">
			<c:if test="${param.page-2 > 1}">
				<a style="position: absolute;"
					href="<spring:url value='/view?id=${param.id}&page=1'/>">1</a>
			</c:if>
			<a id="laquo" style="margin-left: 112px;"
				href="<spring:url value='/view?id=${param.id}&page=${param.page-1}'/>">&laquo;</a>

		</div>

	</article>
	<a href="#" class="totop-btn"> <span><img
			src="<spring:url value='/images/article/totop.png'/>"
			class="totop-img"></span>
	</a>
	<div class="tofloor">
		<span><img
			src="<spring:url value='/images/article/elevator.png'/>"
			style="float: left;"></span> <span><input type="text" oninput="value=value.replace(/[^\d]/g,'')"
			placeholder="？樓" class="tofloor-input"></span>
	</div>
	<input id="flooooor" type="hidden" value="${param.floor}">
	<script type="text/javascript">
    $(document).ready(function() {
    	//從控制器傳回來的map
    	//判斷該會員按的讚在幾樓，是gp還是bp
    	var memberKey = Object.keys(${map});
    	var memberValue = Object.values(${map});
    	memberKey.forEach(element => console.log("memberKey："+element));
    	memberValue.forEach(element => console.log("memberValue："+element));
    	for(let i = 0 ; i<memberKey.length;i++){
    		if(memberValue[i] =="gp"){
    			var btn_id = "#"+memberValue[i]+"-btn"+memberKey[i];
    			var icon_id = "#"+memberValue[i]+"-icon"+memberKey[i];
    			var bp_btn_id = "#bp-btn"+memberKey[i];
    			$(btn_id).addClass("gp-already");
    			$(btn_id).removeClass("gp");
    			$(btn_id).off("click");
    			$(btn_id).off("mouseout");
    			$(bp_btn_id).off("click");
    			$(icon_id).css("color", "white");
    		}
    		if(memberValue[i] =="bp"){ 
        		var btn_id = "#"+memberValue[i]+"-btn"+memberKey[i];
        		var icon_id = "#"+memberValue[i]+"-icon"+memberKey[i];
        		var gp_btn_id = "#gp-btn"+memberKey[i];
    			$(btn_id).addClass("bp-already");
    			$(btn_id).removeClass("bp");
    			$(btn_id).off("click");
    			$(btn_id).off("mouseout");
        		$(gp_btn_id).off("click");
        		$(icon_id).css("color", "white");
        	}
    	}
    })
    //gpbp移動觸發事件
	$(".gp").mouseover(function(e) {
		$(this).children().css('color', 'white');
	})
	$(".gp").mouseout(function(e) {
		$(this).children().css('color', '#FF8B2C');
	})
	$(".bp").mouseover(function(e) {
		$(this).children().css('color', 'white');
	})
	$(".bp").mouseout(function(e) {
		$(this).children().css('color', '#BF8383');
	})
	//gpbp移動觸發事件結尾
	
	//GPBP點擊一次的事件
	$(".gp").one("click", function(e) {
		//獲取gp的ID並pop我所控制的浮動值
		var id_index = e.target.id.split("n").pop();
		//input_memberid的val為${palindromeBean.memberId.memberID}
		var input_memberid = ".input-memberid"+id_index;
		//假設該會員點擊的是自己的文章，則return
		if( $(input_memberid).val() == $("#input-userid").val() ){
			gp_yourself_alert(id_index);
			$(".gp_img").fadeOut(2500);
			return;	
		}
		//否則 就執行下面事件
		var gp_id = "#gp-btn" + id_index;
		var icon_id = "#gp-icon" + id_index;
		var span_id = "#gp-span-" + id_index;
		var bp_id = "#bp-btn" + id_index;
		let inputNum = $(span_id).text();
		$(span_id).val(++inputNum);
		$(span_id).text(inputNum);
		$(gp_id).addClass("gp-already");
		$(gp_id).removeClass("gp");
		$(gp_id).off("mouseout");
		$(bp_id).off("click");
		gp_alert(id_index);
		$(".gp_img").fadeOut(2500);
		//Ajax傳送分數給Controller
		var params={};
		params.articleId = parseInt(document.getElementById("input-id").value);
		params.articlePointForGp = parseInt(inputNum);
		params.articleFloor = parseInt(id_index);
		params.gpOrBp = "gp";
		$.ajax({
            type: "post",
            url: "<c:url value='/HomeController_AjaxToPoint'/>",
            data: params, //將params轉成JSON格式
            dataType: "json"
    	});
	})
	$(".bp").one("click", function(e) {
		var id_index = e.target.id.split("n").pop();
		var input_memberid = ".input-memberid"+id_index;
		if( $(input_memberid).val() == $("#input-userid").val() ){
			bp_yourself_alert(id_index);
			$(".bp_img").fadeOut(2500);
			return;	
		}
		var bp_id = "#bp-btn" + id_index;
		var icon_id = "#bp-icon" + id_index;
		var span_id = "#bp-span-" + id_index;
		var gp_id = "#gp-btn" + id_index;
		let inputNum = $(span_id).text();
// 		console.log("inputNum:"+inputNum);
		$(span_id).val(++inputNum);
		$(span_id).text(inputNum);
		$(bp_id).removeClass("bp");
		$(bp_id).addClass("bp-already");
		$(bp_id).off("mouseout");
		$(gp_id).off("click");
		bp_alert(id_index);
		$(".bp_img").fadeOut(2500);
		//Ajax傳送分數給Controller
		var params={};
		params.articleId = parseInt(document.getElementById("input-id").value);
		params.articlePointForBp = parseInt(inputNum);
		params.articleFloor = parseInt(id_index);
		params.gpOrBp = "bp";
		$.ajax({
            type: "post",
            url: "<c:url value='/HomeController_AjaxToPoint'/>",
            data: params, //將params轉成JSON格式
            dataType: "json",
            success: function(data) {
            	;
            }
    	});
	})
	//GPBP事件處理結束
	function gp_alert(id_index) {
		var page = ${param.page};
		id_index = id_index-((page-1)*7);
    	console.log("id_index,"+id_index);
        var gp_img = document.createElement("img");
        gp_img.setAttribute("class", "gp_img");
        gp_img.setAttribute("src", "<spring:url value='/images/article/plus.png'/>");
        document.getElementsByClassName("point-div")[(id_index-1)].appendChild(gp_img);
    }
    function bp_alert(id_index) {
		var page = ${param.page};
		id_index = id_index-((page-1)*7);
    	console.log("id_index,"+id_index);
        var bp_img = document.createElement("img");
        bp_img.setAttribute("class", "bp_img");
        bp_img.setAttribute("src", "<spring:url value='/images/article/notplus.png'/>");
        document.getElementsByClassName("point-div")[(id_index-1)].appendChild(bp_img);
    }
	function gp_yourself_alert(id_index) {
		var page = ${param.page};
		id_index = id_index-((page-1)*7);
    	console.log("id_index,"+id_index);
        var gp_img = document.createElement("img");
        gp_img.setAttribute("class", "gp_img");
        gp_img.setAttribute("src", "<spring:url value='/images/article/不可以加分哦.png'/>");
        document.getElementsByClassName("point-div")[(id_index-1)].appendChild(gp_img);
    }
    function bp_yourself_alert(id_index) {
		var page = ${param.page};
		id_index = id_index-((page-1)*7);
    	console.log("id_index,"+id_index);
        var bp_img = document.createElement("img");
        bp_img.setAttribute("class", "bp_img");
        bp_img.setAttribute("src", "<spring:url value='/images/article/不可以扣分哦.png'/>");
        document.getElementsByClassName("point-div")[(id_index-1)].appendChild(bp_img);
    }
    
    $(".dropup").mouseenter(function() {
    	$(this).children(".dropup-content").addClass("show-dropup-content");
    })
    $(".dropup").mouseleave(function() {
        $(".dropup-content").removeClass("show-dropup-content");
    })
    	var pageCount = Math.ceil(${pageCount}/7);
		var page = ${param.page};
		var paramid = ${param.id};

		for (var i = 0; i < 5; i++) {
			var sum = (page - 2) + i;
			if (sum <= 0)
				continue;
			if (sum > pageCount)
				break;
			if (sum == page)
				$(".pagination")
						.append(
								"<a  href='javascript:;' class='active'>" + sum
										+ "</a>");
			else
				$(".pagination").append(
						"<a href=\"<spring:url value='/view?id="+paramid+"&page="
								+ sum + "'/>\">" + sum + "</a>");
		}
		$(".pagination").append(
				"<a id='raquo' href=\"<spring:url value='/view?id="+paramid+"&page="
						+ (page + 1) + "'/>\">&raquo;</a>");
		if (page == 1) {
			$("#laquo").attr("href", "javascript:;");
		}
		if (page == pageCount) {
			$("#raquo").attr("href", "javascript:;");
		}
		if (page + 2 < pageCount) {
			$(".pagination").append(
			"<a style='position: absolute;right: 0;' href=\"<spring:url value='/view?id="+paramid+"&page="
			+ pageCount + "'/>\">" + pageCount + "</a>");
		}
		
		$(".tofloor-input").keypress(function(e) {
			code = (e.keyCode ? e.keyCode : e.which);
			if (code == 13) {
				var queryString = $(".tofloor-input").val().trim();
				var queryString_2 = ${pageCount};
				if (queryString == '') {
					swal.fire({
						  title: "請輸入樓層！"
						});
					return;
				}
				if (parseInt(queryString) > parseInt(queryString_2)) {
					swal.fire({
						  title: "樓層只到"+queryString_2+"樓！"
						});
					return;
				}
				var quS = Math.ceil(parseInt(queryString)/7);
					window.location.href = 
						"<spring:url value='/view?id="+paramid+
								"&page="+quS+
								"&floor="+queryString+"' />";
				
			}
		});
		$("#submitArticle").click(function(){
			swal.fire({
				title : '確定要發佈嗎？',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '發佈文章',
				cancelButtonText : '再修改一下'
			}).then((result) => {
				if (result.isConfirmed){
				swal.fire({
					title:'發佈成功！',
					icon:'success',
					allowOutsideClick: false
					}).then(function(){
						$("#form123").submit();
					});
				}
			})
		})
		$(".reportArticle").click(function(e){
			(async () => {		
				var { value: email } = await Swal.fire({
					  title: '請輸入檢舉原因',
					  input: 'text',
					  inputPlaceholder: 'Enter your report reason',
					  showCancelButton: true,
					  confirmButtonText : '送出',
					  cancelButtonText : '不檢舉好了',
					  inputValidator: (value) => {
					    if (!value) {
					      return '必須輸入檢舉內容！'
					    }
					  }
					})
					if (email) {
						var id_index = e.target.id.split("-").pop();
						console.log(id_index);
						var params = {};
						params.articleId = parseInt($("#input-id").val());
						params.memberID = parseInt($("#input-userid").val());
						params.whyReport = email;
						params.articleFloor = parseInt(id_index);
						$.ajax({
				            type: "post",
				            url: "<c:url value='/HomeController_AjaxToReport'/>",
				            data: params, //將params轉成JSON格式
				            dataType: "json",
				            success: function(data) {
				            	;
				            }
				    	});
						Swal.fire({
						    title: '謝謝你的回報！',
						    icon:'success',
						    confirmButtonText : '關閉',
						    text:'後續問題將由管理員做處理'
					    })
					}
			})()	
		})
		
		$(".admin-delete").click(function(e){
			var id_index = e.target.id.split("-").pop();
			var form_id = "#form"+id_index;
			$(form_id).submit();
		})
		
		setTimeout(check, 500);
        function check() {
			var floooor = $("#flooooor").val();
        	var scroll_floor = "#floor"+floooor;
        	if(floooor != ""){
            	$("html, body").animate({
            		scrollTop: $(scroll_floor).offset().top
            	}, 
            	{
            		duration: 500,
            		easing: "swing"
            	});
            }
                return false;
        }
	</script>
</body>
</html>