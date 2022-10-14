<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 

<style>
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
	<c:choose>
		<c:when test="${userAccount eq 'Admin' }">
			<jsp:include page="aaaa.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="search.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	

	
	<div >
	<h2>訂單內容
        <span  style="color:black">
          <i class="fas fa-address-book fa-lg"></i>
          <b></b>
        </span>
    </h2>
    <hr> 
    </div>
	  
	<div id="app">
    <div class="container">
        <div class="item_header shadow">
            <div class="item_detail">商品</div>
            <div class="price">單價</div>
            <div class="count">數量</div> 
            <div class="amount">類別</div>
            <div class="operate">購買日期</div>
        </div>
        <c:forEach var="item" items="${orderitem}" >

        
        <div class="item_header  item_body shadow">
            <div class="item_detail">
                <img src="<c:url value='/getPicture/${item.commodityBean.commodityID}'/>" alt="">
                <a href="<c:url value='/commodity?commodityID=${item.commodityBean.commodityID}' />" class="ai">
                	<div class="name">${item.commodityBean.commodityName}</div>
                </a>
            </div>

           <span>$</span> <div  class="price pri">${item.commodityBean.commodityPrice}</div>
            <div class="count"> 
 				${item.quantity}
            </div> 
             <div  class="amount total">${item.commodityBean.commodityTheme}</div>
            <div class="operate">
                <!-- 引入taglib fmt 格式化時間 只抓到分鐘數以前 去掉秒數及以後的小數點 -->
         <fmt:formatDate value="${item.storeordersBean.orderDate }" pattern="yyyy-MM-dd HH:mm"/>
            </div>
           
            
        </div>
        </c:forEach>
</body>
<script>
$(".container").css('margin-left','290px');
</script>
</html>