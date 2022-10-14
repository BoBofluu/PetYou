<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
#map {
	height: 625px;
	width: 75%;
	float: right;
	border-radius: 10px;
	background-image: linear-gradient(to top, #fad0c4 0%, #ffd1ff 100%);
}

#allPet {
	display: inline-block;
	height: 625px;
	width: 25%;
	/* 	background-color: white; */
	border-radius: 10px;
	overflow: auto;
}

#eachPet:hover {
	-moz-box-shadow: inset 0 0 10px #000000;
	-webkit-box-shadow: inset 0 0 10px #000000;
	box-shadow: inset 0 0 10px #000000;
}

tr td:nth-child(1) {
	width: 200px;
}
</style>

</head>

<body>

	<jsp:include page="../HomePage.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

	<div id="allPet">
		<c:forEach var="map" items="${ab}">
			<div id="eachPet">
				<div style="display: inline-block; margin-left: 20px;">
					<img alt='dog' height="80px" width="80px"
						style='border-radius: 50px; display: table-cell; vertical-align: middle; margin-top: 10px; border: 3px solid #af2e41'
						src='<c:url value="/adoption/getPicture/${map.adoptionInfoID}" />' />
				</div>
				<div style="display: inline-block;">
					<div class="btn-group btn-group-sm" role="group"
						aria-label="${map.petSex}"
						style="font-size: 12pt; margin-left: 10%; background-color: #F6B0AC; margin-top: 10px; margin-bottom: 10px; padding: 3px; border-radius: 5px;">${map.petSex}</div>
					<div class="btn-group btn-group-sm" role="group"
						style="font-size: 12pt; background-color: #F6B0AC; padding: 3px; border-radius: 5px; margin-top: 10px; margin-bottom: 10px"
						aria-label="${map.ageYear}${map.ageMonth}">${map.ageYear}歲${map.ageMonth}個月</div>
					<br>
					<button type="button" class="btn btn-danger btn-lg btn-block"
						data-toggle="modal"
						data-target="#exampleModal${map.adoptionInfoID}" data-whatever=""
						style="height: 40px; font-size: 15pt; line-height: 15px; width: 200px; margin-left: 10%">${map.petName}<img
							src="https://img.icons8.com/color/22/000000/kawaii.png" />詳細資料
					</button>
				</div>
				<hr>
			</div>


			<div class="modal fade" id="exampleModal${map.adoptionInfoID}"
				tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel${map.adoptionInfoID}"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title"
								style="color: #af2e41; font-weight: 600; font-size: 28pt"
								id="exampleModalLabel${map.adoptionInfoID}">
								<img
									src="https://img.icons8.com/cotton/45/000000/dog-heart--v3.png" />${map.petName}</h5>
						</div>
						<div class="modal-body">
							<form>
								<div class="form-group">
									<img alt='dog' width='300px' style='margin-bottom: 10px'
										src='<c:url value="/adoption/getPicture/${map.adoptionInfoID}" />' />
								</div>
								<div class="form-group">
									<label for="message-text${map.adoptionInfoID}"
										class="col-form-label"
										style="font-weight: 600; font-size: larger;"><img
										src="https://img.icons8.com/plasticine/40/000000/info-squared.png" />基本資料</label>
									<table>
										<tr>
											<td>姓名：${map.petName}</td>
											<td>年齡：${map.ageYear}歲${map.ageMonth}個月</td>
										</tr>
										<tr>
											<td>體型：${map.size}</td>
											<td>品種：${map.breed}</td>
										</tr>
										<tr>
											<td>毛色：${map.furColor}</td>
											<td>領養地點：${map.adoptCity}${map.adoptDistrict}</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">關閉</button>
							<a style="color: white; font-weight: 600" type="button"
								class="btn btn-danger" onclick="toSingle(${map.adoptionInfoID})">前往詳細頁面</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div id="map"></div>
	<c:forEach var="map" items="${ab}">
		<input hidden="hidden" type="text" value="${map.petName}"
			class="petMap">
		<input hidden="hidden" type="text" value="${map.petType}"
			class="petType">
		<input hidden="hidden" type="text"
			value="${map.adoptCity}${map.adoptDistrict}" class="petLocation">
		<input hidden="hidden" type="text" value="${map.adoptionInfoID}"
			class="petID">

	</c:forEach>
	<script>
		console.log($(" input[ type='text' ] ").val())
		var arr = [];
		$(" input[ class='petMap' ] ").each(function() {
			arr.push($(this).val());
		})

		var arrType = [];
		$(" input[ class='petType' ] ").each(function() {
			arrType.push($(this).val());
		})

		var arrLocation = []
		$(" input[ class='petLocation' ] ").each(function() {
			arrLocation.push($(this).val());
		})

		var petID = []
		$(" input[ class='petID' ] ").each(function() {
			petID.push($(this).val());
		})

		var locations = [];
		var sizeOfAB = '${ab.size()}';
		for (var i = 0; i < sizeOfAB; i++) {
			locations.push([ arr[i], arrType[i], arrLocation[i], petID[i] ])
		}

		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 11,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
			});

			var infowindow = new google.maps.InfoWindow();
			var geocoder = new google.maps.Geocoder();

			var marker, i;

			for (i = 0; i < locations.length; i++) {
				geocodeAddress(locations[i]);
			}
			function geocodeAddress(location) {
				geocoder
						.geocode(
								{
									'address' : location[2]
								},
								function(results, status) {
									if (status == google.maps.GeocoderStatus.OK) {
										var a = '<c:url value="/adoption/getPicture/'+location[3]+'" />';
										map
												.setCenter(results[0].geometry.location);
										createMarker(
												results[0].geometry.location, //latlng座標
												"<img alt='dog' width='220px' style='margin-bottom:10px' src='"+a+"' /><h5 style='color:#BF264F;font-weight:600'>浪浪名字："
														+ location[0]
														+ "</h5>浪浪品種："
														+ location[1]
														+ "<br>領養地點："
														+ location[2], //html內文
												location[3]); //url Pattern
									} else if ("OVER_QUERY_LIMIT" == status) {
										return geocodeAddress(location);
									}
								});
			}
			function createMarker(latlng, html, url) {
				var marker = new google.maps.Marker({
					position : latlng,
					map : map,
					icon : "https://img.icons8.com/fluent/55/000000/pets.png",
					url : '/PetYou/showSinglePet/' + url
				});

				google.maps.event
						.addListener(
								marker,
								'mouseover',
								function() {
									infowindow.setContent(html);
									marker
											.setIcon("https://img.icons8.com/dusk/55/000000/pets.png");
									infowindow.open(map, marker);
								});

				google.maps.event.addListener(marker, 'click', function() {
					window.location.href = this.url;
				});
				google.maps.event
						.addListener(
								marker,
								'mouseout',
								function() {
									marker
											.setIcon("https://img.icons8.com/fluent/55/000000/pets.png");
									infowindow.close();
								});
			}
		}
// 		$('#myModal').on('shown.bs.modal', function() {
// 			$('#myInput').trigger('focus')
// 		})
function toSingle(id) {
	location.href='<c:url value="/showSinglePet/'+id+'" />';
}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdGuQy4HWX_HF5unLF1fkVhx0LS-cWvQ4&callback=initMap"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

</html>