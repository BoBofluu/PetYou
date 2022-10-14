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
		<form:form modelAttribute="createBean" method="post" id="form123">
			<div class="articlediv" id="outdiv">
				<legend id="legendArticle">發表新文章</legend>
				<div class="articlediv innerA" style="margin-left: 2%;">
					<form:select id="selectBoard" path="articleBoard">
						<form:option class="optionOne" value="-1" label="請選擇" />
						<form:option value="綜合討論" label="綜合討論" />
						<form:option value="疑難雜症" label="疑難雜症" />
						<form:option value="心得分享" label="心得分享" />
						<form:option value="心情點滴" label="心情點滴" />
						<form:option value="食趣旅遊" label="食趣旅遊" />
					   	<form:option value="醫學知識" label="醫學知識" />
					</form:select>
					<form:select id="selectTag" path="articleTag">
						<form:option class="optionOne" value="-1" label="請選擇" />
						<form:option value="問題" label="問題" />
						<form:option value="情報" label="情報" />
						<form:option value="心得" label="心得" />
						<form:option value="閒聊" label="閒聊" />
					</form:select>
					<label class="btn btn-info"
						style="background-color: #f5b0bb; border: none;"> <input
						id="upload_img" style="display: none;" type="file"> <i
						class="fa fa-photo" style="color: black; margin-right: 2px;"></i><img
						src="<spring:url value='/images/article/FotoJet.png'/>">
					</label> <span class="showFileName"></span> <span class="fileerrorTip"></span>
					<br>
					<form:input id="inputArticle" path="articleTitle" type="text"
						autocomplete="off" placeholder="請輸入文章標題..." />
					<div id="textareaContext" contenteditable="true">
					<img id="blackbean" src="<spring:url value='/images/article/blackbean.jpg'/>" style="width:100%;cursor:default;">
					</div>
					<textarea id="palindromeContext" name="palindromeContext" hidden = "true"></textarea>
					<input type="button" disabled id="submitArticle" value="發表文章" />
				</div>
			</div>
		</form:form>
	</article>
	<script type="text/javascript">
		$(document).ready(function() {
			//宣告out為可編輯的<div>
			var out = document.getElementById('textareaContext');
			//宣告a為<span>ID的浮動值
			var a = 1;
			//宣告eleID為浮動的<span>ID
			var eleID = null;
			//此方法為找尋圖片應該新增在游標的位置
			function findCursor() {
				var x = document.getSelection();
				var r = x.getRangeAt(0);
				//新增一個<span>元素
				var tempnode = document.createElement("span");
				//將tempnode新增一個ID值
				tempnode.setAttribute("id", "cursorhook" + a);
				r.surroundContents(tempnode);
				//宣告real為當前的ID值-1，當作先前的<span>ID
				var real = "cursorhook" + (a - 1);
				//if有real這個元素的話，就刪除他
				if (document.getElementById(real)) {
					document.getElementById(real).remove(document.getElementById(real));
				}
				//宣告eleID為JQuery所使用的ID;
				eleID = "#" + tempnode.id;
				//將<span>的浮動值++
				a = a + 1;
			}
			//可編輯的<div>產生鍵盤點擊往上離開事件
			out.onkeyup = findCursor;
			//可編輯的<div>產生點擊事件
			out.onclick = findCursor;
			//按下發佈文章後，可編輯的<div>會轉譯成textarea
			$("#submitArticle").click(function() {
				var divToController = $("#textareaContext").html();
				$("#palindromeContext").val(divToController);
			});
			var prviewId = 0;
			//上傳圖片的事件
			$("#upload_img").change(function() {
				//宣告圖片
				var fileReader = new FileReader();
				var prviewFile = this.files[0];
				var form = new FormData();
				//append到form接下來使用ajax
				form.append("files", prviewFile);
				//ifeleID還沒有被建立的話
				if(eleID == null){
					swal.fire({
					title: "先點擊文章才能上傳圖片唷！"
						});
					//宣告gogofile為<input type="file">
					var gogofile = document.getElementById('upload_img');
					//讓圖片value為空才會觸發change事件
					gogofile.value = "";
					return;
				}
				//ifeleID已被建立的話
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
						//宣告一個新的<img>
						var prviewImg = new Image();
						//設定ID跟src，ID為浮動值
						prviewImg.id = "prviewImg" + prviewId;
						prviewImg.src = Jdata.fileRoot;
						//將新增的圖片放到eleID<span>的下面
						$(eleID).after(prviewImg);
						//宣告<img>的ID
						var getPrviewId = "#prviewImg" + prviewId;
						//添加class置剛剛新增的圖片
						$(getPrviewId).addClass("real-img");
						//宣告gogofile為<input type="file">
						var gogofile = document.getElementById('upload_img');
						//讓圖片value為空才會觸發change事件
						gogofile.value = "";
					}//ajax的success結尾
				});//ajax的結尾
				//將圖片的浮動值++
				prviewId += 1;
			});//上傳圖片的事件結尾
			//點擊編輯器時，黑豆圖片(發文版規)會消失
			$(".articlediv").click(function(e) {
				$("#blackbean").remove();
			});
			//發佈文章的點擊事件
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
						text:'稍後跳轉至文章', 
						icon:'success',
						allowOutsideClick: false
						}).then(function(){
							$("#form123").submit();
						});
					}//then if的結尾
				})//then的結尾
			})//發佈文章事件的結尾
		});
	</script>
</body>

</html>