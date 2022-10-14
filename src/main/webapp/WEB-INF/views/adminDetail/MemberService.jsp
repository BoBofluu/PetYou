<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<style>

.theSelect{
    height: 38px;
    padding: 0 0 0 10px;
}

.theLabel{
	font-size: larger;
    font-weight: bold;
    width:106px;
/*     text-align:right; */
}

.verificationCode{
	text-align:center;
	outline: 0;
}


</style>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<form:form method="post" modelAttribute="customerService" enctype="multipart/form-data">
	<div style="height:1350px;width:700px;margin:10px auto;background-color:#fcd2e9;border-radius: 15px;
				padding:10px;box-shadow: 12px 12px 7px #dfe3e8;padding-left:30px">
		<div style="margin:10px auto;font-size:38px;width:342px;margin-left:170px;margin-bottom: 25px;">寵你網站客服表單<i class="fa fa-commenting-o" aria-hidden="true" style="cursor:pointer;opacity:0;" id="onepunch"></i></div>
		<div>
			<label class="theLabel">反映項目<span style="color:red">*</span></label>
			<select class="theSelect" id="theSelect">
				<option value="-1">請選擇</option>
				<option value="帳號相關">帳號相關</option>
				<option value="合作提案">合作提案</option>
				<option value="申請發放學術問卷">申請發放學術問卷</option>
				<option value="檢舉、處分相關">檢舉、處分相關</option>
				<option value="寵物聚會">寵物聚會</option>
				<option value="預約系統">預約系統</option>
				<option value="寵物論壇">寵物論壇</option>
				<option value="線上商城">線上商城</option>
				<option value="領養浪浪">領養浪浪</option>
				<option value="其他問題">其他問題</option>		
			</select>
			<form:input type="text" path="customercomplaintType" id="customercomplaintType" style="display:none"/>
		</div>
		<hr>
		<div>
			<label class="theLabel" style="text-align:left;width:160px">反映內容詳述<span style="color:red">*</span></label><br>
			<form:textarea name="customercomplaintLetter" rows="10" cols="50" id="customercomplaintLetter" 
				style="resize:none;width:600px;height:200px" path="customercomplaintLetter"/>
		</div>
		<hr>
		<div>
			<label class="theLabel">真實姓名<span style="color:red">*</span></label><br>
			<form:input type="text" style="width:400px" path="customerName" id="customerName"/>
		</div>
		<hr>
		<div>
			<label class="theLabel">信箱<span style="color:red">*</span></label><br>
			<form:input type="text" style="width:400px" path="customerEmail" id="customerEmail"/><br>
			<span style="color:red">請填寫正確，客服將回信至此信箱</span>
		</div>
		<hr>
		<label class="theLabel">上傳圖片</label><br>
		<div style="position:relative;" >
			<form:input type="file" style="position:absolute;opacity:0;width:365px;height:200px;cursor: pointer;" id="customerImage" path="customerImage" accept=".jpg,.png,.jpeg"/> 
			<img src="${pageContext.request.contextPath}/images/upload.jpg" id="ppimg"  style="width:365px;object-fit: contain;height:200px;"> 
		</div>
		<span style="color:red">※若上傳圖片為證件類，請於證件空白處中加上<br>＂僅限寵你網站核對資料使用＂</span>
		<hr>
		<div>
			<label class="theLabel" style="width:160px;">寵你網站帳號</label><br>
			<form:input type="text" style="width:400px" path="customerAccount" id="customerAccount"/>
		</div>
		<hr>
		<div style="width:350px;margin:5px auto;margin-right: 210px;">
			<label >請輸入驗證碼</label>
			<input type="text" class="verificationCode" readonly id="inputverificationCode" style="outline:0;border:0px;"><br>
			<label >輸入驗證碼&nbsp;:<span style="color:red">*</span></label>
			<input type="text" class="verificationCode" id="outputverificationCode" style="width: 223px;" >
		</div>
		<div style="margin:5px auto;width:50px;">
			<input type="submit" value="送出" onclick="return check_element()">
		</div>
	</div>
	<div style="height:50px"></div>
	<input type="hidden" style="display:none" id="yourUserAccount" value="${userAccount}">
	</form:form>
	<script>
		if($("#yourUserAccount").val().trim().length != 0){
			$("#customerAccount").val($("#yourUserAccount").val());
		}
	
		$("#inputverificationCode").bind("contextmenu copy ",function(){
			return false;
		});
	
		$("#theSelect").on("change",function(){
			$("#customercomplaintType").val($("#theSelect").val());
		})
	
		
		var x = new FileReader;
		document.getElementById('customerImage').onchange = function() {
			if(document.getElementById('customerImage').value==""){
			}else{
				x.readAsDataURL(this.files[0]);
			}
		}

		x.onloadend = function() {
			document.getElementById('ppimg').src = this.result;
		}
	
		var innerCode=["A","B","C","D","E","F","G","H","I","J","K","L","M",
					   "N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
					   "a","b","c","d","e","f","g","h","i","j","k","l","m",
					   "n","o","p","q","r","s","t","u","v","w","x","y","z",
					   "0","1","2","3","4","5","6","7","8","9"] //62
					   		
		const mySet = new Set(); 
		var verificationCode = "";
		for(let times = 0;times < 6 ; times++){
			var num = Math.floor(Math.random()*innerCode.length);
			if(mySet.has(num)){
				times--;
			}else{
				mySet.add(num);
				verificationCode += innerCode[num];
			}
		}

		$("#inputverificationCode").val(verificationCode);
		
		$("#onepunch").click(function(){
			$("#theSelect option[value='帳號相關']").attr('selected', 'selected');
			$("#customercomplaintType").val("帳號相關");
			$("#customercomplaintLetter").val("一直收不到驗證信");
			$("#customerName").val("李欣哲");
			$("#customerEmail").val("zerozakiark@gmail.com");
			$("#outputverificationCode").val(verificationCode);
		})
		
		
		function check_element(){
			var message = "";
			
			if($("#theSelect").val() == -1){
				message += "反映項目沒有選擇<br>";
			}
			
			if($("#customercomplaintLetter").val() == 0){
				message += "反映內容沒有填寫<br>";
			}
			
			if($("#customerName").val() == 0){
				message += "姓名沒有填寫<br>";
			}
			
			if($("#customerEmail").val() == 0){
				message += "信箱沒有填寫<br>";
			}
			
			if($("#customercomplaintLetter").val() == 0){
				message += "反映內容沒有填寫<br>";
			}
			
			
			if($("#inputverificationCode").val() != $("#outputverificationCode").val()){
				message += "驗證碼不正確<br>";
			}

			if(message.length != 0){
				
				alertWarning(message);
				return false;
			}else{
				return true;
			}
		
        }
	function alertWarning(message) {
            Swal.fire(
            	"有欄位尚未填寫", //標題 
            	message, 
                "warning" 
            );
        }

	</script>
</body>
</html>