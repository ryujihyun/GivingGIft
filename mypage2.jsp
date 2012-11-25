<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="page-exit" content="BlendTans(Duration=3.0)">
	<meta http-equiv="page-Enter" content="BlendTans(Duration=3.0)">
	<title>Giving Gift learning</title>
	<link href="stylesheets/teaching.css" rel="stylesheet" type="text/css">	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
<% 
	String errorMsg=null;
	String actionUrl;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/givinggift";
	String dbUser = "root";
	String dbPassword = "tiger";
		
	String email="";
	String phone="";
	String address="";
	String name="";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GivingGift", "root", "tiger");

		stmt = conn.prepareStatement("SElECT * FROM member");
		rs = stmt.executeQuery();
		if(!rs.next()){
			email=rs.getString("email");
			phone=rs.getString("phone");
			address=rs.getString("address");
			name=rs.getString("name");
		}
	} catch(SQLException e){}
	finally {
		try{stmt.close();}catch (Exception ignored){}
		try{conn.close();}catch (Exception ignored){}
	}
%>
	<div id="wrap">
		<div id="content">
			<jsp:include page="share/header.jsp"></jsp:include>
			<jsp:include page="share/side.jsp"></jsp:include>
			<section id="teaching_section1">
				<article	class="teaching_article1">
				<div id="left">
					<a href="learning_detail.jsp"> <img src="./images/human.png"></img>
				</div>
				<h1>학생 정보</h1>
				<p>
					<ol>
						<li>아이디 :<%=name%></li>
						<li>폰번호 :<%=phone%></li>
						<li>주소 :<%=address%></li>
						<li>이메일:<%=email%></li>
						<br> date: 2012.11.22 ~ 2012.12.25
						<br> week: Mon, Wen, Fri
						<br> Number: 5
						<br>
					</ol>
				</p></a>
				</article>
			</section>
			<section id="teaching_section2">
				<article class="teaching_article2">
					<h1>상품 수정정보를 입력하세요</h1>
					<form action="updater.jsp" method="post">
						<table>
							<tbody>
								<tr>
									<th colspan="2" class="title">
										<label>기본 정보/변경 내용</label>
									</th>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" name="name"/></td>
								</tr>
								<tr>
									<th><label for="h">폰번호</label></th>
									<td><input type="text" NAME=phone value="<%=phone%>">
									<p style="font-size: 9pt; color: red;">*번호는 2~20자 이내여야 합니다.</p></td>
								</tr>
								<tr>
									<th><label for="h">주소</label></th>
									<td><input type="text" NAME=address value="<%=address%>" />
										<p style="font-size: 9pt; color: red;">주소를 입략해주세여.</p></td>
								</tr>
								<tr>
									<th><label for="h">이메일</label></th>
									<td><input type="text" NAME=email value="<%=email%>" />
									<p style="font-size: 9pt; color: red;">이메일꼭입력해주세요</p></td>
								</tr>
								<tr>
									<th class="button" colspan="2"></th>
									<td><input type="submit" value="수정"onclick="history.back()"/></td>
								</tr>
							</form>
						</tbody>
					</table>
					<form action="delete.jsp" method="post">
					<tr>
									<th class="button" colspan="2"></th>
									<td><input type="submit" value="회원탈퇴"onclick="history.back()"/></td>
								</tr>
				</article>
			</section>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
			$(window).scroll(function() {
				var scrollHeight = $(window).scrollTop() + $(window).height();
				var documentHeight = $(document).height();

				if (scrollHeight + 200 >= documentHeight) {
					for ( var i = 0; i < 10; i++) {
						$('<h1>Infinity Scroll<h1>').appendTo('body');
					}
				}
			});
		});

		//mouse event
		$("article.teaching_article1").mouseover(function() {
			$(this).css("background", "#C4DEFF");
			$(this).css("color", "#ffffff");
		});

		$("article.teaching_article1").mouseout(function() {
			$(this).css("background", "#ffffff");
		});
		$("article.teaching_article2").mouseover(function() {
			$(this).css("background", "#ffffff");
		});
		$("article.teaching_article3").mouseout(function() {
			$(this).css("background", "#ffffff");
		});

	});
</script>