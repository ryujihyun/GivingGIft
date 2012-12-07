<%@page import="java.text.FieldPosition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
	<title>Giving Gift Mypage</title>
	<link href="stylesheets/mypageEdit.css" rel="stylesheet" type="text/css">
	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String member_id = (String) session.getAttribute("SID");
%>
<% 
java.util.Date DtodayDate = new java.util.Date();	

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

StringBuffer dateResult = new StringBuffer();

dateFormat.format(DtodayDate, dateResult, new FieldPosition(1));
String todayDate = dateResult.toString();

int ItodayDate = Integer.parseInt(todayDate); 
%>

<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/givinggift", "root", "tiger");
	if(conn == null)
		throw new Exception("Connect DB fail");
	
	stmt = conn.createStatement();
%>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="header">
		<div id="header_content">
			<h1><%out.println(member_id);%>님의 My page</h1>
			<a href="member_Edit.jsp" id="member_edit_button">회원 정보 수정</a>
		</div>	
	</div>
	<div id="content">
<%
	rs = stmt.executeQuery("select * from class where teacher_id = '"+member_id+"';");
%>
		<div id="present">
			<h1>내가 개설한 강좌</h1>
			<div class="present_tab">
				<ul>
					<li><a href="#"><span>진행중인 강좌</span></a>
						<div>
							<div class="class_nav">
								<ul>
									<li>강좌 제목</li>
									<li>수강인원</li>
									<li>카테고리</li>
									<li>종료날짜</li>
								</ul>
							</div>
							<div class="flow">
<%
if(!rs.next())	{
	out.println("개설 강좌가 없습니다.");
}
else	{
	while(rs.next())	{
		dateResult = new StringBuffer();
		
		String DBname = rs.getString("name");
		java.util.Date DBend_date = rs.getDate("end_date");
		
		dateFormat.format(DBend_date, dateResult, new FieldPosition(1));
		String end_date = dateResult.toString();
		
		int Iend_date = Integer.parseInt(end_date); 
		
		if(Iend_date >= ItodayDate)	{
			%>
			<div class="class_content_nav">
				<ul>
					<li><%out.println(DBname);%></li>
					<li><%out.println(rs.getInt("enroll_num"));%> / <%out.println(rs.getInt("number"));%></li>
					<li><%out.println(rs.getString("interest"));%></li>
					<li><%out.println(end_date);%></li>
					<li><form action=""><input type="submit" name="" value="상세보기"></form></li>
				</ul>
			</div>
			<%
		}
	}
}
%>
							</div>
						</div>
					</li>
					<li><a href="#"><span>완료된 강좌</span></a>
						<div>
							<div class="class_nav">
								<ul>
									<li>강좌 제목</li>
									<li>수강인원</li>
									<li>카테고리</li>
									<li>종료날짜</li>
								</ul>
							</div>
							<div class="flow">
<%
rs = stmt.executeQuery("select * from class where teacher_id = '"+member_id+"';");
if(!rs.next())	{
	out.println("개설 강좌가 없습니다.");
}
else	{
	while(rs.next())	{
		dateResult = new StringBuffer();
		
		String DBname = rs.getString("name");
		java.util.Date DBend_date = rs.getDate("end_date");
		
		dateFormat.format(DBend_date, dateResult, new FieldPosition(1));
		String end_date = dateResult.toString();
		
		int Iend_date = Integer.parseInt(end_date); 
		
		if(Iend_date < ItodayDate)	{
			%>
			<div class="class_content_nav">
				<ul>
					<li><%out.println(DBname);%></li>
					<li><%out.println(rs.getInt("enroll_num"));%> / <%out.println(rs.getInt("number"));%></li>
					<li><%out.println(rs.getString("interest"));%></li>
					<li><%out.println(end_date);%></li>
					<li><form action=""><input type="submit" name="" value="상세보기"></form></li>
				</ul>
			</div>
			<%	
		}
		
	}
}
%>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div id="past">
			<h1>내가 신청한 강좌</h1>
			<div class="past_tab">
				<ul>
					<li><a href="#"><span>진행중인 강좌</span></a>
						<div>
							<div class="class_nav">
								<ul>
									<li>강좌 제목</li>
									<li>수강인원</li>
									<li>카테고리</li>
									<li>종료날짜</li>
								</ul>
							</div>
							<div class="flow">
