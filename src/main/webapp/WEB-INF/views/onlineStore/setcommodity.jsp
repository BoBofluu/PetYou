<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
.e04{
/*  border:solid;  */
margin-top:120px;
}
.select1{
position:relative;
left:62%;
/* border:solid;  */
width:36%;
}



 </style>
<title>寵你 只寵愛你</title>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
     <jsp:include page="aaaa.jsp"></jsp:include>
     
<%--     <div id="titlefirst"><a  href="<c:url value='/commoditys' />">全部商品</a> --%>
<!--     <span> / </span> -->
<%--     <a href="<c:url value='/commoditys/${aaa}'/>"><span class="category">${aaa}</span></a> --%>
<%--     <span class="category">${bbb}</span> --%>
    
<!--     <div class="select1"> -->
<!-- 			<select id="commoditySort" onChange="location = this.options[this.selectedIndex].value;"> -->
<!-- 				<option value="-1">商品排序</option> -->
				
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${bbb!= null}"> --%>
<%-- 						<option value="<c:url value='/commoditys/${aaa}${bbb}?sort=created_at_desc'/>">上架時間:由新到舊</option> --%>
<%-- 						<option value="<c:url value='/commoditys/${aaa}${bbb}?sort=created_at_asc'/>">上架時間:由舊到新</option> --%>
<%-- 						<option value="<c:url value='/commoditys/${aaa}${bbb}?sort=price_at_desc'/>">價格:由高至低</option> --%>
<%-- 						<option value="<c:url value='/commoditys/${aaa}${bbb}?sort=price_at_asc'/>">價格:由低至高</option> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${aaa!=null}"> --%>
<%-- 						<option value="<c:url value='/commoditys/${aaa}?sort=created_at_desc'/>">上架時間:由新到舊</option> --%>
<%-- 						<option value="<c:url value='/commoditys/${aaa}?sort=created_at_asc'/>">上架時間:由舊到新</option> --%>
<%-- 						<option value="<c:url value='/commoditys/${aaa}?sort=price_at_desc'/>">價格:由高至低</option> --%>
<%-- 						<option value="<c:url value='/commoditys/${aaa}?sort=price_at_asc'/>">價格:由低至高</option> --%>
<%-- 					</c:when> --%>
					
<%-- 					<c:otherwise> --%>
<%-- 						<option value="<c:url value='/sortla/?sort=created_at_desc'/>">上架時間:由新到舊</option> --%>
<%-- 						<option value="<c:url value='/sortla/created_at_asc'/>">上架時間:由舊到新</option> --%>
<%-- 						<option value="<c:url value='/sortla/price_at_desc'/>">價格:由高至低</option> --%>
<%-- 						<option value="<c:url value='/sortla/price_at_asc'/>">價格:由低至高</option> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
				
				
				
<!-- 			</select>  -->
<!-- 			<select id="viewQuqntity" onChange="location = this.options[this.selectedIndex].value;"> -->
<!-- 				<option value="-1">每頁顯示數量</option> -->
<!-- 				<option value="12">每頁顯示 12個</option> -->
<!-- 				<option value="24">每頁顯示 24個</option> -->
<!-- 				<option value="36">每頁顯示 36個</option> -->
<!-- 			</select> -->
<!-- 		</div> -->
<!--     </div> -->
    
    
    
 	
    <section class="container e04">
<%--     <a class="category category1"  href="<c:url value='/commoditys/貓'/>">貓</a><span style="display:none" class="category"> / </span> --%>
<!--     <a  class="theme" href="#">食</a> -->
        <div class="row">
          <c:forEach var='commodity' items='${commodity}'>
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail shadow" style="width: 320px; height: 340px">
                <img width='150' height='150' src="<c:url value='/getPicture/${commodity.commodityID}'/>"/>
                    <div class="caption">
                        <p>
                            <a href="<c:url value='/setcommodityform?commodityID=${commodity.commodityID}' />" style='font-size: 16px;'>${commodity.commodityName}</a>
                        </p>
                        <p>NT$${commodity.commodityPrice}</p>
                        <p>供應商:${commodity.supplierBean.supplierName }</p>
                        <p>目前在庫數量: ${commodity.stockQuantity}</p>
                        <p></p>
                    </div>
                </div>
            </div>
           
           </c:forEach>
        </div>
         
        
        
    </section>
     
  
</body>

	<script> 
// 	window.onload = function(){
// 		var xhr = new XMLHttpRequest();
//         var sort= document.getElementById('commoditySort').value;
//         xhr.open("GET","<c:url value='/sortla/"+sort+"' />",true);
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