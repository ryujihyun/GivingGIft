<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<div id="top">
	<div id="top_container">
		<c:choose>
			<c:when test="${sessionScope.SID == null}">
				<div id="top_left">
					<ul>
						<li><a href="index.jsp" id="top_logo">GivingGift</a></li>
						<li><a href="Learning.jsp">Learn</a></li>
					</ul>
				</div>
				<div id="top_right">
					<ul>
						<li><a href="#" class="login_click"> Log In </a></li>
						<li><a href="#" class="join_click"> Join </a></li>
						<li><a href="board.jsp"> Help </a></li>
					</ul>			
				</div>
			</c:when>
			<c:otherwise>
				<div id="top_left">
					<ul>
						<li><a href="index.jsp" id="top_logo">GivingGift</a></li>
						<li><a href="Learning.jsp">Learn</a></li>
						<li><div id="create_class"><a href="teaching.jsp" id="create_click">Teach</a></div></li>
					</ul>
				</div>
				<div id="top_right">
					<ul>
						<li><a href="mypage.jsp"> My Page </a></li>
						<li><a href="logout_page.jsp"> Log out </a></li>
						<li><a href="board.jsp"> Help </a></li>
					</ul>			
				</div>
			</c:otherwise>
		</c:choose>
	</div>

<div class="new_window" id="login_page">
	<div class="window_logo">GivingGift</div>
	<a href="#"><img class="closebutton" src="images/fileclose.png"></a>
	<form action="login_page.jsp" method="post">
		<div>
			<div class="login_class">
				<div class="class_name">E-Mail</div><div><input class="input_text" type="text" name="ID"></div>
			</div>
			<div class="login_class">
				<div class="class_name">Password</div><div><input class="input_text" type="password" name="password"></div>
			</div>					
		</div>
		<div class="window_button"><input type="submit" name="submit" value="log in"></div>
	</form>
</div>
<div class="new_window" id="join_page">
	<div class="window_logo">GivingGift</div>
	<a href="#"><img class="closebutton" src="images/fileclose.png"></a>
	<form action="index_join.jsp" method="post">
		<div>
			<div class="join_class">
				<div class="class_name">이름</div><div><input class="input_text" type="text" name="name"></div>
			</div>
			<div class="join_class">
				<div class="class_name">E-Mail</div><div><input class="input_text" type="text" name="ID"></div>
			</div>
			<div class="join_class">
				<div class="class_name">Password</div><div><input class="input_text" type="password" name="password"></div>
			</div>

			<div class="join_class">
				<div class="class_name">전화번호</div><div><input class="input_text" type="text" name="phone"></div>
			</div>
			<div class="join_class">
				<div class="class_name">생년월일</div><div><input class="input_text" type="text" name="date" placeholder="주민번호앞자리"></div>
			</div>
			<div class="join_class">
				<div class="class_name">성별</div>
				<div>
					<input type="radio" name="gender" value="male">남
					<input type="radio" name="gender" value="female">여
				</div>
			</div>
			<div class="join_class">
				<div class="class_name">주소</div>
				<div><input class="input_text" type="text" name="address"></div>
			</div>
			<div class="join_class">
				<div class="class_name">관심분야</div>
				<div id="checkbox">
					<input type="checkbox" name="language" value="language">엄어
					<input type="checkbox" name="sociology" value="sociology">사회
					<input type="checkbox" name="science" value="science">과학
					<input type="checkbox" name="skill" value="skill">기술
					<input type="checkbox" name="art" value="art">예술
					<input type="checkbox" name="music" value="music">음악
				</div>
			</div>
		</div>
		<div class="window_button"><input id="join_button" type="submit" name="submit" value="join"></div>
	</form>
</div>

</div>

<style type="text/css">
		/* -- new window -- */
.new_window {
	background-color:rgba(255, 157, 157, .8);
	border-radius: 25px 25px 25px 25px;
	border:3px solid #000; display:inline-block;
	z-index:4;
}
#login_page {position:absolute; top:170px; left:230px; width:500px; height:350px;}
#join_page {position:absolute; top:20px; left:230px; width:500px; height:580px;}

.window_logo {
	font-size:50px; padding:50px 0 80px 0; text-align:center;
	font-family:impact;  font-style:italic; color:white;
	position:relative;
}
.closebutton {position:absolute; top:15px; right:15px; width:40px; height:40px;}
.window_button {position:absolute; bottom:25px; right:25px;}
.window_button input {
	width:90px; height:40px; font-size:25px; font-weight:bold;
	background-color:#FF4040; border-radius:10px;
	border-color:#FF4040; color:#fff;
}

.login_class div {float:left;}
.login_class {clear:both;}
.login_class .class_name {padding:0 30px 60px 10px; width:150px; font-size:25px; font-weight:bold; text-align:right;}
.login_class .input_text {font-size:18px; width:250px; border:1px solid #000;}

.join_class div {float:left;}
.join_class {clear:both;}
.join_class .class_name {padding:0 30px 20px 20px; width:160px; font-size:20px; font-weight:bold; text-align:right;}
.join_class .input_text {width:200px;  border:1px solid #000;}
</style>

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

</script>