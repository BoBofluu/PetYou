<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

.navBar {
	width: 250px;
	height: auto;
	background-color: white;
	border-radius: 8px;
	margin-left: 3%;
	box-shadow: 12px 12px 7px #dfe3e8;
	display: inline-block;
}

.navTitle {
	background-color: #FDDAD8;
	padding: 20px;
	font-weight: 600;
	color: #642018;
	font-size: 20pt;
}

.navContent {
	padding: 20px;
	padding-bottom: 0px;
	font-weight: 600;
}

.navContent:hover { 
	color: #E22B2F;
}

#pic1 {
	float: right;
}

.pink {
	padding: 10px;
	margin-top: 10px
}

.link:hover {
	color: #E22B2F;
}

/* 新增、修改、刪除 呈現列表 */

.container{
	width:30%;
	height:30%;
	display:inline-block;
	position:absolute;
    left: 335px;
}

table{
    margin-left: 0px;
}

.table td, .table th{
	padding: 10px;
}


/* 分頁css */

.pagenum {
	display: inline-block;
}

.pagebar {
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

.pagenum2 {
	margin: 0 5px 5px 5px;
	display: block;
	width: 48px;
	height: 48px;
	line-height: 48px;
	font-family: "Poppins", sans-serif;
	font-size: 20px;
	line-height: 48px;
	text-align: center;
	background-color: #2c6e64;
	border-radius: 50%;
	font-family: "Microsoft JhengHei", Arial, Tahoma, sans-serif;
}

navContent>a{
	color:black;
}

button#create {
    float: right;
    margin-right: 75px;
    margin-top: 43px;
}

</style>
</head>
<body style="font-size: 17px;">
	<jsp:include page="../../petHomepage.jsp"></jsp:include>
	<div class="navBar">
		<div class="navTitle">
			後臺管理<img onclick="hide()" id="pic1"
				src="https://img.icons8.com/ios/40/000000/outdent.png" />
		</div>
		<div class="navContent" id="home" style="display: none;">
			<a id="home" href="<c:url value='/activitys'/>"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/pastel-glyph/30/000000/home.png" />
				<span style="margin-left: 6%;" class="link">回到網站</span></a>
		</div>
		<div class="navContent" id="analyze" style="display: none;">
			<span id="analize"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/wired/30/000000/statistics.png" /> <span
				style="margin-left: 6%;" class="link">活動分析</span></span>
		</div>
		<div class="navContent" id="insert" style="display: none;">
			<span id="management"
				style="color: black; text-decoration: none"> <img
				src="https://img.icons8.com/dotty/30/000000/dating-website.png" /> <span
				style="margin-left: 6%;" class="link">回到管理畫面</span></span>
		</div>
		<div class="pink" id="pink" style="display: none;"></div>
	</div>
