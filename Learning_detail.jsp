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
<link href="stylesheets/learning_detail.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"></script>

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
		<div class="center-page">
		</div>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>