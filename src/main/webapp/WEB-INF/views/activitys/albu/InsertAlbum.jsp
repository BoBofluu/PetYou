<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
 <form:form method='POST' modelAttribute="albumsBean" class='form-horizontal'
								 enctype="multipart/form-data">
	<fieldset>
			<div class="form-group">
				<label class='control-label col-lg-2 col-lg-2' for="filename">
					圖片
				</label>
				<div class='col-lg-10'>
					<form:input id="filename" path="albumsImage" type='file'
						class='form:input-large' multiple="multiple" />
				</div>
			</div>	
			
			<div class="form-group">
				<div class='col-lg-offset-2 col-lg-10'>
					<input id="btnAdd" type='submit' class='btn btn-primary'
						value="送出" />
				</div>
			</div>			
	</fieldset>
 </form:form>
 
</body>
</html>