<!-- 新增活動 -->
	<div class="modal fade " id="create" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog" role="document" style="max-width: 640px;">
			<div class="modal-content">
				<form:form method='POST' modelAttribute="Bean" class='form-horizontal'
								 enctype="multipart/form-data" action="activitys/create">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">新增</h5>
						<button type="button" class="close" data-dismiss="modal" id="reeee0" 
						aria-label="Close" onclick="closeWin(this.id);">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id='showpage0' style='visibility:visible'>	
							<input type="hidden" class="form-control" id="act">					
							<div class="form-group">
								<label for="startDate" class="col-form-label">活動起始日:</label>
									<form:input id="startDate" path="startDate" type='text' class='form-control' />
									<form:errors path="startDate" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="endDate" class="col-form-label">活動終止日:</label>
									<form:input id="endDate" path="endDate" type='text' class='form-control' />
									<form:errors path="endDate" cssClass="error" />
							</div>
							
							<div class="form-group">
								<label for="name" class="col-form-label">活動名稱：</label>
									<form:input id="name" path="name" type='text' class='form-control' />
									<form:errors path="name" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="title" class="col-form-label">活動副標題：</label>
									<form:input id="title" path="title" type='text' class='form-control' />
									<form:errors path="title" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="petType" class="col-form-label">適合寵物類型:</label>
									<form:input id="petType" path="petType" type='text' class='form-control' />
									<form:errors path="petType" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="people" class="col-form-label">參加人數：</label>
									<form:input id="people" path="people" type='text' class='form-control' />
									<form:errors path="people" cssClass="error" />
							</div>
							
							<div class="form-group">
								<label for="fee" class="col-form-label">費用:</label>
									<form:input id="fee" path="fee" type='text' class='form-control' />
									<form:errors path="fee" cssClass="error" />
							</div>						
							
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
								 id="oneKey">一鍵輸入</button>
								 <button type="reset" class="btn btn-primary"
								 id="resetAll">清除</button>
								<button type="button" class="btn btn-secondary"
								 id="next0" onclick="showPage(this.id);">下一頁</button>
							</div>
							
							
							
						</div>
						<div id='showpage20' style='visibility:hidden;display:none'>
							<div class="form-group">
								<label for="city" class="col-form-label">縣市:</label>
									<form:input id="city" path="city" type='text' class='form-control' />
	 								<form:errors path="city" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="area" class="col-form-label">地區:</label>
									<form:input id="area" path="area" type='text' class='form-control' />
									<form:errors path="area" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="address" class="col-form-label">詳細地址:</label>
									<form:input id="address" path="address" type='text' class='form-control' />
									<form:errors path="address" cssClass="error" />
							</div>
							
							
							<div class="form-group">
								<label for="phone" class="col-form-label">聯絡方式:</label>
									<form:input id="phone" path="phone" type='text' class='form-control' />
									<form:errors path="phone" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="email" class="col-form-label">E-mail:</label>
									<form:input id="email" path="email" type='text' class='form-control' />
									<form:errors path="email" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="host" class="col-form-label">舉辦單位:</label>
									<form:input id="host" path="host" type='text' class='form-control' />
									<form:errors path="host" cssClass="error" />
							</div>
							
							<div class="form-group">
								<label for="link" class="col-form-label">連結網址:</label>
									<form:input id="link" path="link" type='text' class='form-control' />
									<form:errors path="link" cssClass="error" />
							</div>
							
							
							
							<div class="form-group">
								<label for="content" class="col-form-label">活動內容：</label>
									<form:textarea rows="10" id="content" path="content" type='text' class='form-control' />
									<form:errors path="content" cssClass="error" />
							</div>
							
							<div class="form-group">
									<form:input id="file" path="activityImage" type='file' class='form-control' />
									<form:errors path="activityImage" cssClass="error" />
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									id="previous0" onclick="hidePage(this.id);">上一頁</button>
								<button type="button" class="btn btn-secondary"
									id="reset0" data-dismiss="modal" onclick="closeWin(this.id);">關閉</button>
								<button type="submit" class="btn btn-primary" 
								    id="create00" onclick="return check();">送出</button>
							</div>
						</div>
					</div>	
				</form:form>				
			</div>
		</div>
	</div>	

<!-- 表單活動 -->
	<button id="create" type="button" class="btn btn-primary" 
							 data-toggle="modal" data-target="#create" >新增活動
	</button>
	<div class="container c1" style="top: 260px;">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">活動起日</th>
					<th scope="col">活動訖日</th>
					<th scope="col">活動名稱</th>
					<th scope="col">內容修改</th>
					<th scope="col">刪除活動</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='activitys' items='${activitys}'>
				<tr>
					<th scope="row">${activitys.value.ID}</th>
					<td><fmt:formatDate value="${activitys.value.startDate}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${activitys.value.endDate}" pattern="yyyy-MM-dd"/></td>
					<td>${activitys.value.name}</td>
					<td>
						<button id="btn${activitys.value.ID}" type="button" class="btn btn-primary"
							 data-toggle="modal" data-target="#improve${activitys.value.ID}" onclick="querydata(this.id);">修改
<%-- 							 ${activitys.value.ID} --%>
						</button>
					</td>
					<td>
						<button id="btg${activitys.value.ID}" type="button" class="btn btn-primary" 
							 data-toggle="modal" data-target="#delete${activitys.value.ID}">刪除
<%-- 							 ${activitys.value.ID} --%>
						</button>		
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav class="mt-20 mb-20">
			<ul class="pagebar">
				<c:set var="pageNo" value="${pageNo}" />
				<c:forEach var="page" begin="1" end="${totalPages}"
					varStatus="aa">
					<li class="pagenum"><c:choose>
							<c:when test="${page == pageNo}">
								<span class="pagenum2" id="page${page}" style="background-color: darkorange;color: black;">${page}</span>
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/activityAdmin?pageNo=${page}' />"
									class="pagenum2"> <span style="color:white;" id="page${page}">${page}</span>
								</a>
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
			</ul>
		</nav>
	</div>

