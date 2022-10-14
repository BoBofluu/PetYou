<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<!--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->
 <link rel="stylesheet" style = "text/css" href="${pageContext.request.contextPath}/css/petHomepage.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
 <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style type="text/css">
/* Style the tab */

 .tab1 {  
    float: left;  
    border: 3px solid #ccc;  
    background-color: #f1f1f1;  
    width: 90%;  
  }  

.tab {
  float: left;
  border: 1px solid #ccc;
  background: linear-gradient(to right, #ffc3a0, #FFAFBD);
  width: 100%;
  height: 360px;
  
}

/* Style the buttons that are used to open the tab content */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  position:relative;
  left:100%;
  bottom:49.8%;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 100%;
/*   border-left: solid; */
  height: 300px;
  display: none;
   z-index:9999;
   background: linear-gradient(to bottom,#ee9ca7 , #ffdde1);
}








.search{
 width: 18%;
/*    border:solid;   */
 float: left;
 height: 100%;
 margin: 0px;
 margin-left: 2%;
 margin-top: 2%;
}
.newinput{
width:100%;
}
.omgg{

text-align:center;

}

  .omg {
 line-height: normal;}
 .magnifier{
  width:25px;
 }
 a:link {text-decoration:none;color:black;}     
 a:visited {text-decoration:none;color:black;} 
 a:hover {text-decoration:none;color : black;}    
 a:active {text-decoration:none;color:black;}
   
</style>
</head>
<body>
<div class="search">
	

   <div class="input-group input-group-sm mb-3 ">
    <div class="input-group-prepend">
    
     
     <input class="tab1" type="text" class="form-control" aria-label="Small"
     aria-describedby="inputGroup-sizing-sm">
     <span class="input-group-text" id="inputGroup-sizing-sm"
      style="background-color: #FFEBE7; border: 2px solid #FFC0BE;">
       
      <a href="#" class="omg"> <img 
      src="<c:url value='/images/放大鏡.png' />"
        class="magnifier" id="magnifier" />
     </a>
     </span>
    </div>
    
   </div>
   				<c:forEach var='category' items='${categorylist}' >
				<a href='commoditys/${category}'>${category}</a>
				</c:forEach>

<div class="tab">
  <button class="tablinks"  onclick="location.href='<c:url value='/commoditys/愛貓園地'/>'" onmouseover="openCity(event, 'London')">愛貓園地</button>
  <button class="tablinks"  onclick="location.href='<c:url value='/commoditys/汪汪城堡'/>'" onmouseover="openCity(event, 'Paris')">汪汪城堡</button>
  <button class="tablinks"  onclick="location.href='<c:url value='/commoditys/毛孩用品'/>'" onmouseover="openCity(event, 'Taipei')">毛孩用品</button>
<!--   <button class="tablinks" onmouseover="openCity(event, 'Tokyo')">管理後台</button> -->

<c:choose>
  		<c:when test="${userAccount eq 'Admin' }">
  			<button  class="tablinks" style="display:none" onclick="location.href='<c:url value='/myorder' />'">我的訂單</button>
  		</c:when>
   		<c:otherwise> 
  			<button  class="tablinks"  onclick="location.href='<c:url value='/myorder' />'" onmouseover="openCity(event, 'Tokyo')">我的訂單</button>
  		</c:otherwise> 
</c:choose>
  <button class="tablinks"  onclick="location.href='<c:url value='/' />'">回首頁</button>
  
</div>

<div id="London" class="tabcontent" onmouseleave="none(event,'catclass')">
  
 <a href="<c:url value='/commoditys/愛貓園地/貓咪飼料'/>"><h3>貓咪飼料</h3></a>
</div>

<div id="Paris" class="tabcontent" onmouseleave="none(event,'catclass')">
  <a href="<c:url value='/commoditys/汪汪城堡/狗狗飼料'/>"><h3>狗狗飼料</h3></a>
  
</div>

<div id="Taipei" class="tabcontent" onmouseleave="none(event,'catclass')">
  <a href="<c:url value='/commoditys/毛孩用品/寵物保健'/>"><h3>寵物保健</h3></a>
 
</div>

<div id="Tokyo" class="tabcontent" onmouseleave="none(event,'catclass')">
  <a href="<c:url value='/myorderwaitcancel'/>"><h3>退貨狀態</h3></a>
 
</div>
<%--  <c:forEach var="m" items="${cart_session}" varStatus="status"> --%>
<!--       <div id="saaa"> -->
<%--       ${status.count } --%>
    	
<%--         <span style='font-size:14px' class='price${cart_session[m.key].commodityid}'>   --%>
<%--       	<img width='50' height='50' src="${cart_session[m.key].src}"/> --%>
<%--         <input style="display:none" class ='${cart_session[m.key].commodityid }' value="${cart_session[m.key].commodityid}"> --%>
<%--         ${cart_session[m.key].name} --%>
<%--         ${cart_session[m.key].price} --%>
<%--         ${cart_session[m.key].quantity} --%>
<!--        <br>  -->
       
<!--       </span> -->
<!--       </div> -->
<%--       </c:forEach> --%>

<!-- 這個是臨時後台 -->
<!-- <div id="Tokyo" class="tabcontent" onmouseleave="none(event,'catclass')"> -->
<%--   <a href="<c:url value='/commoditys/add'/>"><h3>新增商品</h3></a> --%>
<%--   <a href="<c:url value='/update/stock'/>"><h3>更新庫存</h3></a> --%>
<%--   <a href="<c:url value='/commoditys/set'/>"><h3>修改商品</h3></a> --%>
<%--   <a href="<c:url value='#'/>"><h3>管理訂單</h3></a> --%>
  
<!-- </div> -->



<%--   <div class="omgg omgg1"><a href="<c:url value='/commoditys/貓'/>">愛貓園地</a></div>  --%>
<%--   <div class="omgg omgg2"><a href="<c:url value='/commoditys/狗'/>">汪汪城堡</a></div>  --%>
<%--  <div class="omgg omgg3"><a href="<c:url value='/commoditys/貓/食'/>">貓咪飼料</a></div> --%>
<%--    <div class="omgg omgg4"><a href="<c:url value='/commoditys/狗/食'/>">狗狗飼料</a></div>  --%>
<%--     <div class="omgg omgg5"><a href="<c:url value='/commoditys/add'/>">新增商品</a></div>  --%>
<%--    <div class="omgg omgg6"><a href="<c:url value='/update/stock'/>">更新庫存</a></div>  --%>
<%--        <div class="omgg omgg7"><a href="<c:url value='/' />">回首頁</a></div>  --%>

  </div>
   
</body>
<script>
function none(evt,Name){
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
}



function openCity(evt, cityName) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the link that opened the tab
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>

</html>