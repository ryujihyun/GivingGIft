<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<!--	<link href="stylesheets/datepicker.css" rel="stylesheet" type="text/css">
  -->
	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
<% 
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/GivingGift";
	String dbUser = "root";
	String dbPassword = "tiger";
%>
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
					<%try{
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GivingGift", "root", "tiger");

						stmt = conn.createStatement();
						rs = stmt.executeQuery("SElECT * FROM member");
		
						while(rs.next()){
					%>
			
				<article class="learning_article">
					<div id ="left"><a href="learning_detail.html">
						<img src="./images/piano.png"></img>
					</div>
					<h1> Giving Gift Piano Gift </h1>
					<p>
						name: <% out.print(rs.getString("name"));%><br>
						address : <% out.print(rs.getString("address"));%> <br>
						phone: <% out.print(rs.getString("phone"));%> <br>
						date: <%out.print(rs.getDate("birthdate")); %><br>
						week: Mon, Wen, Fri<br>
						Number: 5<br>
					</p></a>
				</article>
				<%} %>
			</section>
		</div>
<%		} catch(SQLException ex) {
			%>
			에러발생
			<% }finally {
				if(rs != null) try {rs.close();} catch(SQLException ex){}
				if(conn != null) try {rs.close();} catch(SQLException ex){}
				if(stmt != null) try {rs.close();} catch(SQLException ex){}
			}%>
<jsp:include page="share/footer.jsp"></jsp:include>
<jsp:include page="share/teaching.jsp"></jsp:include>
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

//$('.datepicker').datepicker()

</script>