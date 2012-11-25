<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="new_window" id="create_page">
	<div class="window_logo">GivingGift</div>
	<a href="#"><img class="closebutton" src="images/fileclose.png"></a>
	<form action="teaching_page.jsp" method="post">
		<div>
			<div class="join_class">
				<div class="class_name">강좌명</div><div><input class="input_text" type="text" name="name"></div>
			</div>
			<div class="join_class">
				<div class="class_name">강좌 내용</div><div><input class="input_text" type="text" name="content"></div>
			</div>
			<div class="join_class">
				<div class="class_name">시작날짜</div><div><input class="input_text" type="text" name="start_date"></div>
			</div>
			<div class="join_class">
				<div class="class_name">종료날짜</div><div><input class="input_text" type="text" name="end_date"></div>
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
			<div class="join_class">
				<div class="class_name">관심분야</div>
				<div id="checkbox">
					<input type="radio" name="interest" value="language">엄어
					<input type="radio" name="interest" value="sociology">사회
					<input type="radio" name="interest" value="science">과학
					<input type="radio" name="interest" value="skill">기술
					<input type="radio" name="interest" value="art">예술
					<input type="radio" name="interest" value="music">음악
				</div>
			</div>
			
<!--
			<div class="input-append date" id="dp3" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
				<input class="span2" size="16" type="text" value="12-02-2012">
				<span class="add-on"><i class="icon-th"></i></span>
			</div>
-->			
		</div>
		<div class="window_button"><input type="submit" name="submit" value="join"></div>
	</form>
</div>