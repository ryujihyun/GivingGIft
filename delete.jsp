<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	
	String actionUrl;
  String errorMsg=null;
  int result =0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/GivingGift";
		String dbUser = "root";
		String dbPassword = "tiger";
		request.setCharacterEncoding("utf-8");
String email=null;
		
		try {
			if(session.getAttribute("SID") == null) {
				email = "";
			} else {
				email = (String)session.getAttribute("SID");
			}
		} catch (Exception e) {
			email = "";
		}try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt=conn.prepareStatement("DELETE  FROM member WHERE email=?");
			stmt.setString(1, email);
			result = stmt.executeUpdate();
			if(result!=1){
				errorMsg="삭제에 실패했습니다.";
			}
		}catch(SQLException e){
				errorMsg="SQL에러: "+e.getMessage();
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException e){}
				if(stmt!=null)try{stmt.close();}catch(SQLException e){}
				if(conn!=null)try{conn.close();}catch(SQLException e){}
			}
	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원가입감사</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	 <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
 			
 <% if(errorMsg!=null){%>
 <div class="alert alert-error">
 	<h3>결과:</h3>
 	 <%=errorMsg%>
 	</div>
 	<%}else{ %>
 	<div>
 		<div class="alert alert-success">
 		사용자 정보를 삭제하였습니다. 
 	</div>
 	<%}%>
 	<div class ="form-action">
 		<a href="index.jsp">목록으로</a>
 	</div>
 </div>

</body>
</html>