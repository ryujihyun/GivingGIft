<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

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
		ResultSet rs = stmt.executeQuery("select * from member member;");

		while(rs.next()) {
			if(email.equals(rs.getString("email")) && password.equals(rs.getString("password")))
			{
				String DBemail = rs.getString("email");
				String DBname = rs.getString("name");
				
				session.setAttribute("SID", DBemail);
				session.setAttribute("Sname", DBname);
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
	response.sendRedirect("Learning.jsp");
%>