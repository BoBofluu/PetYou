<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 

<style>
.button.red{
background-color:#ca3535;
border-color:#c43c35;
color:#fff;
text-shadow:0 1px 0 rgba(0,0,0,.2);
background-image:-webkit-linear-gradient(top, rgba(255,255,255,.3), rgba(255,255,255,0));
padding:4px 12px;
}

body{
    background-color: rgba(0, 0, 0,.2);
}
.item_header{
    display: flex;
    width: 1000px;
    margin: 0 auto;
    height: 30px;
    background-color: #fff;
    border-radius: 3px;
    padding-left: 10px;
}
.pri{width:175px;}
.count{width:230px;}
.total{width:220px;}
.item_header div{
    width: 200px;
    color: #888;
    line-height: 30px;
}
.item_header .item_detail{
    width: 50%;
}
.item_body{
    margin-top: 10px;
    height: 100px;
    align-items: center;    
}
.item_detail img{
    width: 80px;
    height: 80px;
    border-radius: 3px;
    /* margin-top: 10px; */
    float: left;
}
.item_detail .name{
    margin-left: 100px;
    margin-top: 20px;
} 
.textorder{
float:right;
}
.ma1{
margin-bottom:3px;
}
.qaza{
background-color:#cf5454;
padding:2px 10px 2px 10px;
color:#FFF;
width:100px;
}
a:active {text-decoration:none;color:black;}
a:hover {text-decoration:none;} 
a:visited {text-decoration:none;color:black;} 
    
 
.QOOA{
padding-top:10px;
padding-bottom:10px;
font-size:16px;
border-radius:4px;
margin-top:5px;
color:#00303c!important;
background-color:rgba(0,0,0,0)!important;
border:2px solid #00303c!important;
transition:color .25s,background .25s;
 text-decoration:none; 
display:block;
width:100%;
margin-bottom:0;
text-align:center;
white-space:nowrap;
}
.labe{
display:inline-block;
max-width:100%;
margin-bottom:5px;
font-size:14px;
}
.sele{
text-align:left;
/* border-color:#ccc !important; */
color:#555 !important;
margin-bottom:0;
display:block;
width:100%;
height:34px;
padding:6px 12px;
font-size:16px;
line-height:1.42857143;
border:1px solid #ccc;
border-radius:4px;
outline:none;
transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.blura{
text-align:center;
}

.ai:hover{
text-decoration:none;
}

</style>

</head>
<body>
<jsp:include page="../petHomepage.jsp"></jsp:include>
	
	<div class="container">
	<h4>購物車
        <span  style="color:black">
          <i class="fa fa-shopping-cart"></i>
          <b></b>
        </span>
    </h4>
    <hr> 
    </div>
	  
	<div id="app">
    <div class="container">
        <div class="item_header shadow">
            <div class="item_detail">商品</div>
            <div class="price">單價</div>
            <div class="count">數量</div> 
            <div class="amount">總計</div>
            <div class="operate">操作</div>
        </div>
        <c:forEach var="m" items="${cart_session}" varStatus="status">
<%--           <c:if test="${status.last}"> --%>
        <input class="sou" style="display:none" value='${status.count}'>
<%--          </c:if> --%>
        
        <div class="item_header  item_body shadow">
            <div class="item_detail">
                <img src="${cart_session[m.key].src}" alt="">
                <a href="<c:url value='/commodity?commodityID=${cart_session[m.key].commodityid}' />" class="ai">
                	<div class="name">${cart_session[m.key].name}</div>
                </a>
            </div>

           <span>$</span> <div id="cp9${cart_session[m.key].commodityid}" class="price pri">${cart_session[m.key].price}</div>
            <div class="count">
                 <input id="${cart_session[m.key].commodityid}" type="button" value="-" class="del"/>
                 <input id="bp8${cart_session[m.key].commodityid}" type="text" style="width:50px" class="blura quantityforsql"  value="${cart_session[m.key].quantity}" oninput="value=value.replace(/[^\d]/g,'')">
                 <input id="${cart_session[m.key].commodityid}" type="button" value="+" class="add"/>
            </div> 
            <span>$</span> <div id="cp8${cart_session[m.key].commodityid}" class="amount total">${cart_session[m.key].price}</div>
            <div class="operate">
                 <button id="${cart_session[m.key].commodityid}" class="lete red button">刪除</button>
                 <!-- 傳給後端處理的資料 -->
                 <input class="xxaaqq"  style="display:none" value='${cart_session[m.key].name+=cart_session[m.key].price+="元"+="X"+=cart_session[m.key].quantity+="#"}'>
                	
                 <input class="itemforsql" style="display:none" value="${cart_session[m.key].commodityid}">
                 <!-- ------------- -->
            </div>
            <input id="bp-${cart_session[m.key].commodityid}" style="display:none" value="${cart_session[m.key].commodityid}">
            <input id="bp0${cart_session[m.key].commodityid}" style="display:none" value="${cart_session[m.key].name}">
            <input id="bp9${cart_session[m.key].commodityid}" style="display:none" value="${cart_session[m.key].price}">
            
        </div>
        </c:forEach>
        <hr>
   	<div  style="float:right;align-items:center;width: 350px;">
   			<div style="margin-bottom:3px">
   				<h4 style="background:#F0F0F0;align:center">訂單資訊</h4>
   			</div>
   		<div class="shadow" style="padding:10px;background: #fff">	
    			<div>
    				<div class="goa" id="ofdg" style="font-size:18px;display:none">已享用之優惠</div>
    					<div class="ma1" id="ofa" style="display:none">
    						<span class="qaza">優惠促銷</span><span class="hid textorder">$499免運費</span>
    					</div>
    					<div class="ma1" id="ofb" style="display:none">
    						<span class="qaza">優惠促銷</span><span class="hit textorder">消費滿$500折扣碼九折一張</span>
    						<div style="float:right;font-size:14px" id="asw"></div>
    					</div>
    					
    			</div>
    		<br>
    		<br>
    		<div class="ma1">
        		小計:<span class="total-price textorder"></span>
        	</div>
        	<div class="ma1">
        		運費:<span class="ttt textorder"></span>
        	</div>
        <hr>
        	<div class="ma1">	
        		合計:<span class="totoal-price textorder"></span>
        	</div>	
        	<button class="QOOA ai" >前往結帳</button>
    	</div>
    	 
    </div>
   
    
    <div  style="float:left;align-items:center;width: 705px;">
   			<div style="margin-bottom:3px">
   				<h4 style="background:#F0F0F0;align:center">選擇送貨及付款方式</h4>
   			</div>
   	<form>
   		<div class="shadow" style="padding:25px;background: #fff">	
    		<div>
    			<label class="labe">送貨地點</label>
    			<span>
    				<select class="sele">
    					<option value="TW" selected>台灣</option>
    				</select>
    			</span>
    		</div>
    		<div>
    			<label class="labe">送貨方式</label>
    			<span>
    				<select class="sele">
    					<option value="TWHOME" selected>台灣本島宅配</option>
    				</select>
    			</span>
    		</div>
    		<div>
    			<label class="labe">付款方式</label>
    			<span>
    				<select id="paytype" class="sele">
    					<option value="paypay" selected>貨到付款</option>
    					<option value="Credit" selected>線上刷卡</option>
    				</select>
    			</span>
    		</div>
    		
    	</div>
    </form>
    
    </div>
   
    <div  style="margin-top:5px;float:left;align-items:center;width:600px;">
   			<div style="margin-bottom:3px;margin-top:20px">
   				<h4 style="background:#F0F0F0;align:center">送貨資料</h4>
   			</div>
   		<form>
   		<div class="shadow" style="padding:25px;background: #fff">	
   			<label class="labe">
   				<input type="checkbox" id="samesame">收件人資料與會員資料相同
   			</label>
    		<div>
    			<label  for="aaname" class="labe">收件人名稱</label>
    			<input  id="aaname" class="sele" type="text"></input>
    			<span class="labe">請填入收件人真實姓名，以確保順利收件</span>	
    		</div>
    		<div>
    			<label  for="aatel" class="labe">收件人電話號碼</label>
    				<input  id="aatel" class="sele" type="text" oninput="value=value.replace(/[^\d]/g,'')"  maxlength="10"></input>
    				
    				<hr>
    		</div>
    		<div style="font-size:16px">地址</div>
    		<div>
    			<p class="labe">送貨地點:台灣</p>
    			<input  id="aaaddress" class="sele" type="text" placeholder="地址"></input>
    		</div>
    		
    	</div>
    </form>
    </div>
    
    <div  style="margin-top:5px;float:right;align-items:center;width:500px;">
   			<div style="margin-bottom:3px">
   				<h4 style="background:#F0F0F0;align:center">會員資料</h4>
   			</div>
   		<form>
   		<div class="shadow" style="padding:25px;background: #fff">	
    		<div>
    			<label  for="aamembername" class="labe">會員名稱</label>
    			<input  readonly id="aamembername" class="sele" type="text" value="${member.lastName += member.firstName}" ></input>
    		</div>
    		<div>
    			<label  for="aaemail" class="labe">電子信箱</label>
    				<input  id="aaemail" class="sele" type="text" value="${member.email }"></input>
    				<span class="labe">請填入訂單通知Email(訂單資訊將以此E-mail通知您)</span>		
    		</div>
    		<div id="akakak">
    		</div>
    		
    		<div>
    			
    			<label  for="aamembertel" class="labe">電話號碼</label>
    			<input readonly  id="aamembertel" class="sele" type="text" value="${member.phone}"></input>
    			<input id="aamemberaddress" style="display:none" value="${member.address }">
    			<input id="aamemberid" style="display:none" value="${member.memberID}">
    			<input id="aacredit" style="display:none" value="${creditcard}">
    		</div>
    		
    	</div>
    </form>
    </div>
    
    </div>
</div>
</body>
<script>
var x = 60
var a = $(".total");
var m = 0;
if(m == 0){
	x = 0;
}
for(var i=0;i<a.length;i++){
    m+=Number(a[i].textContent);
    
}
if (m>0){
	x = 60;
}
var sbqp = parseInt(m/500); //折扣碼數量
if(m > 499){
	x = 0
	$("#ofdg").css('display','block')
	$("#ofa").css('display','block')
}
if(m > 500){
	$("#ofb").css('display','block')
	
	$("#asw").text("您所消費的金額共可獲得"+sbqp+"張折扣碼")
}

var total = parseInt(x)+parseInt(m); //運費+總金額
$(".ttt").text("NT$"+x);
$(".total-price").text("NT$"+m);


$(".totoal-price").text("NT$"+total)


//==
// $(".quantityforsql").onchange(function(){
	//改text的時候
// 	把TEXT的值 傳到xxaaqq2的VALUE
// })
//==



$(".QOOA").click(function(){
	
	
	
	var orderTotalPrice = $(".totoal-price").text().substring(3);
	console.log(orderTotalPrice)
	var shippingAddress = $("#aaaddress").val();
	console.log(shippingAddress)
	var receiverName = $("#aaname").val();
	console.log(receiverName)
	var receiverPhone = $("#aatel").val();
	console.log(receiverPhone)
	var choosePayment = $("#paytype").val();
	console.log(choosePayment)
	var memberid = $("#aamemberid").val();
	console.log(memberid);
	var creditCard = $("#aacredit").val();
	console.log(creditCard)
	var email = $("#aaemail").val();
	//訂單內容傳給資料庫
	var order = {};
	itemforsql="";
	var vpn = document.querySelectorAll("input.itemforsql");
		for(var itemforsqlq of vpn){
			console.log(itemforsqlq.value);
			itemforsql+=itemforsqlq.value+",";
		}
		itemforsql.substring(0,itemforsql.length-1);
		order.itemforsql = itemforsql.substring(0,itemforsql.length-1);
		console.log(order.itemforsql)
	//訂單商品數量
	quantityforsql="";
	var vdn = document.querySelectorAll("input.quantityforsql");

	for(var quantityforsqlq of vdn){
		console.log(quantityforsqlq.value);
		quantityforsql+=quantityforsqlq.value+",";
	}
	order.quantityforsql = quantityforsql.substring(0,quantityforsql.length-1);
	console.log(order.quantityforsql)
	//將要傳到綠界的商品資訊抓出來
	var itemname ="";
	
	
	var vbn = document.querySelectorAll("input.xxaaqq");
		for (var item of vbn) {
			  		console.log(item.value);
			  		itemname+=item.value;
			}
	var itemName = itemname.substring(0,itemname.length-1);
	console.log(itemName)
	//---------------------
	if(orderTotalPrice == 0){
		swal({
			  title: "您並沒有選購任何商品！",
			  text: "請挑選商品在進行結帳",
		})
		return
	}
	
	if($("#aaname").val() == ""){
		swal({
			  title: "由於您並沒有填寫收件人名稱！",
			  text: "請填寫收件人名稱",
		})
		return
	}
	
	if($("#aatel").val() == ""){
		swal({
			  title: "由於您並沒有填寫收件人電話！",
			  text: "請填寫收件人電話",
		})
		return
	}
	
	if($("#aaaddress").val() == ""){
		swal({
			  title: "由於您並沒有填寫收件地址資訊！",
			  text: "請填寫收件地址資訊",
		})
		return
	}
	
	if(creditCard == "[]"){
		swal({
			  title: "由於您並沒有信用卡資訊！",
			  text: "請新增信用卡資訊唷",
			}).then(function () {
				window.location.href="<c:url value='/insertPersonalCreditCard'/>";
				
		    })
		    return
	}
	
	order.orderTotalPrice = orderTotalPrice;
	order.shippingAddress = shippingAddress;
	order.receiverName = receiverName;
	order.receiverPhone = receiverPhone;
	order.choosePayment = choosePayment;
	order.memberid = memberid;
	order.itemName = itemName;
	order.email = email;
	var xhr = new XMLHttpRequest();
	xhr.open("POST","<c:url value='/order'/>",true);
	xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
	xhr.send(JSON.stringify(order));
	xhr.onreadystatechange = function (){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log("xhr.responseText==>"+xhr.responseText);
			
			var obj = JSON.parse(xhr.responseText);
			console.log(obj)
			$(akakak).append(obj.SSS)
			

				
				
			}
		}
     
	})


