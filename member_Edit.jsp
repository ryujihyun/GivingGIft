<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Member Edit</title>
	<link href="stylesheets/member_Edit.css" rel="stylesheet" type="text/css">
	<script src='js/jquery-1.8.2.min.js'></script>
</head>
<body>
<jsp:include page="share/header.jsp"></jsp:include>
 <%
 	
 
	String errorMsg=null;
 	String actionUrl;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/GivingGIft?chracterEncoding=utf8";
	String dbUser = "root";
	String dbPassword = "tiger";

	String phone = "";
	String name = "";
	String address = "";
	String email = (String)session.getAttribute("SID");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

 		// 질의 준비
		stmt = conn.prepareStatement("SELECT name,phone,address from member where EMAIL=?");
		stmt.setString(1, email);
		// 수행
 		rs = stmt.executeQuery();
		
		if (rs.next()) {
			name=rs.getString("name");
			phone=rs.getString("phone");
			address=rs.getString("address");
			}
	}
	catch (SQLException e) {
		errorMsg = "SQL 에러: " + e.getMessage();
		System.out.println(errorMsg);
	} 
	finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}
%>   
<div id="wrap">
	<div id="header">
		<h1>Giving Gift</h1>
		<p>회원 정보를 수정해주십시오</p>
	</div>
	<div id="content">
		<div>
			<ul>
				<li>이름</li>
				<li>전화번호</li>
				<li>주소</li>
			</ul>
		</div>
		<div>
			<form action="Updater.jsp" method="post">
				<input type="text" NAME=name value="<%=name%>">
				<input type="text" NAME=phone value="<%=phone%>">
				<input type="text" NAME=address value="<%=address%>" />
				<input type="submit" value="수정"onclick="history.back()"/>
			</form>
		</div>
		<div id="goback_button">
			<a href="mypage.jsp">돌아가기</a>
		</div>		
	</div>
</div>
<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>