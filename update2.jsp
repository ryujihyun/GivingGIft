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
	<link href="stylesheets/mypage.css" rel="stylesheet" type="text/css">	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
 <%
	String errorMsg=null;
 	String actionUrl;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/GivingGIft";
	String dbUser = "root";
	String dbPassword = "tiger";

	

	
	String phone = "";
	String name = "";
	String address = "";
	String email;
	try {
		if(session.getAttribute("SID") == null) {
			email = "";
		} else {
			email = (String)session.getAttribute("SID");
		}
	} catch (Exception e) {
		System.out.println(e);
		email = "";
	}
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	 		// 질의 준비
			stmt = conn.prepareStatement("SELECT name,phone,address from member where EMAIL=?");
			stmt.setString(1, email);
			// 수행
	 		rs = stmt.executeQuery();
			
			if (rs.next()) {
				name=rs.getString("name");
				phone=rs.getString("phone");
				address=rs.getString("address");
				}
		}catch (SQLException e) {
			errorMsg = "SQL 에러: " + e.getMessage();
			System.out.println(errorMsg);
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	
%>   
	<div id="wrap">
		<div id="content">
			<jsp:include page="share/header.jsp"></jsp:include>
			
			<section id="teaching_section1">
				<article class="teaching_article1">
					<form action="Updater.jsp" method="post">
						<table>
							<tbody>
								<tr>
									<th colspan="2" class="title">
										<label>기본 정보/변경 내용</label>
									</th>
								</tr>
								<th><label for="h">이름</label></th>
									<td><input type="text" NAME=name value="<%=name%>">
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
								</form>
				</article>
			</section>
	
</body>
</html>
<script type="text/javascript">
	$(function() {


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


