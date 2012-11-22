<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
    
    
<%
String email=request.getParameter("email");
String name=request.getParameter("name");
String phone=request.getParameter("phone");

if(email==null||name==null|| phone==null)
	throw new Exception("누락된 데이터가 있습니다.");
	
	Connection conn=null;
	Statement stmt=null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/givinggift","root","tiger");
		
		if (conn==null)
			throw new Exception("데이터 베이스에 연결할 수 없습니다.");
		stmt=conn.createStatement();
		String command =String.format("update member set"+
		"name :='%s', phone:='%s',"+
		"address:=%s where email='%s';",
		name,phone,address,email);
		
		int rowNum=stmt.executeUpdate(command);
		if (rowNum<1)
			throw new Exception("데이터 db를 입력 할 수 없습니다.");
	}
	
	

	finally{
		try{
			stmt.close();
		}
		catch(Exception ignored){
	}
		try{
			conn.close();
		}
		catch(Exception ignored){
		}
	}
	
	response.sendRedirect("UpdaterResult.jsp?email=" +code);
	
	%>