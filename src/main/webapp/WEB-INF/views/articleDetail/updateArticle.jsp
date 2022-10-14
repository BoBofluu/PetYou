<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>寵你 只寵愛你</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link type="text/css"
	href="<spring:url value='/css/createArticle.css'/>" rel="stylesheet">
<script type="text/javascript"
	src="<spring:url value='/js/createArticle.js'/>"></script>
<link
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'
	rel='stylesheet'></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/petHomepage.jsp"></jsp:include>
	<article class="articleScreen">
		<form method="post" id="form123">
			<div class="articlediv" id="outdiv">
				<legend id="legendArticle">修改文章</legend>
				<div class="articlediv innerA" style="margin-left: 2%;">
					<input type="text" disabled id="updateBoard"
						value="${pb.palindromeId.articleBoard}" /> <input type="text"
						disabled id="updateTag" value="${pb.palindromeId.articleTag}" /> <label
						class="btn btn-info"
						style="background-color: #f5b0bb; border: none;"> <input
						id="upload_img" style="display: none;" type="file"> <i
						class="fa fa-photo" style="color: black; margin-right: 2px;"></i><img
						src="<spring:url value='/images/article/FotoJet.png'/>">
					</label> <span class="showFileName"></span> <span class="fileerrorTip"></span>
					<br> <input id="updateArticle" type="text" disabled
						value="${pb.palindromeId.articleTitle}" />
					<div id="textareaContext" contenteditable="true">${pb.palindromeContext}</div>
					<textarea id="palindromeContext" name="palindromeContext" hidden = "true"></textarea>
					<input type="button" id="submitUpdate" value="修改文章" />
				</div>
			</div>
		</form>
	</article>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var out = document.getElementById('textareaContext');
					var a = 1;
					var eleID;
					function findCursor() {
						var x = document.getSelection();
						var r = x.getRangeAt(0);
						var tempnode = document.createElement("span");
						tempnode.setAttribute("id", "cursorhook" + a);
						r.surroundContents(tempnode);
						var real = "cursorhook" + (a - 1);
						if (document.getElementById(real)) {
							document.getElementById(real).remove(
									document.getElementById(real));
						}
						eleID = "#" + tempnode.id;
						a = a + 1;
					}
					out.onkeyup = findCursor;
					out.onclick = findCursor;
					
					$("#submitUpdate").click(function() {
						var divToController = $("#textareaContext").html();
						console.log(divToController);
						$("#palindromeContext").val(divToController);
					});

					var prviewId = 0;
					var realId = 0;
					$("#upload_img").change(function() {
						var fileReader = new FileReader();
						var prviewFile = this.files[0];
						var form = new FormData();
						form.append("files", prviewFile);
						if(eleID == null){
							swal.fire({
								  title: "先點擊文章才能上傳圖片唷！"
								});
							var gogofile = document.getElementById('upload_img');
							gogofile.value = "";
							return;
							}
						$.ajax({
							type : "POST",
							url : "<c:url value='/HomeController_AjaxToImg'/>",
							data : form,
							dataType : "json",
							mimeType : "multipart/form-data",
							cache : false,
							processData : false,
							contentType : false,
							success : function(Jdata) {
								var prviewImg = new Image();
								prviewImg.id = "prviewImg" + prviewId;
								prviewImg.src = Jdata.fileRoot;
								$(eleID).after(prviewImg);
								var getPrviewId = "#prviewImg" + prviewId;
								$(getPrviewId).addClass("real-img");
								var gogofile = document.getElementById('upload_img');
								gogofile.value = "";
								console.log(gogofile.value);
							}
						});
						prviewId += 1;
					});
					$("#submitUpdate").click(function(){
						swal.fire({
							title : '確定要修改嗎？',
							showCancelButton : true,
							confirmButtonColor : '#3085d6',
							cancelButtonColor : '#d33',
							confirmButtonText : '修改文章',
							cancelButtonText : '再修改一下'
						}).then((result) => {
							if (result.isConfirmed){
							swal.fire({
								title:'修改成功！', 
								text:'兩秒後跳轉至文章', 
								icon:'success',
								allowOutsideClick: false
								}).then(function(){
									$("#form123").submit();
								});
							}
						})
					})
				})
	</script>
</body>

</html>