<!-- 修改表單內容 -->
<c:forEach var='activitys' items='${activitys}'>
	<div class="modal fade " id="improve${activitys.value.ID}" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog" role="document" style="max-width: 640px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">修改</h5>
					<button type="button" class="close" data-dismiss="modal" id="resee${activitys.value.ID}" 
					aria-label="Close" onclick="closeWin(this.id);">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div id='showpage${activitys.value.ID}' style='visibility:visible'>	
						<input type="hidden" class="form-control" id="act${activitys.value.ID}">					
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">活動起始日:</label>
							<input type="text" class="form-control" id="startDate${activitys.value.ID}">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">活動終止日:</label>
							<input type="text" class="form-control" id="endDate${activitys.value.ID}">
						</div>
						
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">活動名稱：</label>
							<input type="text" class="form-control" id="name${activitys.value.ID}">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">活動副標題：</label>
							<input type="text" class="form-control" id="title${activitys.value.ID}">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">適合寵物類型:</label>
							<input type="text" class="form-control" id="petType${activitys.value.ID}">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">人數：</label>
							<input type="text" class="form-control" id="people${activitys.value.ID}">
						</div>
						
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">費用:</label>
							<input type="text" class="form-control" id="fee${activitys.value.ID}">
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
							 id="next${activitys.value.ID}" onclick="showPage(this.id);">下一頁</button>
						</div>
						
					</div>
					<div id='showpage2${activitys.value.ID}' style='visibility:hidden;display:none'>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">縣市:</label>
							<input type="text" class="form-control" id="city${activitys.value.ID}">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">地區:</label>
							<input type="text" class="form-control" id="area${activitys.value.ID}">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">詳細地址:</label>
							<input type="text" class="form-control" id="address${activitys.value.ID}">
						</div>
						
						
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">手機:</label>
							<input type="text" class="form-control" id="phone${activitys.value.ID}">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">E-mail:</label>
							<input type="text" class="form-control" id="email${activitys.value.ID}">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">舉辦單位:</label>
							<input type="text" class="form-control" id="host${activitys.value.ID}">
						</div>
						
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">連結網址:</label>
							<input type="text" class="form-control" id="link${activitys.value.ID}">
						</div>			
						
						<div class="form-group">
							<label for="message-text" class="col-form-label">活動內容：</label>
							<textarea class="form-control" id="content${activitys.value.ID}" rows="10"></textarea>
						</div>
						
						<div class="form-group">
							<label for="message-text" class="col-form-label">封面圖片：</label>
							<input type="file" class="form-control" id="photo${activitys.value.ID}">
						</div>
							
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								id="previous${activitys.value.ID}" onclick="hidePage(this.id);">上一頁</button>
							<button type="button" class="btn btn-secondary"
								id="reset${activitys.value.ID}"data-dismiss="modal" onclick="closeWin(this.id);">關閉</button>
							<button id="submit${activitys.value.ID}" type="button" class="btn btn-primary" onclick="submit(this.id);">送出</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
<!-- 刪除表單內容 -->
<c:forEach var='activitys' items='${activitys}'>
<div class="modal fade" id="delete${activitys.value.ID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">刪除</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="restt${activitys.value.ID}" onclick="closeWin(this.id);">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        確認是否刪除該筆紀錄
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button id="del${activitys.value.ID}" type="button" class="btn btn-primary" onclick="deletedata(this.id);">確定</button>
      </div>
    </div>
  </div>
</div>
</c:forEach>

<!-- 資料分析 -->
<div id="reportshow" style="width:1300px;height:1000px;display:inline-block;position:absolute;" hidden="true">
 	<div 
        style="height: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">

        <div
            style="position: relative; width: 1536px; height: 666px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
            <canvas data-zr-dom-id="zr_0" width="1920" height="832"
                style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 666px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
        </div>
        <div
            style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px / 21px &quot;Microsoft YaHei&quot;; padding: 5px; left: 842px; top: 332px; pointer-events: none;">
            访问来源 <br>营销广告: 679 (26.5%)</div>     
    </div>