var ddaa;
ddaa = true;
$("#samesame").click(function(){
		console.log("+"+ddaa)
		if(ddaa){
		var membername = $("#aamembername").val();
		var memberaddress = $("#aamemberaddress").val();
		var membertel = $("#aamembertel").val();
		$("#aaname").val(membername);
		$("#aatel").val(membertel);
		$("#aaaddress").val(memberaddress);
		ddaa = false;
		console.log("-"+ddaa)
 		}
		else {
			console.log("A"+ddaa)
		$("#aaname").val("");
		$("#aatel").val("");
		$("#aaaddress").val("");
		ddaa = true;
		console.log("B"+ddaa)
		
		}
})



$(".lete").click(function(e){
	var id_index = e.target.id;
	var reali = "#bp-"+id_index;
	
	swal({
		title: "確定要移除這個商品嗎？",
	    icon: "warning",
	    buttons: {
	      Btn: false,
	      cancel: {
	        text: "取消",
	        visible: true
	        
	      },
	      confirm: {
	        text: "確認",
	        visible: true

	      },
	    }
	}).then((confirm) => {
		if (confirm){
	    	var xhr = new XMLHttpRequest();
	 		
			xhr.open("POST","<c:url value='/smallcart?delete="+id_index+"'/>",true);
			
			xhr.setRequestHeader('Content-type', 'application/json;charset=utf-8');
			console.log('${cart_session}')
			param = {};
			param.id = "sss"; //隨便塞
			 
			

			xhr.send(JSON.stringify(param));
			window.location.replace(window.location.href);
			}
	    });
	  });

