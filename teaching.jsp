<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8">
	<title> Giving Gift Create Class </title>
	<link href="stylesheets/teaching.css" rel="stylesheet" type="text/css">
	<link href="stylesheets/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css">
	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
</head>
<body>
	<div id="top">
		<div id="top_container">
			<div id="top_left">
				<ul>
					<li><a href="index.html" id="top_logo">GivingGift</a></li>
					<li><a href="learning.html">Learn</a></li>
					<li><div id="create_class"><a href="#" id="create_click">Teach</a></div></li>
				</ul>
			</div>
			<div id="top_right">
				<ul>
					<li><a href="mypage.html"> My Page </a></li>
					<li><a href="board.html"> Help </a></li>
					<li><a href="#"> Log out </a></li>
				</ul>			
			</div>
		</div>
	</div>
	<div id="wrap">
		<div id="header"><!--
			<div id="header_p">
				<h1>Create Class</h1>
				<p>
					If you need assistance with Vimeo, you've come to the right place.
					We've made it easy to help yourself with our extensive FAQ, helpful guidelines, and supportive community forums.
				</p>
			</div>-->
		</div>

		<div id="content">

			<div class="new_window" id="content_left">
				<div id="content_header"><h1>Create Your Class</h1></div>
				<div id="content_form">
					<form action="teaching_page.jsp" method="post">
						<div>
							<div class="join_class">
								<div class="class_name">Class Title</div>
								<div><input class="input_text" type="text" name="name"></div>
							</div>

							<div class="join_class">
								<div class="class_name">Choose a Category</div>
								<select id="select_box" name="interest">
									<option value="language">언어</option>
									<option value="sociology">사회</option>
									<option value="science">과학</option>
									<option value="skill">기술</option>
									<option value="art">예술</option>
									<option value="music">음악</option>
								</select>
							</div>

							<div class="join_class">
								<div class="class_name">강좌 내용</div>
								<div><textarea cols="40" row="10" name="content"></textarea></div>
							</div>
							<div class="join_class" id="date">
								<div class="date_class">
									<div class="class_name">시작날짜</div>
									<div><input id="from" class="input_date" type="text" name="start_date"></div>
								</div>
								<div class="date_class">
									<div class="class_name">종료날짜</div>
									<div><input id="to" class="input_date" type="text" name="end_date"></div>
								</div>
							</div>
							
							<div class="join_class">
								<div class="class_name">수강인원</div><div><input class="input_text" type="text" name="number"></div>
							</div>

							<div class="join_class">
								<div class="class_name">수강장소(위도)</div><div><input class="input_text" type="text" name="latitude"></div>
							</div>
							<div class="join_class">
								<div class="class_name">수강장소(경도)</div><div><input class="input_text" type="text" name="longtutude"></div>
							</div>							
						</div>
						<div id="content_button"><input type="submit" name="submit" value="join"></div>
					</form>
				</div>
			</div>

			<div id="content_right">
				<h1>Create Class</h1>
				<p>
					If you need assistance with Vimeo, you've come to the right place.
					We've made it easy to help yourself with our extensive FAQ, helpful guidelines, and supportive community forums.
				</p>
			</div>

		</div>

		<footer id="learning_footer">
			<h3> 사이트맵 | 고객센터</h3>
			<address> CopyWrite c GivingGift All rights reserved | 2012.11.06 | club.cyworld.com/givinggift</address>
		</footer>
	</div>
</body>
</html>

<script type="text/javascript">
$(function() {
    $( "#from" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3,
        onClose: function( selectedDate ) {
            $( "#to" ).datepicker( "option", "minDate", selectedDate );
        }
    });
    $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3,
        onClose: function( selectedDate ) {
            $( "#from" ).datepicker( "option", "maxDate", selectedDate );
        }
    });
});
</script>