<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	SimpleDateFormat stringtodate = new SimpleDateFormat ("mm/dd/yyyy");
	SimpleDateFormat datetostring = new SimpleDateFormat ("yymmdd");
			
	String teacher_id = (String) session.getAttribute("SID");

	String name = request.getParameter("name");	
	String content = request.getParameter("content");
	
	String S_date = request.getParameter("start_date");
	String E_date =  request.getParameter("end_date");
	
	java.util.Date SS_date = stringtodate.parse(S_date);
	String start_date = datetostring.format(SS_date);

	java.util.Date EE_date = stringtodate.parse(E_date);
	String end_date = datetostring.format(EE_date);
	
	String Gnumber = request.getParameter("number");
	int number = Integer.parseInt(Gnumber);
	
	String latitude = request.getParameter("lat");
	String longtutude = request.getParameter("lng");
/*
	double latitude = Double.valueOf(S_latitude).doubleValue();
	double longtutude = Double.valueOf(S_longtutude).doubleValue();
*/	
	String address = request.getParameter("address");
	String interest = request.getParameter("interest");
			
//		if(name == null || start_date == null || end_date == null)
//			throw new Exception("데이터를 입력하세요");
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/givinggift?chracterEncoding=utf8", "root", "tiger");
		if(conn == null)
			throw new Exception("데이터베이스 연결 실패");
		
		stmt = conn.createStatement();
		
		String command = String.format("INSERT INTO class" +
		"(teacher_id, name, content, number, latitude, longtutude, address, interest, start_date, end_date) VALUES" +
		"('%s', '%s', '%s', '%d', '%s', '%s', '%s', '%s', '%s', '%s');",
			teacher_id, name, content, number, latitude, longtutude, address, interest, start_date, end_date);
		
		int rowNum = stmt.executeUpdate(command);
		if(rowNum < 1)
				throw new Exception("데이터을 DB에 입력못해");
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