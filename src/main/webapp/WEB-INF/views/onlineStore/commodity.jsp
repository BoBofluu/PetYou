<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"
 integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
 crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/jquery-latest.js"></script>
<title>寵你 只寵愛你</title>
<style>

pre {
	white-space: pre-wrap !important;
}
  .descriptions{  

  position: relative;   
    	right: 80%;   
  
  }  
   .img1{  
	
      	position:absolute;    
    	border:3px solid lightgray; 
/*       float: left;   */
        width: 350px;  
	      height: 250px;  
     left:30%;  
/*       bottom:69%;  */
		top:35%;
   } 
  
  .a{
/*      position: relative;    */
  	width:100px; 
  	height:90px; 
/*  	left:370px;  */
/*  	top:300px;  */
/*      border:3px solid lightgray;   */
  }
 
.im{
/* border:solid; */
height:100%;


}

.row{
float:right;
position: relative; 
/*     border:solid;     */
width:55%;
margin:-5%;
margin-bottom:5%;
left:15%;
}
#titlefirst{
/*  border:solid;  */
position:absolute;
left:350px;
width:65%;
z-index:9999;

}

#commodityDescriptions {
	width: 150%;
	padding: 1%;
	padding-left: 0%;
 	background-color: #F0F0F0; 
/*  	background-color: white; */
/*   	border:solid;   */
	word-break: break-all;
	height: 99%; 
	font-size:20px;
	position: relative; 
	bottom:-5%;
	box-shadow: 2px 0px 8px -2px rgba(5, 1, 3, 0.34);
/*      box-shadow: 0.5px 0.5px 0.2px black;  */
}
 .col-md-5{ 
    
 left:80px; 

  border:0.1px solid lightgray; 
  border-radius: 7px 7px 7px 7px;
/*   box-shadow: 0.5px 0.5px 0.2px gray;  */
  box-shadow: 2px 0px 8px -2px rgba(5, 1, 3, 0.34);
 } 

.container{
  position:relative;  
  left:30px;  
/*  border:solid;  */
}
.NT{
font-weight:bold;
}
.NY{
color:red;
}
.imdiv1{
/* border: solid; */
    position: relative;
     display: inline-block;
	width:250px;
/*     height: 90px; */
    left: 280px;
    top: 290px;
}
.sdf{
position:relative;
/* border:solid; */
}

.cartid{

 	position:absolute;
 	right:5px;
 	bottom:6px;
    background-color: #F0F0F0; 
    border: none;
    color: black;
    padding: 4px 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
	font-weight:bold;
}

#overlay {
 position: fixed;
 display: none;
 width: 100%;
 height: 100%;
 top: 0;
 left: 0;
 right: 0;
 bottom: 0;
 background-color: rgba(0, 0, 0, 0.5);
 z-index: 9999;
}

#text {
 position: absolute;
 top: 50%;
 left: 50%;
 font-size: 50px;
 color: white;
 transform: translate(-50%, -50%);
 -ms-transform: translate(-50%, -50%);
}

</style>
</head>
<body> 
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	
    
	<section>
		<div>
			<div id="titlefirst"><a  href="<c:url value='/commoditys' />">全部商品</a>
    <span> / </span>
    <a href="<c:url value='/commoditys/${aaa}'/>"><span class="category">${commodity.commodityCategory}</span></a>
			</div>
		</div>
	</section>
	<jsp:include page="search.jsp"></jsp:include>
	
	<section class="container">
	<div class="im">
	
		<div class="sdf">
			<a href="# "> 
				<img src="<c:url value='/getPicture/${commodity.commodityID}'/>" alt="" class="img1 real-img">
			</a>
	
			<div class="imdiv1">
				<span style="float: left">
 					<a  href="javascript: " style="background-color:red"> 
						<img src="<c:url value='/getPicture1/${commodity.commodityID}'/>" alt="" class="a real-img">
 					</a> 
 				</span>
 				<span style="float: right">
 					<a  href="javascript:" style="background-color:red"> 
						<img src="<c:url value='/getPicture2/${commodity.commodityID}'/>" alt="" class="a real-img">
 					</a> 
 				</span>
			</div>
	
		</div>
	
		<div class="row">

			<div class="col-md-5">
				<h3>${commodity.commodityName}</h3>
				<p><h5 class="NT">|&nbsp 全店，$499免運費</h5></p>
				<p><h5 class="NT">|&nbsp 全店，消費每滿五百得折扣碼九折(僅供下次使用)</h5></p>
				<p><h5 class="NT">|&nbsp 全店，三張九折扣碼可兌換一張<br>八折折扣碼</h5></p>
				<p><h3 class="NY">NT$${commodity.commodityPrice}</h3></p>
				
