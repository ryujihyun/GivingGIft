<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Giving Gift</title>
	<link href="stylesheets/login_page.css" rel="stylesheet" type="text/css">
	<script src='js/jquery-1.8.2.min.js'></script>
</head>
<% 
	String email = request.getParameter("ID");
	String password = request.getParameter("password");
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/givinggift", "root", "tiger");
		if(conn == null)
			throw new Exception("Connect DB fail");
		
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from member where email = '"+email+"';");
		
		if(!rs.next())	{
			%>
			<body>
				<div id="warp">
					<div id="header">
						<h1>Giving Gift</h1>
					</div>
					<div id="content">
						<p>아이디가 없습니다.</p>
					</div>
					<div id="goback_button">
						<a href="index.jsp">돌아가기</a>
					</div>
				</div>
			</body>
			</html>
			<%
		}
		else	{
			if(password.equals(rs.getString("password")))	{
				String DBemail = rs.getString("email");
				String DBname = rs.getString("name");
				
				session.setAttribute("SID", DBemail);
				session.setAttribute("Sname", DBname);
				
				%>	
				<jsp:forward page = "Learning.jsp"/>
				<%	
			}
			else	{
				%>
				<body>
				<div id="warp">
					<div id="header">
						<h1>Giving Gift</h1>
					</div>
					<div id="content">
						<p>패스워드가 틀렸습니다.</p>
					</div>
					<div id="goback_button">
						<a href="index.jsp">돌아가기</a>
					</div>
				</div>
			</body>
				</html>
				<%
			}
		}		
	}
	finally {
		try {
			stmt.close();
		}
		catch (Exception ignored) {}
		
		try {
			conn.close();
		}
		catch (Exception ignored) {}
	}
%>