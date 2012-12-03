<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Learning_detail</title>
<link href="stylesheets/learning_detail.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src='js/jquery-1.8.2.min.js'></script>
</head>
<body>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/GivingGift";
		String dbUser = "root";
		String dbPassword = "tiger";
	%>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="listing_header">
		<div id="center_page">
			<%
				String class_ID = request.getParameter("class_ID");

				try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/givinggift", "root",
							"tiger");
					if (conn == null)
						throw new Exception("Connect DB fail");

					stmt = conn.createStatement();
					rs = stmt.executeQuery("SELECT * FROM class;");
					
					while (rs.next()) {
						if (class_ID.equals(rs.getString("id"))) {
							String DBname = rs.getString("name");
							String DBcontnet = rs.getString("content");
							String DBaddress = rs.getString("address");
							String DBS_date = rs.getString("start_date");
							Date DBE_date = rs.getDate("end_date");
							int DBenroll_num = rs.getInt("enroll_num");
							String latitude = rs.getString("latitude");
							String longtutude = rs.getString("longtutude");

							request.setAttribute("ENROLL",
									new Integer(DBenroll_num));
							request.setAttribute("ID", new String(class_ID));

							session.setAttribute("id", class_ID);

							out.println(DBname);
							out.println(DBcontnet);
							out.println(DBS_date);
						}
					}
			%>
			<div class="left">
				<div class="class-overview">
					<div class="teacher-image">
						<img src="images/youbin.png">
					</div>
					<div class="class-info">
						<h3>Music givinggift - piano gift</h3>
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
						<div id="enroll_form">
							<form action="learning_enroll.jsp" method="post">
								<input type="text" name="DBenroll_num" value="${ENROLL}" style="visibility: hidden;">
								<div id="btn-enroll">
									<input type="submit" value="Click the Enroll!">
								</div>
						</div>
						</form>
					</div>
					<div class="datesection">
						<div class="dateicon">28</div>
						<div class="dateinfo">
							<p class="datedate">WEN,THU 2012-12-25</p>
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
				<li><a href="#"><h1>Location</h1></a>
					<div class="board_content" id="location">
						<div id="map_canvas" style="width: 460px; height: 380px;"></div>
					</div></li>
				<li><a href="#"><h1>abc</h1></a>
					<div class="board_content" id="abc">
						<ul>
							<li>007</li>
							<li>008</li>
							<li>009</li>
						</ul>
					</div></li>
			</ul>
		</div>
		<div id="content_right">
			<div id="map_canvas" style="width: 230px; height: 380px;"></div>
		</div>
	</div>
	</div>
	<%
		} catch (SQLException ex) {

		} finally {
			try {
				stmt.close();
			} catch (Exception ignored) {
			}

			try {
				conn.close();
			} catch (Exception ignored) {
			}
		}
		try {
			rs.close();
		} catch (Exception ignored) {
		}
	%>
	<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>
<script type="text/javascript">
	$(function() {
		var tab = $("#content_left");
		tab.find('li>a').click(function() {
			$("#content_left>ul>li").removeClass('selected');
			$("#content_left>ul>li>div").hide();
			$(this).parent().addClass('selected');
			$(this).parent().find("div").show();
		});
		$("#content_left li>a:first").click();

		$("#center_page").find("#btn-enroll").click(function() {
			alert('enroll class');
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