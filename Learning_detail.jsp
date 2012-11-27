<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Learning_detail</title>
<link href="stylesheets/learning.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

</head>
<body>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="content">
		<jsp:include page="share/side.jsp"></jsp:include>
		<section id="learning_detail">
		 <article	class="learning_person">
			<table border="1">
				<tr>
					<td colspan="2"><div id="map_canvas"style="width: 460px; height: 380px;"></div></td>
				</tr>
				<tr>
					<th width="100">위도</th>
					<td id="lat"></td>
				</tr>
				<tr>
					<th>경도</th>
					<td id="lng"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td id="address"></td>
				</tr>
			</table>
		</article> </section>
	</div>
</body>
</html>
<script type="text/javascript">
	$(document).ready(
			function() {
				var latlng = new google.maps.LatLng(37.513357,
						127.10025999999993);

				var myOptions = {
					zoom : 10,
					center : latlng,
					mapTypeId : google.maps.MapTypeId.ROADMAP
				}
				var map = new google.maps.Map(document
						.getElementById("map_canvas"), myOptions);
				var marker = new google.maps.Marker({
					position : latlng,
					map : map
				});

				var geocoder = new google.maps.Geocoder();

				google.maps.event.addListener(map, 'click', function(event) {
					var location = event.latLng;
					geocoder.geocode({
						'latLng' : location
					}, function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
							$('#address').html(results[0].formatted_address);
							$('#lat').html(results[0].geometry.location.lat());
							$('#lng').html(results[0].geometry.location.lng());
						} else {
							alert("Geocoder failed due to: " + status);
						}
					});
					if (!marker) {
						marker = new google.maps.Marker({
							position : location,
							map : map
						});
					} else {
						marker.setMap(null);
						marker = new google.maps.Marker({
							position : location,
							map : map
						});
					}
					map.setCenter(location);
					map.enableGoogleBar();
				});
			});
</script>