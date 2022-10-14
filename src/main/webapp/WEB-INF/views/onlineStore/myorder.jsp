<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>寵你 只寵愛你</title>
<style>
.button.red {
	background-color: #ca3535;
	border-color: #c43c35;
	color: #fff;
	text-shadow: 0 1px 0 rgba(0, 0, 0, .2);
	background-image: -webkit-linear-gradient(top, rgba(255, 255, 255, .3),
		rgba(255, 255, 255, 0));
	padding: 4px 12px;
}

body {
	background-color: rgba(0, 0, 0, .2);
}

.item_header {
	display: flex;
	width: 1100px;
	margin: 0 auto;
	height: 30px;
	background-color: #fff;
	border-radius: 3px;
	padding-left: 10px;
}

.pri {
	width: 175px;
}

.count {
	width: 230px;
}

.total {
	width: 220px;
}

.item_header div {
	width: 200px;
	color: #888;
	line-height: 30px;
}

.item_header .item_detail {
	width: 40%;
}

.item_body {
	margin-top: 10px;
	height: 100px;
	align-items: center;
}

.item_detail img {
	width: 80px;
	height: 80px;
	border-radius: 3px;
	/* margin-top: 10px; */
	float: left;
}

.item_detail .name {
	margin-left: 5px;
	margin-top: 0px;
}

.textorder {
	float: right;
}

.ma1 {
	margin-bottom: 3px;
}

.qaza {
	background-color: #cf5454;
	padding: 2px 10px 2px 10px;
	color: #FFF;
	width: 100px;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
	color: black;
}

.QOOA {
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 16px;
	border-radius: 4px;
	margin-top: 5px;
	color: #00303c !important;
	background-color: rgba(0, 0, 0, 0) !important;
	border: 2px solid #00303c !important;
	transition: color .25s, background .25s;
	text-decoration: none;
	display: block;
	width: 100%;
	margin-bottom: 0;
	text-align: center;
	white-space: nowrap;
}

.labe {
	display: inline-block;
	max-width: 100%;
	margin-bottom: 5px;
	font-size: 14px;
}

.sele {
	text-align: left;
	/* border-color:#ccc !important; */
	color: #555 !important;
	margin-bottom: 0;
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 16px;
	line-height: 1.42857143;
	border: 1px solid #ccc;
	border-radius: 4px;
	outline: none;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.blura {
	text-align: center;
}

.ai:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>

	<div>
		<c:choose>
			<c:when test="${userAccount eq 'Admin' }">
				<jsp:include page="aaaa.jsp"></jsp:include>

				<h1 style="margin-left: 21%;">
					會員訂單 <span style="color: black"> <i
						class="fas fa-address-book fa-lg"></i> <b></b>
					</span>
				</h1>

			</c:when>
			<c:otherwise>
				<jsp:include page="search.jsp"></jsp:include>
				<h2>
					我的訂單 <span style="color: black"> <i
						class="fas fa-address-book fa-lg"></i> <b></b>
					</span>
				</h2>
			</c:otherwise>
		</c:choose>

		<hr>
	</div>

	<div id="app">
		<div class="container">
			<div class="item_header shadow">
				<div class="item_detail">訂單編號</div>
				<div class="price">收件人</div>
				<div class="count">收件地址</div>
				<div class="amount">收件電話</div>
				<div class="operate">總金額</div>
				<c:choose>
					<c:when test="${userAccount eq 'Admin' }">
						<div class="memberid">會員編號</div>
					</c:when>
					<c:otherwise>
						<div class="controll">操作</div>
					</c:otherwise>
				</c:choose>



			</div>
			<c:choose>
				<c:when test="${userAccount eq 'Admin' }">
			<c:forEach var='m' items='${myorder}'>
				<div class="item_header  item_body shadow">
					<div class="item_detail">
						<a href="<c:url value='/myorderitem/${m.storeOrdersBean.orderID}'/>" class="ai">
							<div class="name">${m.storeOrdersBean.orderNumber}</div>
						</a>
					</div>

					<div class="price pri">${m.storeOrdersBean.receiverName}</div>
					<div class="count">${m.storeOrdersBean.shippingAddress}</div>
					<div class="amount total">${m.storeOrdersBean.receiverPhone}</div>
					<div class="operate">${m.storeOrdersBean.orderTotalPrice}</div>

					<c:choose>
						<c:when test="${userAccount eq 'Admin' }">
							<div class="memberid">${m.storeOrdersBean.member.memberID}</div>
						</c:when>
						<c:otherwise>
							<div class="operate">
								<button id="${m.orderID}" class="red button">申請退貨</button>
							</div>
						</c:otherwise>
					</c:choose>

				</div>
				</c:forEach>
			</c:when>
				<c:otherwise>
				<c:forEach var='m' items='${myorder}'>
				<div class="item_header  item_body shadow">
					<div class="item_detail">
						<a href="<c:url value='/myorderitem/${m.storeOrdersBean.orderID}'/>" class="ai">
							<div class="name">${m.storeOrdersBean.orderNumber}</div>
						</a>
					</div>

					<div class="price pri">${m.storeOrdersBean.receiverName}</div>
					<div class="count">${m.storeOrdersBean.shippingAddress}</div>
					<div class="amount total">${m.storeOrdersBean.receiverPhone}</div>
					<div class="operate">${m.storeOrdersBean.orderTotalPrice}</div>
					<input id="bp${m.oid}" style="display:none"></input>
					<c:choose>
						<c:when test="${userAccount eq 'Admin' }">
							<div class="memberid">${m.storeOrdersBean.member.memberID}</div>
						</c:when>
						<c:otherwise>
							<div class="operate">
								<button id="${m.oid}" class="red button">申請退貨</button>
							</div>
						</c:otherwise>
					</c:choose>

				</div>
				</c:forEach>
			</c:otherwise>
			</c:choose>
</body>
<script>
$(".container").css('margin-left','290px');

$(".button").click(function(e){
	var id_index = e.target.id;
	console.log(id_index);
	var cancel = {};
	cancel.sob = id_index;
	cancel.reason ="";
	cancel.state = "待審核";
	cancel.oid = id_index;
	var reason = {};
	reason.a = "商品與預期不符";
	reason.b = "商品缺件";
	reason.c = "我收到不對的商品";
	reason.d = "商品有毀損";
	reason.e = "商品部分功能無法使用";
	
	Swal.fire({
		  title: '請填寫退貨原因',
		  input: 'select',
		  inputOptions:{reason},
		  
		  width:'1000px'	,
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '確認',
		  
		}).then((result) => {
			
		  if (result.isConfirmed) {
// 			  console.log(reason[result.value]);
			  cancel.reason = reason[result.value];
// 			  console.log(cancel.state)
// 			  console.log(cancel.reason)
// 			  console.log(cancel.sob)
			  	var xhr = new XMLHttpRequest();
 				 xhr.open("POST","<c:url value='/cancelorder'/>",true);
 		 			xhr.setRequestHeader('Content-type','application/json;charset=UTF-8');
 					 xhr.send(JSON.stringify(cancel));
		    
 			Swal.fire({
		      title: '已為您提交 待審核',
		    }).then((result) => {
		    	window.location.replace(window.location.href);
		    })
		    
		  }
		  
		})
	
// 	swal({
// 		  title: '請填寫退貨原因',
// 		  content: "input",
// 		showCancelButton: true
		  
		
// 		}).then((value) => {
// 			  console.log(value);
// 		});
})


</script>
</html>