</div>
<!-- boostrap modal 彈出修改表單內容 -->
	<script type="text/javascript">	
		function hide() {
			$("#pic1").attr("src",
					"https://img.icons8.com/wired/40/000000/close-sign.png")
			document.getElementById("insert").style.display = "";
			document.getElementById("analyze").style.display = "";
			document.getElementById("home").style.display = "";
			document.getElementById("pic1").setAttribute("onClick",
					"javascript: Boo();");
		}

		var Boo = function() {
			$("#pic1").attr("src",
					"https://img.icons8.com/ios/40/000000/outdent.png");
			document.getElementById("insert").style.display = "none";
			document.getElementById("analyze").style.display = "none";
			document.getElementById("home").style.display = "none";
			document.getElementById("pic1").setAttribute("onClick",
					"javascript: hide();");
		}	
		
		//請求圖片
		var form = null;
		var output = null;
		$("input[type='file']").change(function (){
			var url_id = this.id.substring(5)
			var update_url="<c:url value='/ajaxImg?id="+url_id+"'/>"
			var fileReader = new FileReader();
			output = this.files[0];
			form = new FormData();
			form.append("activityImage", output);
// 			console.log(this.files[0])
			$.ajax({
				type: 'POST',
				url: update_url,
				contentType:'application/json; charset=utf-8',
				dataType:'json',
				mimeType : "multipart/form-data",
				cache : false,
				processData : false,
				contentType : false,
				data: form,
				success: function(data) {
					console.log("圖片請求成功");
				},
				error: function(data) {
					console.log("圖片請求失敗");
				},
			});
		})
		
		
	//修改活動	
	function submit(id){
		var url_id=id.substring(6);
		var startDate = document.getElementById("startDate"+url_id);
		var endDate = document.getElementById("endDate"+url_id);
		var name = document.getElementById("name"+url_id);
		var title = document.getElementById("title"+url_id);
		var petType = document.getElementById("petType"+url_id);
		var people = document.getElementById("people"+url_id);
		var fee = document.getElementById("fee"+url_id);
		var city = document.getElementById("city"+url_id);
		var area = document.getElementById("area"+url_id);
		var address = document.getElementById("address"+url_id);
		var phone = document.getElementById("phone"+url_id);
		var email = document.getElementById("email"+url_id);
		var host = document.getElementById("host"+url_id);
		var link = document.getElementById("link"+url_id);
		var content = document.getElementById("content"+url_id);
		var photo = document.getElementById("photo"+url_id);
		
		var photoName = photo.value.substring(photo.value.lastIndexOf('\\')+1);
		var bean={
			id:url_id,
			startDate:startDate.value,
			endDate:endDate.value,
			name:name.value,
			title:title.value,
			petType:petType.value,
			people:people.value,
			fee:fee.value,
			city:city.value,
			area:area.value,
			address:address.value,
			phone:phone.value,
			email:email.value,
			host:host.value,
			link:link.value,
			content:content.value,
			photoName:photoName
		};	
		var update_url="<c:url value='/activityAdmin/improve?id="+url_id+"'/>"
		$.ajax({
			type: 'POST',
			url: update_url,
			contentType:'application/json; charset=utf-8',
			dataType:'json',
// 			mimeType : "multipart/form-data",
			data: JSON.stringify(bean),
			success: function(data) {
				if(data!=null){
					Swal.fire({
			            title: data.msg,
			            showCancelButton: false
			        }).then(function(result) {
			           if (result.value) {
			        	   location.href="<c:url value='/activityAdmin'/>";
			           }
			        });
				}
			},
			error: function(data) {
				for(key in data)
					console.log(data[key])
				alert("ajax請求失敗")
			},
		});
	}
	
	//刪除活動	
	function deletedata(id){
		var del_id=id.substring(3);
		var delurl = "<c:url value='/activityAdmin/delete?id="+del_id+"'/>"
		$.ajax({
			type: 'DELETE',
			url: delurl,
			success: function(data) {
				if(data!=null){
					Swal.fire({
			            title: data.msg,
			            showCancelButton: false
			        }).then(function(result) {
			           if (result.value) {
			        	   location.href="<c:url value='/activityAdmin'/>";
			           }
			        });
				}
								
			},
			error:function(data){ //沒有執行到這一段
				if(data=='')
					alert("請重新整理!!")
			}
		});
	}
	
	//查詢活動
	function querydata(id){
		var queryid = id.substring(3);
		var startDate = document.getElementById("startDate"+queryid);
		var endDate = document.getElementById("endDate"+queryid);
		var name = document.getElementById("name"+queryid);
		var title = document.getElementById("title"+queryid);
		var petType = document.getElementById("petType"+queryid);
		var people = document.getElementById("people"+queryid);
		var fee = document.getElementById("fee"+queryid);
		var city = document.getElementById("city"+queryid);
		var area = document.getElementById("area"+queryid);
		var address = document.getElementById("address"+queryid);
		var phone = document.getElementById("phone"+queryid);
		var email = document.getElementById("email"+queryid);
		var host = document.getElementById("host"+queryid);
		var link = document.getElementById("link"+queryid);
		var content = document.getElementById("content"+queryid);
		var photo = document.getElementById("photo"+queryid);
		var queryurl = "<c:url value='/activityAdmin/query?id="+queryid+"'/>"
		$.ajax({
			type: 'GET',
			url: queryurl,
			success: function(data) {
				for(key in data)						
					var dd = new Date(data[key].startDate);
					var dd2 = new Date(data[key].endDate);
					
					var dd_year = dd.getFullYear()			
					var dd_month = (dd.getMonth()+1)<10?('0'+(dd.getMonth()+1)):(dd.getMonth()+1)
					var dd_day = dd.getDate()<10?('0'+dd.getDate()):dd.getDate()
							
					var dd2_year = dd2.getFullYear()			
					var dd2_month = (dd2.getMonth()+1)<10?('0'+(dd2.getMonth()+1)):(dd2.getMonth()+1)
					var dd2_day = dd2.getDate()<10?('0'+dd2.getDate()):dd2.getDate()
					
					startDate.value = dd_year+"-"+dd_month+"-"+dd_day;
					endDate.value = dd2_year+"-"+dd2_month+"-"+dd2_day;
					name.value = data[key].name;
					title.value = data[key].title;
					petType.value = data[key].petType;
					people.value = data[key].people;
					fee.value = data[key].fee;
					city.value = data[key].city;
					area.value = data[key].area;
					address.value = data[key].address;
					phone.value = data[key].phone;
					email.value = data[key].email;
					host.value = data[key].host;
					link.value = data[key].link;
					content.value = data[key].content;
					photo.value = '';	
								
			},
			error:function(data){ //沒有執行到這一段
				if(data=='')
					alert("請重新整理!!")
			}
		});			
	}	
	
