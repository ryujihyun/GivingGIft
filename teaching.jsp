<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8">
	<title> Giving Gift Create Class </title>
	<link href="stylesheets/teaching.css" rel="stylesheet" type="text/css">
	<link href="stylesheets/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
</head>
<body>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="wrap">
		<div id="header"><!--
			<div id="header_p">
				<h1>Create Class</h1>
				<p>
					If you need assistance with Vimeo, you've come to the right place.
					We've made it easy to help yourself with our extensive FAQ, helpful guidelines, and supportive community forums.
				</p>
			</div>-->
		</div>

		<div id="content">

			<div class="new_window" id="content_left">
				<div id="content_header"><h1>Create Your Class</h1></div>
				<div id="content_form">
					<form action="teaching_page.jsp" method="post">
						<div>
							<div class="join_class">
								<div class="class_name">Class Title</div>
								<div><input class="input_text" type="text" name="name"></div>
							</div>

							<div class="join_class">
								<div class="class_name">Choose a Category</div>
								<select id="select_box" name="interest">
									<option value="language">언어</option>
									<option value="sociology">사회</option>
									<option value="science">과학</option>
									<option value="skill">기술</option>
									<option value="art">예술</option>
									<option value="music">음악</option>
								</select>
							</div>

							<div class="join_class">
								<div class="class_name">강좌 내용</div>
								<div><textarea cols="40" row="10" name="content"></textarea></div>
							</div>
							<div class="join_class" id="date">
								<div class="date_class">
									<div class="class_name">시작날짜</div>
									<div><input id="from" class="input_date" type="text" name="start_date"></div>
								</div>
								<div class="date_class">
									<div class="class_name">종료날짜</div>
									<div><input id="to" class="input_date" type="text" name="end_date"></div><br>
								</div>
							</div>
							
							<div class="join_class">
								<div class="class_name">수강인원</div><div><input class="input_text" type="text" name="number"></div>
							</div>
							<div class="join_class">
								<div class="class_name"> 지도</div><div id="map_canvas" style="width: 460px; height: 380px;"></div>
							</div>
							<div class="join_class">
								<div class="class_name">수강장소(위도)</div><div><input type="text" id="lat" name="lat" style="width: 300px; height: 30px;"></div>
							</div>
							<div class="join_class">
								<div class="class_name">수강장소(경도)</div><div><input type="text" id="lng" name="lng" style="width: 300px; height: 30px;"></div>
							</div>
							<div class="join_class">
								<div class="class_name">주소</div><div><input type="text" id="address" name="address" style="width: 400px; height: 30px;"></div>
							</div>							
						</div>
						<div id="content_button"><input type="submit" name="submit" value="join"></div>
					</form>
				</div>
			</div>

			<div id="content_right">
				<h1>Create Class</h1>
				<p>
					If you need assistance with Vimeo, you've come to the right place.
					We've made it easy to help yourself with our extensive FAQ, helpful guidelines, and supportive community forums.
				</p>
			</div>

		</div>

		<footer id="learning_footer">
			<h3> 사이트맵 | 고객센터</h3>
			<address> CopyWrite c GivingGift All rights reserved | 2012.11.06 | club.cyworld.com/givinggift</address>
		</footer>
	</div>
</body>
</html>

<script type="text/javascript">
$(function() {
    $( "#from" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3,
        onClose: function( selectedDate ) {
            $( "#to" ).datepicker( "option", "minDate", selectedDate );
        }
    });
    $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3,
        onClose: function( selectedDate ) {
            $( "#from" ).datepicker( "option", "maxDate", selectedDate );
        }
    });
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
						$('#address').attr("value", results[0].formatted_address);
						$('#lat').attr("value", results[0].geometry.location.lat());
						$('#lng').attr("value", results[0].geometry.location.lng());
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