<%-- 				<p>商品主題: ${commodity.commodityTheme}</p> --%>
<%-- 				<p>商品分類: ${commodity.commodityCategory}</p> --%>
<%-- 				<p>品牌: ${commodity.supplierBean.supplierName }</p> --%>
				<p style="font-size:14px">庫存:${commodity.stockQuantity}件</p>
				<p>
				
					<strong>商品編號: </strong> <span >
						${commodity.commodityID} </span>
				</p>
				<p>
				<p><button class="cartid">加入購物車</button></p>
				
			
				
			<br>
			</div>
			
			<div class="descriptions">
				<p><!--商品敘述 不能低於30字英數或17中文-->
				<pre id="commodityDescriptions">${commodity.commodityDescriptions}</pre>
				<p>
			</div>
			</div>
		</div>
						<input id="SBD" style="display:none" value="${commodity.commodityID }">
                        <input id="SAD" style="display:none" value="${commodity.commodityName }">
                        <input id="STD" style="display:none" value="${commodity.commodityPrice }">
                        <input id="SYD" style="display:none" value="<c:url value='/getPicture/${commodity.commodityID}'/>">
                        <input id="SHD" style="display:none" value="1">
	</section>
	<div id="overlay">
  <div id="text"></div>
  </div>
  						
  
</body>
<script>
$(".cartid").click(function(e){
	
	
	var reali = $("#SBD")
	var reala = $("#SAD")
	var realx = $("#STD")
	var realq = $("#SYD")
	var realc = $("#SHD")
	console.log($(reali).val());
	console.log($(reala).val());
	console.log($(realx).val());
	console.log($(realq).val());
	console.log($(realc).val());
	var id = $(reali).val();
	var name = $(reala).val();	
	var price = $(realx).val();
	var src = $(realq).val();
	var quantity = $(realc).val();
	var param = {};
	param.commodityid = $(reali).val();
	param.name = $(reala).val();
	param.price = $(realx).val();
	param.src = $(realq).val();
	param.quantity = $(realc).val();
	
// 	var sss = ".sp"+id;
	
// 	if($(".price").children(sss).text()){
		
// 		alert("此商品已存在於購物車中，請點擊購物車並前往購物車頁調整需要的數量，謝謝")
// 		return;
//     }else {
//     	alert("加入購物車成功")
//     }
	
	console.log($("."+id).val())
	
	if($("."+id).val()){
		alert("此商品已存在於購物車中，請點擊購物車並前往購物車頁調整需要的數量，謝謝")
			return;
			
		    }else {
		    	alert("加入購物車成功")
		    }
	
	
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST","<c:url value='/smallcart'/>",true);
	xhr.setRequestHeader('Content-type','application/json;charset=UTF-8');
	
	
	var xhr1 = new XMLHttpRequest();
	
	xhr.send(JSON.stringify(param));
	
	xhr.onreadystatechange = function (){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log("xhr.responseText==>"+xhr.responseText);
			var obj = JSON.parse(xhr.responseText);
			
// 			var vala=obj[$(reali).val()].src
// 			var val1="<img width='50' height='50' src="+vala+">"
// 			var val2=obj[$(reali).val()].name
// 			var val3=obj[$(reali).val()].quantity+"&nbsp"+"x"+"&nbsp"
			
//				var vals="數量:"+"<input id='quantity12' style='width:30px;text-align:center' type = 'text' value="+val3+">"
// 			var val4="NT$"+obj[$(reali).val()].price
			
		window.location.replace(window.location.href);
				
				
				
// 					$(".price").append("<span style='font-size:14px' class='sp"+obj[$(reali).val()].commodityid+"'>"+
// 						val1+val2+"&nbsp"+"&nbsp"+val4
// 						+"</span><br>");
			
			
			
	}
}
})
$(".real-img").click(function() {
	  document.getElementById("overlay").style.display = "block";
	  var gogoro = new Image();
	  gogoro.src = this.src;
	  $("#text").append(gogoro);
	 })
	 $("#overlay").click(function() {
	  document.getElementById("overlay").style.display = "none";
	  $('#text img').remove();
	 })
</script>
</html>
