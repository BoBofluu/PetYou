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
 <form:form method='POST' modelAttribute="activityBean" class='form-horizontal'
								 enctype="multipart/form-data">
	<fieldset>
		<div id='showpage' style='visibility:visible'>
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='name22'>
				    活動主題
			    </label>
				<div class="col-lg-10">
					<form:input id="name22" path="name" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='title22'>
				    標題
			    </label>
				<div class="col-lg-10">
					<form:input id="title22" path="title" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='email22'>
				    Email
			    </label>
				<div class="col-lg-10">
					<form:input id="email22" path="email" type='text' class='form:input-large' />
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='phone22'>
				    手機
			    </label>
				<div class="col-lg-10">
					<form:input id="phone22" path="phone" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='link22'>
				    活動網址
			    </label>
				<div class="col-lg-10">
					<form:input id="link22" path="link" type='text' class='form:input-large' />
				</div>
			</div>
		
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='city22'>
				   	縣市
			    </label>
				<div class="col-lg-10">
					<form:input id="city22" path="city" type='text' class='form:input-large' />
				</div>
			</div>
		
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='area22'>
				    地區
			    </label>
				<div class="col-lg-10">
					<form:input id="area22" path="area" type='text' class='form:input-large' />
				</div>
			</div>
		
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='address22'>
				    詳細地址
			    </label>
				<div class="col-lg-10">
					<form:input id="address22" path="address" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<div class='col-lg-offset-2 col-lg-10'>
					<input id="next" type='button' class='btn btn-primary'
						value="下一頁" />
					<input id="reset" type='reset' class='btn btn-primary'
						value="清除" />
				</div>
			</div>
		
		</div>
			
		<div id='showpage2' style='visibility:hidden;display:none'>
					
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='petType22'>
				    寵物類型
			    </label>
				<div class="col-lg-10">
					<form:input id="petType22" path="petType" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='fee22'>
				    費用
			    </label>
				<div class="col-lg-10">
					<form:input id="fee22" path="fee" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='people22'>
				    參加人數
			    </label>
				<div class="col-lg-10">
					<form:input id="people22" path="people" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='startDate22'>
				    活動開始日期
			    </label>
				<div class="col-lg-10">
					<form:input id="startDate22" path="startDate" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='endDate22'>
				    活動結束日期
			    </label>
				<div class="col-lg-10">
					<form:input id="endDate22" path="endDate" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='host22'>
				    舉辦單位
			    </label>
				<div class="col-lg-10">
					<form:input id="host22" path="host" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='content22'>
				    詳細內容
			    </label>
				<div class="col-lg-10">
					<form:textarea cols="50px" rows="10px" id="content22" path="content" type='text' class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<label class='control-label col-lg-2 col-lg-2' for="photo22">
					圖片
				</label>
				<div class='col-lg-10'>
					<form:input id="photo22" path="activityImage" type='file'
						class='form:input-large' />
				</div>
			</div>
			
			<div class="form-group">
				<div class='col-lg-offset-2 col-lg-10'>
					<input id="btnAdd" type='submit' class='btn btn-primary'
						value="送出" />
					<input id="previous" type='button' class='btn btn-primary'
						value="上一頁" />
				</div>
			</div>	
		</div>
			
		
		
	</fieldset>
 </form:form>
 
 <script>
 	function showPage() {
		var showpage=document.getElementById("showpage");
		var next=document.getElementById("next");
		var showpage2=document.getElementById("showpage2");
		var previous=document.getElementById("previous");
		
		if (showpage != null) {
			showpage.style.visibility = 'hidden';
			showpage.style.display = 'none';
			next.style.visibility = 'hidden';
			next.style.display = 'none';
		}
		if (showpage2 != null) {
			showpage2.style.visibility = "visible";
			showpage2.style.display = "inline";
			previous.style.visibility = "visible"
			previous.style.display = "inline";
		}
	}

	function hidePage() {
		var showpage=document.getElementById("showpage");
		var next=document.getElementById("next");
		var showpage2=document.getElementById("showpage2");
		var previous=document.getElementById("previous");
		
		if (showpage != null) {
			showpage.style.visibility = 'visible';
			showpage.style.display = 'inline';
			next.style.visibility = 'visible';
			next.style.display = 'inline';
		}
		
		if (showpage2 != null) {
			showpage2.style.visibility = "hidden";
			showpage2.style.display = "none";
			previous.style.visibility = "hidden"
			previous.style.display = "none";
		}
	}
	
	var next=document.getElementById("next");
	var previous=document.getElementById("previous");
	window.onload=function(){
		next.onclick =function(){
			showPage();
		}
		
		previous.onclick =function(){
			hidePage();
		}
	}
 </script>
</body>
</html>