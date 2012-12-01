<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Learning_detail</title>
<link href="stylesheets/learning_detail.css" rel="stylesheet"	type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>

</head>
<body>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="listing_header">
		<div id="center_page">
			<div class="left">
				<div class="class-overview">
					<div class="teacher-image">
						<img src="images/youbin.png">
					</div>
					<div class="class-info">
						<h3>givinggift - piano gift</h3>
						<h4>
							"youbin Jeon" <span class="middot">·</span> <span
								class="headline">university students</span>
						</h4>
					</div>
				</div>
			</div>
			<div class="right">
				<div id="buy-module">
					<div id="top-action">
						<a class="btn-enroll"> <span class="main-text">Enroll
								FREE</span>
						</a> <a id="Watchlist"> <span class="btn-text">Watchlist</span>
						</a>
					</div>
					<div class="datesection">
						<div class="dateicon">28</div>
						<div class="dateinfo">
							<p class="datedate">Wed, Nov 28th, 2012</p>
							<p class="datetime">6:00 pm – 8:30 pm EST</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<div id="content_left">
			<ul>
				<li><a href="#"><h1>board</h1></a>
					<div class="board_content" id="notice">
						<ul>
							<li>001</li>
							<li>002</li>
							<li>003</li>
						</ul>
					</div></li>
				<li><a href="#"><h1> Location </h1></a>
					<div class="board_content" id="location">
						<ul>
						<div id="map_canvas" style="width: 460px; height: 380px;"></div>
						</ul>
					</div></li>
					<li><a href="#"><h1> abc </h1></a>
					<div class="board_content" id="abc">
						<ul>
							<li>007</li>
							<li>008</li>
							<li>009</li>
						</ul>
					</div></li>
			</ul>
		</div>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>
<script>
$(function() {
	var tab = $("#content_left");
	tab.find('li>a').click(function() {
		$("#content_left>ul>li").removeClass('selected');
		$("#content_left>ul>li>div").hide();
		$(this).parent().addClass('selected');
		$(this).parent().find("div").show();
	});
	$("#content_left li>a:first").click();
});
	
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
