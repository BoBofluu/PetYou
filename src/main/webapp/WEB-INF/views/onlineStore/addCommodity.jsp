<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 700px;
/*  	margin: auto;  */
 	position: relative; 
   	left: 250px; 
  	background-color:rgb(255,255,255);
}
#commodityDescriptions{
/* height:300px; */
/* width:300px; */
	height: 40%; 
	margin-top: 2%;
	width: 96%;
	padding: 1%;
	font-size: large;
	background-color: #F0F0F0;
	border-radius: 5px;
	resize: none;
}


/* .ab{ */
/* width:200px;} */
</style>
<title>寵你 只寵愛你</title>
</head>
<body>
		<jsp:include page="../petHomepage.jsp"></jsp:include>
	<section>
		<div class="container">
			<h1 style="text-align: center">新增商品資料</h1>
		</div>
	</section>
	<hr style="height: 1px; border: none; color: #333; background-color: #333;">
	<jsp:include page="aaaa.jsp"></jsp:include>
	<div class="ab">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="commodityBean" class='form-horizontal'
						enctype="multipart/form-data" id="form1">
			<fieldset >
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='title'>
						商品名稱 </label>
					<div class="col-lg-10">
						 <form:input id="commodityName" path="commodityName" type='text'
 							class='form:input-large' /> 
					</div>
				</div>

				

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						類別 </label>
					<div class='col-lg-10'>
						<form:select path="commodityCategory">
							<form:option value="-1" label="請挑選" />
							<form:options items="${categoryList}" />
						</form:select>
					</div>
				</div>
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="commodityTheme">
						主題 </label>
					<div class='col-lg-10'>
						<form:select path="commodityTheme">
							<form:option value="-1" label="請挑選" />
							<form:options items="${themeList}" />
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="commodityPrice">
						價格 </label>
					<div class='col-lg-10'>
						<form:input id="commodityPrice" path="commodityPrice" type='text'
						class='form:input-large' /> 
					</div>
				</div>
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="stockQuantity">
						庫存量 </label>
					<div class='col-lg-10'>
						<form:input id="commodityPrice" path="stockQuantity" type='text'
						class='form:input-large' /> 
					</div>
				</div>
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="commodityDescriptions">
						商品敘述 </label>
					<div class='col-lg-10'>
						<form:textarea id="commodityDescriptions" path="commodityDescriptions" 
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="commoditySupplierID">
						供應商 </label>
					<div class='col-lg-10'>
						<form:select path="commoditySupplierID">
							<form:option value="-1" label="請挑選" />
							<form:options items="${supplierlist}" />
						</form:select>
					</div>
				</div>
				
				
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="commodityImagestack">
					</label>
					<div class='col-lg-10'>
						<form:input id="commodityImagestack" path="commodityImagestack" type='file'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group"> 
 					<label class='control-label col-lg-2 col-lg-2' for="commodityImagestack"> 
					</label> 
					<div class='col-lg-10'> 
 						<form:input id="commodityImagestack" path="commodityImagestack1" type='file' 
					class='form:input-large' />  
 					</div> 
				</div> 
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="commodityImagestack2">
					</label>
					<div class='col-lg-10'>
						<form:input id="commodityImagestack2" path="commodityImagestack2" type='file'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='button' class='btn btn-primary'
							value="送出" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
	</div>
</body>
<script>
$("#btnAdd").click(function() {
								

	swal("新增成功","","success").then(function(){
	$("#form1").submit();
		
	})
	
	
 });


</script>
</html>
