<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<%
//	String email = request.getParameter("ID");
	String email = "mallangpeach";
	String teacher_id = "Era";

	String name = request.getParameter("name");	
	String content = request.getParameter("content");
	String start_date = request.getParameter("start_date");
	String end_date =  request.getParameter("end_date");
	String Gnumber = request.getParameter("number");
	int number = Integer.parseInt(Gnumber);
	String latitude =  request.getParameter("latitude");
	String longtutude = request.getParameter("longtutude");
	String interest = request.getParameter("interest");
	
//	Integer type = 2;
		
//		if(name == null || start_date == null || end_date == null)
//			throw new Exception("데이터를 입력하세요");
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/givinggift", "root", "tiger");
		if(conn == null)
			throw new Exception("데이터베이스 연결 실패");
		
		stmt = conn.createStatement();
		
		String command = String.format("INSERT INTO class" +
		"(id, teacher_id, name, content, start_date, end_date, number, latitude, longtutude, interest) VALUES" +
		"('%s', '%s', '%s', '%s', '%s', '%s', '%d', '%s', '%s', '%s');",
			email, teacher_id, name, content, start_date, end_date, number, latitude, longtutude, interest);
		
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
	response.sendRedirect("Learning.jsp");
%>