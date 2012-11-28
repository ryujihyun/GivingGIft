<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Learning_detail</title>
<link href="stylesheets/learning_detail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

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
             <h3>Music givinggift - piano gift</h3>
             <h4>"youbin Jeon"
             <span class="middot">·</span>
             <span class="headline">university students</span></h4>
           </div>
         </div>
			</div>
			<div class="right">
        <div id="buy-module">
   				<div id="top-action" class="clear">
        		<a class="btn-enroll btn green small ga-event left has-sub-copy" ga-cat="buy_module" ga-action="click-enroll" href="http://www.skillshare.com/checkout/1572809114">
        			<span class="main-text">Enroll $50</span>
        			<span class="sub-text">6 spots left</span>
        		</a>
        		<a id="px-245536734-9d9b62b65634fd67a924098c70001ae405281a94" class="ga-event btn btn-watch-flat grey small right type-square" ga-cat="buy_module" ga-action="click-watch" data-ss-lbl-active="Watching" data-ss-lbl-inactive="Watchlist" href="javascript:;">
        		<span class="btn-text">Watchlist</span>
        			<div class="popup-wrapper">
        				<div class="arrow top">
        				</div>
        				<div class="popup">Get an email whenever this class happens.
        				</div>
        			</div>
        		</a>
        	</div>
          <div class="date-section clear">
          	 <div class="date-icon left">28</div>
            		<div class="date-info left">
                	<p class="date-date">Wed, Nov 28th, 2012</p>
                	<p class="date-time">6:00 pm – 8:30 pm EST</p>
            	</div>
        	</div>
          <div class="additional-dates-section">
          	<select ss-dropdown-width="auto" ss-dropdown-style="dropdown" ss-dropdown-menuwidth="266" class="js-jump-on-change" data-ss-always-reset="true" style="display: none;" aria-disabled="false">
            	<option>1 Additional Date</option>
              <option value="http://www.skillshare.com/Art-of-Intuitive-Photography-Grand-Central-Terminal/245536734/2134341691">Wed, Dec 5th, 2012</option>
            </select>
            <span>
            	<a class="ui-selectmenu ui-widget ui-state-default ui-corner-all ui-selectmenu-dropdown js-jump-on-change" id="ui-selectmenu-2da9d093-button" role="button" href="#nogo" tabindex="0" aria-haspopup="true" aria-owns="ui-selectmenu-2da9d093-menu" style="width: auto;" aria-disabled="false">
            		<span class="ui-selectmenu-status">1 Additional Date</span>
            		<span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span>
            	</a>
            </span>
          </div>
         </div>
         
			</div>
		</div>
	</div>
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
	<jsp:include page="share/footer.jsp"></jsp:include>
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