<%
rs = stmt.executeQuery("select * from register_class, class where member_id = '"+member_id+"';");

if(!rs.next())	{
	out.println("개설 강좌가 없습니다.");
}
else	{
	while(rs.next())	{
		if(rs.getString("class_id").equals(rs.getString("id")))	{
			
			dateResult = new StringBuffer();
			
			java.util.Date DBend_date = rs.getDate("end_date");
			
			dateFormat.format(DBend_date, dateResult, new FieldPosition(1));
			String end_date = dateResult.toString();
			
			int Iend_date = Integer.parseInt(end_date); 
			
			if(Iend_date >= ItodayDate)	{
				%>
				<div class="class_content_nav">
					<ul>
						<li><%out.println(rs.getString("name"));%></li>
						<li><%out.println(rs.getInt("enroll_num"));%> / <%out.println(rs.getInt("number"));%></li>
						<li><%out.println(rs.getString("interest"));%></li>
						<li><%out.println(end_date);%></li>
						<li><form action=""><input type="submit" name="" value="상세보기"></form></li>
					</ul>
				</div>
				<%	
			}
		}
	}
}
%>
							</div>
						</div>
					</li>
					<li><a href="#"><span>완료된 강좌</span></a>
						<div>
							<div class="class_nav">
								<ul>
									<li>강좌 제목</li>
									<li>수강인원</li>
									<li>카테고리</li>
									<li>종료날짜</li>
								</ul>
							</div>
							<div class="flow">
<%
rs = stmt.executeQuery("select * from register_class, class where member_id = '"+member_id+"';");

if(!rs.next())	{
	out.println("개설 강좌가 없습니다.");
}
else	{
	while(rs.next())	{
		if(rs.getString("class_id").equals(rs.getString("id")))	{
			
			dateResult = new StringBuffer();
			
			java.util.Date DBend_date = rs.getDate("end_date");
			
			dateFormat.format(DBend_date, dateResult, new FieldPosition(1));
			String end_date = dateResult.toString();
			
			int Iend_date = Integer.parseInt(end_date); 
			
			if(Iend_date < ItodayDate)	{
				%>
				<div class="class_content_nav">
					<ul>
						<li><%out.println(rs.getString("name"));%></li>
						<li><%out.println(rs.getInt("enroll_num"));%> / <%out.println(rs.getInt("number"));%></li>
						<li><%out.println(rs.getString("interest"));%></li>
						<li><%out.println(end_date);%></li>
						<li><form action=""><input type="submit" name="" value="상세보기"></form></li>
					</ul>
				</div>
				<%	
			}
		}
	}
}
%>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
<%
}
finally {
	try {
		stmt.close();
	}
	catch (Exception ignored) {}
	
	try {
		conn.close();
	}
	catch (Exception ignored) {}
}
%>
</body>
</html>

<script type="text/javascript">

$(function() {
	var tab=$(".present_tab");
	tab.find('li>a').click(function() {
		$(".present_tab>ul>li").removeClass('selected');
		$(".present_tab>ul>li>div").hide();
		$(this).parent().addClass('selected')
		$(this).parent().find("div").show();
	});
	$(".present_tab li>a:first").click();
	
	var tab=$(".past_tab");
	tab.find('li>a').click(function() {
		$(".past_tab>ul>li").removeClass('selected');
		$(".past_tab>ul>li>div").hide();
		$(this).parent().addClass('selected')
		$(this).parent().find("div").show();
	});
	$(".past_tab li>a:first").click();
});
</script>