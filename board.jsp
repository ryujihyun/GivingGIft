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
			<div class="new_window" id="join_page">
			<div class="window_logo">GivingGift</div>
			<a href="#"><img class="closebutton" src="images/fileclose.png"></a>
			<form action="board_notice.jsp" method="post">
				<div>
					<div class="join_class">
						<div class="class_name">이름</div><div><input class="input_text" type="text" name="name"></div>
					</div>
					<div class="join_class">
						<div class="class_name">E-Mail</div><div><input class="input_text" type="text" name="ID"></div>
					</div>
				</div>
				<div class="window_button"><input id="join_button" type="submit" name="submit" value="join"></div>
			</form>
		</div>
		
			<div id="content_left">
				<ul>
					<li>
						<a class="content_left_a" href="#">공지사항</a>
						<div class="board_content" id="notice">
							<div id="notice_nav">
								<div>번호</div>
								<div>제목</div>
								<div>작성날짜</div>
							</div>
<% 
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

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
										<div>
										<% out.print(rs.getString("id"));%>
										</div>
										<div>
										<% out.print(rs.getString("name"));%>
										</div>
										<div>
										<% out.print(rs.getString("created_at"));%>
										</div>
									</div>
								</a>
								<div class="section">
									<% out.print(rs.getString("content")); %>
								</div>		
							</div>
							<% } %>
							<div id="notice_create_button">
							<a href="#">
							
									글쓰기
							</a>
							</div>
						</div>
					</li>
					<li>
						<a class="content_left_a" href="#"> QnA </a>
						<div class="board_content" id="qna">
							<div>
								번호 제목 작성자 작성날짜
							</div>
<%
	rs = stmt.executeQuery("SElECT * FROM post ORDER BY created_at desc");
	while(rs.next()){
%>
							<div id="content_name">
								<a href="#" id="slide">
								<div id="title">
								<% out.print(rs.getString("id"));%>
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
					</li>
				</ul>
				
<%
} catch(SQLException ex) {
%>
에러발생
<%
}finally {
	if(rs != null) try {rs.close();} catch(SQLException ex){}
	if(conn != null) try {conn.close();} catch(SQLException ex){}
	if(stmt != null) try {stmt.close();} catch(SQLException ex){}
}
%>
				
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
	//$(".section").slideUp();
	$("#content_name>a").click();
	

	
	$("#join_page").hide();

	$("#notice_create_button>a").click(function() {
		$("#join_page").show();
	});

	$(".closebutton").click(function() {
		$(this).parent().parent().hide();
	});

</script>