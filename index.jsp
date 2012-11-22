<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Giving Gift</title>
	<link href="css/index.css" rel="stylesheet" type="text/css">
	<script src='js/jquery-1.8.2.min.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<div id="top_left">
				<div id="top_logo">
					<a href="index.html" id="logo">GivingGift</a>
				</div>
				<div id="top_nav">
					<ul>
						<li><a href="#" id="login_click">Log In</a></li>
						<li><a href="#" id="join_click">Join</a></li>
						<li><a href="#">help</a></li>
						<li><a href="learning.html">둘러보기</a></li>
					</ul>
				</div>
			</div>
			<div id="top_right">
				<form action="">
					<input type="text" name="search" id="search">
					<input type="submit" value="| Search" id="search_button">
				</form>
			</div>
		</div>
		<div id="header">
			<h1><span>Show your gift to ungifted people!</span></h1>
		</div>
		<div id="content">
			<ul>
				<a href="#" id="login_click"><li class="main_nav"><span id="login">Log In</span></li></a>
				<a href="#" id="join_click"><li class="main_nav"><span id="join">Join</span></li></a>
			</ul>
			<div id="facebook_login">
				<a href="#"><img src="images/facebookicon.png">facebook ID로 로그인하기</a>
			</div>
		</div>
		<div id="footer">
			<p>사이트맵 | 고객센터</p>
			<p>Copyright © GivingGift. All rights reserved.</p>
		</div>
		<div class="new_window" id="login_page">
			<div class="window_logo">GivingGift</div>
			<a href="#"><img class="closebutton" src="images/fileclose.png"></a>
			<form action="">
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
						<div class="class_name">생년월일</div><div><input class="input_text" type="text" name="date"></div>
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
</body>
</html>


<script type="text/javascript">

$("#login_page").hide();
$("#join_page").hide();

$(function() {
	$("#wrap").find("#login_click").click(function() {
		$("#login_page").show();
	});
	$("#content>ul").find("#login_click").click(function() {
		$("#login_page").show();
	});

	$("#wrap").find("#join_click").click(function() {
		$("#join_page").show();
	});
	$("#content>ul").find("#join_click").click(function() {
		$("#join_page").show();
	});

	$(".closebutton").click(function() {
		$(this).parent().parent().hide();
	});
});

$(document).ready(function () {
// 슬라이더를 움직여주는 함수
	function moveSlider(index) {
	// 슬라이더를 이동합니다.
        var willMoveLeft = -(index * 900);
        $('.slider_panel').animate({ left: willMoveLeft }, 'slow');

        // control_button에 active클래스를 부여/제거합니다.
        $('.control_button[data-index=' + index + ']').addClass('active');
        $('.control_button[data-index!=' + index + ']').removeClass('active');

        // 글자를 이동합니다.
        $('.slider_text[data-index=' + index + ']').show().animate({
            left: 0
        }, 'slow');
        $('.slider_text[data-index!=' + index + ']').hide('slow', function () {
            $(this).css('left', -300);
        });
    }

    // 초기 텍스트 위치 지정 및 data-index 할당
    $('.slider_text').css('left', -300).each(function (index) {
        $(this).attr('data-index', index);
    });
    // 컨트롤 버튼의 클릭 핸들러 지정 및 data-index 할당
    $('.control_button').each(function (index) {
        $(this).attr('data-index', index);
    }).click(function () {
        var index = $(this).attr('data-index');
        moveSlider(index);
    });

    // 초기 슬라이더 위치 지정
    var randomNumber = Math.round(Math.random() * 5);
    moveSlider(randomNumber);
});

/*$(function () {
	$("#join_button").click(function() {
		alert("회원 강비 되어써");
	});
});*/
</script>