// 	var yes = confirm('確定要移除這個商品嗎？');

// 	if (yes) {
 		
// 		var xhr = new XMLHttpRequest();
 		
// 		xhr.open("POST","<c:url value='/smallcart?delete="+id_index+"'/>",true);
		
// 		xhr.setRequestHeader('Content-type', 'application/json;charset=utf-8');
// 		console.log('${cart_session}')
// 		param = {};
// 		param.id = "sss"; //隨便塞
		 
		

// 		xhr.send(JSON.stringify(param));
// 		window.location.replace(window.location.href);
// 		 }
	
	
// })

$(".add").click(function(e){
	var id_index = e.target.id;
	var reali = "#bp-"+id_index;
	var reala = "#bp0"+id_index;
	var realx = "#bp9"+id_index;
	var realq = "#bp8"+id_index;
	
		
	
	
	var good_num = "#bp8"+id_index;   //找到商品數量
 	var old_num = $(good_num).val();  //獲取商品數量的值
 	var new_num = parseInt(old_num)+1;  //商品數量+1
 	$(good_num).val(new_num);		  //商品數量賦值
 
 	var one_price = "#cp9"+id_index;
 		console.log($(one_price).text())
 	var new_money= parseInt($(one_price).text())*parseInt($(good_num).val());
 		console.log(new_money)
 	var total_price = "#cp8"+id_index;	
 		console.log($(total_price).text())
 		$(total_price).text(new_money);
	
	var a = $(".total");
	console.log(a)
	var m=0;
	 
	 console.log(m)
	 
	var param = {};
	param.commodityid = $(reali).val();
 	param.quantity = new_num
//  	param.totalprice = m; //可能要另外傳
//  	console.log(param.totalprice)
	 var xhr = new XMLHttpRequest();
	 xhr.open("POST","<c:url value='/cartcheck'/>",true);
	 xhr.setRequestHeader('Content-type','application/json;charset=UTF-8');
	 xhr.send(JSON.stringify(param));
	 
	 xhr.onreadystatechange = function (){
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log("xhr.responseText==>"+xhr.responseText);
				
				var obj = JSON.parse(xhr.responseText);
				console.log(obj.stockquantity)
				console.log(parseInt(obj.stockquantity))
				if(parseInt(obj.stockquantity)<new_num){
					alert("庫存量不足 庫存量剩下:"+obj.stockquantity+"件")
					
					console.log(new_num)
					$(good_num).val(obj.stockquantity);
					new_money = parseInt($(one_price).text())*parseInt(obj.stockquantity);
					$(total_price).text(new_money);
					//合計
					for(var i=0;i<a.length;i++){
				         m+=Number(a[i].textContent);
				         
				     }
					var sbqp = parseInt(m/500); //折扣碼數量
					//計算免運
					if(m > 499){
						x = 0;
						console.log("QQ="+x)
						$("#ofdg").css('display','block')
						$("#ofa").css('display','block')
					}
					if(m > 500){
						$("#ofb").css('display','block')
						$("#asw").text("您所消費的金額共可獲得"+sbqp+"張折扣碼")
					}
					//運費
					$(".ttt").text("NT$"+x);
					var total = parseInt(x)+parseInt(m);
					$(".total-price").text("NT$"+m);
					$(".totoal-price").text("NT$"+total)
					
				}else{
					//合計
					 for(var i=0;i<a.length;i++){
				         m+=Number(a[i].textContent);
				     }
					 var sbqp = parseInt(m/500); //折扣碼數量
					//計算免運
					 if(m > 499){
							x = 0;
							console.log("QQ="+x)
							$("#ofdg").css('display','block')
							$("#ofa").css('display','block')
						}
					 if(m > 500){
							$("#ofb").css('display','block')
							$("#asw").text("您所消費的金額共可獲得"+sbqp+"張折扣碼")
						}
					//運費
					$(".ttt").text("NT$"+x);
					//運費 小計加總
					 var total = parseInt(x)+parseInt(m);
					//小計
					 $(".total-price").text("NT$"+m); 
					 $(".totoal-price").text("NT$"+total)
				}
			}
	 }
	
})

