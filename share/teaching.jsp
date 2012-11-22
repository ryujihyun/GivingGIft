<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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