// -------------------------------------------------------

// 	上下頁控制	
	function showPage(id) {
		var showpage_id = "showpage"+id.substring(4);
		var showpage2_id ="showpage2"+id.substring(4);
			
		var showpage=document.getElementById(showpage_id);
		var showpage2=document.getElementById(showpage2_id);
		
		if (showpage != null) {
			showpage.style.visibility = 'hidden';
			showpage.style.display = 'none';
		}
		if (showpage2 != null) {
			showpage2.style.visibility = "visible";
			showpage2.style.display = "inline";
		}
	}

	function hidePage(id) {
		var showpage_id = "showpage"+id.substring(8);
		var showpage2_id ="showpage2"+id.substring(8);
			
		var showpage=document.getElementById(showpage_id);
		var showpage2=document.getElementById(showpage2_id);
		
		if (showpage!= null) {
			showpage.style.visibility = 'visible';
			showpage.style.display = 'inline';
		}
		
		if (showpage2 != null) {
			showpage2.style.visibility = "hidden";
			showpage2.style.display = "none";
		}
	}
	
	function closeWin(id){
		var showpage_id = "showpage"+id.substring(5);
		var showpage2_id ="showpage2"+id.substring(5);
			
		var showpage=document.getElementById(showpage_id);
		var showpage2=document.getElementById(showpage2_id);
		
		if (showpage!= null) {
			showpage.style.visibility = 'visible';
			showpage.style.display = 'inline';
		}
		
		if (showpage2 != null) {
			showpage2.style.visibility = "hidden";
			showpage2.style.display = "none";
		}
	}
// -------------------------------------------------------	
	//一鍵輸入
	$('#oneKey').click(function(){
		$('#startDate').val("2020/08/10");
		$('#endDate').val("2020/11/27")
		$('input#name').val("2020-11-27★專題發表★")
		$('#title').val("EEIT19-跨平台就業養成班")
		$('#petType').val("工程師")
		$('#people').val("36")
		$('#fee').val("5000")
		$('#city').val("台北市")
		$('#area').val("大安區")
		$('#address').val("復興南路一段390號2樓")
		$('#phone').val("02-66316666")
		$('#email').val("cherrychen@iii.org.tw")
		$('#host').val("資策會")
		$('#link').val("https://www.iii.org.tw/")
		$('#content').val(
				'<p>發表還沒有結束，大家加油 (๑•̀ㅂ•́)و✧\n\n</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>\n'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>\n'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>\n'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>\n'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>\n'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'<p>⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>'
				+'⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄ ⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄</p>\n'
			)	
	})

