<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int DBenroll_num = Integer.parseInt(request.getParameter("DBenroll_num"));
	System.out.println(DBenroll_num);
	
	String id = (String)session.getAttribute("id");
	System.out.println(id);
	
	Connection conn = null;
	PreparedStatement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/givinggift", "root", "tiger");
		if(conn == null)
			throw new Exception("데이터베이스 연결 실패");
		
		DBenroll_num = DBenroll_num + 1;
		System.out.println(DBenroll_num);
		
		String sql = "update class set enroll_num=? where id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, DBenroll_num);
		stmt.setString(2, id);
		stmt.executeUpdate();
		
		session.removeAttribute("ID");
		} catch(SQLException ex){
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