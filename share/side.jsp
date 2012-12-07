<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/GivingGift";
	String dbUser = "root";
	String dbPassword = "tiger";
%>
		<%try{
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GivingGift?chracterEncoding=utf8", "root", "tiger");

						stmt = conn.createStatement();
						
						int randomNumber = (int)(Math.random() * 10)+1;
						String Number = Integer.toString(randomNumber);
						
						rs = stmt.executeQuery("SElECT * FROM class where id ="+randomNumber+";");
		
						String teacher_name = (String) session.getAttribute("Sname");
						
					%>
			<div id ="aside">
				<div id = person_information>
					<h1>| <%out.print((String) session.getAttribute("Sname"));%> |</h1><br>
					Thank you visiting our homepage!
				</div>
				<aside id="category">
					<div id='cssmenu'>
						<ul>
								<li><a href='Learning.jsp'><span>All</span></a></li>
						   <li><a href='Language_class.jsp'><span>Language</span></a></li>
						   <li><a href='Sociaty_class.jsp'><span>Society</span></a></li>
						   <li><a href='Science_class.jsp'><span>Science</span></a></li>
						   <li><a href='Skill_class.jsp'><span>Technology</span></a></li>
						   <li><a href='Art_class.jsp'><span>Art</span></a></li>
						   <li><a href='Music_class.jsp'><span>Music</span></a></li>
						</ul>
					</di>
				</aside>

				<aside id ="learning_aside">
									<%
				while(rs.next()){
					if(Number.equals(rs.getString("id"))){
						String DBname = rs.getString("name");
						String DBcontnet = rs.getString("content");
						String DBaddress = rs.getString("address");
						String DBS_date = rs.getString("start_date");
						String DBE_date = rs.getString("end_date");
						int DBenroll_num = rs.getInt("enroll_num");
				%>
					<section class="buttons">
						<label for="first">Best Class</label>
					</section>
					<div class="tab_item">
						<ul>
								<form action="Learning_detail.jsp" method="post">
									<%	
						String class_ID = rs.getString("id");
						request.setAttribute("CLASSID", new String (class_ID));
					%>
							<input type="text" name="class_ID" value="${CLASSID}" style="visibility: hidden;">
					
							<li class="item"><a href="Learning_detail.jsp">
								<div class="thumbnail">
									<% if(rs.getString("interest").equals("language")){%>
							<img src="./images/language.png"></img>
						<% } else if(rs.getString("interest").equals("sociology")) {%>
							<img src="./images/sociology.png"></img>
						<%} else if(rs.getString("interest").equals("science")) {%>
							<img src="./images/science.png"></img>
						<% } else if(rs.getString("interest").equals("skill")) {%>
							<img src="./images/skill.png"></img>
							<%} else if(rs.getString("interest").equals("art")) {%>
							<img src="./images/art.png"></img>
							<%} else if(rs.getString("interest").equals("music")) {%>
							<img src="./images/music.png"></img>
							<%} %>
								</div>
								<div class="description">
									<strong>Class: <%out.println(DBname);%> </strong>
									<p>Start: <%out.println(DBS_date); %></p>
									<p>End: <%out.println(DBE_date); %></p>
									<p>Num: <%out.println(DBenroll_num); %></p><br><%} %>
									<div id="enroll_button"><input type="submit" value="Enroll"></div>
								</div>
							</a></li>
						</ul>
					</div>
				</aside>
				
				<%}%>
				<%		} catch(SQLException ex) {
			%>
			에러발생
			<% }finally {
				if(rs != null) try {rs.close();} catch(SQLException ex){}
				if(conn != null) try {conn.close();} catch(SQLException ex){}
				if(stmt != null) try {stmt.close();} catch(SQLException ex){}
			}%>
</div>