// -------------------------------------------------------		
	//報表
	$("#management").click(function(){
		$('#reportshow').attr("hidden", true);
		$('.c1').attr("hidden", false);
		$('button#create').attr("hidden", false);
	})
	
	$("#analize").click(function(){
		$('#reportshow').attr("hidden", false);
		$('.c1').attr("hidden", true);
		$('button#create').attr("hidden", true);
	})
	

// -------------------------------------------------------		    
    </script>
<!-- 	報表 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
    <!-- <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&amp;ak=xfhhaTThl11qYVrqLZii6w8qE5ggnhrY&amp;__ec_v__=20190126"></script><script type="text/javascript" src="https://api.map.baidu.com/getscript?v=2.0&amp;ak=xfhhaTThl11qYVrqLZii6w8qE5ggnhrY&amp;services=&amp;t=20200914160603"></script> -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
    <script type="text/javascript">
// 主程式
		var count= [];
		var result=[];
       	$(document).ready(function() {
       		var url = "<c:url value='/activityAdmin/report'/>";
       		$.ajax({
       			type: 'GET',
       			url: url,
       			success: function(data) {
       				
       				for(key in data){
       					var object = new Object();
//        					console.log("key="+key+",value="+data[key]);			
       					object.name = key;
       					object.value = data[key];
       					result.push(object)
       				}

				       	var dom = document.getElementById("reportshow");
				        var myChart = echarts.init(dom);
				        var app = {};
				        option = null;
				        option = {
				            tooltip: {
				                trigger: 'item',
				                formatter: '{a} <br/>{b}: {c} 個'
				            },
				            legend: {
				                orient: 'vertical',
				                left: 10, 
				                top: 70,
				                data: result
				            },
				            series: [
				                {
				                    name: '活動',
				                    type: 'pie',
				                    selectedMode: 'single',
				                    radius: [0, '60%'],
				
				                    label: {
				                        position: 'inner'
				                    },
				                    labelLine: {
				                        show: false
				                    },
				                    data: 
				                    	result
				                },
				                {
				                    name: '活動',
				                    type: 'pie',
				                    radius: ['70%', '80%'],
				                    label: {
				                        formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  個  ',
				                        backgroundColor: '#eee',
				                        borderColor: '#aaa',
				                        borderWidth: 1,
				                        borderRadius: 4,
				                        rich: {
				                            a: {
				                                color: '#999',
				                                lineHeight: 22,
				                                align: 'center'
				                            },
				                            hr: {
				                                borderColor: '#aaa',
				                                width: '100%',
				                                borderWidth: 0.5,
				                                height: 0
				                            },
				                            b: {
				                                fontSize: 20,
				                                lineHeight: 33
				                            },
				                            per: {
				                                color: '#eee',
				                                backgroundColor: '#334455',
				                                padding: [2, 4],
				                                borderRadius: 2
				                            }
				                        }
				                    },
				                    data: result
				                }
				            ]
				        };;
				        if (option && typeof option === "object") {
				            myChart.setOption(option, true);
				        }
       			}
       		});     		   		
       	});
       	
       	//倒數計時
       	function check(){
       		return true;
       	}
       	
//----------------------------------------------------------------------------
		//倒數計時方法
//      <span id="Check_Txt" style="color:red">時間計數：<span id="Check_i"></span></span>
//     	<button onclick="stopColor();"></button>

//         var SetMinute = 3;
//         $(document).ready(function () {
//             Check_Time();
//         });
        
//         function Check_Time() {

// //             var Check_i = document.getElementById("Check_i");
//             var Cal_Second = SetMinute;
// //             Check_i.innerHTML = Cal_Second + "秒";
//             if (SetMinute == 1) {
//                 stopColor();
//                 location.href="<c:url value='/activityAdmin'/>";
//             }
//             SetMinute -= 1;

//         }

//         function stopColor() {
//             clearInterval(mm);
//         }
//----------------------------------------------------------------------------        
  
					
	</script>
</body>
</html>