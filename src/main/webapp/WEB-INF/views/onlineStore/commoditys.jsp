<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
     <script src="https://code.jquery.com/jquery-latest.js"></script>
    
 <style type="text/css">
.titleone{
/*  border:solid;  */
width:40%;
position:relative;
left:350px;
}
#titlefirst{
/*  border:solid;  */
position:absolute;
left:350px;
width:65%;

}
.EEEE{
/*  border:solid;  */
margin-top:120px;
}
.select1{
position:relative;
left:62%;
/* border:solid;  */
width:36%;
}
.cartid{

 	position:absolute;
 	right:16px;
 	bottom:21px;
    background-color: #F0F0F0; 
    border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;

}

 </style>
<title>寵你 只寵愛你</title>
</head>
<body>
<jsp:include page="../petHomepage.jsp"></jsp:include>
	<jsp:include page="search.jsp"></jsp:include>
	
	
    <div id="titlefirst"><a  href="<c:url value='/commoditys' />">全部商品</a>
    <span> / </span>
    <a href="<c:url value='/commoditys/${aaa}'/>"><span class="category">${aaa}</span></a>
    <span class="category">${bbb}</span>
    
    <div class="select1">
			<select id="commoditySort" onChange="location = this.options[this.selectedIndex].value;">
				<option value="-1">商品排序</option>
				
				<c:choose>
					<c:when test="${bbb!= null}">
						<option value="<c:url value='/commoditys/${aaa}${bbb}?sort=created_at_desc'/>">上架時間:由新到舊</option>
						<option value="<c:url value='/commoditys/${aaa}${bbb}?sort=created_at_asc'/>">上架時間:由舊到新</option>
						<option value="<c:url value='/commoditys/${aaa}${bbb}?sort=price_at_desc'/>">價格:由高至低</option>
						<option value="<c:url value='/commoditys/${aaa}${bbb}?sort=price_at_asc'/>">價格:由低至高</option>
					</c:when>
					<c:when test="${aaa!=null}">
						<option value="<c:url value='/commoditys/${aaa}?sort=created_at_desc'/>">上架時間:由新到舊</option>
						<option value="<c:url value='/commoditys/${aaa}?sort=created_at_asc'/>">上架時間:由舊到新</option>
						<option value="<c:url value='/commoditys/${aaa}?sort=price_at_desc'/>">價格:由高至低</option>
						<option value="<c:url value='/commoditys/${aaa}?sort=price_at_asc'/>">價格:由低至高</option>
					</c:when>
					
					<c:otherwise>
						<option value="<c:url value='/sortla/created_at_desc'/>">上架時間:由新到舊</option>
						<option value="<c:url value='/sortla/created_at_asc'/>">上架時間:由舊到新</option>
						<option value="<c:url value='/sortla/price_at_desc'/>">價格:由高至低</option>
						<option value="<c:url value='/sortla/price_at_asc'/>">價格:由低至高</option>
					</c:otherwise>
				</c:choose>
				
				
				
			</select> 
			<select id="viewQuqntity" onChange="location = this.options[this.selectedIndex].value;">
				<option value="-1">每頁顯示數量</option>
				<option value="12">每頁顯示 12個</option>
				<option value="24">每頁顯示 24個</option>
				<option value="36">每頁顯示 36個</option>
			</select>
		</div>
    </div>
    
    
    
 	
    <section class="container EEEE">
<%--     <a class="category category1"  href="<c:url value='/commoditys/貓'/>">貓</a><span style="display:none" class="category"> / </span> --%>
<!--     <a  class="theme" href="#">食</a> -->
        <div class="row">
        
          <c:forEach var='commodity' items='${commodity}'>
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail shadow" style="width: 320px; height: 340px">
              		<a style="position:relative;left:35.5px" href="<c:url value='/commodity?commodityID=${commodity.commodityID }' />">
                		<img width='150' height='150' src="<c:url value='/getPicture/${commodity.commodityID}'/>"/>
                	</a>
                    <div class="caption">
                        <p>
                            <a href="<c:url value='/commodity?commodityID=${commodity.commodityID }' />" style='font-size: 22px;'>${commodity.commodityName}</a>
                        </p>
                        
                        
                        <p style="float:right">
                        	<a href="<c:url value='/commodity?commodityID=${commodity.commodityID }' />" style='font-size: 22px;color:red'>NT$${commodity.commodityPrice}</a>
                        </p>
                        <div style="float:right">
                        <p class="akf">
                        <input id="bp-${commodity.commodityID}" style="display:none" value="${commodity.commodityID }">
                        <input id="bp0${commodity.commodityID}" style="display:none" value="${commodity.commodityName }">
                        <input id="bp9${commodity.commodityID}" style="display:none" value="${commodity.commodityPrice }">
                        <input id="bp8${commodity.commodityID}" style="display:none" value="<c:url value='/getPicture/${commodity.commodityID}'/>">
                        <input id="bp7${commodity.commodityID}" class="text_box" style="display:none" value="1">
                        <input id="bp6${commodity.commodityID}" style="display:none" value="${commodity.stockQuantity}">
                        
                        <button id="${commodity.commodityID}" class="cartid">加入購物車</button>
						
						</p>
						</div>
                    </div>
                </div>
            </div>
            
           </c:forEach>
        </div>
         
         
         <!-- 分頁 -->