$(".del").click(function(e){
	
	
	
	var id_index = e.target.id;
	
	var reali = "#bp-"+id_index;
	var reala = "#bp0"+id_index;
	var realx = "#bp9"+id_index;
	var realq = "#bp8"+id_index;
	var good_num = "#bp8"+id_index;   //找到商品數量
 	var old_num = $(good_num).val();  //獲取商品數量的值
 	var new_num = parseInt(old_num)-1;  //商品數量+1
 	$(good_num).val(new_num);		  //商品數量賦值
        if(new_num<1){
//                 alert("再減就沒有了！");
//                 $(good_num).val(1);;


//         	swal({
//         		title: "確定要移除這個商品嗎？",
//         	    icon: "warning",
//         	    buttons: {
//         	      Btn: false,
//         	      cancel: {
//         	        text: "取消",
//         	        visible: true
        	        
//         	      },
//         	      confirm: {
//         	        text: "確認",
//         	        visible: true

//         	      },
//         	    }
//         	}).then((confirm) => {
//         		if (confirm){
//         	    	var xhr = new XMLHttpRequest();
        	 		
//         			xhr.open("POST","<c:url value='/smallcart?delete="+id_index+"'/>",true);
        			
//         			xhr.setRequestHeader('Content-type', 'application/json;charset=utf-8');
//         			console.log('${cart_session}')
//         			param = {};
//         			param.id = "sss"; //隨便塞
        			 
        			

//         			xhr.send(JSON.stringify(param));
//         			window.location.replace(window.location.href);
//         			}else{
//         				$(good_num).val(1)
//         			}
//         	    });
        	 

			
                var yes = confirm('確定要移除這個商品嗎？');

            	if (yes) {
             		
            		var xhr = new XMLHttpRequest();
             		
            		xhr.open("POST","<c:url value='/smallcart?delete="+id_index+"'/>",true);
            		
            		xhr.setRequestHeader('Content-type', 'application/json;charset=utf-8');
            		console.log('${cart_session}')
            		param = {};
            		param.id = "sss"; //隨便塞
            		 
            		xhr.send(JSON.stringify(param));
            		window.location.replace(window.location.href);
            		 }else{
            			 $(good_num).val(1)
            		 }
            	
        }
        var one_price = "#cp9"+id_index;
 		console.log($(one_price).text())
 	var new_money= parseInt($(one_price).text())*parseInt($(good_num).val());
 		console.log(new_money)
 	var total_price = "#cp8"+id_index;	
 		console.log($(total_price).text())
 		$(total_price).text(new_money);
 	var a = $(".total");
 		console.log(a)
 	var m=0;
 	for(var i=0;i<a.length;i++){
 	         m+=Number(a[i].textContent);
 	    }
 	var sbqp = parseInt(m/500); //折扣碼數量
 	//計算免運
	 if(m < 499){
			x = 60;
			console.log("QQ="+x)
			$("#ofdg").css('display','none')
			$("#ofa").css('display','none')
		}else if(m > 499){
			x = 0;
			$("#ofdg").css('display','block')
			$("#ofa").css('display','block')
		}
	 if(m < 500){
			$("#ofb").css('display','none')
		}else if(m > 500){
			$("#ofb").css('display','block')
			$("#asw").text("您所消費的金額共可獲得"+sbqp+"張折扣碼")
		}
	//運費
	$(".ttt").text("NT$"+x);
	//運費 小計加總
	 var total = parseInt(x)+parseInt(m);
	//小計
	 $(".total-price").text("NT$"+m); 
	 $(".totoal-price").text("NT$"+total)

 	
 		 console.log(m)
 		 
 		 
 		
 		 
 		var param = {};
 		param.commodityid = $(reali).val();
 	 	param.quantity = new_num
// 	  	param.totalprice = m; //可能要另外傳
// 	  	console.log(param.totalprice)
 		 var xhr = new XMLHttpRequest();
 		 xhr.open("POST","<c:url value='/cartcheck'/>",true);
 		 xhr.setRequestHeader('Content-type','application/json;charset=UTF-8');
 		 xhr.send(JSON.stringify(param));
 		 
 		 xhr.onreadystatechange = function (){
 				if(xhr.readyState == 4 && xhr.status == 200){
 					console.log("xhr.responseText==>"+xhr.responseText);
 					
 					var obj = JSON.parse(xhr.responseText);
 					console.log(obj.stockquantity)
 					
 				}
 		 }
})

