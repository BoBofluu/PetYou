<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<script>
		window.onload=function(){
			Swal.fire({
	            title: "找不到資料",
	            showCancelButton: false
	        }).then(function(result) {
	           if (result.value) {
	        	   location.href="<c:url value='/activitys'/>";
	           }
	           else {
	        	   ;
	           }
	        });
		}
	</script>
</body>
</html>