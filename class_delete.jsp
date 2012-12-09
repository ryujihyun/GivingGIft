<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String email = request.getParameter("ID");
	
	String actionUrl;
  String errorMsg=null;
  int result =0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/givinggift";
		String dbUser = "root";
		String dbPassword = "tiger";
		request.setCharacterEncoding("utf-8");
    
		
		String teacher_id=null;
		
		try {
			if(session.getAttribute("SID") == null) {
				teacher_id = "";
			} else {
				teacher_id = (String)session.getAttribute("SID");
			}
		} catch (Exception e) {
			teacher_id = "";
		}try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt=conn.prepareStatement("DELETE FROM CLASS from teacher_id=? ");
			stmt.setString(1, teacher_id);
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
	<title>강좌삭제</title>
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
 		수강신청 내역을 삭제하였습니다. 
 	</div>
 	<%}%>
 	<div class ="form-action">
 		<a href="index.jsp">목록으로</a>
 	</div>
 </div>

</body>
</html>