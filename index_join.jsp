<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("ID");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String phone =  request.getParameter("phone");
	String birthdate =  request.getParameter("date");
	String gender =  request.getParameter("gender");
	Integer type = 2;
	String language = request.getParameter("language");
	String sociology = request.getParameter("sociology");
	String science = request.getParameter("science");
	String skill = request.getParameter("skill");
	String art = request.getParameter("art");
	String music = request.getParameter("music");
	
		if(name == null || email == null || password == null)
			throw new Exception("데이터를 입력하세요");
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/givinggift", "root", "tiger");
		if(conn == null)
			throw new Exception("데이터베이스 연결 실패");
		
		stmt = conn.createStatement();
		
		String command = String.format("INSERT INTO member" +
		"(email, password, name, address, phone, birthdate, gender, type, language, sociology, science, skill, art, music) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%d', '%s', '%s', '%s', '%s', '%s', '%s');",
			email, password, name, address, phone, birthdate, gender, type, language, sociology, science, skill, art, music);
		
		int rowNum = stmt.executeUpdate(command);
		if(rowNum < 1)
				throw new Exception("데이터을 DB에 입렵못해");
		}
	
	finally {
		try {
			stmt.close();
		}
		catch (Exception ignored) {
		
		}
		try {
			conn.close();
		}
		catch (Exception ignored) {
			
		}
	}
	response.sendRedirect("index.jsp");
%>