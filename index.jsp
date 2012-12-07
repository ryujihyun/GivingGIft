<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giving Gift</title>
<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet">	
	<link href="css/facebook.css" rel="stylesheet">
	<script src="js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<!-- Facebook 접속에 쓰일 js -->
	<script src="//connect.facebook.net/en_US/all.js"></script>

	<script src='js/jquery-1.8.2.min.js'></script>

	<link href="stylesheets/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
        
</head>
<body>
	<div id="wrap">
		<div id="top">
			<div id="top_left">
				<div id="top_logo">
					<a href="index.jsp" id="logo">GivingGift</a>
				</div>
			</div>
			<div id="top_right">
				<ul>
					<li><a href="Learning.jsp">둘러보기</a></li>
				</ul>
			</div>
		</div>
		<div id="header">
			<h1>
				<span>Show your gift to ungifted people!</span>
			</h1>
		</div>
		<div id="content">
			<c:choose>
				<c:when test="${sessionScope.SID == null}">
					<ul>
						<a href="#" class="login_click"><li class="main_nav"><span
								id="login">Log In</span></li></a>
						<a href="#" class="join_click"><li class="main_nav"><span
								id="join">Join</span></li></a>
					</ul>
					<div id="facebook_login">
						<div class="container">
							<div style="margin-bottom: 20px;" class="center">

								<!-- Facebook 접속 버튼 -->
								<!--
								<a class="fb_button fb_button_large" id="btnLogin"
									href="FBAuthServlet.do" data-size="xlarge"> <span
									class="fb_button_text"> Facebook Log In</span>
								</a>  -->
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div id="logout">
						<div id="logout_p">
							<p>
								안녕하세요
								<%
								out.print((String) session.getAttribute("Sname"));
							%>님
							</p>
							<p>오늘도 좋은 하루 되세요</p>
						</div>
						<div id="logout_button">
							<a href="logout_page.jsp"><span>log out</span></a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="footer">
			<p>사이트맵 | 고객센터</p>
			<p>Copyright © GivingGift. All rights reserved.</p>
		</div>
		<div class="new_window" id="login_page">
			<div class="window_logo">GivingGift</div>
			<a href="#"><img class="closebutton" src="images/fileclose.png"></a>
			<form action="login_page.jsp" method="post">
				<div>
					<div class="login_class">
						<div class="class_name">E-Mail</div>
						<div>
							<input class="input_text" type="text" name="ID">
						</div>
					</div>
					<div class="login_class">
						<div class="class_name">Password</div>
						<div>
							<input class="input_text" type="password" name="password">
						</div>
					</div>
				</div>
				<div class="window_button">
					<input type="submit" name="submit" value="log in">
				</div>
			</form>
		</div>
		<div class="new_window" id="join_page">
			<div class="window_logo">GivingGift</div>
			<a href="#"><img class="closebutton" src="images/fileclose.png"></a>
			<form action="index_join.jsp" method="post">
				<div>
					<div class="join_class">
						<div class="class_name">이름</div>
						<div>
							<input class="input_text" type="text" name="name">
						</div>
					</div>
					<div class="join_class">
						<div class="class_name">E-Mail</div>
						<div>
							<input class="input_text" type="text" name="ID">
						</div>
					</div>
					<div class="join_class">
						<div class="class_name">Password</div>
						<div>
							<input class="input_text" type="password" name="password">
						</div>
					</div>

					<div class="join_class">
						<div class="class_name">전화번호</div>
						<div>
							<input class="input_text" type="text" name="phone">
						</div>
					</div>
					<div class="join_class">
						<div class="class_name">생년월일</div>
						<div>
							<p><input class="input_text" type="text" name="date" id="datepicker"
								placeholder="주민번호앞자리"></p>
						</div>
					</div>
					<div class="join_class">
						<div class="class_name">성별</div>
						<div>
							<input type="radio" name="gender" value="male">남 <input
								type="radio" name="gender" value="female">여
						</div>
					</div>
					<div class="join_class">
						<div class="class_name">주소</div>
						<div>
							<input class="input_text" type="text" name="address">
						</div>
					</div>
					<div class="join_class">
						<div class="class_name">관심분야</div>
						<div id="checkbox">
							<input type="checkbox" name="language" value="language">엄어
							<input type="checkbox" name="sociology" value="sociology">사회
							<input type="checkbox" name="science" value="science">과학
							<input type="checkbox" name="skill" value="skill">기술 <input
								type="checkbox" name="art" value="art">예술 <input
								type="checkbox" name="music" value="music">음악
						</div>
					</div>
				</div>
				<div class="window_button">
					<input id="join_button" type="submit" name="submit" value="join">
				</div>
			</form>
		</div>
	</div>
</body>
</html>


<script type="text/javascript">
	$("#login_page").hide();
	$("#join_page").hide();

	$(".login_click").click(function() {
		$("#login_page").show();

	});

	$(".join_click").click(function() {
		$("#join_page").show();
	});

	$(".closebutton").click(function() {
		$(this).parent().parent().hide();
	});
	
	$(function() {
        $( "#datepicker" ).datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>