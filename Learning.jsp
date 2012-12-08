<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Giving Gift learning</title>
<link href="stylesheets/learning.css" rel="stylesheet" type="text/css">
<link href="stylesheets/jquery-ui-1.9.2.custom.min.css" rel="stylesheet"
	type="text/css">
<script src='js/jquery-1.8.2.min.js'></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>

</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/GivingGift?chracterEncoding=utf8";
		String dbUser = "root";
		String dbPassword = "tiger";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager
					.getConnection(
							"jdbc:mysql://localhost:3306/GivingGift?chracterEncoding=utf8",
							"root", "tiger");

			stmt = conn.createStatement();
			rs = stmt
					.executeQuery("SElECT * FROM class ORDER BY created_at desc");

			String teacher_name = (String) session.getAttribute("Sname");
	%>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="wrap">
		<div id="header">
			<div class="animation_canvas">
				<div class="slider_panel">
					<img src="images/volonteer.jpg" class="slider_image" /> <img
						src="images/bell.png" class="slider_image" /> <img
						src="images/russia_vol.jpg" class="slider_image" />
				</div>
				<div class="slider_text_panel">
					<div class="slider_text">
						<h1>Devote your GivingGift!</h1>
						<p>Just one click!</p>
					</div>
					<div class="slider_text">
						<h1>재능 기부를 통한 봉사!</h1>
						<p>온라인으로 신청하세요</p>
					</div>
					<div class="slider_text">
						<h1>색다른 재능을 만나보세요.</h1>
						<p>다양한 재능을 배울 수 있습니다</p>
					</div>
				</div>
				<div class="control_panel">
					<div class="control_button"></div>
					<div class="control_button"></div>
					<div class="control_button"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<jsp:include page="share/side.jsp"></jsp:include>
		<div id="learning_section">
		 <%while (rs.next()) {%>
		 <div class="learning_article">
		<div id="left" class="art_f">
			<form action="Learning_detail.jsp" method="post">
				<%
					String class_ID = rs.getString("id");
							request.setAttribute("CLASSID", new String(class_ID));
				%>
				<input type="text" name="class_ID" value="${CLASSID}"
					style="visibility: hidden;">

				<%
					if (rs.getString("interest").equals("language")) {
				%>
				<img src="./images/language.png"></img>
				<%
					} else if (rs.getString("interest").equals("sociology")) {
				%>
				<img src="./images/sociology.png"></img>
				<%
					} else if (rs.getString("interest").equals("science")) {
				%>
				<img src="./images/science.png"></img>
				<%
					} else if (rs.getString("interest").equals("skill")) {
				%>
				<img src="./images/skill.png"></img>
				<%
					} else if (rs.getString("interest").equals("art")) {
				%>
				<img src="./images/art.png"></img>
				<%
					} else if (rs.getString("interest").equals("music")) {
				%>
				<img src="./images/music.png"></img>
				<%
					}
				%>
			
		</div>
		<div id="center" class="art_f">
			<div id="title">
				<h1>
					Giving Gift
					<%
					if (rs.getString("interest").equals("language")) {
				%>
					language
					<%
					} else if (rs.getString("interest").equals("sociology")) {
				%>
					sociology
					<%
					} else if (rs.getString("interest").equals("science")) {
				%>
					science
					<%
					} else if (rs.getString("interest").equals("skill")) {
				%>
					skill
					<%
					} else if (rs.getString("interest").equals("art")) {
				%>
					art
					<%
					} else if (rs.getString("interest").equals("music")) {
				%>
					music
					<%
					}
				%>
					Gift
				</h1>
				<br>
			</div>
			<p>
				class:
				<%
				out.print(rs.getString("name"));
			%><br> name :
				<%
				out.print((String) session.getAttribute("Sname"));
			%>
				<br> email :
				<%
					out.print(rs.getString("teacher_id"));
				%>
				<br> date:
				<%
					out.print(rs.getDate("start_date"));
				%>
				~
				<%
					out.print(rs.getDate("end_date"));
				%>
				<br>
				<br>
				<c:choose>
					<c:when test="${sessionScope.SID == null}">
					</c:when>
					<c:otherwise>
						<div id="enroll_button">
							<input type="submit" value="Enroll">
						</div>
					</c:otherwise>
				</c:choose>
			</p>
		</div>
		<div id="right" class="art_f">
			<p id="cal-lbl">Total number</p>
			<div id="total_people_number">
				<div class="total_number">
					<%
						out.print(rs.getString("number"));
					%>
				</div>
				<div class="enroll_number">
					<%
						out.print(rs.getString("enroll_num"));
					%>
				</div>
			</div>
			<div class="enroll_people_number">Enroll people</div>
		</div>
		</form>
		</div> <%
 	}
 %> </div>
	</div>

	<%
		} catch (SQLException ex) {
	%>
	에러발생
	<%
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException ex) {
				}
		}
	%>
	<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
	$(document).ready(
			function() {
				// 슬라이더를 움직여주는 함수
				function moveSlider(index) {
					// 슬라이더를 이동합니다.
					var willMoveLeft = -(index * 900);
					$('.slider_panel').animate({
						left : willMoveLeft
					}, 'slow');

					// control_button에 active클래스를 부여/제거합니다.
					$('.control_button[data-index=' + index + ']').addClass(
							'active');
					$('.control_button[data-index!=' + index + ']')
							.removeClass('active');

					// 글자를 이동합니다.
					$('.slider_text[data-index=' + index + ']').show().animate(
							{
								left : 0
							}, 'slow');
					$('.slider_text[data-index!=' + index + ']').hide('slow',
							function() {
								$(this).css('left', -300);
							});
				}

				// 초기 텍스트 위치 지정 및 data-index 할당
				$('.slider_text').css('left', -300).each(function(index) {
					$(this).attr('data-index', index);
				});
				// 컨트롤 버튼의 클릭 핸들러 지정 및 data-index 할당
				$('.control_button').each(function(index) {
					$(this).attr('data-index', index);
				}).click(function() {
					var index = $(this).attr('data-index');
					moveSlider(index);
				});

				// 초기 슬라이더 위치 지정
				var randomNumber = Math.round(Math.random() * 3);
				moveSlider(randomNumber);
			});
</script>