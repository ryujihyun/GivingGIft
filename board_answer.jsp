<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
    import="org.apache.commons.lang3.StringUtils"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("board_id");
    int board_id = Integer.parseInt(id); 
    
    String content = request.getParameter("content");
%>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/givinggift?chracterEncoding=utf8", "root", "tiger");
		if(conn == null)
			throw new Exception("데이터베이스 연결 실패");
		
		
		stmt = conn.prepareStatement("update post_qna set answer=? where id=?");
		stmt.setString(1, content);
		stmt.setInt(2, board_id);
		stmt.executeUpdate();
					
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
response.sendRedirect("board.jsp");
%>