<!--          <div class="pagination"> -->
<%-- 				<c:if test="${param.page-2 > 1}"> --%>
<!-- 					<a style="position: absolute; background-color: #e96681;" -->
<%-- 						href="<spring:url value='/memberSelect?select=${param.select}&btn=${param.btn}&page=1'/>">1</a> --%>
<%-- 				</c:if> --%>
<!-- 				<a id="laquo" style="margin-left: 112px;" -->
<%-- 					href="<spring:url value='/memberSelect?select=${param.select}&btn=${param.btn}&page=${param.page-1}'/>">&laquo;</a> --%>

<!-- 			</div> -->
        
<%--         <c:forEach var="m" items="${cart_session}"> --%>
      
<%--         ${cart_session[m.key].commodityid} --%>
<%--         ${cart_session[m.key].name} --%>
<%--         ${cart_session[m.key].price} --%>
<%--         <img width='150' height='150' src="${cart_session[m.key].src}"/> --%>
        
<%--         </c:forEach> --%>
       
    </section>
      
  
</body>

	<script> 
// 	var pageCount = Math.ceil(${pageCount}/7);
// //		var pageCount = 7;
// 	var page = ${param.page};
// //		var page = 4;
// 	console.log("page:" + page);
// 	console.log("pageCount:" + pageCount);
// 	var select = '${param.select}';
// 	var btn = '${param.btn}';
// 	for (var i = 0; i < 5; i++) {
// 		var sum = (page - 2) + i;
// 		if (sum <= 0)
// 			continue;
// 		if (sum > pageCount)
// 			break;
// 		if (sum == page)
// 			$(".pagination")
// 					.append(
// 							"<a  href='javascript:;' class='active'>" + sum
// 									+ "</a>");
// 		else
// 			$(".pagination").append(
// "<a href=\"<spring:url value='/memberSelect?select="+ select + "&btn="+ btn + "&page="+ sum + "'/>\">" + sum + "</a>");
// 	}
// 	$(".pagination").append(
// "<a id='raquo' href=\"<spring:url value='/memberSelect?select="+ select+ "&btn="+btn+ "&page="+ (page + 1) + "'/>\">&raquo;</a>");
// 	if (page == 1) {
// 		$("#laquo").attr("href", "javascript:;");
// 	}
// 	if (page == pageCount) {
// 		$("#raquo").attr("href", "javascript:;");
// 	}
// 	if (page + 2 < pageCount) {
// 		$(".pagination")
// 				.append(
// "<a style='position: absolute;right: 0;' href=''>" + pageCount + "</a>");
// 	}
	
		$(".cartid").click(function(e){
			
			
			
			var id_index = e.target.id;
			var reali = "#bp-"+id_index;
			var reala = "#bp0"+id_index;
			var realx = "#bp9"+id_index;
			var realq = "#bp8"+id_index;
			var realz = "#bp7"+id_index;
			var realb = "#bp6"+id_index;
			
			
			//bug
// 			var good_num = "#bp7"+id_index;　　　　//找到商品數量
// 		    var old_num = $(good_num).val();　　　　　　　　　　　　　　　//獲取商品數量的值
// 		    if($(".price").children(sss).text()){
// 		    var new_num=parseInt(old_num)+1;　　　　　　　　　　　　　　//商品數量+1
// 		    $(good_num).val(new_num);　　　　　　　　　　　　　　　　　 //商品數量賦值
// 		    }
// 			console.log(old_num)
// 		    console.log(new_num)
			
			
			console.log($(reali).val());
			console.log($(reala).val());
			console.log($(realx).val());
			console.log($(realq).val());
			console.log($(realz).val());
			console.log($(realb).val());
			var id = $(reali).val();
			var name = $(reala).val();	
			var price = $(realx).val();
			var src = $(realq).val();
			
			
			var quantity =  $(realz).val();;
			var stockquantity = $(realb).val();
			
			
			
			
			
			
			var param = {};
			param.commodityid = $(reali).val();
			param.name = $(reala).val();
			param.price = $(realx).val();
			param.src = $(realq).val();
			param.quantity = $(realz).val();;
			param.stockquantity = $(realb).val();
			var sss = ".sp"+id;
			
// 			if(param.quantity > param.stockquantity){
				//庫存量不足 
// 			}
		
			
// 			console.log($(".price").children(sss).text())
// 			$(".price").children(sss).text()
// 			:first-child"  $(".title").parent().find('ul');
// 				if($(".price").children(sss).text()){
// 				console.log($("#saaa").children(".price"+id));
// 				console.log($("#saaa").find(".price"+id).val())
// 				console.log($("#saaa").children(sss))
// 				console.log($("#saaa").children(sss).text())
				console.log($("."+id).val())
				
				if($("."+id).val()){
					alert("此商品已存在於購物車中，請點擊購物車並前往購物車頁調整需要的數量，謝謝")
	 				return;
						
	 			    }else {
	 			    	alert("加入購物車成功")
	 			    }
				
			
				
				
// 				console.log(obj[id_index].commodityid);
				
// 				var xod =parseInt(obj[id_index].commodityid);
// 				console.log(xod)
// 				if(xod){
					
// 					alert("此商品已存在於購物車中，請點擊購物車並前往購物車頁調整需要的數量，謝謝")
// 				return;
					
// 			    }else {
// 			    	alert("加入購物車成功")
// 			    }
				

// 			var array=[];
// 			 array[0] = param;
// 			 array[1] = param;
			
		
		
// 			var data = "commodityid="+ id + "&name=" + name + "&price=" + price + "&src=" + src;
			
			var xhr = new XMLHttpRequest();
			xhr.open("POST","<c:url value='/smallcart'/>",true);
			xhr.setRequestHeader('Content-type','application/json;charset=UTF-8');
			
			
// 			var xhr1 = new XMLHttpRequest();
			
			xhr.send(JSON.stringify(param));
			
			xhr.onreadystatechange = function (){
				if(xhr.readyState == 4 && xhr.status == 200){
					console.log("xhr.responseText==>"+xhr.responseText);
			
// 					var type = xhr.getResponseHeader("Content-Type");
// 						alert("發生錯誤1:" + xhr.status +"," + xhr.responseText);
				
						var obj = JSON.parse(xhr.responseText);
						
						
						
// 						+<img width='10' height='10' src="obj[id_index].src">
// 						+<input type = "button" value="obj[id_index].quantity">
						
						
						
						
						
						
// 						var vala=obj[id_index].src
// 						var val1="<img width='50' height='50' src="+vala+">"
// 						var val2=obj[id_index].name
// 						var val3=obj[id_index].quantity+"&nbsp"+"x"+"&nbsp"
						
// 						var vals="數量:"+"<input id='quantity12' style='width:30px;text-align:center' type = 'text' value="+val3+">"
// 						var val4="NT$"+obj[id_index].price
						
					
							
							
							
// 	 						$(".price").append("<span style='font-size:14px' class='sp"+obj[id_index].commodityid+"'>"+
// 									val1+val2+"&nbsp"+"&nbsp"+val4
// 									+"</span><br>");
	 						
	 						
	 						
						window.location.replace(window.location.href);
// 	 						window.location.reload();
// 	 						window.location = window.location.href;
// 	 						window.location.assign(window.location.href);
						
						
// 						$(".price").append("<span style='font-size:14px' class='sp"+obj[id_index].commodityid+"'>"+
// 								val1+val2+"<br>"+val3+val4
// 								+"</span><br>");
						
						
						
						//
						
						
				
						
// 						$(".price").append("<span class='sp"+obj[id_index].commodityid+"'>"+obj[id_index].name+"</span><br>");
// 						console.log(obj);
								
								
					//	console.log(obj[id_index].name)
					
// 						console.log('${cart_session}');
// 						console.log("${cart_session[123].name }");
						
			  }
			}
			
			
			
 		})
        	
    
    
	
	
// 	window.onload = function(){
// 		var xhr = new XMLHttpRequest();
//         var sort= document.getElementById('commoditySort').value;
//         xhr.open("GET","<c:url value='/sortla/"+sort+"' />",true);//
// 		xhr.send();
        
        	
//         commoditySort.onchange = function(){
        	
//             if(sort!= -1){
            	
            
            	
//                 if(xhr.readyState == 4 && xhr.status == 200){
                	
//              	var getsort = xhr.responseText;
//              	console.log(sort);
//             }
        	
        
//             }    
//         }
//     };

    </script>
</html>