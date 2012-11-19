<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="page-exit" content="BlendTans(Duration=3.0)">
	<meta http-equiv="page-Enter" content="BlendTans(Duration=3.0)">
	<title> Giving Gift learning </title>
	<link href="stylesheets/learning.css" rel="stylesheet" type="text/css">
	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="wrap">
		<div id="header">
			<div class="animation_canvas">
        		<div class="slider_panel">
        			<img src="images/volonteer.jpg" class="slider_image"/>
           			<img src="images/bell.png" class="slider_image"/>
            		<img src="images/russia_vol.jpg" class="slider_image"/>
		        </div>
		        <div class="slider_text_panel">
        		    <div class="slider_text">
            		    <h1>당신의 재능을 기부하세요!</h1>
            		    <p>한번의 클릭으로 당신이 원하는 강좌를 들을 수 있습니다</p>
            		</div>
           		<div class="slider_text">
            		    <h1>재능을 나누고 싶으신가요?</h1>
            		    <p>Teach를 통한 자신의 재능을 기부하세요!</p>
           		 </div>
            		<div class="slider_text">
            		    <h1>Quisque eleifend</h1>
            		    <p>Quisque eleifend augue nec lacus lobortis porta.</p>
            		</div>
        		</div>
        	<div class="control_panel">
            	<div class="control_button"></div>
           		<div class="control_button"></div>
            	<div class="control_button"></div>
        		</div>
    		</div>
    		</div>
		<div id="header_search">
			<form action="">
				<input type="text" name="search" id="search">
				<input type="submit" value="| Search" id="search_button">
			</form>
		</div>
	</div>
	<div id="content">
	<jsp:include page="share/side.jsp"></jsp:include>
			<section id="learning_section">
				<article class="learning_article">
					<div id ="left"><a href="learning_detail.html">
						<img src="./images/piano.png"></img>
					</div>
					<h1> Giving Gift Piano Gift </h1>
					<p>
						name: youbin<br>
						address : 경기도 용인시 처인구 명지대학교 <br>
						date: 2012.11.22 ~ 2012.12.25<br>
						week: Mon, Wen, Fri<br>
						Number: 5<br>
					</p></a>
				</article>
				<article class="learning_article">
					<div id="left"><a href="#">
						<img src="./images/book.png"></img>
					</div>
					<h1> Giving Gift Book Gift </h1>
					<p>
						name: youbin<br>
						address : 경기도 용인시 처인구 명지대학교 <br>
						date: 2012.11.22 ~ 2012.12.25<br>
						week: Mon, Thu<br>
						Number: 3<br>
					</p></a>
				</article>
				<article class="learning_article">
					<div id="left"><a href="#">
						<img src="./images/science.png"></img>
					</div>
					<h1> Giving Gift Science Gift </h1>
					<p>
						name: youbin<br>
						address : 경기도 용인시 처인구 명지대학교 <br>
						date: 2012.11.22 ~ 2012.12.25<br>
						week: Wen, Sat, Sun<br>
						Number: 8<br>
					</p></a>
				</article>
				<article class="learning_article">
					<div id="left"><a href="#">
						<img src="./images/language.png"></img>
					</div>
					<h1> Giving Gift Language Gift </h1>
					<p>
						name: youbin<br>
						address : 경기도 용인시 처인구 명지대학교 <br>
						date: 2012.11.22 ~ 2012.12.25<br>
						week: Wen, Sat, Sun<br>
						Number: 8<br>
					</p></a>
				</article>
				<article class="learning_article">
					<div id="left"><a href="#">
						<img src="./images/math.png"></img>
					</div>
					<h1> Giving Gift Math Gift </h1>
					<p>
						name: youbin<br>
						address : 경기도 용인시 처인구 명지대학교 <br>
						date: 2012.11.22 ~ 2012.12.25<br>
						week: Wen, Sat, Sun<br>
						Number: 8<br>
					</p></a>
				</article>
			</section>
		</div>
<jsp:include page="share/footer.jsp"></jsp:include>
		<div class="new_window" id="create_page">
			<div class="window_logo">GivingGift</div>
			<a href="#"><img class="closebutton" src="images/fileclose.png"></a>
			<form action="#">
				<div>
					<div class="join_class">
						<div class="class_name">강좌명</div><div><input class="input_text" type="text" name="name"></div>
					</div>
					<div class="join_class">
						<div class="class_name">E-Mail</div><div><input class="input_text" type="text" name="ID"></div>
					</div>
					<div class="join_class">
						<div class="class_name">Password</div><div><input class="input_text" type="password" name="password"></div>
					</div>
					<div class="join_class">
						<div class="class_name">Password 확인</div><div><input class="input_text" type="password" name="password"></div>
					</div>
					<div class="join_class">
						<div class="class_name">전화번호</div><div><input class="input_text" type="text" name="phone"></div>
					</div>
					<div class="join_class">
						<div class="class_name">성별</div>
						<div>
							<input type="radio" name="gender" value="male">남
							<input type="radio" name="gender" value="female">여
						</div>
					</div>
					<div class="join_class">
						<div class="class_name">주소</div><div><input class="input_text" type="text" name="address"></div>
					</div>
					<div class="join_class">
						<div class="class_name">관심분야</div>
						<div id="checkbox">
							<input type="checkbox" name="like" value="music">음악
							<input type="checkbox" name="like" value="soccer">체육
							<input type="checkbox" name="like" value="art">미술
							<input type="checkbox" name="like" value="science">과학
							<input type="checkbox" name="like" value="sleep">낮잠
							<input type="checkbox" name="like" value="hungry">야식
						</div>
					</div>
				</div>
				<div class="window_button"><input type="submit" name="submit" value="join"></div>
			</form>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">

$("#create_page").hide();

$(function(){
	$(document).ready(function() {
		$(window).scroll(function() {
			var scrollHeight=$(window).scrollTop()+ $(window).height();
			var documentHeight = $(document).height();

			if(scrollHeight + 200 >= documentHeight){
				for(var i=0; i<10; i++){
					$('<h1>Infinity Scroll<h1>').appendTo('body');
				}
			}
		});
	});

	//create window
	$("body").find("#create_click").click(function() {
		$("#create_page").show();
	});
	$(".closebutton").click(function() {
		$(this).parent().parent().hide();
	});

	//mouse event
	$("article.learning_article").mouseover(function() {
		$(this).css("background", "#C4DEFF");
		$(this).css("color", "#ffffff");
	});

	$("article.learning_article").mouseout(function() {
		$(this).css("background", "#ffffff");
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
</script>