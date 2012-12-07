<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	
	SimpleDateFormat stringtodate = new SimpleDateFormat ("mm/dd/yyyy");
	SimpleDateFormat datetostring = new SimpleDateFormat ("yymmdd");

	String name = request.getParameter("name");
	String email = request.getParameter("ID");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String phone =  request.getParameter("phone");
	String S_birthdate =  request.getParameter("date");
	
	String gender =  request.getParameter("gender");
	Integer type = 2;
	String language = request.getParameter("language");
	String sociology = request.getParameter("sociology");
	String science = request.getParameter("science");
	String skill = request.getParameter("skill");
	String art = request.getParameter("art");
	String music = request.getParameter("music");
	
	if(name == null || name.trim().length() == 0 || email == null || email.trim().length() == 0 || password == null || password.trim().length() == 0 || S_birthdate == null || S_birthdate.trim().length() == 0)	{
		%>
			<jsp:forward page = "ErrorFile/join_error_page.jsp"/>
		<%
	}
	
	java.util.Date SS_birthdate = stringtodate.parse(S_birthdate);
	String birthdate = datetostring.format(SS_birthdate);
	
	Connection conn = null;
	PreparedStatement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/givinggift?chracterEncoding=utf8", "root", "tiger");
		if(conn == null)
			throw new Exception("데이터베이스 연결 실패");
		
		stmt = conn.prepareStatement(
			"INSERT INTO member" +
		"(email, password, name, address, phone, birthdate, gender, type, language, sociology, science, skill, art, music)"	+
		"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
		);		
		stmt.setString(1, email);
		stmt.setString(2, password);
		stmt.setString(3, name);
		stmt.setString(4, address);
		stmt.setString(5, phone);
		stmt.setString(6, birthdate);
		stmt.setString(7, gender);
		stmt.setInt(8, type);
		stmt.setString(9, language);
		stmt.setString(10, sociology);
		stmt.setString(11, science);
		stmt.setString(12, skill);
		stmt.setString(13, art);
		stmt.setString(14, music);
			
		int rowNum = stmt.executeUpdate();
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