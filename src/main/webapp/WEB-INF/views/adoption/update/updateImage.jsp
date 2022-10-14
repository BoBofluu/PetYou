<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>


<style type="text/css">
* {margin =0;padding =0;
	
}

#head {
	color: #5D001E;
	font-weight: bolder;
	margin-left: 42%;
}

#freePost {
	padding: 100px;
	margin-top: 2%;
	margin-left: 12%;
	margin-right: 12%;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	border-radius: 10px;
	height: auto;
	position: absolute;
	margin-bottom: 40px;
}

.radioType {
	font-size: large;
	margin-right: 10px;
	margin-left: 5px;
}

.restrict {
	margin: 0px 0px 0px 240px;
	font-size: 12pt
}

.nextStep {
	font-size: 15pt;
	background-color: #E96681;
	color: white;
	padding: 10px;
	border: 0px;
	border-radius: 10px;
	font-weight: bold;
	margin-top: 2%;
	outline: none;
}

#statusCut {
	height: auto;
	vertical-align: top;
}

.first {
	width: 450px;
	display: inline-block;
	height: auto;
}

.second {
	width: 450px;
	display: inline-block;
	height: auto;
}

input[type=radio] {
	transform: scale(1.6);
	margin-right: 5px;
}
</style>

</head>
<body>
	<jsp:include page="../HomePage.jsp" />
	<h2 id="head">上傳兩張浪浪照片</h2>

	<div align="center" id="freePost">
		<form:form method='POST' modelAttribute="albumn"
			class='form-horizontal' enctype="multipart/form-data">

			<div class="first">
				<img src="https://img.icons8.com/bubbles/100/000000/1-circle.png" />
				<div class="input-group mb-3 form-group" style="width: 400px;">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary" type="button">圖片1</button>
					</div>
					<div class="custom-file">
						<form:input type="file" class="custom-file-input Image1"
							id="inputGroupFile01" path="Image" required="true" />
						<label class="custom-file-label" for="inputGroupFile01"
							style="text-align: left;">請上傳</label>
					</div>
				</div>
				<label for="c0"><img class="preview"
					style="max-width: 300px; max-height: 300px;"></label>
				<p>
					<form:radiobutton path="cover" id="c0" value="31"
						required="required" />
					<label for="c0">選擇此張做為封面</label>
				</p>
			</div>

			<div class="second">
				<img src="https://img.icons8.com/bubbles/100/000000/2-circle.png" />
				<div class="input-group mb-3 form-group" style="width: 400px">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary" type="button">圖片2</button>
					</div>
					<div class="custom-file">
						<form:input type="file" class="custom-file-input Image2"
							id="inputGroupFile02" path="Image" required="true" />
						<label class="custom-file-label" for="inputGroupFile02"
							style="text-align: left;">請上傳</label>
					</div>
				</div>
				<label for="c"><img class="preview2"
					style="max-width: 300px; max-height: 300px;"></label>
				<p>
					<form:radiobutton path="cover" id="c" value="55"
						required="required" />
					<label for="c">選擇此張做為封面</label>
				</p>
			</div>

			<input type="submit" value="下一步" class="nextStep"
				style="margin-left: 6%" />
			<img src="https://img.icons8.com/emoji/48/000000/paw-prints.png" />
		</form:form>
	</div>
</body>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">
<script>
	$('#freePost').width(screen.width * 0.65);
	window.history.forward(1);

	$(function() {

		function format_float(num, pos) {
			var size = Math.pow(10, pos);
			return Math.round(num * size) / size;
		}
		var first = $("#inputGroupFile01")
		function preview(first) {

			if (first.files && first.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('.preview').attr('src', e.target.result);
				}
				reader.readAsDataURL(first.files[0]);
			}
		}

		$("body").on("change", ".Image1", function() {
			preview(this);
		})

	})

	$(function() {

		function format_float(num, pos) {
			var size = Math.pow(10, pos);
			return Math.round(num * size) / size;
		}
		var second = $("#inputGroupFile02");
		function preview(second) {
			if (second.files && second.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('.preview2').attr('src', e.target.result);
				}
				reader.readAsDataURL(second.files[0]);
			}
		}

		$("body").on("change", ".Image2", function() {
			preview(this);
		})

	})
</script>

</html>