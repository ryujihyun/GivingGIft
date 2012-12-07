<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
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
			</div>
		</div>

		<div id="content">
		
			<div class="notice_page" id="notice_page_a">
				<div class="notice_logo">GivingGift</div>
				<a href="#"><img class="notice_closebutton" src="images/fileclose.png"></a>
				<form action="board_notice.jsp" method="post">
					<div>
						<div class="notice_class">
							<div class="class_name">제목</div><input class="input_text" type="text" name="name">
						</div>
						<div class="notice_text">
							<div><textarea cols="40" row="10" name="content" placeholder="내용을 쓰세요"></textarea></div>
						</div>
					</div>
					<div class="notice_button"><input type="submit" name="submit" value="게시"></div>
				</form>
			</div>
			
			<div class="notice_page" id="notice_page_b">
				<div class="notice_logo">GivingGift</div>
				<a href="#"><img class="notice_closebutton" src="images/fileclose.png"></a>
				<form action="board_qna.jsp" method="post">
					<div>
						<div class="notice_class">
							<div class="class_name">제목</div><input class="input_text" type="text" name="name">
						</div>
						<div class="notice_text">
							<div><textarea cols="40" row="10" name="content" placeholder="내용을 쓰세요"></textarea></div>
						</div>
					</div>
					<div class="notice_button"><input type="submit" name="submit" value="게시"></div>
				</form>
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
		
			<div id="content_left">
			
				<div id="content_notice">			
					<h1>공지사항</h1>
					<div class="board_content" id="notice">
						<div class="notice_nav">
							<li>번호</li>
							<li>제목</li>
							<li>작성날짜</li>
						</div>
						<div class="scroll">
<% 
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GivingGift?chracterEncoding=utf8", "root", "tiger");

	stmt = conn.createStatement();
	rs = stmt.executeQuery("SElECT * FROM post ORDER BY created_at desc");

	while(rs.next()){
%>
						<div class="content_name">
							<a href="#" id="slide">
								<div class="title">
									<li class="a"><% out.print(rs.getString("id"));%></li>
									<li class="b"><% out.print(rs.getString("name"));%></li>
									<li class="c"><% out.print(rs.getString("created_at"));%></li>
								</div>
							</a>
							<div class="section">
								<% out.print(rs.getString("content")); %>
							</div>		
						</div>
						<% } %>
						</div>
						<c:choose>
							<c:when test="${sessionScope.STYPE != 1}"></c:when>
							<c:otherwise>
								<div class="notice_create_button" id="button_a">
								<a href="#">
										글쓰기
								</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>	
	
				<div id="content_qna">
					<h1>강좌 요청하기 & QnA</h1>
					<div class="board_content" id="qna">
						<div class="notice_nav">
							<li>작성자</li>
							<li>제목</li>
							<li>작성날짜</li>
						</div>
						<div class="scroll">
<%
	rs = stmt.executeQuery("SElECT * FROM post_qna ORDER BY created_at desc");
	while(rs.next()){
%>
						<div class="content_name">
							<a href="#" id="slide">
							<div class="title">
								<li class="a"><% out.print(rs.getString("writer"));%></li>
								<li class="b"><% out.print(rs.getString("name"));%></li>
								<li class="c"><% out.print(rs.getString("created_at"));%></li>
							</div>
							</a>
							<div class="section">
								<li>작성 글 : <% out.print(rs.getString("content")); %><li>
								<li class="out_answer">answer : <% out.print(rs.getString("answer")); %></li>
								
								<c:choose>
									<c:when test="${sessionScope.STYPE != 1}"></c:when>
									<c:otherwise>
								<div class="answer_form">
									<form action="board_answer.jsp" method="post">
<input type="text" name="board_id" value=<%out.println(rs.getInt("id")); %> style="visibility: hidden;">
										<textarea rows="5" cols="60" name="content"></textarea>
										<input type="submit" value="답하기">
									</form>
								</div>		
									</c:otherwise>
								</c:choose>
							
							</div>
						</div>
						<% } %>
						</div>
						<c:choose>
							<c:when test="${sessionScope.SID == null}"></c:when>
							<c:otherwise>
								<div class="notice_create_button" id="button_b">
								<a href="#">
										글쓰기
								</a>
								</div>
							</c:otherwise>
						</c:choose>
					
				</div>	
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
			</div>
		</div>
	</div>
<jsp:include page="share/footer.jsp"></jsp:include>
	
</body>
</html>

<script type="text/javascript">
	
	$(".content_name>a").click(function() {
		$(this).parent().find(".section").toggle(slide);
	});
	$(".content_name>a").click();

	
	$(".notice_page").hide();

	$("#button_a>a").click(function() {
		$("#notice_page_a").show();
	});

	$("#button_b>a").click(function() {
		$("#notice_page_b").show();
	});
	
	$(".notice_closebutton").click(function() {
		$(this).parent().parent().hide();
	});

</script>