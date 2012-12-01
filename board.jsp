<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> Giving Gift Board </title>
	<link href="stylesheets/board.css" rel="stylesheet" type="text/css">
	<link href="stylesheets/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css">
	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
</head>
<% 
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
%>
<body>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="wrap">
		<div id="header">
			<div id="header_p">
				<h1>Help Center</h1>
				<p>
					If you need assistance with Vimeo, you've come to the right place.
					We've made it easy to help yourself with our extensive FAQ, helpful guidelines, and supportive community forums.
				</p>
			</div>
			<div id="header_search">
				<form action="">
					<input type="text" name="search" id="search">
					<input type="submit" value="| Search" id="search_button">
				</form>
				<p>Have a question? Ask of enter a search term here</p>
			</div>
		</div>

		<div id="content">
			<div id="content_left">
				<ul>
					<li>
						<a class="content_left_a" href="#">공지사항</a>
						<div class="board_content" id="notice">
							<div>
								아이디 제목 작성자 작성날짜
							</div>
			<%
				try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GivingGift", "root", "tiger");

				stmt = conn.createStatement();
				rs = stmt.executeQuery("SElECT * FROM post ORDER BY created_at desc");

				while(rs.next()){
			%>
							<div id="content_name">
								<a href="#" id="slide">
								<div id="title">
								name: <% out.print(rs.getString("id"));%>
								<% out.print(rs.getString("name"));%>
								<% out.print(rs.getString("writer"));%>
								<% out.print(rs.getString("created_at"));%>
								</div>
								</a>
								<div class="section">
								<% out.print(rs.getString("content")); %>
								</div>		
							</div>
							<% } %>
						</div>
						
			<%		} catch(SQLException ex) {
			%>
			에러발생
			<% }finally {
				if(rs != null) try {rs.close();} catch(SQLException ex){}
				if(conn != null) try {conn.close();} catch(SQLException ex){}
				if(stmt != null) try {stmt.close();} catch(SQLException ex){}
			}%>

					</li>
					<li>
						<a class="content_left_a" href="#"> QnA </a>
						<div class="board_content" id="qna">
							<ul>
								<li>001</li>
								<li>002</li>
								<li>003</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<div id="content_right">
				<div><li>Giving Gift Creater</li></div>				
				<div>
					<img src="images/jh.jpg">
					유지현
				</div>
				<div>
					<img src="images/yb.png">
					전유빈
				</div>
				<div>
					<img src="images/tm.jpg">
					홍택민
				</div>
			</div>
		</div>

			<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>

<script type="text/javascript">
$(function() {
	var tab=$("#content_left");
	tab.find('li>a').click(function() {
		$("#content_left>ul>li").removeClass('selected');
		$("#content_left>ul>li>div").hide();
		$(this).parent().addClass('selected')
		$(this).parent().find("div").show();
	});
	$("#content_left li>a:first").click();
});
	
	$("#content_name>a").click(function() {
		$(this).parent().find(".section").toggle(slide);
	});
	$(".section").slideUp();

</script>