$(".blura").blur(function(e){
	
	
	
	var id_index = e.target.id;
	id_index = id_index.replace("bp8","");
	console.log(id_index)
	var reali = "#bp-"+id_index;
	var reala = "#bp0"+id_index;
	var realx = "#bp9"+id_index;
	var realq = "#bp8"+id_index;
	
	console.log(id_index)
	
		
	
	
	var good_num = "#bp8"+id_index;   //找到商品數量
	console.log(good_num)
 	var old_num = $(good_num).val();  //獲取商品數量的值
 	$(good_num).val(old_num);
 	console.log(old_num);
 	if(parseInt(old_num)==0){
 		alert("請重新輸入數量")
 		$(good_num).val(1)
 	}
 	var one_price = "#cp9"+id_index;
		console.log($(one_price).text())
	var new_money= parseInt($(one_price).text())*parseInt($(good_num).val());
		console.log(new_money)
	var total_price = "#cp8"+id_index;	
		console.log($(total_price).text())
		$(total_price).text(new_money);

var a = $(".total");
console.log(a)
var m=0;
 
 console.log(m)
 
var param = {};
param.commodityid = $(reali).val();
	param.quantity = old_num
//	param.totalprice = m; //可能要另外傳
//	console.log(param.totalprice)
 var xhr = new XMLHttpRequest();
 xhr.open("POST","<c:url value='/cartcheck'/>",true);
 xhr.setRequestHeader('Content-type','application/json;charset=UTF-8');
 xhr.send(JSON.stringify(param));
 
 xhr.onreadystatechange = function (){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log("xhr.responseText==>"+xhr.responseText);
			
			var obj = JSON.parse(xhr.responseText);
			console.log(obj.stockquantity)
			console.log(parseInt(obj.stockquantity))
			if(parseInt(obj.stockquantity)<old_num){
				alert("庫存量不足 庫存量剩下:"+obj.stockquantity+"件")
				
				console.log(old_num)
				$(good_num).val(obj.stockquantity);
				new_money = parseInt($(one_price).text())*parseInt(obj.stockquantity);
				$(total_price).text(new_money);
				//合計
				for(var i=0;i<a.length;i++){
			         m+=Number(a[i].textContent);
			         
			     }
				var sbqp = parseInt(m/500); //折扣碼數量
				//計算免運
				if(m > 499){
					x = 0;
					console.log("QQ="+x)
					$("#ofdg").css('display','block')
					$("#ofa").css('display','block')
				}
				if(m > 500){
					$("#ofb").css('display','block')
					$("#asw").text("您所消費的金額共可獲得"+sbqp+"張折扣碼")
				}
				//運費
				$(".ttt").text("NT$"+x);
				var total = parseInt(x)+parseInt(m);
				$(".total-price").text("NT$"+m);
				$(".totoal-price").text("NT$"+total)
				
			}else{
				//合計
				 for(var i=0;i<a.length;i++){
			         m+=Number(a[i].textContent);
			     }
				 var sbqp = parseInt(m/500); //折扣碼數量
				//計算免運
				 if(m > 499){
						x = 0;
						console.log("QQ="+x)
						$("#ofdg").css('display','block')
						$("#ofa").css('display','block')
					}
				 if(m > 500){
						$("#ofb").css('display','block')
						$("#asw").text("您所消費的金額共可獲得"+sbqp+"張折扣碼")
					}
				//運費
				$(".ttt").text("NT$"+x);
				//運費 小計加總
				 var total = parseInt(x)+parseInt(m);
				//小計
				 $(".total-price").text("NT$"+m); 
				 $(".totoal-price").text("NT$"+total)
			}
		}
	} 
 })
</script>
</html>