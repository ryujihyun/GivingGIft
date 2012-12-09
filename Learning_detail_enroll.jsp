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
<link href="stylesheets/learning_detail.css" rel="stylesheet"	type="text/css">
<script type="text/javascript"src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript"src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src='js/jquery-1.8.2.min.js'></script>
<link href="stylesheets/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
</head>
<body onlead="access">
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
%>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="listing_header">
		<div id="center_page">
			<%
				request.setCharacterEncoding("utf-8");
				
				String class_ID = request.getParameter("class_ID");

				try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/givinggift?chracterEncoding=utf8", "root",
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
							String DBE_date = rs.getString("end_date");
							int DBenroll_num = rs.getInt("enroll_num");
							//String latitude = rs.getString("latitude");
							double latitude = rs.getDouble("latitude");
							double longtutude= rs.getDouble("longtutude");

							request.setAttribute("ENROLL",
									new Integer(DBenroll_num));
							request.setAttribute("ID", new String(class_ID));

							session.setAttribute("id", class_ID);
							%>
			<div class="left">
				<div class="class-overview">
					<div class="class-info">
						<h3><%out.println(DBname);%> givinggift - <%out.println(DBname);%> gift</h3>
						<h4>
							<%out.print((String) session.getAttribute("Sname"));%><span class="middot">·</span> <span
								class="headline"><%out.print((String) session.getAttribute("SID")); %></span>
						</h4>
					</div>
				</div>
			</div>
			<div class="right">
				<div id="buy-module">
					<div id="top-action">
						<div id="enroll_form">
							<form action="learning_enroll_f.jsp" method="post">
								<input type="text" name="DBenroll_num" value="${ENROLL}" style="visibility: hidden;">
								<div id="btn-enroll">
									<input type="submit" value="수강 취소">
								</div>
						</div>
						</form>
					</div>
					<div class="datesection">
						<div class="dateinfo">
							<p class="datedate"><% out.println(DBS_date); %> ~ <% out.println(DBE_date); %></p>
							<p class="datetime">current enroll_num: <%out.println(DBenroll_num);%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<div id="content_left">
			<div id= "contents">
				Class Information<br>
			</div>
			<article class="detail_left1">
			
				<h1>Class</h1> <% out.println(DBname); %><br><br>
				<h1>Address</h1> <% out.println(DBaddress); %><br><br>
				<h1>Period</h1> <% out.println(DBS_date); %> ~ <%out.println(DBE_date);%><br><br>
				<h1>Current Enroll_num</h1> <%out.println(DBenroll_num); %><br><br>
				<h1>Contents</h1> <% out.println(DBcontnet); %><br><br>
			</div>
		<div id="content_right">
			<div id= "contents">
				Class Map<br>
			</div>
			<div id="detail_right1">
			<div id = "google_map">
				<div id="map_canvas" style="width: 450px; height: 380px;"></div>
			</div>
			</div>
			<div id="latitude" style="visibility: hidden;">
				<%out.println(latitude); %>
			</div>
			<div id="longtutude" style="visibility: hidden;">
				<% out.println(longtutude); %>
			</div>
		</div>
							<%
						}
					}
			%>
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
	$(document).ready(
			function() {
				var latlng = new google.maps.LatLng($("#latitude").text(),
						$("#longtutude").text());

				var myOptions = {
					zoom : 15,
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