<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="page-exit" content="BlendTans(Duration=3.0)">
	<meta http-equiv="page-Enter" content="BlendTans(Duration=3.0)">
	<title>Giving Gift learning</title>
	<link href="stylesheets/mypage.css" rel="stylesheet" type="text/css">	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
 <%
	String errorMsg=null;
 	String actionUrl;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/GivingGIft";
	String dbUser = "root";
	String dbPassword = "tiger";

	

	
	String phone = "";
	String name = "";
	String address = "";
	String email=null;
	String end_date = "";
	String start_date = "";
	String content="";
	String teacher_id=null;
	try {
		if(session.getAttribute("SID") == null) {
			email =null;
		} else {
			email = (String)session.getAttribute("SID");
		}
	} catch (Exception e) {
		System.out.println(e);
		email = null;
	}
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
		}catch (SQLException e) {
			errorMsg = "SQL 에러: " + e.getMessage();
			System.out.println(errorMsg);
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	
%>   
	<div id="wrap">
		<div id="content">
			<jsp:include page="share/header.jsp"></jsp:include>
		
			<section id="teaching_section1">
				<article	class="teaching_article1">
				
				<div id="left">
					<a href=""> <img src="./images/human.png"></img>
			
				</div>
				
				<h1>학생 정보</h1>
				<p>
					<ol>
					<li>email :<%=email%></li>
						<li>이름 :<%=name%></li>
						<li>폰번호 :<%=phone%></li>
						<li>주소 :<%=address%></li>
						<br> <form action="update2.jsp" method="post">
					        <tr>
									<th class="button" colspan="2"></th>
									<td><input type="submit" value="회원정보수정"onclick="history.back()"/></td>
								</tr>
						</form>	</br>
						<br>
						
					</ol>
					
				</p></a>
				</article>
			</section>
			
	    <section id="teaching_section1">
				<article class="teaching_article1">
		<%
	  stmt = null;
	  rs = null;
	  

		
		
		try {
			if(session.getAttribute("SID") == null) {
				teacher_id = "";
			} else {
				teacher_id = (String)session.getAttribute("SID");
			}
		} catch (Exception e) {
			System.out.println(e);
			teacher_id = "";
		}
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		 		// 질의 준
				stmt = conn.prepareStatement("SELECT * from CLASS where teacher_id=?");
				stmt.setString(1, teacher_id);
				// 수행
		 		rs = stmt.executeQuery();
				
				if (rs.next()) {
					name=rs.getString("namee");
					content=rs.getString("content");
					start_date=rs.getString("start_date");
					end_date=rs.getString("end_date");
							
					}
			}catch (SQLException e) {
				errorMsg = "SQL 에러: " + e.getMessage();
				System.out.println(errorMsg);
			} finally {
				// 무슨 일이 있어도 리소스를 제대로 종료
				if (rs != null) try{rs.close();} catch(SQLException e) {}
				if (stmt != null) try{stmt.close();} catch(SQLException e) {}
				if (conn != null) try{conn.close();} catch(SQLException e) {}
			}
		
	%>   
	 
	 <H1>내가 등록한 강좌</H1></BR>
						name: <%=name%><br>
						content : <%=content%> <br>
						teacher : <%=teacher_id%> <br>
						date: <%=start_date%>~ <%=end_date%> <br>
						</br>
						<form action="class_delete.jsp" method="post">
					<tr>
									<th class="button" colspan="2"></th>
									<td><input type="submit" value="강좌삭제"onclick="history.back()"/></td>
								</tr>
								</form>
					
				</article>
				</section>
</body>
</html>



