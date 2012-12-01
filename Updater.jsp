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
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/GivingGift";
	String dbUser = "root";
	String dbPassword = "tiger";
	String email;

	try {

		if (session.getAttribute("SID") == null) {
			email = "";
		} else {
			email = (String) session.getAttribute("SID");
		}
	} catch (Exception e) {
		email = "";
	}
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");

	List<String> errorMsg = new ArrayList<String>();
	int result = 0;

	if (name == null || name.trim().length() == 0) {
		errorMsg.add("이름을 반드시 입력해주세요.");
	}

	if (phone == null || phone.trim().length() == 0) {
		errorMsg.add("휴대전화 번호를  반드시 입력해주세요.");
	}

	if (address == null || address.trim().length() == 0) {
		errorMsg.add("주소를 반드시 입력해주세요.");
	}
	if (errorMsg.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);
			
			stmt = conn.prepareStatement("UPDATE member "
					+ "SET   name=?, phone=?, address=?");
			
			stmt.setString(1, name);
			stmt.setString(2, phone);
			stmt.setString(3, address);
			System.out.println(name);
			System.out.println(phone);
			System.out.println(address);
			System.out.println(email);
			

			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsg.add("변경에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsg.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (stmt != null){
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			}
			if (conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}
%>

<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<h3>결과:</h3>
	<ul>
		<%
			for (String msg : errorMsg) {
		%>
		<li><%=msg%></li>
		<%
			}
		%>
	</ul>
	<div>
		<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
	</div>

	<div>
		<b><%=name%></b> 님 수정되었습니다.
	</div>
	<div>
		<a href="mypage2.jsp">목록으로</a>
</body>
</html>