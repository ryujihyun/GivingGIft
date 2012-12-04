<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<div id="top">
	<div id="top_container">
		<div id="top_left">
			<ul>
				<li><a href="Learning.jsp" id="top_logo">GivingGift</a></li>
				<li><a href="Learning.jsp">Learn</a></li>
				<li><div id="create_class"><a href="teaching.jsp" id="create_click">Teach</a></div></li>
			</ul>
		</div>
		<div id="top_right">
			<ul>
				<c:choose>
					<c:when test="${sessionScope.SID == null}">
						<li><a href="#" class="login_click"> Log In </a></li>
						<li><a href="#" class="join_click"> Join </a></li>
					</c:when>
					<c:otherwise>
						<li><a href="mypage.jsp"> My Page </a></li>
						<li><a href="logout_page.jsp"> Log out </a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="board.jsp"> Help </a></li>
			</ul>			
		</div>
	</div>
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